module Main where
import           Data.Era
import           System.Environment

main :: IO ()
main = do
    args <- getArgs
    showResult $ era args

showResult :: Either String String -> IO ()
showResult (Left  msg)           = putStrLn msg
showResult (Right formattedYear) = putStrLn formattedYear
