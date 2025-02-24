{
  stdenvNoCC,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "SimSun";
  version = "0.1";
  src = ./.;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp -r $src/*.{ttf,otf} $out/share/fonts/truetype/
  '';

  meta = with lib; {
    description = "SimSun";
    homepage = "https://www.microsoft.com/zh-cn//";
    platforms = platforms.all;
  };
}