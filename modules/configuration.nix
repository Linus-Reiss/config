{
  inputs,
  lib,
  system,
  ...
}:
{

  imports = [ inputs.nixos-wsl.nixosModules.default ];

  system.stateVersion = "25.05";
  wsl.enable = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${system}";
}
