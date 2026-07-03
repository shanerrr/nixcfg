{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "shanerrr";
      user.email = "you@example.com";

      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
