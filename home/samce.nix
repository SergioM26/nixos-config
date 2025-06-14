{ config, pkgs, ... }:

{
  imports = [
    ./modules/zsh.nix
    ./modules/devtools.nix
    ./modules/browser.nix
    ./modules/terminal.nix
    ./modules/git.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "samce";
  home.homeDirectory = "/home/samce";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Allow unfree packages in home-manager
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".config/hypr/hyprpaper.conf" = {
      text = ''
        preload = ~/nixos-config/wallpapers/toph-wallpaper.png
        wallpaper = ,~/nixos-config/wallpapers/toph-wallpaper.png
      '';
      force = true;
    };
    ".config/hypr/hyprland.conf" = {
      text = ''
        exec-once = hyprpaper
        # Otras configuraciones que ya tengas…
      '';
      force = true;
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/samce/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  # EDITOR = "emacs";

};
home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
      gtk.enable = true;
    };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
