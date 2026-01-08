{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # enableBashCompletion = true;
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

    initContent = ''
         eval "$(direnv hook zsh)"
      export EDITOR=nvim
      eval "$(zoxide init zsh)"
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
