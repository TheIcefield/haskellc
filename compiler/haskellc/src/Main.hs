module Main where

import CompilerOptionsParser (CompilerOptions (..), parseCompilerOptions)
import HaskellLexer (readModule)

processModule :: String -> CompilerOptions -> IO ()
processModule moduleName _options = do
  result <- readModule moduleName
  case result of
    Left err -> putStrLn $ "Failed process module \"" ++ moduleName ++ "\" with errors: " ++ show err
    Right content -> putStrLn $ "Success on process module \"" ++ moduleName ++ "\"\n  - Content:\n" ++ content

main :: IO ()
main = do
  options <- parseCompilerOptions
  putStrLn $ "Main module: " ++ mainModule options
  processModule (mainModule options) options
  putStrLn $ "End!"
