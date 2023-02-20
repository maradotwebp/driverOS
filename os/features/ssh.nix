{ pkgs, ... }:
{
  programs.ssh.startAgent = true;
  programs.ssh.askPassword = "${pkgs.ksshaskpass}/bin/ksshaskpass";
}