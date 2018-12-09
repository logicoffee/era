module Data.Era.AD where
import Data.Text

type Year = Word

data AD = AD Year deriving(Eq, Show)
