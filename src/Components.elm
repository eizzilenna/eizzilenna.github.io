module Components exposing (..)

import Html as H exposing (Attribute, Html)
import Html.Attributes as A
import Html.Events as E
import Json.Decode as Decode



onClick : msg -> Attribute msg
onClick message =
  E.onWithOptions "click" (E.Options False True) (Decode.succeed message)



-- Placeholders

loremParagraph : String
loremParagraph = """
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
no sea takimata sanctus est Lorem ipsum dolor sit amet.
"""

loremWorkPortrait : Html msg
loremWorkPortrait =
  work
    "Untitled 1."
    "Lorem ipsum dolor sit amet"
    "1024 x 576"
    "http://placehold.it/1024x576"

loremWorkLandscape : Html msg
loremWorkLandscape =
  work
    "Untitled 2."
    "Lorem ipsum dolor sit amet"
    "1024 x 576"
    "http://placehold.it/640x960"

loremWorkGroup : Html msg
loremWorkGroup =
  workGroup
    "Untitled 2."
    "Lorem ipsum dolor sit amet"



-- Layout

layout : List (Html msg) -> Html msg
layout children =
  H.div [ A.class "center mw8"] children

-- Navigation

nav : (String -> msg) -> Html msg
nav navigate =
  H.nav [ A.class "db dt-l w-100 border-box pa4 ph5-l" ]
    [ brand navigate
    , H.div [ A.class "db dtc-l v-mid w-100 w-75-l tc tr-l" ]
        [ navLink navigate "About" "/"
        , navLink navigate "Drawings" "/drawings"
        , navLink navigate "Collages" "/collages"
        , navLink navigate "Interiors" "/interiors"
        ]
    ]

brand : (String -> msg) -> Html msg
brand navigate =
  H.a
    [ A.class "db dtc-l v-mid mid-gray dim w-100 w-25-l tc tl-l mb2 mb0-l"
    , A.href "/"
    , A.title "Home"
    , onClick (navigate "/")
    ]
    [ H.img
        [ A.class "dib w3 h3 br-100"
        , A.src "http://placehold.it/100x100"
        , A.alt "Hilmy" ] []
    ]

navLink : (String -> msg) -> String -> String -> Html msg
navLink navigate title href =
  H.a
    [ A.class "dim dark-gray no-underline f6 f5-l dib mr2 mr3-l"
    , A.href href
    , A.title title
    , onClick (navigate href)
    ]
    [ H.text title ]

navLinkLast : (String -> msg) -> String -> String -> Html msg
navLinkLast navigate title href =
  H.a
    [ A.class "dim dark-gray no-underline f6 f5-l dib "
    , A.href href
    , A.title title
    , onClick (navigate href)
    ]
    [ H.text title ]



-- Headers

pageHeader : String -> Html msg
pageHeader title =
  H.article [ A.class "cf ph3 ph5-ns pv5" ]
    [ H.header [ A.class "fn fl-ns w-50-ns pr4-ns" ]
        [ H.h1 [ A.class "f2 lh-title fw6 mb1 mt0 pt3 bt bw1" ] [ H.text title ]
        , H.h2 [ A.class "f5 fw4 mid-gray mb1 mt0 lh-title" ] [ H.text "Lorem ipsum dolor sit amet" ]
        , H.time [ A.class "f6 mt0 ttu tracked gray" ] [ H.text "28-04-1985" ]
        ]
    , H.div [ A.class "fn fl-ns w-50-ns" ]
        [ H.p [ A.class "f5 lh-copy measure mt0-ns" ] [ H.text loremParagraph ]
        , H.p [ A.class "f5 lh-copy measure" ] [ H.text loremParagraph ]
        ]
    ]

workHeader : String -> Html msg
workHeader title =
  H.article [ A.class "cf ph3 ph5-ns pv5" ]
    [ H.header [ A.class "fn fl-ns w-50-ns pr4-ns" ]
        [ H.h2 [ A.class "f2 lh-title fw6 mb1 mt0 pt3 bt bw1" ] [ H.text title ]
        , H.h3 [ A.class "f5 fw4 mid-gray mb1 mt0 lh-title" ] [ H.text "Lorem ipsum dolor sit amet" ]
        ]
    , H.div [ A.class "fn fl-ns w-50-ns" ]
        [ H.p [ A.class "f5 lh-copy measure mt0-ns" ] [ H.text loremParagraph ]
        ]
    ]


-- Works

work : String -> String -> String -> String -> Html msg
work title media dimensions src =
  H.article [ A.class "cf ph3 ph5-ns pv5" ]
    [ H.div [ A.class "" ]
        [ H.img [ A.class "db pb2 mxhi6", A.alt title, A.src src ] []
        ]
    , H.header [ A.class "fn fl-ns w-50-ns pr4-ns" ]
        [ H.h2 [ A.class "f3 lh-title fw6 mb1 mt0 pt3" ] [ H.text title ]
        , H.h3 [ A.class "f5 fw4 mid-gray mb1 mt0 lh-title" ] [ H.text media ]
        , H.h4 [ A.class "f6 mt0 fw4 tracked gray" ] [ H.text dimensions ]
        ]
    ]

workGroup : String -> String -> Html msg
workGroup title media =
  H.article [ A.class "cf ph3 ph5-ns pv5" ]
    [ H.div [ A.class "cf" ]
        [ H.div [ A.class "fl w-100 w-50-ns ph0" ]
            [ H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/480x640" ] []
            , H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/640x480" ] []
            ]
        , H.div [ A.class "fl w-50 w-25-ns pl0 pl3-ns" ]
            [ H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/480x640" ] []
            , H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/640x640" ] []
            , H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/640x480" ] []
            , H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/480x640" ] []
            ]
        , H.div [ A.class "fl w-50 w-25-ns pl3" ]
            [ H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/640x480" ] []
            , H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/480x640" ] []
            , H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/480x640" ] []
            , H.img [ A.class "pv2 db w-100", A.src "http://placehold.it/640x640" ] []
            ]
        ]
    , H.header [ A.class "fn fl-ns w-50-ns pr4-ns" ]
        [ H.h2 [ A.class "f3 lh-title fw6 mb1 mt0 pt3" ]
            [ H.text title ]
        , H.h3 [ A.class "f5 fw4 mid-gray mb1 mt0 lh-title" ]
            [ H.text media ]
        ]
    ]
