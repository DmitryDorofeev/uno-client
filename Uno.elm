port module Uno exposing (..)

{-| Entry point
# Definition
@docs view
-}

import Html exposing (Html, button, div, text)
import Html.App as App
import Html.Events exposing (onClick)

import Uno.Menu exposing (menu)

type alias Model = Int

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

{-|-}
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ menu ]
    , button [ onClick Increment ] [ text "+" ]
    ]
