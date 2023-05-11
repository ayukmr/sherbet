module Token
  ( Tok (..)
  , TokKind (..)
  , Op (..)
  , numTok
  , opTok
  ) where

-- token
data Tok =
    -- number token
    Num { kind   :: TokKind
        , numVal :: Integer
        }
    -- operator token
  | Op { kind  :: TokKind
       , opVal :: Op
       }
  deriving (Eq, Show)

-- token kind
data TokKind = NumKind | OpKind
  deriving (Eq, Show)

-- operator
data Op =
  Add | Sub | Mul | Div | Mod | Exp
  deriving (Eq, Show)

-- create number token
numTok :: Integer -> Tok
numTok num = Num NumKind num

-- create operator token
opTok :: Op -> Tok
opTok op = Op OpKind op
