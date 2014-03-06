module Main where

import Control.Monad
import Happstack.Server

list = ["http://example.com"]

--addToList :: String -> String
--addToList url = do 
--	show url
--	url : list
--	return "Thanks for " ++ url

main :: IO ()
main = simpleHTTP nullConf $ msum
	[ dir "add" $ path $ \url -> ok $ toResponse $ "Thanks " ++ head (url : list)
	, dir "about" $ ok $ toResponse "About page."
	, serveDirectory EnableBrowsing ["index.html"] "./htdocs" ]
