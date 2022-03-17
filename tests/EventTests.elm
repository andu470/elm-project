module EventTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Html
import Main
import Model as M
import Model.Date as Date
import Model.Event as Event
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval
import Test exposing (..)
import Test.Html.Query as Q
import Test.Html.Selector as S


testEvent : Event.Event
testEvent =
    { title = "Test event"
    , interval = Interval.withDurationYears (Date.onlyYear 2016) 4
    , description = Html.text "Sample text"
    , category = Academic
    , url = Nothing
    , tags = []
    , important = False
    }


importantTestEvent : Event.Event
importantTestEvent =
    { title = "Important Test event"
    , interval = Interval.withDurationYears (Date.onlyYear 2016) 4
    , description = Html.text "Sample text"
    , category = Academic
    , url = Nothing
    , tags = []
    , important = True
    }


suite : Test
suite =
    describe "Model.Event module"
        [ test "Event view has class event" <|
            \_ ->
                Event.view testEvent
                    |> Q.fromHtml
                    |> Q.has [ S.class "event" ]
        , test "Children of Event view have the required fields" <|
            \_ ->
                Event.view testEvent
                    |> Q.fromHtml
                    |> Q.has
                        [ S.class "event"
                        , S.containing [ S.class "event-title" ]
                        , S.containing [ S.class "event-category" ]
                        , S.containing [ S.class "event-interval" ]
                        , S.containing [ S.class "event-description" ]
                        ]
        , test "Important events have class event-important" <|
            \_ ->
                Event.view importantTestEvent
                    |> Q.fromHtml
                    |> Q.has
                        [ S.classes [ "event", "event-important" ]
                        ]
        ]
