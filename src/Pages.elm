module Pages exposing
  ( page
  , pages
  )

import Components as C
import Dict exposing (Dict)
import Html as H exposing (Attribute, Html)



page : (String -> msg) -> String -> Html msg
page navigate path =
  C.layout
    [ C.nav navigate
    , Dict.get path pages |> Maybe.withDefault notFound
    ]

pages : Dict String (Html msg)
pages =
  Dict.fromList
    [ ("/", about)
    , ("/drawings", drawings)
    , ("/collages", collages)
    , ("/interiors", interiors)
    , ("/404", notFound)
    ]

about : Html msg
about =
  H.div []
    [ C.pageHeader "About"
    , C.loremWorkPortrait
    , C.loremWorkLandscape
    , C.loremWorkGroup
    ]

drawings : Html msg
drawings =
  H.div []
    [ C.pageHeader "Drawings"
    , C.loremWorkPortrait
    , C.loremWorkLandscape
    , C.loremWorkGroup
    ]

collages : Html msg
collages =
  H.div []
    [ C.pageHeader "Collages"
    , C.workHeader "Lines and Other Shapes"
    , C.work
        "Two Blocks"
        "Pencil and ink on paper"
        "210 x 297 mm"
        "/images/lines-and-other-shapes/two-blocks.jpg"
    , C.work
        "Blue Lines"
        "Ink on Paper"
        "100 x 100 mm"
        "/images/lines-and-other-shapes/blue-lines.jpg"
    , C.work
        "Black, Grey and Orange"
        "Felt Tip Pen on Paper"
        "210 x 297 mm"
        "/images/lines-and-other-shapes/black-grey-and-orange.jpg"
    , C.work
        "Black Lines"
        "Ink on Paper"
        "297 x 210 mm"
        "/images/lines-and-other-shapes/black-lines.jpg"
    , C.work
        "Untitled 29"
        "Mixed Media on Paper"
        "290 x 385 mm"
        "/images/lines-and-other-shapes/untitled-29.jpg"
    , C.work
        "Tally Marks"
        "Pen and Pencil on Paper"
        "297 x 210 mm"
        "/images/lines-and-other-shapes/tally-marks.jpg"
    ]

interiors : Html msg
interiors =
  H.div []
    [ C.pageHeader "Interiors"
    , C.loremWorkPortrait
    , C.loremWorkLandscape
    , C.loremWorkGroup
    ]

notFound : Html msg
notFound =
  C.pageHeader "404"
