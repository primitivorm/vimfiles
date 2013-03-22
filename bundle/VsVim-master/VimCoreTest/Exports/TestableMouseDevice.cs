﻿using System.ComponentModel.Composition;
using Vim;

namespace Vim.UnitTest.Exports
{
    [Export(typeof(IMouseDevice))]
    public sealed class TestableMouseDevice : IMouseDevice
    {
        public bool IsLeftButtonPressed { get; set; }

        bool IMouseDevice.IsLeftButtonPressed
        {
            get { return IsLeftButtonPressed; }
        }
    }
}
