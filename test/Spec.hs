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
    ]
  return ()


encodeFromJpEraToAD :: JpEraType -> Year -> Maybe AD
encodeFromJpEraToAD era_type year = do
  jp_era <- makeJpEra era_type year
  return $ fromJpEra jp_era
