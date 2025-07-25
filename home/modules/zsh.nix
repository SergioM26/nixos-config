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

    initExtra = ''
      eval "$(direnv hook zsh)"
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
} 
