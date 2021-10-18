import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Loggers

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
-- import XMonad.Hooks.FadeWindows

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
-- import XMonad.Layout.Gaps

main :: IO ()
main = xmonad
     . ewmh
     =<< xmobar myConfig

myLayout = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True $
           smartBorders tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1     -- Windows in master pane
    ratio    = 1/2   -- Portion of master
    delta    = 2/100 -- Res amt

myConfig = def
  { layoutHook  = myLayout
  -- , logHook    = fadeWindowsLogHook myFadeHook
  -- , handleEventHook = fadeWindowsEventHook
  , borderWidth = 1
  , focusedBorderColor = "#45283c"
  , normalBorderColor = "#68aed4"
  , terminal    = "kitty"
  , modMask     = mod4Mask -- Rebind Mod to Super (Win)
  }
  `additionalKeysP`
  [ ("M4-p", spawn "rofi -show drun")
  , ("M4-0", spawn "rofi -show window")
  ]

-- this isn't setup to work well :|
-- myFadeHook = composeAll [isUnfocused --> transparency 0.2
                        -- ,                opaque
                        -- ]

-- myXMobarPP :: PP
-- myXMobarPP = def
--   {   ppSep             = magenta " • "
--     , ppTitleSanitize   = xmobarStrip
--     , ppCurrent         = wrap (blue "<") (blue ">")
--     , ppHidden          = white . wrap " " ""
--     , ppHiddenNoWindows = lowWhite . wrap " " ""
--     , ppUrgent          = red . wrap (yellow "!") (yellow "!")
--     , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
--     , ppExtras          = [] --[logTitles formatFocused formatUnfocused]
--     }
--   where
--     formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
--     formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

--     -- | Windows should have *some* title, which should not not exceed a
--     -- sane length.
--     ppWindow :: String -> String
--     ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

--     blue, lowWhite, magenta, red, white, yellow :: String -> String
--     magenta  = xmobarColor "#ff79c6" ""
--     blue     = xmobarColor "#bd93f9" ""
--     white    = xmobarColor "#f8f8f2" ""
--     yellow   = xmobarColor "#f1fa8c" ""
--     red      = xmobarColor "#ff5555" ""
--     lowWhite = xmobarColor "#bbbbbb" ""
