{ lib, osConfig, ... }:
{
  programs.starship.enable = true;
  programs.starship.enableNushellIntegration = true;
  programs.starship.settings = with osConfig.theme.colors; {
    add_newline = false;
    format = lib.concatStrings [
      "$directory"
      "$git_branch"
      "$nix_shell"
      "$character"
    ];
    directory = {
      format = "[]($style)[ ](bg:${zinc."600".hex} fg:#ECD3A0)[$path](bg:${zinc."600".hex} fg:${zinc."200".hex})[ ]($style)";
      style = "bg:none fg:${zinc."600".hex}";
    };
    character = {
      success_symbol = "[](green)";
      error_symbol = "[󱖳](red)";
    };
    git_branch = {
      format = "[]($style)[[󰘬](bg:${zinc."600".hex} fg:${zinc."400".hex}) $branch](bg:${zinc."600".hex} fg:${zinc."200".hex})[ ]($style)";
      style = "bg:none fg:${zinc."600".hex}";
      truncation_length = 10;
    };
    nix_shell = {
      format = "[]($style)[❄️](bg:${zinc."600".hex} fg:${cyan."300".hex})[ ]($style)";
      style = "bg:none fg:${zinc."600".hex}";
    };
  };
}