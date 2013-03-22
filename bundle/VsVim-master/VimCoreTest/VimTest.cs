﻿using System;
using Microsoft.FSharp.Collections;
using Microsoft.FSharp.Core;
using Microsoft.VisualStudio.Text.Editor;
using Moq;
using Xunit;
using Vim.Extensions;
using Vim.UnitTest.Mock;
using System.Collections.Generic;
using Vim.Interpreter;

namespace Vim.UnitTest
{
    public abstract class VimTest : VimTestBase
    {
        #region SimpleListener

        protected sealed class SimpleListener : IVimBufferCreationListener
        {
            internal int Count { get; set; }
            internal IVimBuffer VimBuffer { get; set; }

            void IVimBufferCreationListener.VimBufferCreated(IVimBuffer vimBuffer)
            {
                Count++;
                VimBuffer = vimBuffer;
            }
        }

        #endregion

        protected readonly MockRepository _factory;
        protected readonly Mock<IVimHost> _vimHost;
        protected readonly Mock<IFileSystem> _fileSystem;
        protected readonly IKeyMap _keyMap;
        protected readonly IVimGlobalSettings _globalSettings;
        protected readonly SimpleListener _simpleListener;
        internal readonly IVimBufferFactory _bufferFactory;
        internal readonly Vim _vimRaw;
        protected readonly IVim _vim;

        protected VimTest()
        {
            _factory = new MockRepository(MockBehavior.Strict);
            _globalSettings = new GlobalSettings();
            _fileSystem = _factory.Create<IFileSystem>(MockBehavior.Strict);
            _bufferFactory = VimBufferFactory;
            _simpleListener = new SimpleListener();
            var creationListeners = new [] { new Lazy<IVimBufferCreationListener>(() => _simpleListener) };

            var map = new Dictionary<string, VariableValue>();
            _keyMap = new KeyMap(_globalSettings, map);
            _vimHost = _factory.Create<IVimHost>(MockBehavior.Strict);
            _vimHost.Setup(x => x.CreateHiddenTextView()).Returns(CreateTextView());
            _vimHost.Setup(x => x.AutoSynchronizeSettings).Returns(true);
            _vimRaw = new Vim(
                _vimHost.Object,
                _bufferFactory,
                CompositionContainer.GetExportedValue<IVimInterpreterFactory>(),
                creationListeners.ToFSharpList(),
                _globalSettings,
                _factory.Create<IMarkMap>().Object,
                _keyMap,
                MockObjectFactory.CreateClipboardDevice().Object,
                _factory.Create<ISearchService>().Object,
                _fileSystem.Object,
                new VimData(),
                _factory.Create<IBulkOperations>().Object,
                map,
                new EditorToSettingSynchronizer());
            _vim = _vimRaw;
            _vim.AutoLoadVimRc = false;
        }

        public sealed class LoadVimRcTest : VimTest
        {
            public LoadVimRcTest()
            {
                _fileSystem.Setup(x => x.GetVimRcDirectories()).Returns(new string[] { }).Verifiable();
                _fileSystem.Setup(x => x.LoadVimRcContents()).Returns(FSharpOption<FileContents>.None).Verifiable();
                _vimHost.Setup(x => x.VimRcLoaded(It.IsAny<VimRcState>(), It.IsAny<IVimLocalSettings>(), It.IsAny<IVimWindowSettings>()));
            }

            private void SetRcContents(params string[] lines)
            {
                var contents = new FileContents("foo", lines);
                _fileSystem.Setup(x => x.LoadVimRcContents()).Returns(FSharpOption.Create(contents)).Verifiable();
            }

            [Fact]
            public void BadLoadClearGlobalSettings()
            {
                _globalSettings.VimRc = "invalid";
                _globalSettings.VimRcPaths = "invalid";
                Assert.True(_vim.LoadVimRc().IsLoadFailed);
                Assert.Equal("", _globalSettings.VimRc);
                Assert.Equal("", _globalSettings.VimRcPaths);
                Assert.True(_vim.VimRcState.IsLoadFailed);
                _fileSystem.Verify();
            }

            [Fact]
            public void BadLoadStillChangeGlobal()
            {
                _fileSystem.Setup(x => x.GetVimRcDirectories()).Returns(new string[] { "foo" }).Verifiable();
                Assert.True(_vim.LoadVimRc().IsLoadFailed);
                Assert.Equal("", _globalSettings.VimRc);
                Assert.Equal("foo", _globalSettings.VimRcPaths);
                Assert.True(_vim.VimRcState.IsLoadFailed);
                _fileSystem.Verify();
            }

            [Fact]
            public void LoadUpdateSettings()
            {
                // Setup the VimRc contents
                var contents = new FileContents(
                    "foo",
                    new[] { "set ai" });
                _fileSystem.Setup(x => x.LoadVimRcContents()).Returns(FSharpOption.Create(contents)).Verifiable();
                _vimHost.Setup(x => x.CreateHiddenTextView()).Returns(CreateTextView());
                Assert.True(_vim.LoadVimRc().IsLoadSucceeded);
                Assert.True(_vimRaw._vimRcLocalSettings.AutoIndent);
                _fileSystem.Verify();
            }

            /// <summary>
            /// Part of loading the vimrc file includes creating an IVimBuffer under the hood.  This creation
            /// shouldn't show up in IVimBufferCreationListener instances.  It's designed to be transparent
            /// </summary>
            [Fact]
            public void LoadShouldntNotify()
            {
                SetRcContents("");
                Assert.True(_vim.LoadVimRc().IsLoadSucceeded);
                Assert.Equal(0, _simpleListener.Count);
            }

            /// <summary>
            /// The same is true for an automatic load of the VimRc file
            /// </summary>
            [Fact]
            public void AutoLoadShouldntNotify()
            {
                SetRcContents("");
                _vim.AutoLoadVimRc = true;
                _vim.CreateVimBuffer(CreateTextView());
                Assert.True(_vim.VimRcState.IsLoadSucceeded);
                Assert.Equal(1, _simpleListener.Count);
            }
        }

        public sealed class MiscTest : VimTest
        {

            /// <summary>
            /// Make sure that we can close multiple IVimBuffer instances
            /// </summary>
            [Fact]
            public void CloseAllVimBuffers_Multiple()
            {
                const int count = 5;
                for (var i = 0; i < count; i++)
                {
                    _vim.CreateVimBuffer(CreateTextView(""));
                }

                Assert.Equal(count, _vim.VimBuffers.Length);
                _vim.CloseAllVimBuffers();
                Assert.Equal(0, _vim.VimBuffers.Length);
            }

            [Fact]
            public void Create_SimpleTextView()
            {
                var textView = CreateTextView();
                var ret = _vim.CreateVimBuffer(textView);
                Assert.NotNull(ret);
                Assert.Same(textView, ret.TextView);
            }

            [Fact]
            public void Create_CreateTwiceForSameViewShouldFail()
            {
                var textView = CreateTextView();
                _vim.CreateVimBuffer(textView);
                Assert.Throws<ArgumentException>(() => _vim.CreateVimBuffer(textView));
            }

            [Fact]
            public void GetVimBuffer_ReturnNoneForViewThatHasNoBuffer()
            {
                var textView = CreateTextView();
                var ret = _vim.GetVimBuffer(textView);
                Assert.True(ret.IsNone());
            }

            [Fact]
            public void GetVimBuffer_ReturnBufferForCachedCreated()
            {
                var textView = CreateTextView();
                var bufferFromCreate = _vim.CreateVimBuffer(textView);
                var bufferFromGet = _vim.GetVimBuffer(textView);
                Assert.True(bufferFromGet.IsSome());
                Assert.Same(bufferFromGet.Value, bufferFromCreate);
            }

            [Fact]
            public void GetOrCreateVimBuffer_CreateForNewView()
            {
                var textView = CreateTextView();
                var buffer = _vim.GetOrCreateVimBuffer(textView);
                Assert.Same(textView, buffer.TextView);
            }

            [Fact]
            public void GetOrCreateVimBuffer_SecondCallShouldReturnAlreadyCreatedVimBuffer()
            {
                var textView = CreateTextView();
                var buffer1 = _vim.GetOrCreateVimBuffer(textView);
                var buffer2 = _vim.GetOrCreateVimBuffer(textView);
                Assert.Same(buffer1, buffer2);
            }

            [Fact]
            public void GetOrCreateVimBuffer_ApplyActiveBufferLocalSettings()
            {
                var textView = CreateTextView();
                var buffer = _vim.GetOrCreateVimBuffer(textView);
                buffer.LocalSettings.AutoIndent = true;
                buffer.LocalSettings.QuoteEscape = "b";

                var didRun = false;
                buffer.KeyInputStart += delegate
                {
                    var textView2 = CreateTextView();
                    var buffer2 = _vim.GetOrCreateVimBuffer(textView2);
                    Assert.True(buffer2.LocalSettings.AutoIndent);
                    Assert.Equal("b", buffer2.LocalSettings.QuoteEscape);
                    didRun = true;
                };
                buffer.Process('a');
                Assert.True(didRun);
            }

            /// <summary>
            /// Make sure window settings are applied from the current IVimBuffer to the newly 
            /// created one
            /// </summary>
            [Fact]
            public void GetOrCreateVimBuffer_ApplyActiveBufferWindowSettings()
            {
                var textView = CreateTextView();
                var buffer = _vim.GetOrCreateVimBuffer(textView);
                buffer.WindowSettings.CursorLine = true;

                var didRun = false;
                buffer.KeyInputStart += delegate
                {
                    var textView2 = CreateTextView();
                    var buffer2 = _vim.GetOrCreateVimBuffer(textView2);
                    Assert.True(buffer2.WindowSettings.CursorLine);
                    didRun = true;
                };
                buffer.Process('a');
                Assert.True(didRun);
            }

            /// <summary>
            /// When creating an IVimBuffer instance, if there is an existing IVimTextBuffer then
            /// the mode should be taken from that
            /// </summary>
            [Fact]
            public void GetOrCreateVimBuffer_InitialMode()
            {
                var textView = CreateTextView("");
                _vim.GetOrCreateVimTextBuffer(textView.TextBuffer).SwitchMode(ModeKind.Insert, ModeArgument.None);
                var buffer = _vim.GetOrCreateVimBuffer(textView);
                Assert.Equal(ModeKind.Insert, buffer.ModeKind);
            }

            /// <summary>
            /// Make sure the result of this call is cached and that only one is ever created
            /// for a given ITextBuffer
            /// </summary>
            [Fact]
            public void GetOrCreateVimTextBuffer_Cache()
            {
                var textBuffer = CreateTextBuffer("");
                var vimTextBuffer = _vim.GetOrCreateVimTextBuffer(textBuffer);
                Assert.Same(vimTextBuffer, _vim.GetOrCreateVimTextBuffer(textBuffer));
            }

            /// <summary>
            /// Sanity check to ensure we create different IVimTextBuffer for different ITextBuffer 
            /// instances
            /// </summary>
            [Fact]
            public void GetOrCreateVimTextBuffer_Multiple()
            {
                var textBuffer1 = CreateTextBuffer("");
                var textBuffer2 = CreateTextBuffer("");
                var vimTextBuffer1 = _vim.GetOrCreateVimTextBuffer(textBuffer1);
                var vimTextBuffer2 = _vim.GetOrCreateVimTextBuffer(textBuffer2);
                Assert.NotSame(vimTextBuffer1, vimTextBuffer2);
            }

            /// <summary>
            /// The IVimTextBuffer should outlive an associated ITextView and IVimBuffer
            /// </summary>
            [Fact]
            public void GetOrCreateVimTextBuffer_LiveLongerThanTextView()
            {
                var textView = CreateTextView("");
                var buffer = _vim.GetOrCreateVimBuffer(textView);
                Assert.Same(buffer.VimTextBuffer, _vim.GetOrCreateVimTextBuffer(textView.TextBuffer));
                buffer.Close();
                Assert.Same(buffer.VimTextBuffer, _vim.GetOrCreateVimTextBuffer(textView.TextBuffer));
            }

            [Fact]
            public void RemoveBuffer_ReturnFalseForNonAssociatedTextView()
            {
                var textView = CreateTextView();
                Assert.False(_vim.RemoveVimBuffer(textView));
            }

            [Fact]
            public void RemoveBuffer_AssociatedTextView()
            {
                var textView = CreateTextView();
                _vim.CreateVimBuffer(textView);
                Assert.True(_vim.RemoveVimBuffer(textView));
                var ret = _vim.GetVimBuffer(textView);
                Assert.True(ret.IsNone());
            }

            [Fact]
            public void ActiveBuffer1()
            {
                Assert.True(_vim.ActiveBuffer.IsNone());
            }

            [Fact]
            public void ActiveBuffer2()
            {
                var textView = CreateTextView();
                var buffer = _vim.CreateVimBuffer(textView);
                var didRun = false;
                buffer.KeyInputStart += delegate
                {
                    didRun = true;
                    Assert.True(_vim.ActiveBuffer.IsSome());
                    Assert.Same(buffer, _vim.ActiveBuffer.Value);
                };

                buffer.Process('a');
                var active = _vim.ActiveBuffer;
                Assert.True(didRun);
            }

            [Fact]
            public void ActiveBuffer3()
            {
                var textView = CreateTextView();
                var buffer = _vim.CreateVimBuffer(textView);
                buffer.Process('a');
                Assert.True(_vim.ActiveBuffer.IsNone());
            }
        }
    }
}
