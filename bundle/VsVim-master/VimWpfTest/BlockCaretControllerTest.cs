﻿using Microsoft.VisualStudio.Text.Editor;
using Moq;
using Vim.Extensions;
using Vim.UI.Wpf.Implementation.BlockCaret;
using Vim.UnitTest.Mock;
using Xunit;

namespace Vim.UI.Wpf.UnitTest
{
    public sealed class BlockCaretControllerTest
    {
        private readonly MockRepository _factory;
        private readonly Mock<ITextView> _textView;
        private readonly Mock<IVimBuffer> _buffer;
        private readonly Mock<IBlockCaret> _caret;
        private readonly Mock<IVimGlobalSettings> _settings;
        private readonly Mock<IVimLocalSettings> _localSettings;
        private readonly Mock<IIncrementalSearch> _incrementalSearch;
        private readonly BlockCaretController _controller;

        public BlockCaretControllerTest()
        {
            _factory = new MockRepository(MockBehavior.Loose);
            _textView = _factory.Create<ITextView>(MockBehavior.Strict);
            _settings = _factory.Create<IVimGlobalSettings>(MockBehavior.Loose);
            _localSettings = MockObjectFactory.CreateLocalSettings(global: _settings.Object, factory: _factory);
            _incrementalSearch = _factory.Create<IIncrementalSearch>();
            _incrementalSearch.SetupGet(x => x.InSearch).Returns(false);
            _buffer = _factory.Create<IVimBuffer>(MockBehavior.Strict);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Command);
            _buffer.SetupGet(x => x.TextView).Returns(_textView.Object);
            _buffer.SetupGet(x => x.LocalSettings).Returns(_localSettings.Object);
            _buffer.SetupGet(x => x.IncrementalSearch).Returns(_incrementalSearch.Object);
            _caret = _factory.Create<IBlockCaret>(MockBehavior.Strict);
            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.Invisible);
            _caret.SetupSet(x => x.CaretOpacity = It.IsAny<double>());
            _controller = new BlockCaretController(_buffer.Object, _caret.Object);
        }

        [Fact]
        public void OperatorPending1()
        {
            var mode = new Mock<INormalMode>();
            mode.SetupGet(x => x.KeyRemapMode).Returns(FSharpOption.Create(KeyRemapMode.OperatorPending)).Verifiable();
            _buffer.SetupGet(x => x.NormalMode).Returns(mode.Object);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Normal);

            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.HalfBlock).Verifiable();
            _controller.Update();
            _caret.Verify();
        }

        /// <summary>
        /// Other modes shouldn't even consider operator pending
        /// </summary>
        [Fact]
        public void OperatorPending2()
        {
            var mode = new Mock<INormalMode>();
            mode.SetupGet(x => x.KeyRemapMode).Returns(FSharpOption.Create(KeyRemapMode.OperatorPending)).Verifiable();
            _buffer.SetupGet(x => x.NormalMode).Returns(mode.Object);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Command);
            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.Invisible).Verifiable();
            _controller.Update();
            _caret.Verify();
        }

        [Fact]
        public void IsInReplace1()
        {
            var mode = new Mock<INormalMode>();
            mode.SetupGet(x => x.IsInReplace).Returns(true);
            _buffer.SetupGet(x => x.NormalMode).Returns(mode.Object);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Normal);

            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.QuarterBlock).Verifiable();
            _controller.Update();
            _caret.Verify();
        }

        /// <summary>
        /// Replace wins over operator pending
        /// </summary>
        [Fact]
        public void IsInReplace2()
        {
            var mode = new Mock<INormalMode>();
            mode.SetupGet(x => x.IsInReplace).Returns(true);
            mode.SetupGet(x => x.KeyRemapMode).Returns(FSharpOption.Create(KeyRemapMode.Normal)).Verifiable();
            _buffer.SetupGet(x => x.NormalMode).Returns(mode.Object);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Normal);

            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.QuarterBlock).Verifiable();
            _controller.Update();
            _caret.Verify();
        }

        [Fact]
        public void NormalMode1()
        {
            var mode = new Mock<INormalMode>();
            _buffer.SetupGet(x => x.NormalMode).Returns(mode.Object);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Normal);

            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.Block).Verifiable();
            _controller.Update();
            _caret.Verify();
        }

        [Fact]
        public void NormalMode2()
        {
            var mode = new Mock<INormalMode>();
            _buffer.SetupGet(x => x.NormalMode).Returns(mode.Object);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Normal);
            _incrementalSearch.SetupGet(x => x.InSearch).Returns(true);

            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.Invisible).Verifiable();
            _controller.Update();
            _caret.Verify();
        }

        [Fact]
        public void CommandMode1()
        {
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Command);
            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.Invisible);
            _controller.Update();
        }

        [Fact]
        public void DisabledMode1()
        {
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Disabled);
            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.NormalCaret);
            _controller.Update();
        }

        [Fact]
        public void VisualMode1()
        {
            _settings.SetupGet(x => x.IsSelectionInclusive).Returns(true);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.VisualBlock);
            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.Block);
            _controller.Update();
        }

        [Fact]
        public void VisualMode2()
        {
            _settings.SetupGet(x => x.IsSelectionInclusive).Returns(true);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.VisualCharacter);
            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.Block);
            _controller.Update();
        }

        [Fact]
        public void VisualMode3()
        {
            _settings.SetupGet(x => x.IsSelectionInclusive).Returns(true);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.VisualLine);
            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.Block);
            _controller.Update();
        }

        /// <summary>
        /// The caret should be invisible for incremental search even in visual mode
        /// </summary>
        [Fact]
        public void VisualMode_InIncrementalSearch()
        {
            _incrementalSearch.SetupGet(x => x.InSearch).Returns(true);
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.VisualCharacter);

            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.Invisible).Verifiable();
            _controller.Update();
            _caret.Verify();
        }

        [Fact]
        public void ReplaceMode1()
        {
            _buffer.SetupGet(x => x.ModeKind).Returns(ModeKind.Replace);
            _caret.SetupSet(x => x.CaretDisplay = CaretDisplay.QuarterBlock);
            _controller.Update();
        }

        [Fact]
        public void CaretOpacity1()
        {
            _caret.SetupSet(x => x.CaretOpacity = 0.01d).Verifiable();
            var setting = new Setting(
                GlobalSettingNames.CaretOpacityName,
                "",
                LiveSettingValue.NewString("", ""),
                true);
            _settings.SetupGet(x => x.CaretOpacity).Returns(1);
            _settings.Raise(x => x.SettingChanged += null, null, new SettingEventArgs(setting));
            _caret.Verify();
        }
    }
}
