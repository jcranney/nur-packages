{ 
  stdenv, rustPlatform, lib, pkgs
}:
rustPlatform.buildRustPackage rec {
  
  pname = "para-audit";
  version = "0.1.11";

  cargoLock.lockFile = "${src}/Cargo.lock";

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.openssl ];

  src = pkgs.fetchFromGitHub {
    owner = "jcranney";
    repo = pname;
    rev = version;
    hash = "sha256-tOfq/lkvdaTKzyQY0mQjbRLloE2udQAqgdIPYJBzfDg=";
    # hash = lib.fakeHash;
  };

  meta = with lib; {
    description = "A tool for auditing/organising/interacting with my para system.";
    homepage = https://github.com/jcranney/para-audit;
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}