#Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/pipewire.nix
    ../../modules/nixos/webserver.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # System version
  system.stateVersion = "25.11";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Hardware
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Shell configuration
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  #environment.shells = with pkgs; [ zsh ];

  # Time and locale
  time.timeZone = "America/Monterrey";
  i18n.defaultLocale = "es_MX.UTF-8";
  services.xserver.xkb.layout = "latam";
  console.keyMap = "la-latin1";

  # Desktop environment
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;

  # User configuration
  users.users.samce = {
    isNormalUser = true;
    description = "samce";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Home Manager configuration
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "samce" = import ../../home/samce.nix;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };
  environment.pathsToLink = [ "/share/zsh" ];

  # System packages
  environment.systemPackages = with pkgs; [
    # Shell
    zsh
    starship
    
    # Desktop
    wofi
    hyprpaper
    waybar
    pavucontrol
    spotify
    discord
    qt5.full
    nwg-look
  ];
}
