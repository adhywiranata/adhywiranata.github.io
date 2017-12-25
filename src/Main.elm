module Main exposing (..)

import Html exposing (Html, text, div, h1, h3, img, span, p, a, i, footer)
import Html.Attributes exposing (src, id, class, target, href)

---- MODEL ----

type alias SocialLinkItem =
    { id : Int
    , icon: String
    , link: String
    }

type alias ShowcaseItem =
    { id : Int
    , title : String
    , link : String
    , description: String
    }


type alias Model =
    { socialLinkList : List SocialLinkItem
    , showcaseList : List ShowcaseItem
    }


init : ( Model, Cmd Msg )
init =
    (
        { socialLinkList =
            [ { id = 1, icon = "facebook", link = "https://www.facebook.com/frost.adh" }
            , { id = 2, icon = "twitter", link = "https://twitter.com/adhfrostfate" }
            , { id = 3, icon = "linkedin", link = "https://www.linkedin.com/in/adhywiranata" }
            , { id = 4, icon = "github", link = "https://github.com/adhywiranata" }
            , { id = 5, icon = "medium", link = "https://medium.com/@adhywiranata" }
            , { id = 6, icon = "envelope", link = "mailto:adhywiranatap@gmail.com" }
            ]
        , showcaseList =
            [ { id = 1
              , title = "Ree.na Framework"
              , link = "https://github.com/adhywiranata/reena"
              , description = "React Native Opinionated Framework with Atomic Design"
              }
            , { id = 2
              , title = "React Code Splitting"
              , link = "https://github.com/adhywiranata/react-code-split-component"
              , description = "Painless Code Splitting Higher Order Component for React"
              }
            , { id = 3
              , title = "Museic"
              , link = "https://museic.adhywiranata.com"
              , description = "Data visualization of top artists, musics, and albums from Spotify using React, Redux, and D3"
              }
            , { id = 4
              , title = "Exploranime"
              , link = "https://exploranime.adhywiranata.com"
              , description = "Anime Listing Progressive Web App using kitsu.io API"
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
        [ src "https://github.com/adhywiranata/adhywiranata.github.io/blob/develop/public/atom_v2.svg"
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

viewSocialLinkItem : SocialLinkItem -> Html Msg
viewSocialLinkItem socialLinkItem =
    a
        [ target "_blank"
        , href socialLinkItem.link
        ]
        [ i [ class ("fa fa-" ++ socialLinkItem.icon) ] [] ]

viewSocialLinkList : List SocialLinkItem -> Html Msg
viewSocialLinkList socialLinkList =
    let
        socialLinkItem =
            List.map viewSocialLinkItem socialLinkList
    in
        div
            [ class "social-icons"] socialLinkItem


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
                        [ text "I am a front-end engineer passionate in internet-based "
                        , text "technology. I am an INFP (Mediator) person, a futurist "
                        , text "and a learner by nature, a good listener and sometimes "
                        , text "a deep thinker. I have a great drive to improve people's "
                        , text "life by helping them launch their dream, passion, and "
                        , text "career through education and productivity."
                        ]
                    ]
                ]
            ]
        ]

viewShowcaseItem : ShowcaseItem -> Html Msg
viewShowcaseItem showcaseItem =
    div
        [ class "card-wrapper" ]
        [ div
            [ class "card card-normal" ]
            [ div
                [ class "card-content" ]
                [ a [ href showcaseItem.link
                    , target "_blank"
                    ]
                    [ h3 [] [ text showcaseItem.title ]
                    ]
                , p
                    []
                    [ text showcaseItem.description ]
                ]
            ]
        ]

viewShowcaseList : List ShowcaseItem -> Html Msg
viewShowcaseList showcaseList =
    let
        showcaseItems =
            List.map viewShowcaseItem showcaseList
    in
        div
            [ class "card-container" ]
            showcaseItems


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
            , viewSocialLinkList model.socialLinkList
            ]
        , div
            [ id "content" ]
            [ viewDescription
            ]
        , div
            [ id "showcase" ]
            [ viewShowcaseList model.showcaseList ]
        , footer
            []
            [ span
                []
                [ text "copyright by "
                , a
                    [ href "https://adhywiranata.com" ]
                    [ text "Adhy Wiranata" ]
                ]
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
