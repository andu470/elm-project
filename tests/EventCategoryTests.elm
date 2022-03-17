module EventCategoryTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Model as M
import Model.Event.Category as EvtCat
import Test exposing (..)
import Test.Html.Query as Q
import Test.Html.Selector as S


suite : Test
suite =
    describe "Model.Event.Category module"
        [ test "allSelected has all categories set" <|
            \_ ->
                EvtCat.eventCategories
                    |> List.all (\cat -> EvtCat.isEventCategorySelected cat EvtCat.allSelected)
                    |> Expect.true "Expected all categories to be selected"
        , test "set sets selected categories correctly" <|
            \_ ->
                EvtCat.eventCategories
                    |> List.all (\cat -> EvtCat.isEventCategorySelected cat (EvtCat.set EvtCat.Academic False EvtCat.allSelected))
                    |> Expect.false "Expected some categories to not be selected"
        , test "view contains 4 checkboxes" <|
            \_ ->
                EvtCat.view EvtCat.allSelected
                    |> Q.fromHtml
                    |> Q.findAll [ S.class "category-checkbox" ]
                    |> Q.count (Expect.equal 4)
        ]
