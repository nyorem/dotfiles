-- see: https://wiki.haskell.org/Xmonad/Config_archive/John_Goerzen's_Configuration#Preliminaries

import qualified Data.Map as M
import XMonad
import XMonad.Config.Azerty
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import qualified XMonad.StackSet as W
import System.IO

myKeys conf@(XConfig { modMask = modm}) =
    M.fromList $
        -- switch workspaces using F1 .. F9
       [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_F1 .. xK_F9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

cfg =
    azertyConfig

main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad cfg { terminal    = "urxvt"
               , modMask     = mod4Mask -- 'mod' = 'super' = 'windows'
               , keys = \c -> myKeys c `M.union` keys cfg c
               , manageHook = manageDocks <+> manageHook cfg
               , layoutHook = avoidStruts $ layoutHook cfg
               , logHook = dynamicLogWithPP xmobarPP
                            { ppOutput = hPutStrLn xmproc
                            , ppTitle = xmobarColor "green" "" . shorten 50
                            }
               }

