module VerifyExamples.Model.Date.MonthsBetween2 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Model.Date exposing (..)







spec2 : Test.Test
spec2 =
    Test.test "#monthsBetween: \n\n    monthsBetween (full 2020 Dec) (full 2021 Jan)\n    --> Just 1" <|
        \() ->
            Expect.equal
                (
                monthsBetween (full 2020 Dec) (full 2021 Jan)
                )
                (
                Just 1
                )