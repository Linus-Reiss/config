{ inputs, ... }:
{
        imports = [ inputs.nvf.nixosModules.default ];
        programs.nvf = {
                enable = true;
                settings.vim = {
                        autocomplete.nvim-cmp.enable = true;
                        lsp.enable = true;
                        languages = {
                                nix = {
                                        enable = true;
                                        extraDiagnostics.enable = true;
                                        format.enable = true;
                                        lsp.enable = true;
                                        treesitter.enable = true;
                                };
                                rust.enable = true;
                                html = {
                                        enable = true;
                                        extraDiagnostics.enable = true;
                                        format.enable = true;
                                        lsp.enable = true;
                                        treesitter.enable = true;
                                };
                                css = {
                                        enable = true;
                                        format.enable = true;
                                        lsp.enable = true;
                                        treesitter.enable = true;
                                };
                                ts = {
                                        enable = true;
                                        extraDiagnostics.enable = true;
                                        format.enable = true;
                                        lsp.enable = true;
                                        treesitter.enable = true;
                                };
                        };
                        formatter.conform-nvim = {
                                enable = true;
                                setupOpts.formatters_by_ft = { nix = [ "alejandra" ]; css = [ "prettier" ]; html = [ "prettier" ]; javascript = [ "prettier" ]; };
                        };
                };
        };
        environment.variables.EDITOR = "nvim";

}
