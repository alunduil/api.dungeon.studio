{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

{-|
Module      : Earthdawn.API
Description : HTTP API for Earthdawn Resources
Copyright   : (c) Alex Brandt, 2017
License     : MIT

HTTP API for Earthdawn resources.
-}
module Earthdawn.API
  ( API
  , server
  ) where

import Servant

import qualified Earthdawn.FourthEdition.API as FourthEdition

-- | "Servant" API for Earthdawn.
--
--   Implemented Editions:
--
--   * "Earthdawn.FourthEdition.API"
type API = "4e" :> FourthEdition.API

-- | "Servant" 'Server' for Earthdawn.
server :: String -> Server API
server b = FourthEdition.server $ b ++ "/4e"
