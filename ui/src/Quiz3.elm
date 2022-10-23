module Quiz3 exposing (main)

import Html exposing (..)
import Html.Attributes exposing(..)
import Html.Events exposing (..)
import Browser






-----------------------
-- MODEL
-----------------------

-- viewForm  : {  visible : Bool} -> Html Msg
-- viewForm model = 
--         let
--             buttonType = 
--                 if model.visible then "show" else "hide"
--         in
--             span [class "material-icons" ]
--             [ text buttonType ]    
type alias Model =
  { content : String
  }

init : Model
init =
  { content = "" }

-----------------------
-- Update
-----------------------
-- update : Msg -> {  visible : Bool} -> {  visible : Bool} 
-- update msg model =
--     case msg of
--         Visible ->
--            {model | visible = True}
--         Unvisible ->
--            { model | visible = False} 

type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }




-----------------------
-- View
-----------------------
view : Model  -> Html Msg 
view model =
     section [][
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
        ]
      

        


-- MAIN
main =
  Browser.sandbox { init = init, update = update, view = view }