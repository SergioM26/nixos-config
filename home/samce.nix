{ config, pkgs, system, inputs, ... }:
let
    system = "x86_64-linux";
in
{
  imports = [
    ./modules/zsh.nix
    ./modules/devtools.nix
    ./modules/browser.nix
    ./modules/terminal.nix
	./modules/tmux.nix
    ./modules/git.nix
	./modules/yazi.nix
	./modules/nvim.nix
  ];

  home.username = "samce";
  home.homeDirectory = "/home/samce";

  # Font configuration
  fonts.fontconfig.enable = true;

  # Home packages
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    spotify
    discord
	inputs.quickshell.packages.${system}.default
    # ddcutil
    # ddcui
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Allow unfree packages in home-manager
  # nixpkgs.config.allowUnfree = true;

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
    # ''
      # ".config/hypr/pywal.sh".text = ''
      #   #!/bin/bash
      #
      #   export WALLPAPER=$(find ~/nixos-config/wallpapers -type f | shuf -n 1)
      #
      #   # Iniciar swww si no está corriendo
      #   if ! pgrep -x swww > /dev/null; then
      #       swww-daemon &
      #       sleep 1
      #   fi
      #        
      #   # Aplicar el fondo
      #   swww img "$WALLPAPER"
      # '';
    
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
      size = 24; gtk.enable = true; };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
