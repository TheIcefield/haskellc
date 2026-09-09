module HaskellLexer (readModule) where

import Control.Exception (IOException, try)

pathFromModuleName :: String -> String
pathFromModuleName moduleName = moduleName ++ ".hs"

readModule :: String -> IO (Either IOException String)
readModule moduleName = try (readFile (pathFromModuleName moduleName))
