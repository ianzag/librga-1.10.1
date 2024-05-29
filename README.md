# librga

RGA (Raster Graphic Acceleration Unit) is an independent 2D hardware accelerator that can be used to accelerate point/line drawing and perform common 2D graphics operations such as image scaling, rotation, bitBlt, alpha blending, etc. This repository code implements the RGA user space driver and provides a series of 2D graphics operation APIs.

**ATTENTION!** Originally librga was published in Rockchup GitHub repository at https://github.com/rockchip-linux/linux-rga. Due to some unknown reasons this repository was removed from Rockchip account. In order to preserve access to librga sources code this repository was created. Have fun!

## Version Description

**RGA API** Version: 1.10.1

## Applicable Chip Platforms

Rockchip RK3066 | RK3188 | RK2926 | RK2928 | RK3026 | RK3028 | RK3128 | Sofia3gr | RK3288 | RK3288w | RK3190 | RK1108 | RK3368 | RK3326 | RK3228 | RK3228H | RK3326 | RK1808 | RV1126 | RV1109 | RK3399 | RK3399pro | RK3566 | RK3568 | RK3588 | RK3326S | RV1106 | RV1103 | RK3528 | RK3562 | RK3576

## Directory description

├── **im2d_api**: RGA API related implementation and header files<br/>
├── **include**: RGA hardware related header files<br/>
├── **core**: RGA user space driver implementation<br/>
├── **docs**: FAQ and API documentation<br/>
├── **samples**: Sample code<br/>
├── **toolchains**: Sample toolchain configuration file<br/>
└── Other compilation related files<br/>

## Compilation instructions

### Android Source Project

Download the librga repository and copy it to the hardware/rockchip directory of the android source code project. After configuring the compilation environment, execute **mm** to compile. Depending on the Android version, Android.mk or Android.bp will be automatically selected as the compilation script.

```bash
$ mm -j16
```

### CMAKE

The sample code in this repository supports CMAKE compilation. You can quickly compile by modifying the toolchain_*.cmake file and the compilation script.

#### Toolchain modification

- **Android NDK (build for android)**

 ​ Refer to **toolchains/toolchain_android_ndk.cmake** in the librga source directory to modify the NDK path, Android version information, etc.

| Toolchain options | Description |
| ----------------------------------- | -------------------------------------------- |
| CMAKE_ANDROID_NDK | NDK compilation package path |
| CMAKE_SYSTEM_NAME | Platform name, default is Android |
| CMAKE_SYSTEM_VERSION | Android version |
| CMAKE_ANDROID_ARCH_ABI | Processor version |
| CMAKE_ANDROID_NDK_TOOLCHAIN_VERSION | Toolchain selection (clang/gcc) |
| CMAKE_ANDROID_STL_TYPE | NDK C++ library linking method (c++_static/c++_shared) |

- **Linux (buildroot/debian)**

 ​ Refer to **toolchains/toolchain_linux.cmake** in the librga source directory to modify the toolchain path and name.

| Toolchain options | Description |
| -------------- | ---------- |
| TOOLCHAIN_HOME | Toolchain directory |
| TOOLCHAIN_NAME | Toolchain name |

#### Compile script modification

​ Modify **cmake_*.sh** in the samples directory or the sample code directory that needs to be compiled, and specify the toolchain path.

| Compile options | Description |
| -------------- | ------------------------------------------------------------ |
| TOOLCHAIN_PATH | The absolute path of toolchain, that is, the absolute path of the toolchain_*.cmake file modified in the "Toolchain Modification" section |
| LIBRGA_PATH | The absolute path of librga.so to be linked, which defaults to the default packaging path when librga cmake is compiled |
| BUILD_DIR | The relative path where the compiled files are stored |

#### Execute the compilation script

- **Android NDK (build for android)**

```bash
$ chmod +x ./cmake_android.sh
$ ./cmake_android.sh
```

- **Linux (buildroot/debian)**

```bash
$ chmod +x ./cmake_linux.sh
$ ./cmake_linux.sh
```

### Meson

  This repository provides meson.build, and buildroot/debian supports meson compilation. For separate compilation, you can use the meson.sh script for configuration. You need to modify the install path specified in meson.sh and environment variables such as PATH. The cross directory contains the cross-compilation tool configuration file, which also needs to be modified to the corresponding cross-compilation tool path.

​ Perform the following operations to complete the compilation:

```bash
$ ./meson.sh
```

## Instructions

* **Header file reference**

  * C++ calls im2d api

    im2d_api/im2d.hpp

  * C calls im2d api

    im2d_api/im2d.h

* **Library file**

  librga.so

  librga.a

* **librga application development interface description document**

  [IM2D API description document [Chinese]](docs/Rockchip_Developer_Guide_RGA_CN.md)

  [IM2D API description document [English]](docs/Rockchip_Developer_Guide_RGA_EN.md)

* **RGA module FAQ document**

  [RGA_FAQ [Chinese]](docs/Rockchip_FAQ_RGA_CN.md)

  [RGA_FAQ [English]](docs/Rockchip_FAQ_RGA_EN.md)
