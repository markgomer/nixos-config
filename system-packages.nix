{ pkgs, ... }: {
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
      vim
      linuxKernel.packages.linux_6_6.cpupower
      intel-undervolt
      git
      btop
      alacritty
      xwayland
      gnome-software
  ];
}
