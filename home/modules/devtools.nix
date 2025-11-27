{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # IDEs y editores
    vim
    #neovim
    vscode
    code-cursor
    qtcreator
	code-cursor
	netbeans
	swi-prolog
 
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
	ruby
	go
	laravel

	#Otras Herramientas
	putty
	postman
#	ciscoPacketTracer8
	lunacy
    obsidian
    obs-studio

    # Herramientas de sistema
    tree
    yazi
  ];
} 
