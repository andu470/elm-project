module VerifyExamples.Model.Date.Compare0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Model.Date exposing (..)







spec0 : Test.Test
spec0 =
    Test.test "#compare: \n\n    Model.Date.compare (onlyYear 2019) (full 2020 Dec)\n    --> LT" <|
        \() ->
            Expect.equal
                (
                Model.Date.compare (onlyYear 2019) (full 2020 Dec)
                )
                (
                LT
                )