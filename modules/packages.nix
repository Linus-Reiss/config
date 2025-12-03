{
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    tealdeer
    nixfmt-tree
  ];

}
