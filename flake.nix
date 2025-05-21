{
  description = "Cereal flake, a kickstarter for my daily driver";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    arch = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${arch};
  in {
    packages.${arch}.default = pkgs.buildEnv {
      name = "my-cereal-flake";
      paths = with pkgs; [
        cargo
        docker
        docker-buildx
        neovim
        nixd
        yazi
      ];
    };

    devShells.${arch}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        neovim
      ];
    };
  };
}
