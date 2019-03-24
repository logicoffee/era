module Data.Era.Encoding where
import           Data.Era.AD
import           Data.Era.JpEra

toJpEra :: AD -> Either String JpEra
toJpEra (AD year)
    | year >= firstYear Heisei = makeJpEra Heisei $ year - firstYear Heisei + 1
    | year >= firstYear Showa  = makeJpEra Showa  $ year - firstYear Showa + 1
    | year >= firstYear Taisho = makeJpEra Taisho $ year - firstYear Taisho + 1
    | year >= firstYear Meiji  = makeJpEra Meiji  $ year - firstYear Meiji + 1

fromJpEra :: JpEra -> AD
fromJpEra (JpEra eraType year) = AD $ firstYear eraType + year - 1
