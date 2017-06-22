module Pages exposing
  ( page
  , pages
  )

import Components as C
import Dict exposing (Dict)
import Html as H exposing (Attribute, Html)
import Html.Attributes as A


page : (String -> msg) -> String -> Html msg
page navigate path =
  C.layout
    [ C.nav navigate path
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
    [ C.image "Elizabeth Anne Wright" "https://placehold.it/960x240"
    , C.pageHeader "about" "About"
        [ C.leadParagraph C.loremParagraph ]
    ]

drawings : Html msg
drawings =
  H.div []
    [ C.pageHeader "drawings" "Drawings"
        [ C.leadParagraph C.loremParagraph ]
    , C.workHeader "Scribbles" C.loremTitle C.loremParagraph
    , C.work
        "Untitled 20"
        "Pencil on paper"
        "210 x 297 mm"
        "/images/scribbles/untitled-20.jpg"
    , C.work
        "Untitled 52"
        "Pencil and correction tape on paper"
        "297 x 210 mm"
        "/images/scribbles/untitled-52.jpg"
    , C.work
        "Twombly 10"
        "Pencil on paper"
        "245 x 195 mm"
        "/images/scribbles/twombly-10.jpg"
    , C.work
        "Untitled 48"
        "Mixed media on paper"
        "212 x 280 mm"
        "/images/scribbles/untitled-48.jpg"
    , C.workHeader "Drawings" C.loremTitle C.loremParagraph
    , C.work
        "Self Portrait"
        "Pencil on paper"
        "570 x 760 mm"
        "/images/drawings/self-portrait.jpg"
    , C.work
        "Self Portrait Rules"
        "Typewriter on paper"
        "297 x 210 mm"
        "/images/drawings/self-portrait-rules.jpg"
    , C.work
        "Self Portrait Measurements 1"
        "Typewriter on paper"
        "297 x 210 mm"
        "/images/drawings/self-portrait-measurements-1.jpg"
    , C.work
        "Self Portrait Measurements 2"
        "Typewriter on paper"
        "297 x 210 mm"
        "/images/drawings/self-portrait-measurements-2.jpg"
    , C.work
        "Self Portrait Measurements 3"
        "Typewriter on paper"
        "297 x 210 mm"
        "/images/drawings/self-portrait-measurements-3.jpg"
    , C.work
        "Black I"
        "Pencil on paper"
        "760 x 570 mm"
        "/images/drawings/black-i.jpg"
    , C.work
        "Black II"
        "Etching"
        "740 x 525 mm"
        "/images/drawings/black-ii.jpg"
    , C.work
        "I Went Too"
        "Pencil on paper"
        "570 x 760 mm"
        "/images/drawings/i-went-too.jpg"
    , C.work
        "After I Went Too"
        "Pencil on paper"
        "570 x 760 mm"
        "/images/drawings/after-i-went-too.jpg"
    , C.work
        "Pencil on Paper"
        "Pencil on paper"
        "760 x 570 mm"
        "/images/drawings/pencil-on-paper.jpg"
    , C.work
        "Eduardo Marquina"
        "Pencil on paper"
        "570 x 760 mm"
        "/images/drawings/eduardo-marquina.jpg"
    , C.scrollToTop "drawings"
    ]

collages : Html msg
collages =
  H.div []
    [ C.pageHeader "collages" "Collages"
        [ C.leadParagraph C.loremParagraph ]
    , C.workHeader "Postcards" C.loremTitle C.loremParagraph
    , C.work
        "Untitled 1"
        "Mixed media on card"
        "105 x 148 mm"
        "/images/postcards/untitled-1.jpg"
    , C.work
        "Untitled 2"
        "Mixed media on card"
        "105 x 148 mm"
        "/images/postcards/untitled-2.jpg"
    , C.work
        "Untitled 3"
        "Mixed media on card"
        "105 x 148 mm"
        "/images/postcards/untitled-3.jpg"
    , C.work
        "Untitled 4"
        "Mixed media on card"
        "105 x 148 mm"
        "/images/postcards/untitled-4.jpg"
    , C.work
        "Untitled 5"
        "Mixed media on card"
        "105 x 148 mm"
        "/images/postcards/untitled-5.jpg"
    , C.work
        "Untitled 6"
        "Mixed media on card"
        "105 x 148 mm"
        "/images/postcards/untitled-6.jpg"
    , C.work
        "Untitled 7"
        "Mixed media on card"
        "105 x 148 mm"
        "/images/postcards/untitled-7.jpg"
    , C.work
        "Untitled 8"
        "Mixed media on card"
        "105 x 148 mm"
        "/images/postcards/untitled-8.jpg"
    , C.work
        "Untitled 9"
        "Mixed media on card"
        "105 x 148 mm"
        "/images/postcards/untitled-9.jpg"
    , C.workHeader "Lines and Other Shapes" C.loremTitle C.loremParagraph
    , C.work
        "Two Blocks"
        "Pencil and ink on paper"
        "210 x 297 mm"
        "/images/lines-and-other-shapes/two-blocks.jpg"
    , C.work
        "Blue Lines"
        "Ink on paper"
        "100 x 100 mm"
        "/images/lines-and-other-shapes/blue-lines.jpg"
    , C.work
        "Black, Grey and Orange"
        "Felt tip pen on paper"
        "210 x 297 mm"
        "/images/lines-and-other-shapes/black-grey-and-orange.jpg"
    , C.work
        "Black Lines"
        "Ink on paper"
        "297 x 210 mm"
        "/images/lines-and-other-shapes/black-lines.jpg"
    , C.work
        "Untitled 29"
        "Mixed media on paper"
        "290 x 385 mm"
        "/images/lines-and-other-shapes/untitled-29.jpg"
    , C.work
        "Tally Marks"
        "Pen and pencil on paper"
        "297 x 210 mm"
        "/images/lines-and-other-shapes/tally-marks.jpg"
    , C.workHeader "Bird Collages" C.loremTitle C.loremParagraph
    , C.work
        "Grey Wagtail"
        "Mixed media on paper"
        "297 x 210 mm"
        "/images/bird-collages/grey-wagtail.jpg"
    , C.work
        "Yellow Bird"
        "Mixed media on paper"
        "170 x 170 mm"
        "/images/bird-collages/yellow-bird.jpg"
    , C.work
        "Blue Bird"
        "Mixed media on paper"
        "170 x 120 mm"
        "/images/bird-collages/blue-bird.jpg"
    , C.workHeader "Magasin Collage" C.loremTitle C.loremParagraph
    , C.work
        "Design"
        "Mixed media on paper"
        "297 x 210mm"
        "/images/magasin-collage/design.jpg"
    , C.work
        "Yellow Can"
        "Mixed media on paper"
        "297 x 210mm"
        "/images/magasin-collage/yellow-can.jpg"
    , C.work
        "Guilt Tripping, Nice World"
        "Mixed media on paper"
        "297 x 210mm"
        "/images/magasin-collage/guilt-tripping-nice-world.jpg"
    , C.work
        "Milton"
        "Mixed media on paper"
        "297 x 210mm"
        "/images/magasin-collage/milton.jpg"
    , C.workHeader "Dot Series" C.loremTitle C.loremParagraph
    , C.work
        "M"
        "Mixed media on paper"
        "297 x 210mm"
        "/images/dot-series/m.jpg"
    , C.work
        "Exhibits in the Sculpture Gallery"
        "Dots on paper"
        "297 x 210mm"
        "/images/dot-series/exhibits-in-the-scuplture-gallery.jpg"
    , C.work
        "du"
        "Dots on paper"
        "297 x 210mm"
        "/images/dot-series/du.jpg"
    , C.work
        "Indice Alfabetico Delle Illustrazioni"
        "Mixed media on paper"
        "297 x 210mm"
        "/images/dot-series/indice-alfabetico-delle-illustrazioni.jpg"
    , C.work
        "I Am Participating (Draft)"
        "Mixed media on paper"
        "165 x 115 mm"
        "/images/dot-series/i-am-participating.jpg"
    , C.work
        "Zema Plast"
        "Mixed media on card"
        "297 x 210mm"
        "/images/dot-series/zema-plast.jpg"
    , C.work
        "Untitled 73"
        "Mixed media on paper"
        "196 x 145 mm"
        "/images/dot-series/untitled-73.jpg"
    , C.scrollToTop "collages"
    ]

interiors : Html msg
interiors =
  H.div []
    [ C.pageHeader "interiors" "Interiors"
        [ C.leadParagraph """
Carefully arranged to maximise the space and light, this South East London
apartment, with its open-plan layout and large floor to ceiling windows, is
ideal for housing its owners collections of pottery, glass and art.
"""
        , C.paragraph """
To utilise the space available, the layout has been intelligently configured
into separate ‘zones’ using grouped furniture that maintains a view from the
front door right through to the outside.
"""
        , C.paragraph """
Large spaces are painted white and smaller areas a soft muted grey to create a
sense of depth. The warm oak flooring is laid throughout the entire open-plan
living space. A mixture of mid-century furniture and simple contemporary
pieces complement each other, creating a retro yet modern feel.
"""
        ]
    , C.interior
        "Hallway"
        (C.paragraph """
A Componibili storage unit by Kartell and a small teak drawer unit provide
space for a set of the owners collections, including glassware by Danish design
company Normann Copenhagen and Finnish designer Alvar Aalto for Iittala.
""")
        [ H.div [ A.class "fl w-100 w-40-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/hallway/hallway-1.jpg" ] []
            , H.img [ A.class "pv2 db w-100", A.src "/images/hallway/hallway-2.jpg" ] []
            ]
        , H.div [ A.class "fl w-100 w-60-ns pl3-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/hallway/hallway-3.jpg" ] []
            ]
        ]
    , C.interior
        "Dining Area"
        (C.paragraph """
A Muuto pendant light, by Swedish designer Mattias Ståhlbom, hangs above an
Ercol drop leaf dining table, which is bathed in natural light and surrounded
by greenery.
""")
        [ H.div [ A.class "fl w-100 w-50-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/dining-table/dining-table-1.jpg" ] []
            , H.img [ A.class "pv2 db w-100", A.src "/images/dining-table/dining-table-2.jpg" ] []
            ]
        , H.div [ A.class "fl w-100 w-50-ns pl3-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/dining-table/dining-table-3.jpg" ] []
            , H.img [ A.class "pv2 db w-100", A.src "/images/dining-table/dining-table-4.jpg" ] []
            ]
        ]
    , C.interior
        "Sitting Area"
        (C.paragraph """
The colours in the painting by Finnish artist Henry Wright are mirrored in the
cushions and Marimekko fabric used on the sofa.  A vintage bookshelf houses an
eclectic array of objects, including a pair of Staffordshire ‘Wally dugs’ found
in a market in Greenwich and vintage glass pieces bought in Sweden and Finland.
""")
        [ H.div [ A.class "fl w-100 w-40-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/sitting-area/sitting-area-1.jpg" ] []
            ]
        , H.div [ A.class "fl w-100 w-30-ns pl3-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/sitting-area/sitting-area-2.jpg" ] []
            ]
        , H.div [ A.class "fl w-100 w-30-ns pl3-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/sitting-area/sitting-area-3.jpg" ] []
            ]
        , H.div [ A.class "fl w-100 w-60-ns pl3-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/sitting-area/sitting-area-4.jpg" ] []
            ]
        ]
    , C.interior
        "Workspace"
        (C.paragraph """
The workspace houses a simple white desk that sits neatly within a recess at
the end of the living space. Brightly coloured objects, including a vintage
typewriter and several pot plants provide vibrant pockets of colour against the
light grey back wall.
""")
        [ H.div [ A.class "fl w-100 w-40-ns pr3-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/workspace/workspace-1.jpg" ] []
            ]
        , H.div [ A.class "fl w-100 w-60-ns" ]
            [ H.div [ A.class "fl w-100 w-60-ns pr2-ns" ]
                [ H.img [ A.class "fl pv2 db w-100", A.src "/images/workspace/workspace-2.jpg" ] []
                ]
            , H.div [ A.class "fl w-100 w-40-ns pl2-ns" ]
                [ H.img [ A.class "fl pv2 db w-100", A.src "/images/workspace/workspace-3.jpg" ] []
                ]
            ]
        , H.div [ A.class "fl w-100 w-60-ns" ]
            [ H.div [ A.class "fl w-100 w-40-ns pr2-ns" ]
                [ H.img [ A.class "fl pv2 db w-100", A.src "/images/workspace/workspace-4.jpg" ] []
                ]
            , H.div [ A.class "fl w-100 w-60-ns pl2-ns" ]
                [ H.img [ A.class "fl pv2 db w-100", A.src "/images/workspace/workspace-5.jpg" ] []
                ]
            ]
        ]
    , C.interior
        "Bookshelf"
        (C.paragraph """
The large bookshelf acts as both a storage/display area for a collection of
books and other objects, as well as a room divider between the dining area and the workspace.
""")
        [ H.div [ A.class "fl w-100 w-50-ns pr3-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/bookshelf/bookshelf-1.jpg" ] []
            ]
        , H.div [ A.class "fl w-100 w-50-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "/images/bookshelf/bookshelf-2.jpg" ] []
            , H.img [ A.class "pv2 db w-100", A.src "/images/bookshelf/bookshelf-3.jpg" ] []
            ]
        ]
    , C.scrollToTop "interiors"
    ]

notFound : Html msg
notFound =
  C.pageHeader "404" "404" []
