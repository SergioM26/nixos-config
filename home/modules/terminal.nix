{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jq
    socat
	zoxide
	fzf
	unzip
	unrar-wrapper
	zip
	# pearl
	# caligula
  ];
} 
