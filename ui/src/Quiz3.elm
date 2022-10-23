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
    | DoneTodos Int Bool
    | DelTodo Int
    | SetField String


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
                    ul [ class "text-left mt-24" ] (List.map viewResult model.todo)
                    -- List of Items

                ]-- /Form Block
                ,div[ class "newItem "]
                [
                    Html.form [ class "form" ,onSubmit CreateTodo ] [
                        input
                            [ class "inputTitle"
                            , placeholder "Add item here.."
                            , onInput
                                (\string -> SetField string)
                            , value model.field
                            ]
                            []
                        ,button [ class "btn", type_ "submit", disabled (model.field == "") ] [ text "Create" ]       
                        ]--/New Item Button
                    ]
                
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
        SetField str ->
            { model | field = str }
        DelTodo id ->
            { model | todo = List.filter(\todo -> todo.id /= id) model.todo }
        DoneTodos id done ->
            let
                updateTodo todo =
                    if todo.id == id then
                        { todo | isDone = not done }
                    else
                        todo
            in
            { model | todo = List.map updateTodo model.todo }


viewResult : Todos -> Html Msg
viewResult todo =
    li [ class "itemList", onClick (DoneTodos todo.id todo.isDone) ]
        [ 
        div [ classList[("completed", todo.isDone)], class "item" ] [ text todo.name ]
        ,button
            [ class "done material-symbols-outlined ", onClick (DoneTodos todo.id todo.isDone) ]
            [ text "check" ]
        , button
            [ class "delete material-symbols-outlined", onClick (DelTodo todo.id)]
            [ text "delete" ]
        ]

-- MAIN
main : Program () Model Msg
main =
    Browser.sandbox
        { view = view
         , update = update
        , init = initModel
        }