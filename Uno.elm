port module Uno exposing (main)

{-| Entry point
# Definition
@docs main
-}

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (style)
import Html.App as App
import Html.Events exposing (onClick)
import Navigation
import Http

import Uno.Routes as Routes
import Uno.Routes exposing (Sitemap(..))
import Uno.Menu exposing (menu)

type alias Model =
  { route : Sitemap
  , ready : Bool
  , error : Maybe String
  }

type Msg
    = RouteTo Sitemap

{-|-}
main : Program Never
main =
  Navigation.program (Navigation.makeParser Routes.parsePath)
  { urlUpdate=urlUpdate
  , init=init
  , view=view
  , update=update
  , subscriptions = \_ -> Sub.batch []
  }


init : Sitemap -> ( Model, Cmd Msg )
init route =
    urlUpdate route
        { route = route
        , ready = False
        , error = Nothing
        }

urlUpdate : Sitemap -> Model -> ( Model, Cmd Msg )
urlUpdate route ({ ready } as m) =
    let
        model =
            { m | route = route }
    in
        case route of
            _ ->
                model ! []

update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ route } as model) =
    case msg of
        RouteTo route ->
            model ! [ Routes.navigateTo route ]

appStyle =
  [ ("display", "flex")
  , ("justify-content", "center")
  , ("align-items", "center")
  , ("width", "100%")
  , ("height", "100%")
  ]

{-|-}
view: Model -> Html Msg
view model =
  div [ style appStyle ]
    [ menu ]
