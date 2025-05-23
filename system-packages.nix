{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alacritty
    wget
    git
    vim
    btop
    acpi
    acpid
    acpilight
    cpufrequtils
    linuxKernel.packages.linux_6_6.cpupower
    undervolt
    gnome-software
  ];

  programs.firefox.enable = true;

  programs.xwayland.enable = true;
}
