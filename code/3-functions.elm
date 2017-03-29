import Html


{-| Add punctuation to a sentence.
-}
punctuate : String -> String -> String
punctuate mark sentence =
    sentence ++ mark


{-| Add an exclamation point to a sentence.
-}
exclaim : String -> String
exclaim sentence =
    punctuate "!" sentence


main : Html.Html msg
main =
    exclaim "Hello, world"
        |> Html.text
