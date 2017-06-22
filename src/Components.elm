module Components exposing (..)

import Html as H exposing (Attribute, Html)
import Html.Attributes as A
import Html.Events as E
import Json.Decode as Decode



-- Helpers

onClick : msg -> Attribute msg
onClick message =
  E.onWithOptions "click" (E.Options False True) (Decode.succeed message)



-- Placeholders

loremTitle : String
loremTitle = "Lorem ipsum dolor sit amet"

loremParagraph : String
loremParagraph = """
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
no sea takimata sanctus est Lorem ipsum dolor sit amet.
"""



-- Layout

layout : List (Html msg) -> Html msg
layout children =
  H.div [ A.class "center mw8"]
    [ H.div [ A.class "ph3 ph5-ns pb5" ] children ]



-- Navigation

activeClass : String -> String -> String
activeClass path href =
  if (path == href) then "underline" else "no-underline"

nav : (String -> msg) -> String -> Html msg
nav navigate path =
  H.nav [ A.class "db dt-l w-100 border-box pb4 pt4" ]
    [ brand navigate
    , H.div [ A.class "db dtc-l v-mid w-100 w-75-l tc tr-l" ]
        [ navLink navigate "About" "/" (activeClass path "/")
        , navLink navigate "Interiors" "/interiors" (activeClass path "/interiors")
        , navLink navigate "Drawings" "/drawings" (activeClass path "/drawings")
        , navLinkLast navigate "Collages" "/collages" (activeClass path "/collages")
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
        , A.src "/images/brand.jpg"
        , A.alt "Elizabeth Anne Wright" ] []
    ]

navLink : (String -> msg) -> String -> String -> String -> Html msg
navLink navigate title href class =
  H.a
    [ A.class "dim dark-gray f6 f5-l dib mr2 mr3-l"
    , A.class class
    , A.href href
    , A.title title
    , onClick (navigate href)
    ]
    [ H.text title ]

navLinkLast : (String -> msg) -> String -> String -> String -> Html msg
navLinkLast navigate title href class =
  H.a
    [ A.class "dim dark-gray f6 f5-l dib"
    , A.class class
    , A.href href
    , A.title title
    , onClick (navigate href)
    ]
    [ H.text title ]

scrollToTop : String -> Html msg
scrollToTop id =
  H.div [ A.class "cf" ]
    [ H.a [ A.class "fr lh-copy dim no-underline dark-gray", A.href ("#" ++ id) ]
        [ H.text "^ Back to top" ]
    ]



-- Headers

leadParagraph : String -> Html msg
leadParagraph content = H.p [ A.class "f5 lh-copy measure mt0-ns" ] [ H.text content ]

paragraph : String -> Html msg
paragraph content =
  H.p [ A.class "f5 lh-copy measure" ] [ H.text content ]

pageHeader : String -> String -> List (Html msg) -> Html msg
pageHeader id title content =
  H.article [ A.class "cf pb4 pt3" ]
    [ H.header [ A.class "fn fl-ns w-50-ns pr4-ns" ]
        [ H.h1 [ A.id id, A.class "f2 lh-title fw6 mb1 mt0 pt3 bt bw1" ] [ H.text title ]
        ]
    , H.div [ A.class "fn fl-ns w-50-ns" ] content
    ]



-- Works

image : String -> String -> Html msg
image title src =
  H.img [ A.class "db mxhi6", A.alt title, A.src src ] []

groupImage : String -> Html msg
groupImage src =
  H.img [ A.class "pv2 db w-100", A.src src ] []

work : String -> String -> String -> String -> Html msg
work title media dimensions src =
  H.article [ A.class "cf pv4" ]
    [ H.div [ A.class "" ] [ image title src ]
    , H.header [ A.class "fn fl-ns pr4-ns" ]
        [ H.h2 [ A.class "f3 lh-title fw6 mb1 mt0 pt3" ] [ H.text title ]
        , H.h3 [ A.class "f5 fw4 mid-gray mb1 mt0 lh-title" ] [ H.text media ]
        , H.h4 [ A.class "f6 mt0 fw4 tracked gray" ] [ H.text dimensions ]
        ]
    ]

workGroup : String -> String -> String -> List (Html msg) -> Html msg
workGroup title media dimensions children =
  H.article [ A.class "cf pv4" ]
    [ H.div [ A.class "cf" ] children
    , H.header [ A.class "fn fl-ns pr4-ns" ]
        [ H.h2 [ A.class "f3 lh-title fw6 mb1 mt0 pt3" ] [ H.text title ]
        , H.h3 [ A.class "f5 fw4 mid-gray mb1 mt0 lh-title" ] [ H.text media ]
        , H.h4 [ A.class "f6 mt0 fw4 tracked gray" ] [ H.text dimensions ]
        ]
    ]

interior : String -> Html msg -> List (Html msg) -> Html msg
interior title description children =
  H.article [ A.class "cf pv4" ]
    [ H.div [ A.class "cf" ] children
    , H.header []
        [ H.h2 [ A.class "f3 lh-title fw6 mb1 mt0 pt3" ]
            [ H.text title ]
        ]
    , H.div [] [ description ]
    ]
