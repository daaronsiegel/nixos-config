{
    description = "the drake flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    };


    outputs = inputs@{
        self, nixpkgs, nixpkgs-stable, ...
    }: let
        inherit (self) outputs;
       in 
    {
    nixosConfigurations = {
        drakenix = nixpkgs.lib.nixosSystem {
            specialArgs = {
                inherit inputs outputs;
            };
            modules = [
                ./configuration.nix
                ./hardware-configuration.nix
            ];

            system = "x86_64-linux";
        };
        desktop = nixpkgs.lib.nixosSystem {
            specialArgs = {
                inherit inputs outputs;
            };
            modules = [
                ./configuration.nix
                ./hardware-configuration.nix #TO DO CHANGE THIS TO DESKTOP
            ];

            system = "x86_64-linux";
        };
    };


};
}
