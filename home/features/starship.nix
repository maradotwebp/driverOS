{ lib, ... }:
{
  programs.starship.enable = true;
  programs.starship.enableNushellIntegration = true;
  programs.starship.settings = {
    add_newline = false;
    format = lib.concatStrings [
      "$character"
      "$username"
      "$directory"
    ];
    right_format = lib.concatStrings [
      "$nix_shell"
      "$git_branch"
      "$git_state"
      "$git_status"
    ];
    character = {
      success_symbol = "[󱖳](white)";
      error_symbol = "[󱖳](bold red)";
    };
    nix_shell = {
      format = "via [❄️](bold blue) ";
    };
  };
}