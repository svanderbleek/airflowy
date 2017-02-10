module Main where

import Airtable.Query
  (AirtableOptions(AirtableOptions)
  ,getTable)
import Airtable.Table
  (Table)
import System.Environment
  (getArgs)
import Control.Monad.IO.Class
  (MonadIO)
import Control.Monad.Except
  (MonadError
  ,throwError)

data Opts
  = Opts
  { api :: String
  , app :: String
  , table :: String }

main :: (MonadError e m, MonadIO m) => m ()
main = undefined

mkOpts :: MonadError e m => [String] -> m Opts
mkOpts (api:app:table:_) =
  return $ Opts api app table
mkOpts _ =
  throwError "Please pass Api Key, App Id, and Table Name via command line arguments"

mkReq :: Opts -> IO (Table String)
mkReq opts =
  getTable airOpts (table opts)
  where
    airOpts = (AirtableOptions (api opts) (app opts) 0)
