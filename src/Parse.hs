module Parse (parseExpr, parseStk) where

import Token
import Data.Char

-- parse expression
parseExpr :: String -> [Tok]
parseExpr expr = map parseTok $ words expr

-- parse stack
parseStk :: [Tok] -> [Tok]
parseStk stk = do
  foldl (\nStk tok -> do
    if kind tok == OpKind then
      parseStkOp nStk tok
    else
      nStk ++ [tok]) [] stk

-- parse stack operator
parseStkOp :: [Tok] -> Tok -> [Tok]
parseStkOp stk tok = do
  let split = splitAt (length stk - 2) stk

  -- get numbers
  let numA = numVal $ head $ snd split
  let numB = numVal $ last $ snd split

  -- push result to stack
  let result = doOp (opVal tok) numA numB
  fst split ++ [Num NumKind result]

-- parse token
parseTok :: String -> Tok
parseTok text =
  if all isDigit text then
    -- create number token
    numTok (read text :: Integer)
  else
    -- create operator token
    opTok $ parseOp text

-- do operation
doOp :: Op -> Integer -> Integer -> Integer
doOp op numA numB =
  case op of
    Add -> numA + numB
    Sub -> numA - numB
    Mul -> numA * numB
    Div -> numA `div` numB
    Mod -> numA `mod` numB
    Exp -> numA ^ numB

-- parse operator
parseOp :: String -> Op
parseOp text =
  case text of
    "+" -> Add
    "-" -> Sub
    "*" -> Mul
    "/" -> Div
    "%" -> Mod
    "^" -> Exp
