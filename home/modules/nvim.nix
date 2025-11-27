{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
	# LSP
	lua-language-server
	nil
	bash-language-server
	hyprls
	vscode-langservers-extracted
	quick-lint-js
	clang-tools
	python3
	ripgrep
	typescript-language-server
	phpactor
	python313Packages.python-lsp-server

	# Neovim packages
	tree-sitter
	fd
	luajitPackages.luarocks
	alejandra
  ];


	programs.neovim = {
	  enable = true;
	  withNodeJs = true;
	  withPython3 = true;
	  withRuby = false;
	  extraLuaPackages = ps: with ps; [ jsregexp ];
	};
} 
