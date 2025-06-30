{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # IDEs y editores
    vim
    neovim
    #vscode
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
  programs.vscode.enable = true;
  programs.vscode.package = pkgs.vscode.fhsWithPackages (ps: with ps; [ gcc]);
} 