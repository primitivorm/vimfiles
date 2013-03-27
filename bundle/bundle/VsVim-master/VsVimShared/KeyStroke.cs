﻿using System;
using System.Collections.Generic;
using Vim;

namespace VsVim
{
    /// <summary>
    /// Represents a Visual Studio key stroke for the purpose of command binding.  Need
    /// to separate out the modifiers and KeyInput because they have separate meanings
    /// for Visual Studio commands.  It is possible for example to have the following
    /// key binding
    ///
    ///     Ctrl + }
    ///
    /// However on most key boards this can't be created without actually using the Shift
    /// key as well to create the }.  This abstraction separates out the key input and the
    /// modifiers 
    /// </summary>
    public sealed class KeyStroke : IEquatable<KeyStroke>
    {
        private readonly KeyInput _keyInput;
        private readonly KeyModifiers _keyModifiers;

        /// <summary>
        /// Actualy Key being entered
        /// </summary>
        public KeyInput KeyInput
        {
            get { return _keyInput; }
        }

        /// <summary>
        /// Modifiers being applied to that key
        /// </summary>
        public KeyModifiers KeyModifiers
        {
            get { return _keyModifiers; }
        }

        /// <summary>
        /// Actual character in the key stroke without the additional modifiers
        /// </summary>
        public char Char
        {
            get { return _keyInput.Char; }
        }

        /// <summary>
        /// Actual VimKey used in the keystroke without the additional modifiers
        /// </summary>
        public VimKey Key
        {
            get { return _keyInput.Key; }
        }

        /// <summary>
        /// KeyInput which is the result of both the provided KeyInput and the additional
        /// modifiers
        /// </summary>
        public KeyInput AggregateKeyInput
        {
            get { return KeyInputUtil.ApplyModifiers(_keyInput, _keyModifiers | _keyInput.KeyModifiers); }
        }

        public KeyStroke(KeyInput keyInput, KeyModifiers modifiers)
        {
            _keyInput = keyInput;
            _keyModifiers = modifiers;
        }

        public override int GetHashCode()
        {
            return _keyInput.GetHashCode() ^ _keyModifiers.GetHashCode();
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as KeyStroke);
        }

        public bool Equals(KeyStroke other)
        {
            if (other == null)
            {
                return false;
            }

            return this.KeyInput == other.KeyInput
                && this.KeyModifiers == other.KeyModifiers;
        }

        public static bool operator ==(KeyStroke left, KeyStroke right)
        {
            return EqualityComparer<KeyStroke>.Default.Equals(left, right);
        }

        public static bool operator !=(KeyStroke left, KeyStroke right)
        {
            return !EqualityComparer<KeyStroke>.Default.Equals(left, right);
        }
    }
}
