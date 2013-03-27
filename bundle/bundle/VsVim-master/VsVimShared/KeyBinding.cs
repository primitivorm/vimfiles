﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Vim;

namespace VsVim
{
    /// <summary>
    /// KeyBinding in Visual Studio as set through the Key board part of the Environment options
    /// panel
    /// </summary>
    public sealed class KeyBinding : IEquatable<KeyBinding>
    {
        private readonly Lazy<string> _commandString;

        public readonly string Scope;
        public readonly IEnumerable<KeyStroke> KeyStrokes;

        public KeyStroke FirstKeyStroke
        {
            get { return KeyStrokes.First(); }
        }

        /// <summary>
        /// Visual Studio string which is the equivalent of this KeyBinding instance
        /// </summary>
        public string CommandString
        {
            get { return _commandString.Value; }
        }

        public KeyBinding(string scope, KeyStroke stroke)
        {
            Scope = scope;
            KeyStrokes = Enumerable.Repeat(stroke, 1);
            _commandString = new Lazy<string>(CreateCommandString);
        }

        public KeyBinding(string scope, IEnumerable<KeyStroke> strokes)
        {
            Scope = scope;
            KeyStrokes = strokes.ToList();
            _commandString = new Lazy<string>(CreateCommandString);
        }

        #region Equality

        public override int GetHashCode()
        {
            return Scope.GetHashCode() ^ CommandString.GetHashCode();
        }

        public override bool Equals(object obj)
        {
            var other = obj as KeyBinding;
            return Equals(other);
        }

        public bool Equals(KeyBinding other)
        {
            if (ReferenceEquals(other, null))
            {
                return false;
            }

            var comp = StringComparer.OrdinalIgnoreCase;
            return
                comp.Equals(Scope, other.Scope)
                && comp.Equals(CommandString, other.CommandString);
        }

        public static bool operator ==(KeyBinding left, KeyBinding right)
        {
            return EqualityComparer<KeyBinding>.Default.Equals(left, right);
        }

        public static bool operator !=(KeyBinding left, KeyBinding right)
        {
            return !EqualityComparer<KeyBinding>.Default.Equals(left, right);
        }

        #endregion

        private string CreateCommandString()
        {
            var builder = new StringBuilder();
            builder.Append(Scope);
            builder.Append("::");
            var isFirst = true;
            foreach (var stroke in KeyStrokes)
            {
                if (!isFirst)
                {
                    builder.Append(", ");
                }
                isFirst = false;
                AppendCommandForSingle(stroke, builder);
            }

            return builder.ToString();
        }

        private static void AppendCommandForSingle(KeyStroke stroke, StringBuilder builder)
        {
            if (0 != (stroke.KeyModifiers & KeyModifiers.Control))
            {
                builder.Append("Ctrl+");
            }
            if (0 != (stroke.KeyModifiers & KeyModifiers.Shift))
            {
                builder.Append("Shift+");
            }
            if (0 != (stroke.KeyModifiers & KeyModifiers.Alt))
            {
                builder.Append("Alt+");
            }

            EnsureVsMap();
            var input = stroke.KeyInput;
            var query = _vsMap.Where(x => x.Value == input);
            if (query.Any())
            {
                builder.Append(query.First().Key);
            }
            else if (Char.IsLetter(input.Char))
            {
                builder.Append(Char.ToUpper(input.Char));
            }
            else if (input.Char == ' ')
            {
                builder.Append("Space");
            }
            else
            {
                builder.Append(input.Char);
            }
        }

        public override string ToString()
        {
            return CommandString;
        }

        public static string CreateKeyBindingStringForSingleKeyStroke(KeyStroke stroke)
        {
            var builder = new StringBuilder();
            AppendCommandForSingle(stroke, builder);
            return builder.ToString();
        }

        #region Parsing Methods

        private static readonly string[] ModifierPrefix = new[] { "Shift", "Alt", "Ctrl" };
        private static Dictionary<string, KeyInput> _vsMap;

        private static void BuildVsMap()
        {
            var map = new Dictionary<string, KeyInput>(StringComparer.OrdinalIgnoreCase);
            map.Add("Down Arrow", KeyInputUtil.VimKeyToKeyInput(VimKey.Down));
            map.Add("Up Arrow", KeyInputUtil.VimKeyToKeyInput(VimKey.Up));
            map.Add("Left Arrow", KeyInputUtil.VimKeyToKeyInput(VimKey.Left));
            map.Add("Right Arrow", KeyInputUtil.VimKeyToKeyInput(VimKey.Right));
            map.Add("Bkspce", KeyInputUtil.VimKeyToKeyInput(VimKey.Back));
            map.Add("PgDn", KeyInputUtil.VimKeyToKeyInput(VimKey.PageDown));
            map.Add("PgUp", KeyInputUtil.VimKeyToKeyInput(VimKey.PageUp));
            map.Add("Ins", KeyInputUtil.VimKeyToKeyInput(VimKey.Insert));
            map.Add("Del", KeyInputUtil.VimKeyToKeyInput(VimKey.Delete));
            map.Add("Esc", KeyInputUtil.EscapeKey);
            map.Add("Break", KeyInputUtil.CharWithControlToKeyInput('c'));
            map.Add("Num +", KeyInputUtil.VimKeyToKeyInput(VimKey.KeypadPlus));
            map.Add("Num -", KeyInputUtil.VimKeyToKeyInput(VimKey.KeypadMinus));
            map.Add("Num /", KeyInputUtil.VimKeyToKeyInput(VimKey.KeypadDivide));
            map.Add("Num *", KeyInputUtil.VimKeyToKeyInput(VimKey.KeypadMultiply));
            map.Add("Enter", KeyInputUtil.EnterKey);
            map.Add("Tab", KeyInputUtil.TabKey);
            map.Add("Home", KeyInputUtil.VimKeyToKeyInput(VimKey.Home));
            map.Add("End", KeyInputUtil.VimKeyToKeyInput(VimKey.End));
            map.Add("F1", KeyInputUtil.VimKeyToKeyInput(VimKey.F1));
            map.Add("F2", KeyInputUtil.VimKeyToKeyInput(VimKey.F2));
            map.Add("F3", KeyInputUtil.VimKeyToKeyInput(VimKey.F3));
            map.Add("F4", KeyInputUtil.VimKeyToKeyInput(VimKey.F4));
            map.Add("F5", KeyInputUtil.VimKeyToKeyInput(VimKey.F5));
            map.Add("F6", KeyInputUtil.VimKeyToKeyInput(VimKey.F6));
            map.Add("F7", KeyInputUtil.VimKeyToKeyInput(VimKey.F7));
            map.Add("F8", KeyInputUtil.VimKeyToKeyInput(VimKey.F8));
            map.Add("F9", KeyInputUtil.VimKeyToKeyInput(VimKey.F9));
            map.Add("F10", KeyInputUtil.VimKeyToKeyInput(VimKey.F10));
            map.Add("F11", KeyInputUtil.VimKeyToKeyInput(VimKey.F11));
            map.Add("F12", KeyInputUtil.VimKeyToKeyInput(VimKey.F12));
            map.Add("Space", KeyInputUtil.CharToKeyInput(' '));

            _vsMap = map;
        }

        private static void EnsureVsMap()
        {
            if (null == _vsMap)
            {
                BuildVsMap();
            }
        }

        private static bool TryConvertToModifierKeys(string mod, out KeyModifiers modKeys)
        {
            var comp = StringComparer.OrdinalIgnoreCase;
            if (comp.Equals(mod, "shift"))
            {
                modKeys = KeyModifiers.Shift;
            }
            else if (comp.Equals(mod, "ctrl"))
            {
                modKeys = KeyModifiers.Control;
            }
            else if (comp.Equals(mod, "alt"))
            {
                modKeys = KeyModifiers.Alt;
            }
            else
            {
                modKeys = KeyModifiers.None;
                return false;
            }

            return true;
        }

        /// <summary>
        /// Convert the single character to a KeyInput. Visual Studio doesn't 
        /// differentiate between upper and lower case alpha characters.  
        /// Use all lower case for simplicity elsewhere
        /// </summary>
        private static KeyInput ConvertToKeyInput(char c)
        {
            c = Char.IsLetter(c) ? Char.ToLower(c) : c;
            return KeyInputUtil.CharToKeyInput(c);
        }

        private static KeyInput ConvertToKeyInput(string keystroke)
        {
            if (keystroke.Length == 1)
            {
                return ConvertToKeyInput(keystroke[0]);
            }

            KeyInput vs;
            if (TryConvertVsSpecificKey(keystroke, out vs))
            {
                return vs;
            }

            return null;
        }

        /// <summary>
        /// Try and convert the given string into a Visual Studio specific key stroke.
        /// </summary>
        private static bool TryConvertVsSpecificKey(string keystroke, out KeyInput keyInput)
        {
            EnsureVsMap();
            if (_vsMap.TryGetValue(keystroke, out keyInput))
            {
                return true;
            }

            if (keystroke.StartsWith("Num ", StringComparison.OrdinalIgnoreCase))
            {
                keyInput = null;
                switch (keystroke.ToLower())
                {
                    case "num +":
                        keyInput = KeyInputUtil.VimKeyToKeyInput(VimKey.KeypadPlus);
                        break;
                    case "num /":
                        keyInput = KeyInputUtil.VimKeyToKeyInput(VimKey.KeypadDivide);
                        break;
                    case "num *":
                        keyInput = KeyInputUtil.VimKeyToKeyInput(VimKey.KeypadMultiply);
                        break;
                    case "num -":
                        keyInput = KeyInputUtil.VimKeyToKeyInput(VimKey.KeypadMinus);
                        break;
                }
                return keyInput != null;
            }

            keyInput = null;
            return false;
        }

        private static KeyStroke ParseOne(string entry)
        {
            // If it's of length 1 it can only be a single keystroke entry
            if (entry.Length == 1)
            {
                return new KeyStroke(ConvertToKeyInput(entry), KeyModifiers.None);
            }

            // First get rid of the Modifiers
            var mod = KeyModifiers.None;
            while (ModifierPrefix.Any(x => entry.StartsWith(x, StringComparison.OrdinalIgnoreCase)))
            {
                var index = entry.IndexOf('+');
                if (index < 0)
                {
                    return null;
                }

                var value = entry.Substring(0, index);
                var modKeys = KeyModifiers.None;
                if (!TryConvertToModifierKeys(value, out modKeys))
                {
                    return null;
                }
                mod |= modKeys;
                entry = entry.Substring(index + 1).TrimStart();
            }

            var ki = ConvertToKeyInput(entry);
            if (ki == null)
            {
                return null;
            }

            return new KeyStroke(ki, mod);
        }

        /// <summary>
        /// Parse the key binding format as described by the Command.Bindings documentation
        /// 
        /// http://msdn.microsoft.com/en-us/library/envdte.command.bindings.aspx
        /// </summary>
        public static KeyBinding Parse(string binding)
        {
            KeyBinding keyBinding;
            if (!TryParse(binding, out keyBinding))
            {
                throw new ArgumentException("Invalid key binding");
            }

            return keyBinding;
        }

        public static bool TryParse(string binding, out KeyBinding keyBinding)
        {
            keyBinding = default(KeyBinding);
            var scopeEnd = binding.IndexOf(':');
            if (scopeEnd < 0)
            {
                return false;
            }

            var scope = binding.Substring(0, scopeEnd);
            var rest = binding.Substring(scopeEnd + 2);
            var entries = rest
                .Split(new string[] { ", " }, StringSplitOptions.RemoveEmptyEntries)
                .Select(x => ParseOne(x));
            if (entries.Any(x => x == null))
            {
                return false;
            }

            keyBinding = new KeyBinding(scope, entries);
            return true;
        }

        #endregion
    }
}
