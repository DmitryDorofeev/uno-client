module Uno.Routes exposing ( Sitemap(..), match, route, parsePath, navigateTo )

import Navigation exposing (Location)
import Route exposing (..)

type Sitemap
  = HomeR ()
  | AboutR ()
  | LoginR ()
  
homeR = HomeR := static ""
aboutR = AboutR := static "about"
loginR = LoginR := static "login"
sitemap = router [homeR, aboutR, loginR]

match : String -> Maybe Sitemap
match = Route.match sitemap

route : Sitemap -> String
route r =
  case r of
    HomeR () -> reverse homeR []
    AboutR () -> reverse aboutR []
    LoginR () -> reverse loginR []


parsePath : Location -> Maybe Sitemap
parsePath =
    .pathname >> match


navigateTo : Sitemap -> Cmd msg
navigateTo =
    toString >> Navigation.newUrl
