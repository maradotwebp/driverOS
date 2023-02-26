{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "froehlichA";
    userEmail = "froehlich.alexander@protonmail.com";
    ignores = [
      ".direnv/" ".envrc"
    ];
  };
}