{-# LANGUAGE CPP #-}
-- | Miscellaneous information about the system environment.
module System.Environment.Compat (
  getArgs
, getProgName
, getExecutablePath
, getEnv
, lookupEnv
, withArgs
, withProgName
, getEnvironment
) where

import           System.Environment
import           System.Environment.ExecutablePath

#if !MIN_VERSION_base(4,6,0)
-- | Return the value of the environment variable @var@, or @Nothing@ if
-- there is no such value.
--
-- For POSIX users, this is equivalent to 'System.Posix.Env.getEnv'.
lookupEnv :: String -> IO (Maybe String)
lookupEnv k = lookup k `fmap` getEnvironment
#endif