{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.IO.Class (liftIO)
import Database.Persist
import Database.Persist.Sqlite
import Control.Monad (void)
import Model

main :: IO ()
main = runSqlite "test.db" $ do
    runMigration migrateAll
    void $ insert $ User "Alice" 30
    void $ insert $ User "Bob" 25
    users <- selectList [] [Asc UserName]
    liftIO $ print (users :: [Entity User])
