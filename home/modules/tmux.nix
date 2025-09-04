{ config, pkgs, ... }:

{
    programs.tmux = {
        enable = true;
        baseIndex = 1; 
		keyMode = "vi";
		escapeTime = 10;
		extraConfig = ''
			set -g mouse on
			set-option -g focus-events on
			set-option -g default-terminal "screen-256color"
		'';
    };
} 
