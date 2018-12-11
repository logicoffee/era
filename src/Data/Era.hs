module Data.Era where
import Data.Era.AD
import Data.Era.JpEra
import Data.Era.Encoding
import Text.Read


era :: [String] -> Either String String
era [era_type_char, year_str] = do
  era_type <- match era_type_char
  year <- readEither year_str
  jp_era <- makeJpEra era_type year
  return . show . fromJpEra $ jp_era

era [year_str] = do
  year <- readEither year_str
  jp_era <- toJpEra $ AD year 
  return . show $ jp_era
