# AMD Ryzen Hackintosh RX550 Lexa

[![MacOS version](https://img.shields.io/badge/Ventura-13.2.1-informational.svg)](https://www.apple.com/macos) \
[![OpenCore version](https://img.shields.io/badge/OpenCore-0.9.0-informational.svg)](https://github.com/acidanthera/OpenCorePkg)\
[![GitHub](https://img.shields.io/github/license/sileshn/Ryzentosh?style=flat-square)](https://github.com/felipecaninnovaes/Ryzentosh-Rx550Lexa/blob/main/README.md)

## Important information
This EFI supports only MacOS versions Ventura(13.2) and higher. Your system will not boot if you use this on Mojave and High Sierra.

## Disclaimer
Use at your own risk. I take no responsiblity if your rig explodes. Create unique SMBios values for your rig. Don't copy ones shown in the config.plist!!!

## Specification

| Component        | Model                                              |
| ---------------- | ---------------------------------------------------|
| CPU              | AMD Ryzen™ 7 5700X                                 |
| MotherBoard      | Gigabyte GA-AB350M-DS3H V2                         |
| Wifi/Bluetooth   | USB Stick Orico Bluetooth 5.0                      |
| OS Disk OS Disk (NVMe)| SSD Husky Gaming M.2 NVME 256gb               |
| RAM              | 4x Husky Gaming 8GB 3200Mhz DDR4 CL19 32GB RAM     |
| GPU 1            | GTX 1660 SUPER                                     |
| GPU 2            | AMD Radeon RX550 Lexa 4gb  ( ? )                   |
| Cooler    	     | Cooler Master Hyper H412R - RR-H412-20PK-R2        |

## Working

* iCloud
* Bluetooth
* Ethernet
* Wifi
* iServices & drm
* Sleep

## Not Working ( only ones I have tried, there may be more )

* None apart from the known ones like sidecar afaik...

## Patches, Drivers & Kexts

* [AppleALC](https://github.com/acidanthera/AppleALC)
* [Kernel Patches](https://github.com/AMD-OSX/AMD_Vanilla) ( Newer universal patches introduced in [this](https://github.com/sileshn/Ryzentosh/commit/adcb87fa003a0e77afaded014984a00ecb07b775) commit requires you to update the core count of your processor. For more information on this subject, click [here](https://github.com/AMD-OSX/AMD_Vanilla#read-me-first).)
* [Lilu](https://github.com/acidanthera/Lilu)
* [BrcmPatchRAM](https://github.com/acidanthera/BrcmPatchRAM)
* [SMCAMDProcessor](https://github.com/trulyspinach/SMCAMDProcessor)
* [RadeonSensor](https://github.com/aluveitie/RadeonSensor)
* [OpenCore](https://github.com/acidanthera/OpenCorePkg)
* [RealtekRTL8111](https://github.com/Mieze/RTL8111_driver_for_OS_X)
* [RestrictEvents](https://github.com/acidanthera/RestrictEvents)
* [VirtualSMC](https://github.com/acidanthera/VirtualSMC) 
* [WhateverGreen](https://github.com/acidanthera/WhateverGreen)

## ACPI

* [SSDT-GPU-SPOOF](https://github.com/felipecaninnovaes/Ryzentosh-Rx550Lexa/blob/main/SSDT-GPU-SPOOF.dsl) ( The fix RX 550 Lexa video, click [Here](https://youtu.be/xb5yKRhOtp0).)

## Credits and links

* [OpenCore install guide](https://dortania.github.io/OpenCore-Install-Guide)
* [Hackintool](https://www.hackintosh-forum.de/forum/thread/38316-hackintool-ehemals-intel-fb-patcher)
* [OpenCore-Legacy-Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher)
* [OpenCore-Legacy-Patcher guide](https://dortania.github.io/OpenCore-Legacy-Patcher)
