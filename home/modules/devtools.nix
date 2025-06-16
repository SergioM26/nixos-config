{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # IDEs y editores
    vim
    neovim
    vscode
    code-cursor
    qtcreator
 
    # Herramientas de desarrollo
    git
    gcc
    gdb
    cmake
    gnumake
    
    # Herramientas de sistema
    tree
    yazi
  ];
} 