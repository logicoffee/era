{-# LANGUAGE PatternSynonyms #-}

module Data.Era.JpEra
    ( JpEraType(..)
    , JpEra
    , pattern JpEra
    , makeJpEra
    , maxYear
    , firstYear
    , match
    ) where

import           Data.Text
import           Text.Read

data JpEraType
    = Meiji
    | Taisho
    | Showa
    | Heisei
    deriving(Eq)

instance Show JpEraType where
    show Meiji  = "明治"
    show Taisho = "大正"
    show Showa  = "昭和"
    show Heisei = "平成"

data JpEra = JpEra_ JpEraType Word deriving(Eq)

instance Show JpEra where
    show (JpEra eraType year) = show eraType ++ show year ++ "年"

pattern JpEra eraType year <- JpEra_ eraType year

maxYear :: JpEraType -> Word
maxYear Meiji  = 45
maxYear Taisho = 15
maxYear Showa  = 64
maxYear Heisei = 31

firstYear :: JpEraType -> Word
firstYear Meiji  = 1868
firstYear Taisho = 1912
firstYear Showa  = 1926
firstYear Heisei = 1989

makeJpEra :: JpEraType -> Word -> Either String JpEra
makeJpEra eraType year
    | year <= maxYear eraType = Right $ JpEra_ eraType year
makeJpEra eraType _           = Left $ "The year should be " ++ show eraType ++ " or less"



match :: String -> Either String JpEraType
match t = case t of
    "h" -> Right Heisei
    "s" -> Right Showa
    "m" -> Right Meiji
    "t" -> Right Taisho
match _ = Left "Invalid character"
