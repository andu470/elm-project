module VerifyExamples.Model.Date.MonthsBetween4 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Model.Date exposing (..)







spec4 : Test.Test
spec4 =
    Test.test "#monthsBetween: \n\n    monthsBetween (onlyYear 2020) (full 2021 Jan)\n    --> Nothing" <|
        \() ->
            Expect.equal
                (
                monthsBetween (onlyYear 2020) (full 2021 Jan)
                )
                (
                Nothing
                )