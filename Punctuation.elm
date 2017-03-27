module Punctuation exposing (..)

type Punctuation
    = Period
    | QuestionMark
    | ExclamationMark

punctuate : Punctuation -> String -> String
punctuate p s =
    let
        mark =
            case p of
                Period -> "."
                QuestionMark -> "?"
                ExclamationMark -> "!"
    in
        s ++ mark
