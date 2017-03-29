module Main exposing (..)

import Html exposing (Html, Attribute, button, text, div, input, program)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Platform.Cmd
import Platform.Sub
import String


type alias Model =
    String


type Msg
    = SetMsg String
    | ClearMsg


update : Msg -> Model -> ( Model, Platform.Cmd.Cmd Msg )
update msg model =
    case msg of
        SetMsg m ->
            ( m, Platform.Cmd.none )

        ClearMsg ->
            ("", Platform.Cmd.none)


view : Model -> Html Msg
view model =
    div []
        [ input
            [ placeholder "Text to reverse"
            , value model
            , onInput SetMsg
            , inputStyle
            ]
            []
        , input
            [ placeholder "Reversed text"
            , value (String.reverse model)
            , inputStyle
            , disabled True
            ]
            []
        , button [onClick ClearMsg] [text "Clear"]
        ]


inputStyle : Attribute Msg
inputStyle =
    style
        [ ( "width", "100%" )
        , ( "height", "40px" )
        , ( "padding", "10px 0" )
        , ( "font-size", "2em" )
        , ( "text-align", "center" )
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = ( "", Platform.Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Platform.Sub.none
        }
