#Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/pipewire.nix
    ../../modules/nixos/webserver.nix
    ../../modules/nixos/tlp.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # System version  
  system.stateVersion = "25.11";

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelModules = ["kvm-amd"];
	boot.extraModulePackages = with config.boot.kernelPackages; [
    rtw88
    v4l2loopback
  ];

  boot.extraModprobeConfig = ''
    options ideapad_laptop no_bt_rfkill=1
  '';

  # Commands After resume
  powerManagement.resumeCommands = "${pkgs.kmod}/bin/rmmod atkbd; ${pkgs.kmod}/bin/modprobe atkbd reset=1";

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Hardware
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;

  # Shell configuration
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Habilitar atftpd (servidor TFTP). Ajusta path si tu módulo usa tftpd o atftpd.
  # services.atftpd.enable = true;
  # services.atftpd.extraOptions = [ "--bind-address" "192.168.1.100" "--verbose=5" ];
  # services.atftpd.root = "/srv/tftpboot";

  # Time and locale
  time.timeZone = "America/Monterrey";
  i18n.defaultLocale = "es_MX.UTF-8";
  services.xserver.xkb.layout = "latam";
  console.keyMap = "la-latin1";

  # Desktop environment
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;
  services.udisks2.enable = true;
  services.flatpak.enable = true;

  # Virtualisation
  # virtualisation.libvirtd.enable = true;
  # programs.virt-manager.enable = true;
  #virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true; # opcional, si quieres USB 2/3

  # User configuration
  users.users.samce = {
    isNormalUser = true;
    description = "samce";
    extraGroups = [ "networkmanager" "wheel" /* "vboxusers" "kvm"*/ "libvirtd"];
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
    direnv
    tmux
    kitty
    btop
    fastfetch

    # Desktop
    wofi
    waybar
    pavucontrol
    vlc
	udiskie
    swww
    nwg-look
    playerctl
    brightnessctl
    wlogout
    grim
    slurp
    hyprlock
    hypridle
	wl-clipboard
	cliphist
	dmenu
	flatpak
  ];
}
