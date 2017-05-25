module GildedRoseSpec (spec) where

import Test.Hspec
import GildedRose

spec :: Spec
spec =
  describe "updateQuality" $ do

    it "Foo is a bad boy" $
       let inventory = [
                Item "foo" 0 0,--1
                Item "foo" 0 1,--2
                Item "foo" 0 3,--3
                Item "foo" 1 3 --4
                       ]
           actual = updateQuality inventory
           expected = [
                Item "foo" (-1) 0,
                Item "foo" (-1) 0,
                Item "foo" (-1) 1,
                Item "foo"  0   2
                      ]
       in actual `shouldBe` expected


    it "Brie ages excellently, but you need to sell it" $
        let inventory = [
                Item "Aged Brie" 0 0,
                Item "Aged Brie" 0 49,
                Item "Aged Brie" 0 50,
                Item "Aged Brie" 1 0,
                Item "Aged Brie" 1 49,
                Item "Aged Brie" 1 50
                        ]
            actual = updateQuality inventory
            expected = [
                Item "Aged Brie" (-1) 2,
                Item "Aged Brie" (-1) 50,
                Item "Aged Brie" (-1) 50,
                Item "Aged Brie"  0   1,
                Item "Aged Brie"  0   50,
                Item "Aged Brie"  0   50
                ]
        in actual `shouldBe` expected