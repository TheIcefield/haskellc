module Main where

import CompilerOptionsParser (CompilerOptions (..), parseCompilerOptions)

main :: IO ()
main = do
  options <- parseCompilerOptions
  putStrLn $ "Main module: " ++ mainModule options
