{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    chromium
    inputs.zen-browser.packages.${system}.default
    netflix
    xfce.thunar
  ];
}
