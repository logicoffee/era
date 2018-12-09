module Main where
import Data.Era.AD
import Data.Era.JpEra
import Data.Era.Encoding
import Data.Text
import Test.HUnit

main :: IO ()
main = do
  runTestTT $ TestList
    [ "encode from Heisei to AD" ~: encodeFromJpEraToAD Heisei 5 ~?= Just (AD 1993)
    , "encode from Showa  to AD" ~: encodeFromJpEraToAD Showa 64 ~?= Just (AD 1989)
    , "encode from Taisho to AD" ~: encodeFromJpEraToAD Taisho 9 ~?= Just (AD 1920)
    , "encode from Meiji  to AD" ~: encodeFromJpEraToAD Meiji 37 ~?= Just (AD 1904)
    , "encode from AD to Heisei" ~: toJpEra (AD 1993) ~?= makeJpEra Heisei 5
    , "encode from AD to Showa"  ~: toJpEra (AD 1927) ~?= makeJpEra Showa  2
    , "encode from AD to Taisho" ~: toJpEra (AD 1920) ~?= makeJpEra Taisho 9
    , "encode from AD to Meiji"  ~: toJpEra (AD 1900) ~?= makeJpEra Meiji 33
    ]
  return ()


encodeFromJpEraToAD :: JpEraType -> Word -> Maybe AD
encodeFromJpEraToAD era_type year = do
  jp_era <- makeJpEra era_type year
  return $ fromJpEra jp_era
