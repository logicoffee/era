module Main where
import System.Environment
import Data.Era

main :: IO ()
main = do
  args <- getArgs
  showResult $ era args

showResult :: Either String String -> IO ()
showResult (Left  msg)            = putStrLn msg
showResult (Right formatted_year) = putStrLn formatted_year
