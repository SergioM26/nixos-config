{pkgs, ...}: {
  home.packages = with pkgs; [
    # IDEs y editores
    vim
    #neovim
    vscode
    qtcreator
    # code-cursor
    # netbeans
    # swi-prolog

    # Herramientas de desarrollo
    git
    gcc
    gdb
    cmake
    gnumake
    cargo
    rustc
    nodejs
    temurin-jre-bin-17 # Java
    lua51Packages.lua
    kdePackages.qtdeclarative
    # ghc #Compilador de Haskell
    # cabal-install #Gestor de Haskell
    # ruby
    # go
    # laravel
    # mongodb
    # mongosh

    #Otras Herramientas
    # putty
    # postman
    # ciscoPacketTracer8
    # lunacy
    obsidian
    # obs-studio

    # Herramientas de sistema
    tree
    yazi
  ];
}
