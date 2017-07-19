{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

{-|
Module      : Earthdawn.FourthEdition.API
Description : HTTP API for Earthdawn 4th Edition Resources
Copyright   : (c) Alex Brandt, 2017
License     : MIT

HTTP API for Earthdawn 4th Edition resources.
-}
module Earthdawn.FourthEdition.API
  ( API
  , server
  ) where

import Servant

import qualified Earthdawn.FourthEdition.Abilities.API as Abilities
import qualified Earthdawn.FourthEdition.Disciplines.API as Disciplines
import qualified Earthdawn.FourthEdition.Races.API as Races
import qualified Earthdawn.FourthEdition.Talents.API as Talents

-- | "Servant" API for Earthdawn 4th Edition.
--
--   Implemented Resources:
--
--   * "Earthdawn.FourthEdition.Abilities.API"
--   * "Earthdawn.FourthEdition.Disciplines.API"
--   * "Earthdawn.FourthEdition.Races.API"
type API = "abilities" :> Abilities.API
      :<|> "disciplines" :> Disciplines.API
      :<|> "races" :> Races.API
      :<|> "talents" :> Talents.API

-- | "Servant" "Server" for Earthdawn 4th Edition.
server :: String -> Server API
server b = Abilities.server (b ++ "/abilities")
      :<|> Disciplines.server (b ++ "/disciplines")
      :<|> Races.server (b ++ "/races")
      :<|> Talents.server (b ++ "/talents")
