#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:3206659441a8768a1df2f18fbec84fb3ce7f2f46; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:051a89d230f1afc4ad6ce4d163b59133edfd7b84 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:3206659441a8768a1df2f18fbec84fb3ce7f2f46 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
