port module Build exposing (..)


import Dict exposing (Dict)
import Html as H exposing (Html)
import Pages exposing (page, pages)

import ElmHtml.InternalTypes exposing (decodeElmHtml)
import ElmHtml.ToString exposing (nodeToStringWithOptions, defaultFormatOptions)
import Json.Decode as Decode
import Json.Encode as Encode exposing (encode)
import Native.Jsonify


port request : (() -> msg) -> Sub msg
port response : Encode.Value -> Cmd msg


asJsonString : Html msg -> String
asJsonString = Native.Jsonify.stringify

options = { defaultFormatOptions | newLines = True, indent = 2 }

htmlToString : Html msg -> String
htmlToString html =
  case Decode.decodeString decodeElmHtml (asJsonString html) of
    Err str -> str
    Ok str -> nodeToStringWithOptions options str

encodePage : String -> a -> Encode.Value
encodePage path _ =
  page (\_ -> ()) path
    |> htmlToString
    |> Encode.string

encodedPages : Encode.Value
encodedPages =
  Encode.object (Dict.toList (Dict.map encodePage pages))

main : Program Never () Msg
main =
  Platform.program
    { init = ((), Cmd.none)
    , update = update
    , subscriptions = subscriptions
    }

type Msg = Request

update : Msg -> () -> ((), Cmd msg)
update _ model = (model, response encodedPages)

subscriptions : () -> Sub Msg
subscriptions _ = request (always Request)
