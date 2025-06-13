{ config, pkgs, ... }:

{

   # Habilita Waybar
  programs.waybar = {
    enable = true;

    # Configuración del estilo CSS
    style = ''
      * {
        border: none;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
      }
      #clock {
        color: #ffffff;
      }
    '';

    # Aquí va la configuración que antes estaría en config.json
    settings = [
      {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "backlight" "battery" "network" ];

        backlight = {
          device = "acpi_video0";
          format = "󰖨 {}%";
        };

        clock = {
          format = "{:%H:%M:%S}";
          tooltip-format = "{:%A, %d %B %Y}";
        };

        battery = {
          format = "{capacity}%";
          full-at = 99;
        };

        network = {
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = " {ifname}";
          format-disconnected = "⚠ Desconectado";
        };
      }
    ];
  };
}
  

