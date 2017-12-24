module Main exposing (..)

import Html exposing (Html, text, div, h1, img, span, p)
import Html.Attributes exposing (src, id, class)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----
viewHeading : Html Msg
viewHeading =
    h1
        []
        [ span [ class "main-01" ] [ text "__" ]
        , span [ class "main-02" ] [ text "." ]
        , span [ class "main-03" ] [ text "the" ]
        , span [ class "main-04" ] [ text "Artsy" ]
        , span [ class "main-05" ] [ text "Tinkerer" ]
        ]

viewLogo : Html Msg
viewLogo =
    img
        [ src "./images/atom_v2.svg"
        , class "atom-logo"
        ] []

viewLeadContent : Html Msg
viewLeadContent =
    p
        [ class "lead" ]
        [ span
                [ class "headline-description" ]
                [ text "Hi, I'm" ]
        ]


view : Model -> Html Msg
view model =
    div
        [ id "container" ]
        [ div
            [ id "main" ]
            [ viewHeading
            , viewLogo
            , viewLeadContent
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
