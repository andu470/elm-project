module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (..)
import Html.Attributes exposing (title)
import Model.Event.Category exposing (eventCategories)
import Model.Date exposing (Month(..))


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


compareEvents : Event -> Event -> Order
compareEvents event1 event2 = Interval.compare event1.interval event2.interval

sortByInterval : List Event -> List Event
sortByInterval events =
    List.sortWith compareEvents events
    -- Debug.todo "Implement Event.sortByInterval"

view : Event -> Html Never
view event =
    let
        classSimple = class "event"
        classImportant = [class "event-important"]
        checkImportant = if event.important == True then classImportant else []
        intervalPrint = Interval.checkIntervalStart event.interval ++ "-" ++ Interval.checkIntervalEnd event.interval
    in
    div (classSimple::checkImportant) [
        h3 [class "event-title"][text event.title]
        , div [class "event-interval"][text intervalPrint]
        , div [class "event-description"][event.description]
        , div [class "event-category"][categoryView event.category]
        , div [class "event-url"][text (event.url |> Maybe.withDefault "no url")]
    ]
    -- Debug.todo "Implement the Model.Event.view function"
