module Main exposing (main)

import Playground exposing (..)
import Playground3d exposing (..)



-- MAIN


main =
    animation <|
        \time ->
            [ shape3dto2d camera1 <|
                scale3d 2 <|
                    move3d 0 0 800 <|
                        words3d red "MERRY CHRISTMAS"
            , shape3dto2d camera1 <|
                rotate3d 0 0 (spin 6 time) <|
                    move3d 0 0 -400 <|
                        fade3d 0.5 <|
                            tree
            , rotate (spin 3 time) <|
                move -100 -250 <|
                    shape3dto2d camera1 <|
                        rotate3d 0 0 (spin 6 time) <|
                            fade3d 0.5 <|
                                cube lightYellow yellow darkYellow 200
            , rotate (spin 3 time) <|
                move 0 -250 <|
                    shape3dto2d camera1 <|
                        rotate3d 0 0 (spin 6 time) <|
                            fade3d 0.5 <|
                                cube lightRed red darkRed 200
            , rotate (spin 3 time) <|
                move 100 -250 <|
                    shape3dto2d camera1 <|
                        rotate3d 0 0 (spin 6 time) <|
                            fade3d 0.5 <|
                                cube lightYellow yellow darkYellow 200
            ]


tree =
    group3d
        [ move3d 0 0 -100 <| cube lightBrown brown darkBrown 100
        , pyramid darkGreen green lightGreen 600
        , move3d 0 0 200 <| pyramid darkGreen green lightGreen 600
        , move3d 0 0 400 <| pyramid darkGreen green lightGreen 600
        , move3d 0 0 1000 <| pyramid darkYellow yellow lightYellow 100
        , rotate3d 0 180 0 <| move3d 0 0 -1050 <| pyramid darkYellow yellow lightYellow 100
        ]


pyramid color1 color2 color3 size =
    let
        b =
            sqrt 3

        base1 =
            ( 0.5, 0.5 / b, 0 )

        base2 =
            ( 0, 0.5 / b * -2, 0 )

        base3 =
            ( -0.5, 0.5 / b, 0 )

        top =
            ( 0, 0, sqrt (1 - ((0.5 / b) ^ 2)) )
    in
    scale3d size <|
        group3d
            [ polygon3d color1 [ base1, base2, base3 ]
            , polygon3d color3 [ base1, base2, top ]
            , polygon3d color1 [ base2, base3, top ]
            , polygon3d color2 [ base3, base1, top ]
            ]



{-
   , shape3dto2d camera1 <|
       scale3d 600 <|
           fade3d 0.5 <|
               group3d
                   [ polygon3d darkGreen [ ( 0, 0, 0 ), ( 0, 1, 0 ), ( cos (degrees 30), sin (degrees 30), 0 ) ]
                   , polygon3d green [ ( 0.5 / sqrt 3, 0.5, 1 ), ( 0, 1, 0 ), ( cos (degrees 30), sin (degrees 30), 0 ) ]
                   , polygon3d green [ ( 0.5 / sqrt 3, 0.5, 1 ), ( 0, 0, 0 ), ( cos (degrees 30), sin (degrees 30), 0 ) ]
                   , polygon3d green [ ( 0.5 / sqrt 3, 0.5, 1 ), ( 0, 1, 0 ), ( 0, 0, 0 ) ]
                   ]
   ]
-}
