{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    vim
    linuxKernel.packages.linux_6_6.cpupower
    undervolt
    git
    btop
    alacritty
    gnome-software
  ];

  programs.firefox.enable = true;

  programs.xwayland.enable = true;
}
