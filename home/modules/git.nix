{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "SergioM26";
    userEmail = "sergioalejandro.moreno04@gmail.com";
    
    # Configuración adicional de Git
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      color.ui = true;
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
    
    # Alias útiles
    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      ci = "commit";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
      visual = "!gitk";
    };
  };
} 