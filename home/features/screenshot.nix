{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "screenshot" = {
      name = "Screenshot";
      exec = "${pkgs.writeScript "screenshot" ''
        mkdir shots
        FILEOUT="shots/$(date +'%Y-%m-%d-%H%M%S_screenshot.png')"
        ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -d)" - | ${pkgs.swappy}/bin/swappy -f - -o "$FILEOUT"
      ''}";
    };
  };
}