module Quiz3 exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-----------------------
-- MODEL
-----------------------
type alias Model =
    { field : String
    , id : Int
    , todo : List Todos
    }

type alias Todos =
    { id : Int
    , name : String
    , isDone: Bool
    }


type Msg
    = CreateTodo


initModel : Model
initModel =
    { field = ""
    , id = 0
    , todo = []
    }


-----------------------
-- View
-----------------------
view : Model -> Html Msg
view model =
    section [ ] [ 
     
        div [ class "container" ]
            [ div [ class "wrapper header"] 
                [
                    span [ class "material-symbols-outlined"][ text "download_done"]
                    , h1 [] 
                        [
                            text "ToDo"
                            , span [][ text "list"]
                        ]
                        
                ]-- / Header

                ,div[class "wrapper formBlock"]
                [
                    -- List of Items

                ]-- /Form Block
                ,div[ class "newItem "]
                [
                    span[ class "material-symbols-outlined" ]
                    [
                       text "add"
                    ]
                    ,text "New Item"
                       
                ]--/New Item Button
                
            ]--/Container
        

       
    ]

-----------------------
-- Update
-----------------------
update : Msg -> Model -> Model
update msg model =
    case msg of
        CreateTodo ->
            { model | todo = { id = model.id, name = model.field, isDone = False } :: model.todo, field = "", id = model.id + 1 }



-- MAIN
main : Program () Model Msg
main =
    Browser.sandbox
        { view = view
         , update = update
        , init = initModel
        }