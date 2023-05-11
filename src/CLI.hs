module CLI (runCLI) where

import Help
import Token
import Parse
import String

import Data.Char

import System.IO
import System.Exit
import System.Environment

-- run cli
runCLI :: IO ()
runCLI = do
  hSetBuffering stdout NoBuffering

  -- get expression
  args <- getArgs
  let expr = unwords args

  -- show help
  if null args then do
    showHelp
    exitWith $ ExitFailure 1
  else do
    -- parse expression
    let parsed = parseExpr expr

    -- create new stack
    let newStk   = parseStk parsed
    let printStk = reverse newStk

    -- print expression
    mapM_ (\char -> putStr $ bold $ if isDigit char then blue [char] else yellow [char]) expr

    putStr $ magenta " -> "

    -- print stack
    putStr "{"

    putStr $ bold $ blue $ show $ numVal $ head printStk

    -- print numbers
    mapM_ (\tok -> do
      putStr ", "

      putStr $ bold $ blue $ show $ numVal tok) $ tail printStk

    putStr $ "}"

    return ()
