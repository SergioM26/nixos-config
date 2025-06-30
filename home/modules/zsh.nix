{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    #enableBashCompletion = true; 
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
    };

    autocd = true; 

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "history"
        "dirhistory"
      ];
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
} 