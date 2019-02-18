module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Attribute, Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { content : String
    }


init : Model
init =
    { content = ""
    }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model
                | content = newContent
            }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text <| longOrShort <| model.content ]
        , input [ placeholder "Paste a line here", value model.content, onInput Change ] []
        ]


longOrShort : String -> String
longOrShort line =
    let
        length : Int
        length =
            String.length line
    in
    if length < 90 && length > 45 then
        "the line is the ideal length, congrats"

    else
        "RIDICOULOUS"
