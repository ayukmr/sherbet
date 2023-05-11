module String
  ( red, green, yellow, blue, magenta, cyan
  , bold, italic, underline
  ) where

-- make string red
red :: String -> String
red str = "\ESC[31m" ++ str ++ "\ESC[0m"

-- make string green
green :: String -> String
green str = "\ESC[32m" ++ str ++ "\ESC[0m"

-- make string yellow
yellow :: String -> String
yellow str = "\ESC[33m" ++ str ++ "\ESC[0m"

-- make string blue
blue :: String -> String
blue str = "\ESC[34m" ++ str ++ "\ESC[0m"

-- make string magenta
magenta :: String -> String
magenta str = "\ESC[35m" ++ str ++ "\ESC[0m"

-- make string cyan
cyan :: String -> String
cyan str = "\ESC[36m" ++ str ++ "\ESC[0m"

-- make string bold
bold :: String -> String
bold str = "\ESC[1m" ++ str ++ "\ESC[22m"

-- make string italic
italic :: String -> String
italic str = "\ESC[3m" ++ str ++ "\ESC[23m"

-- make string underlined
underline :: String -> String
underline str = "\ESC[4m" ++ str ++ "\ESC[24m"
