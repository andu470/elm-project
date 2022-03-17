module RepoTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Html.Attributes as Attr
import Main
import Model as M
import Model.Repo as Repo
import Test exposing (..)
import Test.Html.Query as Q
import Test.Html.Selector as S


testRepo : Repo.Repo
testRepo =
    { name = "compiler"
    , description = Just "Compiler for Elm, a functional language for reliable webapps."
    , url = "https://github.com/elm/compiler"
    , pushedAt = "2021-09-18T14:00:17Z"
    , stars = 6625
    }


suite : Test
suite =
    describe "Model.Repo module"
        [ test "Repo view has class repo" <|
            \_ ->
                Repo.view testRepo
                    |> Q.fromHtml
                    |> Q.has [ S.class "repo" ]
        , test "Children of Repo view have the required fields" <|
            \_ ->
                Repo.view testRepo
                    |> Q.fromHtml
                    |> Q.has
                        [ S.class "repo"
                        , S.containing [ S.class "repo-name" ]
                        , S.containing [ S.class "repo-url" ]

                        -- , S.containing [ S.class "repo-description" ]
                        , S.containing [ S.class "repo-stars" ]
                        ]
        , test "Repo url should contain a link to the repo" <|
            \_ ->
                Repo.view testRepo
                    |> Q.fromHtml
                    |> Q.find [ S.class "repo-url" ]
                    |> Q.has [ S.containing [ S.attribute (Attr.href testRepo.url) ] ]
        ]
