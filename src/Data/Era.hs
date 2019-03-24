module Data.Era where

import           Data.Era.AD
import           Data.Era.Encoding
import           Data.Era.JpEra
import           Text.Read


era :: [String] -> Either String String
era [eraTypeChar, yearStr] = do
    eraType <- match eraTypeChar
    year    <- readEither yearStr
    jpEra   <- makeJpEra eraType year
    return . show . fromJpEra $ jpEra

era [yearStr] = do
    year  <- readEither yearStr
    jpEra <- toJpEra $ AD year
    return . show $ jpEra
