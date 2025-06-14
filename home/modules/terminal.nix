{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    btop
    fastfetch
  ];
} 