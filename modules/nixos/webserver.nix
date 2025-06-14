{ config, pkgs, ... }:

{
  # Web Server SaludUniversitaria
  networking.extraHosts = ''
    127.0.0.1 www.SaludUniversitaria.com SaludUniversitaria.com
  '';

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # Web server configuration
  services.httpd.enable = true;
  services.httpd.adminAddr = "webmaster@example.org";
  services.httpd.enablePHP = true;
  services.httpd.phpPackage = pkgs.php82;
  services.httpd.virtualHosts."www.SaludUniversitaria.com" = {
    serverAliases = [ "SaludUniversitaria.com" ];
    documentRoot = "/home/samce/GitHub/SaludUniversitaria";
    extraConfig = ''
      DirectoryIndex index.php index.html index.htm
      <Directory "/home/samce/GitHub/SaludUniversitaria">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
      </Directory>
    '';
  };

  # Database
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;
} 