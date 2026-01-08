{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 10;
    #withUtempter = false;
    terminal = "screen-256color";
    shortcut = "x";
    clock24 = true;
    extraConfig = ''
      			set -g mouse on
      			set-option -g focus-events on
      # # Style
      # gray_light="#D8DEE9"
      # gray_medium="#ABB2BF"
      # gray_dark="#3B4252"
      # green_soft="#A3BE8C"
      # blue_muted="#81A1C1"
      # cyan_soft="#88C0D0"

      set -g status-position top
      set -g status-left-length 100
      set -g status-style "fg=#D8DEE9,bg=default"
      set -g status-left "#[fg=#A3BE8C,bold]  #S #[fg=#D8DEE9,nobold] | "
      set -g window-status-current-format "#[fg=#88C0D0,bold]● #[underscore]#I:#W"
      set -g window-status-format " #I:#W"
      set -g message-style "fg=#D8DEE9,bg=default"
      set -g mode-style "fg=#3B4252,bg=#81A1C1"
    '';
  };
}
