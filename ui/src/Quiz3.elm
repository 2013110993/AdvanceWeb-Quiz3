module Quiz3 exposing (main)

import Html exposing (..)
import Html.Attributes exposing(class, src)
import Html.Events exposing (onClick)
import Browser

view model =
    -- Header
    div [ class "container" ]
        [ div [ class "wrapper header"] 
              [
                span [ class "material-symbols-outlined"][ text "download_done"]
                , h1 [] 
                     [
                        text "ToDo"
                        , span [][ text "list"]
                     ]
              ]
        
        ]
    -- / Header


main =
    view "dummy model"
