{ pkgs, lib, ... }:
let
  mkScript = eventName: lines: pkgs.writeScript "event-${eventName}" "${lines} &";
  toConfig = builtins.mapAttrs (name: value: mkScript name value);
in {
  options = with lib; {
    events = mkOption {
      type = types.attrsOf (types.separatedString " & \n");
      description = "Allows for dispatching to multiple receivers.";
      apply = toConfig;
    };
    scripts = mkOption {
      type = types.attrsOf types.str;
      description = "Allows for dispatching to one receiver.";
    };
  };
}