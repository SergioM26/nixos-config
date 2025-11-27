{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    socat
	zoxide
	fzf
	# pearl
	# caligula
  ];
} 
