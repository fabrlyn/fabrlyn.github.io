module Main exposing (..)

--import Html exposing (Html, text, div, h1, img)

import Browser
import Css exposing (alignItems, backgroundColor, borderBottom3, center, color, column, displayFlex, flex, flexDirection, fontFamilies, fontSize, height, hex, int, justifyContent, letterSpacing, margin, maxWidth, minWidth, pct, property, px, sansSerif, solid, textAlign, width)
import Css.Global exposing (body, global, html)
import Html.Attributes exposing (src)
import Html.Styled exposing (Html, div, h1, hr, img)
import Html.Styled.Attributes exposing (css)
import Svg.Styled exposing (text)


noSelect : Css.Style
noSelect =
    property "user-select" "none"



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
update _ model =
    ( model, Cmd.none )



---- VIEW ----


splashContainer : Html Msg
splashContainer =
    div
        [ css
            [ displayFlex
            , alignItems center
            , justifyContent center
            , height (pct 100)
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , flexDirection column
                , alignItems center
                , justifyContent center
                ]
            ]
            [ splash
            , splashDivider
            , subSplash
            ]
        ]


splash : Html Msg
splash =
    div
        [ css
            [ displayFlex
            , alignItems center
            , justifyContent center
            , textAlign center
            , fontSize (px 50)
            , letterSpacing (px 3)
            , noSelect
            ]
        ]
        [ text "robert bärlin" ]


splashDivider : Html Msg
splashDivider =
    div
        [ css
            [ displayFlex
            , alignItems center
            , justifyContent center
            , textAlign center
            , width (pct 100)
            , noSelect
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , alignItems center
                , justifyContent center
                , textAlign center
                , width (px 450)
                , borderBottom3 (px 1) solid (hex "5e5e5e")
                , noSelect
                ]
            ]
            []
        ]


subSplash : Html Msg
subSplash =
    div
        [ css
            [ displayFlex
            , alignItems center
            , justifyContent center
            , textAlign center
            , fontSize (px 45)
            , letterSpacing (px 3)
            , noSelect
            ]
        ]
        [ text "fabrlyn" ]


container : Html Msg
container =
    div [ css [ height (pct 100), width (pct 100) ] ] [ splashContainer ]


view : Model -> Html Msg
view _ =
    div [ css [ margin (px 0), height (pct 100) ] ]
        [ global
            [ html
                [ color (hex "606060")
                , backgroundColor (hex "96bbc1")
                , Css.fontWeight (int 300)
                , fontFamilies [ "Cairo", "sans-serif" ]
                , height (pct 100)
                , margin (px 0)
                ]
            , body [ height (pct 100), margin (px 0) ]
            ]
        , container
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = Html.Styled.toUnstyled << view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
