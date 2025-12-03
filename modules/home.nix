{ pkgs, ... }:
{

  programs.git = {
    enable = true;
    userName = "Linus-Reiss";
    userEmail = "linus.reiss@ict-campus.net";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    hello
  ];
  home.stateVersion = "25.11";

}
