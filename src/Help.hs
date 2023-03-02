module Help (showHelp) where

import String

-- show help
showHelp :: IO ()
showHelp = do
  -- usage
  putStrLn $ (bold $ magenta "Usage") ++ ":"
  putStrLn $ "  " ++ (cyan "sherbert") ++ " " ++ (yellow "<EXPRESSION>") ++ "\n"

  -- examples
  putStrLn $ (bold $ magenta "Examples") ++ ":"
  putStrLn $ "  " ++ (cyan "1 2 +")     ++ "      " ++ (yellow "1 + 2     -> {3}")
  putStrLn $ "  " ++ (cyan "1 3 5 +")   ++ "    "   ++ (yellow "3 + 5, 1  -> {8, 1}")
  putStrLn $ "  " ++ (cyan "2 4 6 + ^") ++ "  "     ++ (yellow "2^(4 + 6) -> {1024}")

  return ()
