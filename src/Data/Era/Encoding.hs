module Data.Era.Encoding where
import Data.Era.AD
import Data.Era.JpEra

toJpEra :: AD -> JpEra
toJpEra = undefined

fromJpEra :: JpEra -> AD
fromJpEra (JpEra era_type year) = AD $ firstYear era_type + year - 1
