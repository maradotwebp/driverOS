{ inputs, outputs, ... }:
{
  # Custom Packages
  additions = final: prev: import ../pkgs {
    pkgs = final;
  };

  # Unstable NixOS Packages
  unstable = final: prev: {
    unstable = import inputs.unstable {
      system = prev.system;
      config.allowUnfree = true;
    };
  };
}