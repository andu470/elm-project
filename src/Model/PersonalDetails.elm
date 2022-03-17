module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id, href)
import Html.Attributes exposing (name)
import Model.Repo exposing (decodeRepo)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
    div [][
        h1 [id "name"][text details.name]
        , em [id "intro"][text details.intro]
        , h3 [class "contact-detail"][text "andu_rotaru@yahoo.com"]
        , h3 []
            [ a
                [href "https://github.com/andu470", class "social-link"]
                [text "Github"]
            ]
    ]
    -- Debug.todo "Implement the Model.PersonalDetails.view function"
