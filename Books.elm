module Books exposing (..)

import Html
import Punctuation exposing (..)


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


formatParagraph : Paragraph -> String
formatParagraph =
    List.map (\s -> punctuate s.punctuation s.text) >> String.join " "


formatBook : Book -> Html.Html msg
formatBook b =
    Html.div []
        ([ Html.h1 [] [ Html.text b.title ] ]
            ++ List.map (formatParagraph >> Html.text) b.text
        )
