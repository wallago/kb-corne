{
  description = "Keyboard Corne";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    project-banner.url = "github:wallago/project-banner?dir=nix";
  };

  outputs = { nixpkgs, flake-utils, project-banner, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ freecad kicad ];
            shellHook = ''
              ${project-banner.packages.${system}.default}/bin/project-banner \
                --owner "wallago" \
                --logo " 󰖌 " \
                --product "corne" \
                --part "keyboard" \
                --code "WL25-KB-CO01" \
                --tips "3D model: freecad" \
                --tips "Electronic design: kidcad" \
            '';
          };
        };
      });
}
