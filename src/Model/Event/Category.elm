module Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected, eventCategories, isEventCategorySelected, set, view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (checked, class, style, type_)
import Html.Events exposing (onCheck)


type EventCategory
    = Academic
    | Work
    | Project
    | Award


eventCategories =
    [ Academic, Work, Project, Award ]


{-| Type used to represent the state of the selected event categories
-}
type alias SelectedEventCategories = 
    { academic : Maybe EventCategory
    , work : Maybe EventCategory
    , project : Maybe EventCategory
    , award : Maybe EventCategory
    }


{-| Returns an instance of `SelectedEventCategories` with all categories selected

    isEventCategorySelected Academic allSelected --> True

-}
allSelected : SelectedEventCategories
allSelected = 
    { academic = Just Academic
    , work = Just Work
    , project = Just Project
    , award = Just Award
    }
    -- Debug.todo "Implement Model.Event.Category.allSelected"


{-| Given a the current state and a `category` it returns whether the `category` is selected.

    isEventCategorySelected Academic allSelected --> True

-}
isEventCategorySelected : EventCategory -> SelectedEventCategories -> Bool
isEventCategorySelected category current =
    case category of
        Academic -> case current.academic of
                        (Just a) -> True
                        (Nothing) -> False
        Work -> case current.work of
                        (Just w) -> True
                        (Nothing) -> False
        Project -> case current.project of
                        (Just p) -> True
                        (Nothing) -> False
        Award -> case current.award of
                        (Just a) -> True
                        (Nothing) -> False
    -- Debug.todo "Implement Model.Event.Category.isEventCategorySelected"


{-| Given an `category`, a boolean `value` and the current state, it sets the given `category` in `current` to `value`.

    allSelected |> set Academic False |> isEventCategorySelected Academic --> False

    allSelected |> set Academic False |> isEventCategorySelected Work --> True

-}
set : EventCategory -> Bool -> SelectedEventCategories -> SelectedEventCategories
set category value current =
    let
        {academic,work,project,award} = current
        setAcademic = case category of
                        Academic -> if value then Just Academic else Nothing
                        _ -> academic

        setWork = case category of
                        Work -> if value then Just Work else Nothing
                        _ -> work

        setProject = case category of
                        Project -> if value then Just Project else Nothing
                        _ -> project

        setAward = case category of
                        Award -> if value then Just Award else Nothing
                        _ -> award
    in 
        {academic = setAcademic, work = setWork, project = setProject, award = setAward}
    -- Debug.todo "Implement Model.Event.Category.set"


checkbox : String -> Bool -> EventCategory -> Html ( EventCategory, Bool )
checkbox name state category =
    div [ style "display" "inline", class "category-checkbox" ]
        [ input [ type_ "checkbox", onCheck (\c -> ( category, c )), checked state ] []
        , text name
        ]


view : SelectedEventCategories -> Html ( EventCategory, Bool )
view model =
    div [] 
    [ checkbox "Academic" (isEventCategorySelected Academic model) Academic
    , checkbox "Work" (isEventCategorySelected Work model) Work
    , checkbox "Project" (isEventCategorySelected Project model) Project
    , checkbox "Award" (isEventCategorySelected Award model) Award
    ]
    -- Debug.todo "Implement the Model.Event.Category.view function"
