﻿#light

namespace Vim
open System
open StringBuilderExtensions

// TODO: Use pascal case in this type
module internal StringUtil =

    [<CompiledName("Empty")>]
    let empty = System.String.Empty

    [<CompiledName("FindFirst")>]
    let findFirst (input:seq<char>) index del =
        let found = 
            input 
                |> Seq.mapi ( fun i c -> (i,c) )
                |> Seq.skip index 
                |> Seq.skipWhile (fun (i,c) -> not (del c))
        match Seq.isEmpty found with
            | true -> None
            | false -> Some (Seq.head found)

    [<CompiledName("isValidIndex")>]
    let isValidIndex index (input:string) = index >= 0 && index < input.Length
            
    [<CompiledName("CharAtOption")>]
    let charAtOption index (input:string) = 
        match isValidIndex index input with
            | true -> Some input.[index]
            | false -> None
            
    [<CompiledName("CharAt")>]
    let charAt index input =
        match charAtOption index input with 
            | Some c -> c
            | None -> failwith "Invalid index"
    
    [<CompiledName("Repeat")>]
    let repeat count (value:string) =
        if 1 = count then value
        else
            let buffer = new System.Text.StringBuilder()
            for i = 1 to count do
                buffer.AppendString value
            buffer.ToString()

    [<CompiledName("ReplaceNoCase")>]
    let replaceNoCase (source : string) (toFind : string) (toReplace : string) = 
        let builder = System.Text.StringBuilder()
        let mutable lastIndex = 0
        let mutable index = source.IndexOf(toFind, StringComparison.OrdinalIgnoreCase)
        while index >= 0 do
            builder.AppendSubstring source lastIndex (index - lastIndex)
            builder.AppendString toReplace 
            lastIndex <- index + toFind.Length
            index <- source.IndexOf(toFind, lastIndex, StringComparison.OrdinalIgnoreCase)

        if lastIndex < source.Length then
            builder.AppendSubstring source lastIndex (source.Length - lastIndex)
        builder.ToString()

    [<CompiledName("RepeatChar")>]
    let repeatChar count (value : char) =
        if 1 = count then (value.ToString())
        else
            let buffer = new System.Text.StringBuilder()
            for i = 1 to count do
                buffer.AppendChar value
            buffer.ToString()

    /// Create a String from an array of chars
    [<CompiledName("OfCharArray")>]
    let ofCharArray (chars:char[]) = new System.String(chars)

    /// Create a String from a sequence of chars
    [<CompiledName("OfCharSeq")>]
    let ofCharSeq (chars : char seq) = chars |> Array.ofSeq |> ofCharArray

    [<CompiledName("OfCharList")>]
    let ofCharList (chars :char list) = chars |> Seq.ofList |> ofCharSeq

    /// Create a String from a single char
    [<CompiledName("OfChar")>]
    let ofChar c = System.String(c,1)

    [<CompiledName("OfStringSeq")>]
    let ofStringSeq (strings : string seq) = 
        let builder = System.Text.StringBuilder()
        for value in strings do
            builder.AppendString value
        builder.ToString()

    [<CompiledName("IsNullOrEmpty")>]
    let isNullOrEmpty str = System.String.IsNullOrEmpty(str)

    [<CompiledName("IndexOfChar")>]
    let indexOfChar (c : char) (str : string) = 
        let result = str.IndexOf(c)
        if result < 0 then None
        else Some result

    [<CompiledName("IndexOfCharAt")>]
    let indexOfCharAt (c : char) (index : int) (str : string) = 
        let result = str.IndexOf(c, index)
        if result < 0 then None
        else Some result

    [<CompiledName("IndexOfString")>]
    let indexOfString (toFind : string) (str : string) = 
        let result = str.IndexOf(toFind)
        if result < 0 then None
        else Some result

    [<CompiledName("IndexOfStringAt")>]
    let indexOfStringAt (toFind : string) (index : int) (str : string) = 
        let result = str.IndexOf(toFind, index)
        if result < 0 then None
        else Some result

    [<CompiledName("length")>]
    let length (str:string) = 
        if str = null then 0
        else str.Length

    [<CompiledName("IsEqualIgnoreCase")>]
    let isEqualIgnoreCase left right = 
        let comp = System.StringComparer.OrdinalIgnoreCase
        comp.Equals(left,right)

    [<CompiledName("IsEqual")>]
    let isEqual left right = 
        let comp = System.StringComparer.Ordinal
        comp.Equals(left,right)

    [<CompiledName("Split")>]
    let split c (value:string) = value.Split( [| c |]) 

    [<CompiledName("Last")>]
    let last value =
        let index = (length value) - 1
        value.[index]

    [<CompiledName("EndsWith")>]
    let endsWith suffix (value:string) = value.EndsWith(suffix, System.StringComparison.Ordinal)

    [<CompiledName("StartsWith")>]
    let startsWith prefix (value:string) = value.StartsWith(prefix, System.StringComparison.Ordinal)

    [<CompiledName("StartsWithIgnoreCase")>]
    let startsWithIgnoreCase prefix (value:string) = value.StartsWith(prefix, System.StringComparison.OrdinalIgnoreCase)

    [<CompiledName("CombineWith")>]
    let combineWith (arg:string) (values:string seq) =
        let builder = new System.Text.StringBuilder()
        values |> Seq.iteri (fun i str -> 
            if i <> 0 then 
                builder.AppendString arg
            builder.AppendString str)
        builder.ToString()

    [<CompiledName("ContainsChar")>]
    let containsChar (arg:string) (c:char) = arg.IndexOf(c) >= 0

    [<CompiledName("IsWhiteSpace")>]
    let isWhiteSpace (arg : string) = not (Seq.exists CharUtil.IsNotWhiteSpace arg)

    [<CompiledName("IsBlanks")>]
    let isBlanks (arg : string) = Seq.forall CharUtil.IsBlank arg

