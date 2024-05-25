{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { ... }@inputs: inputs.flake-utils.lib.eachDefaultSystem (system: 
    let
      pkgs = import inputs.nixpkgs { inherit system; };
    in {
      packages = rec {
        chatgpt = pkgs.callPackage ./package.nix { };
        default = chatgpt;
      };
      devShells = rec {
        go = pkgs.mkShell {
          nativeBuildInputs = [
          ];
          buildInputs = [
            pkgs.go
          ];
        };
        default = go;
      };
    }
  );
}