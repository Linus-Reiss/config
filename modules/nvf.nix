{ inputs, ... }:
{

  imports = [ inputs.nvf.nixosModules.default ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      autocomplete.nvim-cmp.enable = true;
      lsp.enable = true;

      languages = {
        nix.enable = true;
        rust.enable = true;
      };
    };
  };

  environment.variables.EDITOR = "nvim";

}
