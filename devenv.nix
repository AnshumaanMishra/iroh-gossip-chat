{ pkgs, ... }:

{
  packages = with pkgs; [
    git
    actionlint
    act
    jq
  ];

  languages.rust = {
    enable = true;
    channel = "stable";
    components = [ "rustc" "cargo" "clippy" "rustfmt" "rust-analyzer" ];
  };

  scripts.fmt-check.exec = ''
    cargo fmt --all -- --check
  '';

  scripts.test.exec = ''
    cargo test --all-targets --locked
  '';

  scripts.build.exec = ''
    cargo build --locked
  '';

  scripts.ci.exec = ''
    set -e
    cargo fmt --all -- --check
    cargo test --all-targets --locked
    cargo build --locked
  '';

  scripts.release.exec = ''
    cargo build --release --locked
  '';

  scripts.workflow-check.exec = ''
    actionlint .github/workflows/*.yml
  '';

  scripts.act-ci.exec = ''
    act push -W .github/workflows/ci.yml
  '';

  enterShell = ''
    echo "Rust development environment"
    rustc --version
    cargo --version
    echo "Commands: fmt-check, test, build, ci, release, workflow-check, act-ci"
  '';
}
