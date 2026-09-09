module HaskellLexer (readModule) where

import Control.Exception (IOException, try)

readModule :: String -> IO (Either IOException String)
readModule moduleName = try (readFile moduleName)
