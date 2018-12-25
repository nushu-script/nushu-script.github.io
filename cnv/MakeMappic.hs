-- Make mappic.js for Nushu Converter
-- Usage: echo -e "var mappic = {\n`stack runhaskell -- -Wall -Werror cnv/MakeMappic < data.csv`\n}" > cnv/mappic.js

import Data.List (intercalate)
import Data.List.Split (splitOn)
import Data.MultiMap (MultiMap)
import qualified Data.MultiMap as MM (assocs, empty, insert)
import System.IO

insertOne :: Int -> MultiMap Char Int -> Char -> MultiMap Char Int
insertOne ch m v = MM.insert v ch m

getMap :: MultiMap Char Int -> String -> MultiMap Char Int
getMap m x = let [[colA],_,colC,_] = splitOn "," x in foldl (insertOne $ fromEnum colA) m colC

pp :: (Char, [Int]) -> String
pp (k,v) = '"' : k : "\":\"" <> (intercalate " " $ fmap show v) <> "\""

solve :: String -> String
solve str =
 let ("女书字符,《字帖》序,对应汉字,江永方言代表发音":contents) = lines str
  in intercalate ",\n" $ fmap pp $ MM.assocs $ foldl getMap MM.empty contents

main :: IO ()
main = do
  hSetEncoding stdin utf8_bom
  putStr . solve =<< getContents
