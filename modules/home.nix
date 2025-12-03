{ pkgs, ... }:
{

  imports = [ ./home/git.nix ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    hello
  ];

  home.stateVersion = "25.11";

}
