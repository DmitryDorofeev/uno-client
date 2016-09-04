port module Uno exposing (main)

{-| Entry point
# Definition
@docs main
-}

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (style)
import Html.App as App
import Html.Events exposing (onClick)

import Uno.Menu exposing (menu)

type alias Model = Int

{-|-}
main : Program Never
main =
  App.beginnerProgram { model=0 , view=view, update=update }

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

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
