{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nvf = {
      url = "github:notashelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {

      devShells."${system}" = {
        "rust" = pkgs.mkShell {
          packages = with pkgs; [
            rustc
            cargo
          ];
          shellHook = ''
            echo "Rust env loaded succesfuly"
          '';
        };
        "haskell" = pkgs.mkShell {
          packages = with pkgs; [
            haskell.compiler.ghc98
          ];
          shellHook = ''
            echo "Haskell env loaded succesfuly"
          '';
        };

      };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
          };
          modules = [
            ./modules/bundle.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = true;
              home-manager.users.nixos = ./modules/home.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit system;

              };
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
    };
}
