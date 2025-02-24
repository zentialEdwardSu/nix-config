{
  stdenvNoCC,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "SimFamily";
  version = "0.1";
  src = ./.;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp -r $src/*.{ttf,otf} $out/share/fonts/truetype/
  '';

  meta = with lib; {
    description = "SimFamily";
    homepage = "https://www.microsoft.com/zh-cn//";
    platforms = platforms.all;
  };
}