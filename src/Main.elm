module Main exposing (..)

import Components as C
import Html as H exposing (Html)
import Html.Attributes as A
import Html.Events as E
import Navigation



main =
  Navigation.program UrlChange
    { init = init
    , view = view
    , update = update
    , subscriptions = (\_ -> Sub.none)
    }



-- MODEL

type alias Model =
  { page : String
  }

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
  ( updatePage location (Model "/")
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
      ( updatePage location model
      , Cmd.none
      )
    Navigate path ->
      ( model
      , Navigation.newUrl path
      )

updatePage : Navigation.Location -> Model -> Model
updatePage location model =
  { model | page = location.pathname }


-- VIEW

view : Model -> Html Msg
view model =
  let
    body =
      case model.page of
        "/" -> C.about
        "/drawings" -> C.drawings
        "/collages" -> C.collages
        "/interiors" -> C.interiors
        _ -> C.notFound
  in
    C.layout
      [ C.nav Navigate
      , body
      ]
