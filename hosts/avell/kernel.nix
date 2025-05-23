{ config, ... }: {
  boot = {
    initrd.kernelModules = [ ];
    kernelModules = [ "nvidia" "nvidia_drm" "nvidia_modeset" "i915" ];
    kernelParams = [
      "rhgb"
      "rw"
      "preempt=full"
      "rd.driver.blacklist=nouveau"
      "modprobe.blacklist=nouveau"
      "acpi_osi=Linux"
      "acpi_osi=\"!Windows 2015\""
      "mem_sleep_default=deep"
      "nvidia-drm.modeset=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=0"
      "nvidia.NVreg_TemporaryFilePath=/var/tmp"
      "nvidia.NVreg_DynamicPowerManagement=0x01"
      "bluetooth.disable_ertm=1"
      "i915.enable_guc=2"
      "i915.enable_fbc=1"
      "i915.enable_psr=2"
      "i8042.dumbkbd=1"
    ];
    blacklistedKernelModules = [ "nouveau" ];
    extraModprobeConfig = ''
      blacklist nouveau
    '';
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;   # required for many Steam games (32-bit Vulkan/OpenGL)
    };

    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;
      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
      # of just the bare essentials.
      powerManagement.enable = true;
      prime = {
        offload = {
          enable = true;
        };
        # integrated
        intelBusId = "PCI:00:02:0";
        # dedicated
        nvidiaBusId = "PCI:01:00:0";
      };
      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;
      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of 
      # supported GPUs is at: 
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
      # Only available from driver 515.43.04+
      open = false;
      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;
      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
    };
  };
}
