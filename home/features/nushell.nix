{
  programs.nushell.enable = true;
  programs.nushell.configFile.text = ''
    let-env config = {
      table_mode: thin
    }
  '';
}