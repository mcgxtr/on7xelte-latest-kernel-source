# Değişkenler
export ARCH=arm64
export ANDROID_MAJOR_VERSION=o
export CROSS_COMPILE=~/Downloads/Toolchains-main/aarch64-linux-android-4.9/bin/aarch64-linux-android-

# Kernel Klasöründeki Hataları Otomatik Tamir Et (yylloc ve sdcardfs)
sed -i 's/YYLTYPE yylloc;/extern YYLTYPE yylloc;/g' scripts/dtc/dtc-lexer.lex.c_shipped 2>/dev/null || true
sed -i '/source "fs\/sdcardfs\/Kconfig"/d' fs/sdcardfs/Kconfig 2>/dev/null || true

# Derleme
make clean
make exynos7870-on7xelteswa_defconfig
make HOSTCFLAGS="-fcommon" -j$(nproc)
