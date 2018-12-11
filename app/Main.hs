module Main where
import System.Environment
import Data.Era

main :: IO ()
main = do
  args <- getArgs
  putStrLn $ show $ era args
