module Data.Era.AD where

import           Data.Text

newtype AD = AD Word deriving(Eq)

instance Show AD where
    show (AD year) = show year ++ "年"
