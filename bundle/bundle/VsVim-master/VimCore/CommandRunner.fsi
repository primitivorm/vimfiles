﻿#light

namespace Vim
open Microsoft.VisualStudio.Text
open Microsoft.VisualStudio.Text.Operations
open Microsoft.VisualStudio.Text.Editor
open Vim

type internal CommandRunner =
    interface ICommandRunner
    new : ITextView * IRegisterMap * IMotionCapture * ICommandUtil * IStatusUtil * VisualKind-> CommandRunner

