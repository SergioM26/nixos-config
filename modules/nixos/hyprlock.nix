{
  config,
  inputs,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;

    settings = {		

	general = {
		hide_cursor = false;
	};

	animations = {
		enabled = true;
		bezier = linear, 1, 1, 0, 0;
		animation = fadeIn, 1, 5, linear;
		animation = fadeOut, 1, 5, linear;
		animation = inputFieldDots, 1, 2, linear;
	};



	background = {
		monitor = ;
		path = /home/samce/Downloads/anbuWP.png;
		blur_passes = 3;
	};


	input-field = {
		monitor =;
		size = 30%, 10%;
		outline_thickness = 3;
		inner_color = "rgba(64, 64, 64, 0.0)"; # no fill

		outer_color = "rgba(0, 0, 0, 0.0)"; # no fill 
		check_color = "rgba(0, 0, 0, 0.0)"; # no fill
		fail_color = "rgba(200, 0, 0, 0.0)" # no fill

		font_color = rgb(143, 143, 143)
		fade_on_empty = false
		rounding = 15

		font_family = $font
		placeholder_text = 
		fail_text = $PAMFAIL

		# uncomment to use a letter instead of a dot to indicate the typed password
		# dots_text_format = *
		# dots_size = 0.4
		dots_spacing = 0.3

		# uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
		# hide_input = true

		position = 0,15%
		halign = center
		valign = bottom 
	}

# DATE
label {
  monitor =
  text = cmd[update:1000] echo "$(date +"%A, %B %d")"
  color = rgba(209, 207, 207, 0.75)
  font_size = 22
  font_family = JetBrains Mono
  position = 0, 10%
  halign = center
  valign = center
}

# TIME
label {
  monitor = 
  text = cmd[update:1000] echo "$(date +"%-H:%M")"
  color = rgba(209, 207, 207, 0.75)
  font_size = 95
  font_family = JetBrains Mono Extrabold
  position = 0, 20% 
  halign = center
  valign = center
}

    };
  };
}
