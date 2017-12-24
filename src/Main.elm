module Main exposing (..)

import Html exposing (Html, text, div, h1, h3, img, span, p, a, i)
import Html.Attributes exposing (src, id, class, target, href)


---- MODEL ----


type alias ShowcaseItem =
    { id : Int
    , title : String
    , link : String
    }


type alias Model =
    { showcaseList : List ShowcaseItem }


init : ( Model, Cmd Msg )
init =
    ( { showcaseList =
            [ { id = 1
              , title = "Hello"
              , link = "lorem ipsum dolor.."
              }
            , { id = 2
              , title = "Hellow"
              , link = "lorem ipsum doler.."
              }
            ]
      }
    , Cmd.none
    )



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
        , span [ class "main-02" ] [ text " . " ]
        , span [ class "main-03" ] [ text "the" ]
        , span [ class "main-04" ] [ text "Artsy" ]
        , span [ class "main-05" ] [ text "Tinkerer" ]
        ]


viewLogo : Html Msg
viewLogo =
    img
        [ src "./images/atom_v2.svg"
        , class "atom-logo"
        ]
        []


viewLeadContent : Html Msg
viewLeadContent =
    p
        [ class "lead" ]
        [ span
            [ class "headline-description" ]
            [ span
                []
                [ text "Hi, I'm " ]
            , span
                [ class "headline-name headline-tooltip" ]
                [ text "Adhy Wiranata" ]
            , span
                []
                [ text ", " ]
            , span
                [ class "headline-title headline-tooltip" ]
                [ text "Full Stack Engineer" ]
            , span
                []
                [ text " based in " ]
            , span
                [ class "headline-city headline-tooltip" ]
                [ text "Jakarta, Indonesia" ]
            , span
                []
                [ text ". I made " ]
            , span
                [ class "headline-tech headline-tooltip" ]
                [ text "Web Apps" ]
            , span
                []
                [ text " and " ]
            , span
                [ class "headline-tech headline-tooltip" ]
                [ text "React Native Mobile Apps" ]
            ]
        ]


viewSocial : Html Msg
viewSocial =
    div
        [ class "social-icons" ]
        [ a
            [ target "_top"
            , href "mailto:adhywiranatap@gmail.com"
            ]
            [ i [ class "fa fa-envelope" ] [] ]
        , a
            [ target "_blank"
            , href "https://www.facebook.com/frost.adh"
            ]
            [ i [ class "fa fa-facebook" ] [] ]
        , a
            [ target "_blank"
            , href "https://twitter.com/adhfrostfate"
            ]
            [ i [ class "fa fa-twitter" ] [] ]
        , a
            [ target "_blank"
            , href "https://www.linkedin.com/in/adhywiranata"
            ]
            [ i [ class "fa fa-linkedin" ] [] ]
        , a
            [ target "_blank"
            , href "https://github.com/adhywiranata"
            ]
            [ i [ class "fa fa-github" ] [] ]
        , a
            [ target "_blank"
            , href "https://medium.com/@adhywiranata"
            ]
            [ i [ class "fa fa-medium" ] [] ]
        ]


viewDescription : Html Msg
viewDescription =
    div
        [ class "card-container" ]
        [ div
            [ class "card-wrapper" ]
            [ div
                [ class "card card-normal" ]
                [ div
                    [ class "card-content" ]
                    [ h3
                        []
                        [ text "WHO AM I" ]
                    , p
                        []
                        [ text "I am a front-end engineer passionate in internet-based"
                        , text "technology. I am an INFP (Mediator) person, a futurist"
                        , text "and a learner by nature, a good listener and sometimes"
                        , text "a deep thinker. I have a great drive to improve people's"
                        , text "life by helping them launch their dream, passion, and "
                        , text "career through education and productivity."
                        ]
                    ]
                ]
            ]
        ]


viewShowcase : Html Msg
viewShowcase =
    div
        [ class "card-container" ]
        [ div
            [ class "card-wrapper" ]
            [ div
                [ class "card card-normal" ]
                [ div
                    [ class "card-content" ]
                    [ a [ href "https://github.com/adhywiranata/react-code-split-component" ]
                        [ h3 [] [ text "React Code Splitting" ]
                        ]
                    , p
                        []
                        [ text "Painless Code Splitting Higher Order Component for React" ]
                    ]
                ]
            ]
        ]


view : Model -> Html Msg
view model =
    div
        [ id "container"
        ]
        [ div
            [ id "main" ]
            [ viewHeading
            , viewLogo
            , viewLeadContent
            , viewSocial
            ]
        , div
            [ id "content" ]
            [ viewDescription
            ]
        , div
            [ id "showcase" ]
            [ viewShowcase ]
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
