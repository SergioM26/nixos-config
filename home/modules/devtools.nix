{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # IDEs y editores
    vim
    neovim
    vscode
    code-cursor
    jetbrains.idea-community
    
    # Herramientas de desarrollo
    git
    gcc
    gdb
    cmake
    gnumake
    nodejs_20
    
    # Herramientas de sistema
    tree
  ];
} 