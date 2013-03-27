﻿using System;
using System.Collections.Generic;
using System.Windows.Input;
using Vim.UI.Wpf.Implementation.Keyboard;
using Xunit;

namespace Vim.UI.Wpf.UnitTest
{
    public class KeyUtilTest
    {
        private IKeyUtil _keyUtil;
        private KeyUtil _keyUtilRaw;

        public KeyUtilTest()
        {
            _keyUtilRaw = new KeyUtil();
            _keyUtil = _keyUtilRaw;
        }

        private void KeyToKeyInput(char c, Key key)
        {
            KeyToKeyInput(c, key, ModifierKeys.None);
        }

        private KeyInput ConvertToKeyInput(Key key)
        {
            return ConvertToKeyInput(key, ModifierKeys.None);
        }

        private KeyInput ConvertToKeyInput(Key key, ModifierKeys modKeys)
        {
            KeyInput ki;
            Assert.True(_keyUtilRaw.TryConvertToKeyInput(key, modKeys, out ki));
            return ki;
        }

        private void KeyToKeyInput(char c, Key key, ModifierKeys mod)
        {
            var left = KeyInputUtil.CharToKeyInput(c);
            KeyInput right;
            Assert.True(_keyUtilRaw.TryConvertToKeyInput(key, mod, out right));
            Assert.Equal(left, right);
        }

        private void WellKnownBothWays(VimKey wellKnownKey, Key key)
        {
            var left = KeyInputUtil.VimKeyToKeyInput(wellKnownKey);
            KeyInput right;
            Assert.True(_keyUtilRaw.TryConvertToKeyInput(key, out right));
            Assert.Equal(left, right);
        }

        [Fact]
        public void KeyToKeyInputMatchesExpected()
        {
            KeyToKeyInput(' ', Key.Space);
            KeyToKeyInput(';', Key.OemSemicolon);
            KeyToKeyInput(':', Key.OemSemicolon, ModifierKeys.Shift);
            KeyToKeyInput('/', Key.Oem2);
            KeyToKeyInput('?', Key.Oem2, ModifierKeys.Shift);
            KeyToKeyInput('.', Key.OemPeriod);
            KeyToKeyInput('>', Key.OemPeriod, ModifierKeys.Shift);
            KeyToKeyInput(',', Key.OemComma);
            KeyToKeyInput('<', Key.OemComma, ModifierKeys.Shift);
            KeyToKeyInput('[', Key.OemOpenBrackets);
            KeyToKeyInput('{', Key.OemOpenBrackets, ModifierKeys.Shift);
            KeyToKeyInput(']', Key.OemCloseBrackets);
            KeyToKeyInput('}', Key.OemCloseBrackets, ModifierKeys.Shift);
            KeyToKeyInput('-', Key.OemMinus);
            KeyToKeyInput('=', Key.OemPlus);
            KeyToKeyInput('+', Key.OemPlus, ModifierKeys.Shift);
            KeyToKeyInput('~', Key.OemTilde, ModifierKeys.Shift);
        }

        [Fact]
        public void WellKnownBothWaysMatchesExpected()
        {
            WellKnownBothWays(VimKey.Left, Key.Left);
            WellKnownBothWays(VimKey.Right, Key.Right);
            WellKnownBothWays(VimKey.Up, Key.Up);
            WellKnownBothWays(VimKey.Down, Key.Down);
            WellKnownBothWays(VimKey.F1, Key.F1);
            WellKnownBothWays(VimKey.F2, Key.F2);
            WellKnownBothWays(VimKey.F3, Key.F3);
            WellKnownBothWays(VimKey.F4, Key.F4);
            WellKnownBothWays(VimKey.F5, Key.F5);
            WellKnownBothWays(VimKey.F6, Key.F6);
            WellKnownBothWays(VimKey.F7, Key.F7);
            WellKnownBothWays(VimKey.F8, Key.F8);
            WellKnownBothWays(VimKey.F9, Key.F9);
            WellKnownBothWays(VimKey.F10, Key.F10);
            WellKnownBothWays(VimKey.F11, Key.F11);
            WellKnownBothWays(VimKey.F12, Key.F12);
            WellKnownBothWays(VimKey.Delete, Key.Delete);
            WellKnownBothWays(VimKey.KeypadMultiply, Key.Multiply);
            WellKnownBothWays(VimKey.KeypadPlus, Key.Add);
            WellKnownBothWays(VimKey.KeypadMinus, Key.Subtract);
            WellKnownBothWays(VimKey.KeypadDecimal, Key.Decimal);
            WellKnownBothWays(VimKey.KeypadDivide, Key.Divide);
            WellKnownBothWays(VimKey.Keypad0, Key.NumPad0);
            WellKnownBothWays(VimKey.Keypad1, Key.NumPad1);
            WellKnownBothWays(VimKey.Keypad2, Key.NumPad2);
            WellKnownBothWays(VimKey.Keypad3, Key.NumPad3);
            WellKnownBothWays(VimKey.Keypad4, Key.NumPad4);
            WellKnownBothWays(VimKey.Keypad5, Key.NumPad5);
            WellKnownBothWays(VimKey.Keypad6, Key.NumPad6);
            WellKnownBothWays(VimKey.Keypad7, Key.NumPad7);
            WellKnownBothWays(VimKey.Keypad8, Key.NumPad8);
            WellKnownBothWays(VimKey.Keypad9, Key.NumPad9);
        }

        [Fact]
        public void ConvertToKeyInput_AKeyAndShift()
        {
            var ki = ConvertToKeyInput(Key.A, ModifierKeys.Shift);
            Assert.Equal(KeyInputUtil.CharToKeyInput('A'), ki);
        }

        [Fact]
        public void ConvertToKeyInput_AKey()
        {
            var ki = ConvertToKeyInput(Key.A, ModifierKeys.None);
            Assert.Equal('a', ki.Char);
            Assert.Equal(KeyModifiers.None, ki.KeyModifiers);
        }

        [Fact]
        public void ConvertToKeyInput_AKeyAndControl()
        {
            var keyInput = ConvertToKeyInput(Key.A, ModifierKeys.Control);
            Assert.Equal(KeyInputUtil.CharWithControlToKeyInput('a'), keyInput);
        }

        [Fact]
        public void ConvertToKeyInput4()
        {
            var list = new List<Tuple<char, Key>>() {
                    Tuple.Create('1', Key.D1),
                    Tuple.Create('2', Key.D2),
                    Tuple.Create('3', Key.D3) };
            foreach (var tuple in list)
            {
                var ki = ConvertToKeyInput(tuple.Item2, ModifierKeys.None);
                Assert.Equal(tuple.Item1, ki.Char);
                Assert.Equal(KeyModifiers.None, ki.KeyModifiers);
            }
        }

        [Fact]
        public void ConvertToKeyInput5()
        {
            var ki = ConvertToKeyInput(Key.F12, ModifierKeys.Shift | ModifierKeys.Control);
            Assert.Equal(VimKey.F12, ki.Key);
            Assert.Equal(KeyModifiers.Shift | KeyModifiers.Control, ki.KeyModifiers);
        }
    }
}
