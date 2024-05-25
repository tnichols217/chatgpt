{ lib
, buildGoModule
}:
buildGoModule rec {
  pname = "chatgpt";
  version = "1.3.4";

  src = ./.;

  vendorHash = null;

  subPackages = [ "cmd" ];

  postInstall = ''
    mkdir -p $out/bin
    mv $out/bin/cmd $out/bin/$pname
  '';

  meta = with lib; {
    description = "Interactive CLI for ChatGPT";
    homepage = "https://github.com/tnichols217/chatgpt";
    license = licenses.mit;
    mainProgram = "chatgpt";
    maintainers = with maintainers; [ Ruixi-rebirth ];
  };
}