module Uno.Menu exposing (menu)

import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, href, style)
import Html.Events exposing (onClick)

menuStyle =
  [ ("width", "300px") ]

itemStyle =
  [ ("display", "block")
  , ("color", "#cc0000")
  , ("padding", "20px 0")
  , ("text-align", "center")
  ]

{-|-}
menu =
  div [ style menuStyle ]
    [ a [ href "/login", style itemStyle ] [ text "Логин" ]
    , a [ href "/signup", style itemStyle ] [ text "Регистрация" ]
    , a [ href "/about", style itemStyle ] [ text "Об игре" ]
    ]
