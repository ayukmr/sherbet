module Help (showHelp) where

import String

-- show help
showHelp :: IO ()
showHelp = do
  -- usage
  putStrLn $ (bold $ magenta "Usage") ++ ":"
  putStrLn $ "  " ++ (blue "shbt") ++ " " ++ (yellow "<EXPRESSION>") ++ "\n"

  -- examples
  putStrLn $ (bold $ magenta "Examples") ++ ":"
  putStrLn $ "  " ++ (blue "1 2 +")     ++ "      " ++ (yellow "1 + 2     -> {3}")
  putStrLn $ "  " ++ (blue "1 3 5 +")   ++ "    "   ++ (yellow "3 + 5, 1  -> {8, 1}")
  putStrLn $ "  " ++ (blue "2 4 6 + ^") ++ "  "     ++ (yellow "2^(4 + 6) -> {1024}")

  return ()
