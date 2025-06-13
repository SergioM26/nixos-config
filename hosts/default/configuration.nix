#Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      #../../modules/nixos/hyprland.nix
   #   ../../modules/nixos/pipewire.nix
   #   ../../modules/nixos/zsh.nix
   #   ../../modules/nixos/base.nix

      inputs.home-manager.nixosModules.home-manager

      #./home.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #Web Server SaludUniversitaria
  networking.extraHosts = ''
   127.0.0.1 www.SaludUniversitaria.com SaludUniversitaria.com
  '';

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.httpd.enable = true;
  services.httpd.adminAddr = "webmaster@example.org";
  services.httpd.enablePHP = true; # oof... not a great idea in my opinion
  services.httpd.phpPackage = pkgs.php82;
  services.httpd.virtualHosts."www.SaludUniversitaria.com" = {
    serverAliases = [ "SaludUniversitaria.com" ];
    documentRoot = "/home/samce/GitHub/SaludUniversitaria";
    extraConfig = ''
      DirectoryIndex index.php index.html index.htm
      <Directory "/home/samce/GitHub/SaludUniversitaria">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
      </Directory>
    '';
  };

/* Web Server localhost
  services.httpd.virtualHosts."localhost" = {
  documentRoot = "/home/samce/GitHub/SaludUniversitaria";
  serverAlias = "www.SaludUniversitaria.com";
  extraConfig = ''
    DirectoryIndex index.php index.html
      <Directory "/home/samce/GitHub/SaludUniversitaria">
         AllowOverride All
         Require all granted
      </Directory>
    '';
  }; 
*/

  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Monterrey";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_MX.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

/*
  home-manager.users.samce = {
    home.stateVersion = "23.11"; # Usa la versión con la que iniciaste o la actual
    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
      gtk.enable = true;
    };

 programs.git = {
    enable = true;
    userName = "SergioM26";
    userEmail = "sergioalejandro.moreno04@gmail.com";
  };
  };
*/
  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  services.xserver.displayManager.sddm = {
    enable = true;
    settings = {
      General = {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 24;
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    shellAliases = {
      # ...
    };
    setOptions = [
      "AUTO_CD"
    ];

    promptInit = ''source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme'';

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "dirhistory" "history" ];
    };
  };

  users.defaultUserShell = pkgs.zsh;
  system.userActivationScripts.zshrc = "touch .zshrc";
  environment.shells = with pkgs; [ zsh ];


 

  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  
  users.users.samce = {
    isNormalUser = true;
    description = "samce";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  
  

  home-manager = {
    #specialArgs = { inherit inputs; };
    users = {
      "samce" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    wget
    neofetch
    wofi
    hyprpaper
    hyprland
    kitty
    waybar
    firefox
    qtcreator
    cmake
    gcc
    kdePackages.dolphin
    qt5.full
    nwg-look
    chromium
    btop
    fastfetch
    yazi
    discord
    pavucontrol
    spotify
    gnumake
    zsh
    vscode
    zsh-powerlevel10k
    git
    tree
    gdb
    code-cursor
    jetbrains.idea-community
    nodejs_20
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  hardware.pulseaudio.enable = false; # Desactivamos pulseaudio tradicional

  # PipeWire recomendado
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # Opcional: útil si haces producción de audio
  };

  # Para control de volumen en GUI
  # Gestor recomendado para PipeWire

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html)

  system.stateVersion = "25.05"; # Did you read the comment?
}
