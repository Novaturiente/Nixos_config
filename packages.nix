{ config, lib, pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    duf
    pyright
    rsync
    stow
    python3
    gparted
    openssl
    lsof
    baobab
    yazi
    fastfetch
    gzip
    curl
    bat
    unzip
    unrar
    p7zip
    vlc
    jq
    fzf
    zoxide
    eza

    #Development
    cpio
    cmake
    gcc
    gnumake
    nmap
    file
    cargo
    rustc
    rust-analyzer
    rustfmt
    uv
  ];

  programs.adb.enable = true;

  # Gaming setup
  security.wrappers.fuse = {
    source = "${pkgs.fuse}/bin/fusermount";
    group = "users";
    owner = "nova";
    capabilities = "cap_sys_admin=eip";
  };
}
