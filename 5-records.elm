import Html
import String

type Punctuation
    = Period
    | QuestionMark
    | ExclamationMark

type alias Sentence =
    { text : String
    , punctuation : Punctuation
    }

type alias Paragraph =
    List Sentence

type alias Book =
    { title : String
    , text : List Paragraph
    }

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

formatParagraph : Paragraph -> String
formatParagraph =
    List.map (\s -> punctuate s.punctuation s.text) >> String.join " "

formatBook : Book -> Html.Html msg
formatBook b =
    Html.div []
        ([ Html.h1 [] [ Html.text b.title ] ]
             ++ List.map (formatParagraph >> Html.text) b.text)

main =
    let
        p1 =
            [ Sentence "There was a null dereference" Period
            , Sentence "It was coming from inside the house" ExclamationMark
            ]

        book =
            { title = "A Nightmare on Javascript Lane"
            , text = [ p1 ]
            }
    in
        formatBook book
