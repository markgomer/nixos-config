{
  boot = {
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    };
    kernelModules = [ "nvidia" "nvidia_drm" "nvidia_modeset" "i915" "kvm-intel"];
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
      "nvidia.NVreg_RegistryDwords=\"PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3\""
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
    extraModulePackages = [ ];
  };
}
