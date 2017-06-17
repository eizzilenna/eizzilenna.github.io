module Main exposing (..)

import Html as H exposing (Html)
import Navigation
import Pages



main =
  Navigation.program UrlChange
    { init = init
    , view = view
    , update = update
    , subscriptions = (\_ -> Sub.none)
    }



-- MODEL

type alias Model = String

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
  ( location.pathname
  , Cmd.none
  )

-- UPDATE

type Msg
  = UrlChange Navigation.Location
  | Navigate String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UrlChange location ->
      ( location.pathname
      , Cmd.none
      )
    Navigate path ->
      ( model
      , Navigation.newUrl path
      )



-- VIEW

view : Model -> Html Msg
view = Pages.page Navigate
