{ inputs, outputs, ... }:
{
  additions = final: prev: import ../pkgs {
    pkgs = final;
  };
}