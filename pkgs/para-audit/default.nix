{ 
  stdenv, fetchFromGitHub, rustPlatform, lib, pkgs
}:
rustPlatform.buildRustPackage rec {
  
  pname = "para-audit";
  version = "0.1.10";

  cargoLock.lockFile = "${src}/Cargo.lock";

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.openssl ];

  src = fetchFromGitHub {
    owner = "jcranney";
    repo = pname;
    rev = version;
    hash = "sha256-8NyiiZivmXjx9GQY7biwKHZvfa4acOZJZcFHZqEWc7I=";
    # hash = lib.fakeHash;
  };

  meta = with lib; {
    description = "A tool for auditing/organising/interacting with my para system.";
    homepage = https://github.com/jcranney/para-audit;
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}