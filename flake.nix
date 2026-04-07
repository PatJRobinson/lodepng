{
  description = "A flake exposing a CMake-packaged fork of lodepng";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-linux" "aarch64-darwin"] (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      packages.default = pkgs.stdenv.mkDerivation {
        pname = "lodepng";
        version = "1.0.0";
        src = ./.;

        nativeBuildInputs = [
          pkgs.cmake
          pkgs.ninja
        ];

        cmakeFlags = [
          "-DCMAKE_BUILD_TYPE=Release"
        ];

        meta = with pkgs.lib; {
          description = "CMake-packaged fork of lodepng";
          homepage = "https://github.com/PatJRobinson/lodepng";
          license = licenses.zlib;
          platforms = platforms.linux;
        };
      };

      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.cmake
          pkgs.ninja
        ];
      };
    });
}
