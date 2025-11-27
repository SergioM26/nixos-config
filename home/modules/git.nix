{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "SergioM26";
        email = "sergioalejandro.moreno04@gmail.com";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
      color.ui = true;
      pull.rebase = true;
      push.autoSetupRemote = true;

      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        visual = "!gitk";
      };
    };
  };
}