module CompilerOptionsParser (parseCompilerOptions, CompilerOptions (..)) where

import Options.Applicative

data CompilerOptions = CompilerOptions
  { mainModule :: String
  }
  deriving (Show)

compilerOptionsParser :: Parser CompilerOptions
compilerOptionsParser =
  CompilerOptions
    <$> strArgument
      ( metavar "MAIN"
          <> help "Locate by module name source file and automatically find other modules"
      )

parseCompilerOptions :: IO CompilerOptions
parseCompilerOptions = execParser opts
  where
    opts =
      info
        (compilerOptionsParser <**> helper)
        ( fullDesc
            <> progDesc "Compiler flags"
        )
