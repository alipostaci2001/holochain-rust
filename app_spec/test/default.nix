{ pkgs }:
let
  name-n3h = "hc-app-spec-test-n3h";

  script-n3h = pkgs.writeShellScriptBin name-n3h ''
  set -euo pipefail
  hc-cli-install
  hc-conductor-rust-install
  (cd app_spec && APP_SPEC_NETWORK_TYPE="n3h" ./build_and_test.sh);
  '';

  name-memory = "hc-app-spec-test-memory";

  script-memory = pkgs.writeShellScriptBin name-memory ''
  set -euo pipefail
  hc-cli-install
  hc-conductor-rust-install
  (cd app_spec && APP_SPEC_NETWORK_TYPE="memory" ./build_and_test.sh);
  '';
in
{
 buildInputs = [ script-n3h script-memory ];
}
