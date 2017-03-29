import Html


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


exclaim : String -> String
exclaim =
    punctuate ExclamationMark


main =
    exclaim "The owls are not what they seem"
        |> Html.text
