import qualified Data.Map as M
import Data.Monoid
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

myTerminal = "kitty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth = 2

myModMask = mod4Mask

myNormalBorderColor = "#44475a"

myFocusedBorderColor = "#bd93f9"

myWorkspaces = [" code ", " web ", " music ", " chat ", " engines ", " obs ", " art ", " steam ", " term "]

myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList $
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), windows W.swapMaster),
      -- launch dmenu
      ((modm, xK_p), spawn "dmenu_run"),
      -- launch rofi
      -- ((modm, xK_p), spawn "rofi -show drun"),
      -- launch gmrun
      ((modm .|. shiftMask, xK_p), spawn "gmrun"),
      -- close focused window
      ((modm .|. shiftMask, xK_c), kill),
      -- Rotate through the available layout algorithms
      ((modm, xK_space), sendMessage NextLayout),
      --  Reset the layouts on the current workspace to default
      ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf),
      -- Resize viewed windows to the correct size
      ((modm, xK_n), refresh),
      -- Move focus to the next window
      ((modm, xK_Tab), windows W.focusDown),
      -- Move focus to the next window
      ((modm, xK_j), windows W.focusDown),
      -- Move focus to the previous window
      ((modm, xK_k), windows W.focusUp),
      -- Move focus to the master window
      ((modm, xK_m), windows W.focusMaster),
      -- Swap the focused window and the master window
      ((modm, xK_Return), spawn $ XMonad.terminal conf),
      -- Swap the focused window with the next window
      ((modm .|. shiftMask, xK_j), windows W.swapDown),
      -- Swap the focused window with the previous window
      ((modm .|. shiftMask, xK_k), windows W.swapUp),
      -- Shrink the master area
      ((modm, xK_h), sendMessage Shrink),
      -- Expand the master area
      ((modm, xK_l), sendMessage Expand),
      -- Push window back into tiling
      ((modm, xK_t), withFocused $ windows . W.sink),
      -- Increment the number of windows in the master area
      ((modm, xK_comma), sendMessage (IncMasterN 1)),
      -- Deincrement the number of windows in the master area
      ((modm, xK_period), sendMessage (IncMasterN (-1))),
      -- Toggle the status bar gap
      -- Use this binding with avoidStruts from Hooks.ManageDocks.
      -- See also the statusBar function from Hooks.DynamicLog.
      --
      -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

      -- Quit xmonad
      ((modm .|. shiftMask, xK_u), io (exitWith ExitSuccess)),
      -- Restart xmonad
      ((modm, xK_u), spawn "xmonad --recompile; xmonad --restart"),
      -- Run xmessage with a summary of the default keybindings (useful for beginners)
      ((modm .|. shiftMask, xK_slash), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
      ++
      --
      -- mod-[1..9], Switch to workspace N
      -- mod-shift-[1..9], Move client to workspace N
      --
      [ ((m .|. modm, k), windows $ f i)
        -- | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9],
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1, xK_2, xK_3, xK_4, xK_q, xK_w, xK_e, xK_a, xK_s],
          (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
      ]
      -- ++
      --
      -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
      -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
      --
      -- [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
      --   | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..],
      --     (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
      -- ]

myMouseBindings (XConfig {XMonad.modMask = modm}) =
  M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ( (modm, button1),
        ( \w ->
            focus w >> mouseMoveWindow w
              >> windows W.shiftMaster
        )
      ),
      -- mod-button2, Raise the window to the top of the stack
      ((modm, button2), (\w -> focus w >> windows W.shiftMaster)),
      -- mod-button3, Set the window to floating mode and resize by dragging
      ( (modm, button3),
        ( \w ->
            focus w >> mouseResizeWindow w
              >> windows W.shiftMaster
        )
      )
      -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled = Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2

    -- Percent of screen to increment by when resizing panes
    delta = 3 / 100

myManageHook :: Query (Endo WindowSet)
myManageHook =
  composeAll
    [ className =? "MPlayer" --> doFloat,
      className =? "Gimp" --> doFloat,
      className =? "spotify" --> doShift "3",
      className =? "Godot_Engine" --> doFloat,
      className =? "Protobuilder" --> doFloat,
      resource =? "desktop_window" --> doIgnore,
      resource =? "kdesktop" --> doIgnore
    ]

myEventHook :: Event -> X All
myEventHook = mempty

myLogHook :: X ()
myLogHook = return ()

myStartupHook = do
  spawnOnce "initialize-monitors"
  spawnOnce "emacs --daemon"
  spawnOnce "xsetroot -cursor_name left_ptr & "
  spawnOnce "setxkbmap -option caps:escape && notify-send 'Keybindings' 'Caps set to Escape'"
  -- spawnOnce "xrandr --output LDVS1 --mode 1366x768 --rotate normal"
  -- spawnOnce "xrandr --output LVDS1 --mode 1366x768 --pos 1920x312 --rotate normal --output VGA1 --primary --mode 1920x1080 --pos 0x0 --rotate normal"
  spawnOnce "random-wallpaper"
  spawnOnce "sxhkd &"
  spawnOnce "picim --experimental-backends"
  spawnOnce "udiskie &"
  spawnOnce "dunst &"
  spawnOnce "dropbox &"

main = do
  -- xmproc <- spawnPipe "xmobar -x 0 /home/junior/.config/xmobar/xmobar.config"
  -- xmproc <- spawnPipe "xmobar -x 1 /home/junior/.config/xmobar/xmobar.config"
  -- xmonad $ docks defaults
  -- xmonad =<< xmobar defaults
  -- h <- spawnPipe "xmobar /home/junior/.config/xmobar/xmobar.config"
  h <- spawnPipe "pick-xmobar-config"
  xmonad $
    docks
      def
        { -- simple stuff
          terminal = myTerminal,
          focusFollowsMouse = myFocusFollowsMouse,
          clickJustFocuses = myClickJustFocuses,
          borderWidth = myBorderWidth,
          modMask = myModMask,
          workspaces = myWorkspaces,
          normalBorderColor = myNormalBorderColor,
          focusedBorderColor = myFocusedBorderColor,
          -- key bindings
          keys = myKeys,
          mouseBindings = myMouseBindings,
          -- hooks, layouts
          layoutHook = myLayout,
          -- manageHook = manageDocks <+> myManageHook,
          manageHook = myManageHook,
          handleEventHook = myEventHook,
          logHook =
            dynamicLogWithPP $
              xmobarPP
                { ppOutput = hPutStrLn h
                },
          startupHook = myStartupHook
        }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help =
  unlines
    [ "The default modifier key is 'alt'. Default keybindings:",
      "",
      "-- launching and killing programs",
      "mod-Shift-Enter  Launch xterminal",
      "mod-p            Launch dmenu",
      "mod-Shift-p      Launch gmrun",
      "mod-Shift-c      Close/kill the focused window",
      "mod-Space        Rotate through the available layout algorithms",
      "mod-Shift-Space  Reset the layouts on the current workSpace to default",
      "mod-n            Resize/refresh viewed windows to the correct size",
      "",
      "-- move focus up or down the window stack",
      "mod-Tab        Move focus to the next window",
      "mod-Shift-Tab  Move focus to the previous window",
      "mod-j          Move focus to the next window",
      "mod-k          Move focus to the previous window",
      "mod-m          Move focus to the master window",
      "",
      "-- modifying the window order",
      "mod-Return   Swap the focused window and the master window",
      "mod-Shift-j  Swap the focused window with the next window",
      "mod-Shift-k  Swap the focused window with the previous window",
      "",
      "-- resizing the master/slave ratio",
      "mod-h  Shrink the master area",
      "mod-l  Expand the master area",
      "",
      "-- floating layer support",
      "mod-t  Push window back into tiling; unfloat and re-tile it",
      "",
      "-- increase or decrease number of windows in the master area",
      "mod-comma  (mod-,)   Increment the number of windows in the master area",
      "mod-period (mod-.)   Deincrement the number of windows in the master area",
      "",
      "-- quit, or restart",
      "mod-Shift-q  Quit xmonad",
      "mod-q        Restart xmonad",
      "mod-[1..9]   Switch to workSpace N",
      "",
      "-- Workspaces & screens",
      "mod-Shift-[1..9]   Move client to workspace N",
      "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
      "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
      "",
      "-- Mouse bindings: default actions bound to mouse events",
      "mod-button1  Set the window to floating mode and move by dragging",
      "mod-button2  Raise the window to the top of the stack",
      "mod-button3  Set the window to floating mode and resize by dragging"
    ]
