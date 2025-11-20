let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/98ff3f9af2684f6136c24beef08f5e2033fc5389.tar.gz";
    sha256 = "sha256-/YdfibIrnqXAL8p5kqCU345mzpHoOtuVIkMiI2pF4Dc=";
  };
  pkgs = import nixpkgs { config = {}; overlays = []; };

  gems = pkgs.bundlerEnv {
    ruby = pkgs.ruby;
    name = "jekyll-pages-env";
    gemdir = ./.;
  };

  in
  pkgs.mkShell {
    buildInputs = [
      gems
      pkgs.bundix
      pkgs.bundler
      pkgs.git
      pkgs.gnumake
      pkgs.pkg-config
      pkgs.zlib
      pkgs.libffi
      pkgs.openssl
      pkgs.libyaml
      pkgs.libxml2
      pkgs.libxslt
      pkgs.imagemagick
    ];
  }
