{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    # Development
    chromium
    firefox
    micro
    unstable.jetbrains.idea-ultimate
    unstable.obsidian
    spotify
    insomnia

    # Files
    feh
    libreoffice
    zathura
    xfce.thunar
    vlc

    # Communication
    unstable.discord
    slack

    # Others
    pfetch
    htop
    killall
  ];

  # Skip Discord updates
  home.file.discord-config = {
    target = ".config/discord/settings.json";
    text = ''{ "SKIP_HOST_UPDATE": true }'';
  };

  # Better cat
  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
      pager = "never";
    };
  };
  programs.nushell.extraConfig = ''
    alias cat = bat
  '';

  # Nix direnv
  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };
}