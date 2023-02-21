{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Development
    chromium
    firefox
    micro
    jetbrains.idea-ultimate
    obsidian

    # Files
    feh
    libreoffice
    zathura
    xfce.thunar
    vlc

    # Communication
    discord
    slack

    # Others
    pfetch
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