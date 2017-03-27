import Html
import Books exposing (..)
import Punctuation exposing (..)

main : Html.Html msg
main =
    let
        p1 =
            [ Sentence "There was a null dereference" Period
            , Sentence "It was coming from inside the house" ExclamationMark
            ]

        book =
            Book "A Nightmare on Javascript Lane" [ p1 ]
    in
        formatBook book
