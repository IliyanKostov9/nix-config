{ pkgs
, config
, lib
, ...
}:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      floating.modifier = "Mod4";
      fonts = {
        names = [ "0xProtoNerdFontMono-Regular" ];
        style = "Bold Semi-Condensed";
        size = 9.0;
      };
      keybindings =
        let
          mod = config.xsession.windowManager.i3.config.modifier;
          alt = "Mod1";
        in
        lib.mkOptionDefault {
          # Programs
          "${mod}+${alt}+l" = "exec ${pkgs.librewolf}/bin/librewolf";
          "${mod}+${alt}+c" = "exec ${pkgs.chromium}/bin/chromium";
          "${mod}+${alt}+e" = "exec ${pkgs.microsoft-edge}/bin/microsoft-edge";
          "${alt}+f" = "exec flameshot gui";
          "${alt}+n" = "exec normcap";
          "${alt}+v" = "exec --no-startup-id copyq show resize set width 300 px height 300 px";

          "${mod}+space" = "exec setxkbmap -layout us";
          "${mod}+b" = "exec setxkbmap -layout bg -variant phonetic";
          # PC
          "${mod}+Shift+Page_Down" = "exec shutdown -h now";
          "${mod}+Shift+End" = "exec reboot";
          "${mod}+Shift+Delete" = "exec i3-msg exit";
          "${mod}+Shift+b" = "exec blueman-manager";

          # Default i3 options
          "${mod}+Return" = "exec i3-sensible-terminal";
          "${mod}+Shift+q" = "kill";
          "${mod}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";

          # change focus
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          # alternatively, you can use the cursor keys:
          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          # move focused window
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          # alternatively, you can use the cursor keys:
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          # split in horizontal orientation
          "${mod}+z" = "split h";
          # split in vertical orientation
          "${mod}+v" = "split v";

          # enter fullscreen mode for the focused container
          "${mod}+f" = "fullscreen toggle";

          # change container layout (stacked, tabbed, toggle split)
          "${mod}+s" = "layout stacking";
          "${mod}+t" = "layout tabbed";
          "${mod}+e" = "layout toggle split";

          # toggle tiling / floating
          "${mod}+Shift+space" = "floating toggle";
          # change focus between tiling / floating windows
          # "${mod}+space" = "focus mode_toggle";
          # focus the parent container
          "${mod}+a" = "focus parent";

          # switch to workspace
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          # move focused container to workspace
          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          # reload the configuration file
          "${mod}+Shift+c" = "reload";
          # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
          "${mod}+Shift+r" = "restart";
          # exit i3 (logs you out of your X session)
          "${mod}+Shift+e" = "exec 'i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'";

          #
          # # resize window (you can also use the mouse for that)
          # mode "resize" {
          # # These bindings trigger as soon as you enter the resize mode
          #
          # # Pressing left will shrink the window’s width.
          # # Pressing right will grow the window’s width.
          # # Pressing up will shrink the window’s height.
          # # Pressing down will grow the window’s height.
          # bindsym h resize shrink width 10 px or 10 ppt
          # bindsym j resize grow height 10 px or 10 ppt
          # bindsym k resize shrink height 10 px or 10 ppt
          # bindsym l resize grow width 10 px or 10 ppt
          #
          # # same bindings, but for the arrow keys
          # bindsym Left resize shrink width 10 px or 10 ppt
          # bindsym Down resize grow height 10 px or 10 ppt
          # bindsym Up resize shrink height 10 px or 10 ppt
          # bindsym Right resize grow width 10 px or 10 ppt
          #
          # # back to normal: Enter or Escape or $mod+r
          # bindsym Return mode "default"
          # bindsym Escape mode "default"
          # bindsym $mod+r mode "default"
          # }
          #
          "${mod}+r" = "resize";
        };
      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
        }
      ];
    };
    extraConfig = ''
      default_border pixel 1
      for_window [class=".*terminator.*"] move to workspace 1
      for_window [class=".*chromium.*"] move to workspace 2
      for_window [class=".*librewolf.*"] move to workspace 3
      for_window [class=".*microsoft-edge.*"] move to workspace 4
      for_window [class="copyq"] floating enable
      for_window [class="blueman-manager"] floating enable
    
      exec --no-startup-id dex --autostart --environment i3
      exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork
      exec --no-startup-id nm-applet

      tiling_drag modifier titlebar
    '';
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          { block = "focused_window"; format = "$title.str(max_w:180)|Missing"; }
          {
            block = "music";
            format = "{$icon $combo $play |}";
            separator = " – ";
          }
          {
            block = "net";
            format = "$icon {$signal_strength SSID @$frequency|Wired connection} via $device ";
            interval = 5;
          }
          {
            block = "battery";
            interval = 30;
            format = "{percentage}% {time}";
          }
          { block = "backlight"; }
          {
            block = "bluetooth";
            mac = "CC:98:8B:D1:40:88";
            format = {
              full = "$icon $percentage";
              short = "";
            };
            click = [
              {
                button = "left";
                cmd = "blueman-adapters";
              }
            ];
          }
          {
            block = "sound";
            headphones_indicator = true;
            click = [
              {
                button = "left";
                cmd = "pavucontrol --tab=3";
              }
            ];
          }
          {
            block = "time";
            interval = 60;
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
          }
          {
            block = "keyboard_layout";
            driver = "sway";
            format = " ^icon_keyboard $layout ";
            mappings = {
              "English (US)" = "US";
              "Bulgarian (N/A)" = "BG";
            };
          }
          # {
          #   block = "tea_timer";
          #   done_cmd = "notify-send 'Timer Finished'";
          # }
        ];
        settings = {
          theme = {
            theme = "solarized-dark";
            overrides = {
              idle_bg = "#123456";
              idle_fg = "#abcdef";
            };
          };
        };
        icons = "awesome6";
        theme = "space-villain";
      };
    };
  };
}
