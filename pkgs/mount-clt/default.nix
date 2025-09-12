{ 
  stdenv, fetchFromGitHub, rustPlatform, lib, pkgs
}:
rustPlatform.buildRustPackage rec {
  
  pname = "mount-clt";
  version = "v0.1.0";

  cargoLock.lockFile = "${src}/Cargo.lock";

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.openssl ];

  src = fetchFromGitHub {
    owner = "jcranney";
    repo = pname;
    rev = version;
    hash = "sha256-Vq6CzsQbA9NRytGt+XJyT15z6JG4czOyyylKygkMb90=";
  };

  meta = with lib; {
    description = "A tool for controlling my telescope mount";
    homepage = https://github.com/jcranney/mount-clt;
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}