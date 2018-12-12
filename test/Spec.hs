module Main where
import Data.Era
import Data.Era.AD
import Data.Era.JpEra
import Data.Era.Encoding
import Test.HUnit

main :: IO ()
main = do
  _ <- runTestTT $ TestList
    [ "encode from Heisei to AD" ~: encodeFromJpEraToAD Heisei 5 ~?= Right (AD 1993)
    , "encode from Showa  to AD" ~: encodeFromJpEraToAD Showa 64 ~?= Right (AD 1989)
    , "encode from Taisho to AD" ~: encodeFromJpEraToAD Taisho 9 ~?= Right (AD 1920)
    , "encode from Meiji  to AD" ~: encodeFromJpEraToAD Meiji 37 ~?= Right (AD 1904)
    , "encode from AD to Heisei" ~: toJpEra (AD 1993) ~?= makeJpEra Heisei 5
    , "encode from AD to Showa"  ~: toJpEra (AD 1927) ~?= makeJpEra Showa  2
    , "encode from AD to Taisho" ~: toJpEra (AD 1920) ~?= makeJpEra Taisho 9
    , "encode from AD to Meiji"  ~: toJpEra (AD 1900) ~?= makeJpEra Meiji 33
    , "era func test" ~: era ["h", "5"] ~?= Right "1993年"
    , "era func test" ~: era ["1993"]   ~?= Right "平成5年"
    ]
  return ()


encodeFromJpEraToAD :: JpEraType -> Word -> Either String AD
encodeFromJpEraToAD era_type year = do
  jp_era <- makeJpEra era_type year
  return $ fromJpEra jp_era
