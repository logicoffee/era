{-# LANGUAGE PatternSynonyms #-}
module Data.Era.JpEra
  ( JpEraType(..)
  , Year
  , JpEra
  , pattern JpEra
  , makeJpEra
  , maxYear
  , firstYear
  ) where
import Data.Text

type Year = Word

data JpEraType 
  = Meiji
  | Taisho
  | Showa
  | Heisei
  deriving(Eq, Show)

data JpEra = JpEra_ JpEraType Year deriving(Eq, Show)

pattern JpEra era_type year <- JpEra_ era_type year

maxYear :: JpEraType -> Year
maxYear Meiji  = 45
maxYear Taisho = 15
maxYear Showa  = 64
maxYear Heisei = 31

firstYear :: JpEraType -> Year
firstYear Meiji  = 1868
firstYear Taisho = 1912
firstYear Showa  = 1926
firstYear Heisei = 1989

makeJpEra :: JpEraType -> Year -> Maybe JpEra
makeJpEra era_type year | year <= maxYear era_type = Just $ JpEra_ era_type year
makeJpEra _ _                              = Nothing
