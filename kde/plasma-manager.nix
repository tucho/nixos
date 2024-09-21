{ config, lib, pkgs, ... }:

{
  home-manager.users.marcel = {
    programs.plasma = {
      enable = true;
      overrideConfig = true;
      
      workspace = {
        clickItemTo = "open";
        lookAndFeel = "org.kde.breezedark.desktop";
        soundTheme = "ocean";
        wallpaper = "${config.home-manager.users.marcel.xdg.userDirs.pictures}/wallpapers/millennium-falcon.gif";
      };
      
      fonts = {
        general = {
          family = "Noto Sans";
          pointSize = 10;
        };

        fixedWidth = {
          family = "Hurmit Nerd Font";
          pointSize = 10;
        };

        small = {
          family = "Noto Sans";
          pointSize = 8;
        };

        toolbar = {
          family = "Noto Sans";
          pointSize = 10;
        };

        menu = {
          family = "Noto Sans";
          pointSize = 10;
        };

        windowTitle = {
          family = "Noto Sans";
          pointSize = 10;
        };
      };
      
      kwin = {
        virtualDesktops = {
          number = 4;
          rows = 1;
          names = [
            "Desktop 1"
            "Desktop 2"
            "Desktop 3"
            "Desktop 4"
          ];
        };
      };
      
      panels = [
        {
          screen = "all";
          alignment = "center";
          floating = true;
          height = 32;
          hiding = "none";
          lengthMode = "fill";
          location = "bottom";
          widgets = [
            "org.kde.plasma.kickoff"
            "org.kde.plasma.pager"
            "org.kde.plasma.icontasks"
            "org.kde.plasma.marginsseparator"
            "org.kde.plasma.systemtray"
            "org.kde.plasma.digitalclock"
            "org.kde.plasma.showdesktop"
          ];
        }
      ];
      
      input = {
        keyboard = {
          layouts = [
            {
              layout = "us";
            }
            {
              layout = "us";
              variant = "intl";
            }
          ];
        };
        
        mice = [
          {
            name = "Logitech M720 Triathlon";
            vendorId = "046d";
            productId = "405e";
            enable = true;
            naturalScroll = true;
          }
        ];
        
        touchpads = [
          {
            name = "DELL0949:00 04F3:30CB Touchpad";
            vendorId = "04f3";
            productId = "30cb";
            enable = true;
            disableWhileTyping = true;
            tapToClick = true;
            twoFingerTap = "rightClick";
            scrollMethod = "twoFingers";
            naturalScroll = true;
          }
        ];
      };
      
      powerdevil = {
        AC = {
          autoSuspend.action = "nothing";
          powerButtonAction = "showLogoutScreen";
          whenLaptopLidClosed = "hibernate";
          inhibitLidActionWhenExternalMonitorConnected = false;
          dimDisplay = {
            enable = true;
            idleTimeOut = 1800;
          };

          turnOffDisplay = {
            idleTimeout = 3600;
            idleTimeoutWhenLocked = 900;
          };
        };
        
        battery = {
          autoSuspend.action = "nothing";
          powerButtonAction = "showLogoutScreen";
          whenLaptopLidClosed = "hibernate";
          inhibitLidActionWhenExternalMonitorConnected = false;
          dimDisplay = {
            enable = true;
            idleTimeOut = 300;
          };
          turnOffDisplay = {
            idleTimeout = 600;
            idleTimeoutWhenLocked = 150;
          };
        };
        
        lowBattery = {
          autoSuspend.action = "nothing";
          powerButtonAction = "showLogoutScreen";
          whenLaptopLidClosed = "hibernate";
          inhibitLidActionWhenExternalMonitorConnected = false;
          dimDisplay = {
            enable = true;
            idleTimeOut = 300;
          };
          turnOffDisplay = {
            idleTimeout = 600;
            idleTimeoutWhenLocked = 150;
          };
        };
      };
      
      shortcuts = {
        kmix = {
          increase_volume = "Volume Up";
          decrease_volume = "Volume Down";
          mute = "Volume Mute";
          increase_volume_small = "Shift+Volume Up";
          decrease_volume_small = "Shift+Volume Down";
          increase_microphone_volume = "Alt+Volume Up";
          decrease_microphone_volume = "Alt+Volume Down";
          mic_mute = "Alt+Volume Mute";
        };

        kwin = {
          "Switch to Desktop 1" = "Meta+1";
          "Switch to Desktop 2" = "Meta+2";
          "Switch to Desktop 3" = "Meta+3";
          "Switch to Desktop 4" = "Meta+4";
          
          "Walk Through Windows" = "Alt+Tab";
          "Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
          
          "Window to Desktop 1" = "Meta+!";
          "Window to Desktop 2" = "Meta+@";
          "Window to Desktop 3" = "Meta+#";
          "Window to Desktop 4" = "Meta+$";
          
          "Window Close" = "Meta+Shift+Q";
          "Window Maximize" = "Meta+PgUp";
          "Window Minimize" = "Meta+PgDown";
          
          "Window Quick Tile Top" = "Meta+Up";
          "Window Quick Tile Bottom" = "Meta+Down";
          "Window Quick Tile Left" = "Meta+Left";
          "Window Quick Tile Right" = "Meta+Right";
          
          view_zoom_in = "Meta++";
          view_zoom_out = "Meta+-";
          view_actual_size = "Meta+0";
        };

        org_kde_powerdevil = {
          "Increase Screen Brightness" = "Monitor Brightness Up";
          "Decrease Screen Brightness" = "Monitor Brightness Down";
          "Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
          "Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
          
          "Increase Keyboard Brightness" = "Keyboard Brightness Up";
          "Decrease Keyboard Brightness" = "Keyboard Brightness Down";
          "Toggle Keyboard Backlight" = "Keyboard Light On/Off";
          
          powerProfile = "Meta+B";
        };

        plasmashell = {
          "activate application launcher" = "Meta";
        };

        "services/emacs.desktop"."_launch" = "Meta+Shift+E";
        "services/emacsclient.desktop"."_launch" = "Meta+E";
        "services/org.kde.dolphin.desktop"."_launch" = "Meta+D";
        "services/org.kde.kcalc.desktop"."_launch" = "Meta+C";
        "services/systemsettings.desktop"."_launch" = "Meta+S";
        yakuake.toggle-window-state = "Meta+Return";
      };
      
      configFile = {
        kded5rc = {
          Module-browserintegrationreminder.autoload = false;
          Module-device_automounter.autoload = false;
        };

        kdeglobals = {
          General = {
            TerminalApplication = "yakuake";
            TerminalService = "org.kde.yakuake.desktop";
            XftHintStyle = "hintslight";
            XftSubPixel = "none";
          };
        };

        kiorc = {
          Confirmations = {
            ConfirmDelete = true;
            ConfirmEmptyTrash = true;
          };
        };
        
        ksmserverrc = {
          General = {
            confirmLogout = false;
            loginMode = "emptySession";
          };
        };
        
        kwalletrc = {
          Wallet = {
            "First Use" = false;
          };
        };

        kwinrc = {
          Windows = {
            Placement = "Smart";
          };
          # the following configuration is not working
          # Xwayland = {
          #   Scale = 1.4;
          # };
        };
      };
    };
  };
}
