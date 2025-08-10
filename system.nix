{ inputs, config, lib, pkgs, modulesPath, pkgs-unstable, ... }:

{
  imports = [
    ./packages.nix
    ./nvidia.nix
    # ./virtualization.nix
    # ./gaming.nix
    # ./gnome.nix
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.xserver.enable = true;
  services.displayManager.ly.enable = true;

  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
      {
        from = 32768;
        to = 61000;
      }
    ];
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
      {
        from = 8008;
        to = 8009;
      }
    ];
    allowedTCPPorts = [ 5555 ];
    allowedUDPPorts = [ ];
  };

  environment.systemPackages = with pkgs; [
    home-manager
    kdePackages.kdeconnect-kde
    bibata-cursors
    hyprpanel
    playerctl
    clipman
    wl-clipboard
    alsa-utils
    grim
    mako
    slurp
    swappy
    wlinhibit
    hyprlock
    killall
    wpaperd
    networkmanagerapplet
    gdk-pixbuf

    btop
    nvtopPackages.nvidia
    bluez-tools
    wireplumber
    bluez
    blueman
    pciutils
    usbutils
    rofi-wayland
    hyprpolkitagent
    sshfs

    ripgrep
    fd
    tree-sitter
    nodejs
    lua
    lua51Packages.luarocks
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  security.polkit.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.space-mono
    nerd-fonts.fira-code
    nerd-fonts.d2coding
    #  (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "SpaceMono" "AnonymousPro" "D2Coding"]; })
  ];

  xdg.menus.enable = true;
  xdg.mime.enable = true;
  xdg.portal.enable = true;

  catppuccin.flavor = "mocha";
  catppuccin.enable = true;

  environment.variables = { XDG_MENU_PREFIX = "gnome-"; };

  environment.etc."fuse.conf".text = ''
    user_allow_other
  '';
}

