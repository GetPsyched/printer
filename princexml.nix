{ autoPatchelfHook, fetchurl, fontconfig, glibc, stdenv }:

stdenv.mkDerivation rec {
  pname = "princexml";
  version = "15.1";
  src = fetchurl {
    url = "https://www.princexml.com/download/prince-${version}-linux-generic-x86_64.tar.gz";
    hash = "sha256-rm0GeKPa8iDXBhW52GNcja09Qb+aYUtvFaxZUFHEOTw=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [
    fontconfig
    glibc
  ];

  installPhase = ''
    ./install.sh $out
    ln -sf /var/lib/prince/license.dat $out/lib/prince/license/license.dat
  '';
}
