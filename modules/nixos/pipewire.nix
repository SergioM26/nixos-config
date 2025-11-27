{ config, pkgs, ... }:

{
  services.pulseaudio.enable = false;
  services.pipewire.audio.enable = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.wireplumber.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };
} 
