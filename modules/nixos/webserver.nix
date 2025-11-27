{ config, pkgs,inputs, ... }:

{
  # Web Server SaludUniversitaria
  networking.extraHosts = ''
    127.0.0.1 www.SaludUniversitaria.com SaludUniversitaria.com
    127.0.0.1 www.makeitwork.com makeitwork.com
  '';

  networking.firewall.allowedTCPPorts = [ 80 443 3000 3001];

  # Web server configuration
  services.httpd.enable = true;
  services.httpd.adminAddr = "webmaster@example.org";
  services.httpd.enablePHP = true;
  services.httpd.phpPackage = pkgs.php82;
  services.httpd.virtualHosts = {
    # "www.SaludUniversitaria.com" = {
    #   serverAliases = [ "SaludUniversitaria.com" ];
    #   documentRoot = "/home/samce/Github/ProyectoPlantaIA";
    #   extraConfig = ''
    #     DirectoryIndex index.php index.html index.htm
    #     <Directory "/home/samce/GitHub/ProyectoPlantaIA">
    #       Options Indexes FollowSymLinks
    #       AllowOverride All
    #       Require all granted
    #     </Directory>
    #  '';
    # };
    localhost = {
      documentRoot = "/nix/store/...-media-manager-backend-0.1.0";
    };
  # "www.makeitwork.com" = {
  #   serverAliases = [ "makeitwork.com" ];
  #   documentRoot = "/home/samce/Github/makeitwork/public";
  #   extraConfig = ''
  #     DirectoryIndex index.php index.html index.htm
  #     <Directory "/home/samce/GitHub/makeitwork/public">
  #       Options Indexes FollowSymLinks
  #       AllowOverride All
  #       Require all granted
  #     </Directory>
  #   '';
  # };
};

  # Database
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;
} 
