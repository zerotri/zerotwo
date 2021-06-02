# zerotwo (02)

A testing ground for GadgetOS version 02.
Currently targeting the Pi CM4, tested on a Piunora beta board.

# Building

```bash
git clone https://github.com/zerotri/zerotwo
cd zerotwo
git submodule update --init --recursive
make raspberrypicm4_64_defconfig
time make # might as well log how long it takes
```

# Installing/Running

You'll need the raspberry pi usb boot tool to install. This requires libusb1.0 development files to build.
On Ubuntu:
```
sudo apt install libusb-1.0-0-dev
```

On Fedora
```
sudo dnf install libusb-devel.x86_64
```

Then run the following. Please note, you will need to replace `/dev/sdX` with whatever the drive identifier is for your RPI CM4
```
git clone https://github.com/raspberrypi/usbboot
make -C usbboot
sudo ./usbboot/rpiboot
sudo dd if=output-rpi4/images/sdcard.img of=/dev/sdX bs=4M
```
