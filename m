Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9C8195762
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 13:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbgC0Mot (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 08:44:49 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46542 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbgC0Mos (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2020 08:44:48 -0400
Received: by mail-pf1-f193.google.com with SMTP id q3so4428830pff.13
        for <linux-next@vger.kernel.org>; Fri, 27 Mar 2020 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tknk/aeFPPGseyHj0/8JvKYKQtZ/6r+p9Q/LKWlKMEo=;
        b=RihbPGWCFTGtGMgqx2a+/S76zwe3xPY5NWUk9rnllXoAhpnePPnm2k0Z2wjAJMzTH/
         QKVgrfFskiANtRi5rgpqz+vdKdE1M2dkAU8bXRHflU6u8LbwyKCv3C7TL9zTtvOfkXdO
         +OVyfWRSKNIcns/uNK4U6PtrSVqFaUV3QCvOXdlbeLFyPe0rXT+Rc90NMH+7CJBVsBrN
         Rinfrtk5XaUQ/PVYSPAoYtwGSLoQz6yhaVAtQDdT5NFBFYCnUGmv6fwM7lzdYgDZjnmj
         RNI+e2aoNVlaXuVAK58gRIobMXv+vxtsYZmWYGRenzKS8rEp9l29yTSCslcOFwItDaB+
         16Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tknk/aeFPPGseyHj0/8JvKYKQtZ/6r+p9Q/LKWlKMEo=;
        b=qMt35n7adB5yqYyTgoh7HZOqrRVLwqB0HdvsuptYrDw4aJMnKKLxU2a9Uvl396QNy7
         WzfbXqEpniMtdbUmmV6CjAI/2ETc5sF5DGXs0EfHCCL2Ur5IYDRyevFKXA/evspW8ukW
         VDpEH42Fnp6cd4hf12cgcpO/gXXhXN8tAJ0Bx699TNQEvtJyDNnT+qG3Z4rew+6fglSs
         Xa1ij69bStPKMCGUWPYxhQUbaw5I1LbAeyGrHimxowTcbdW042mmmIxv99bpqw9Ecjyt
         MouqO/YJb39wxK5ROJL1I2i3gQR96hfhsg4wWbl0csqwt53pZHGDyy9eEjzS60YUpDGz
         obKg==
X-Gm-Message-State: ANhLgQ069c4ZkusjtRO1o49hXq8LCjV3KfCDed7RZIoxxwUPYXCklOpj
        I5XTK5+VxrBit3NFK01eVk7E6xoTLhg=
X-Google-Smtp-Source: ADFU+vs+zu7UPZJP5ivAXwX+3eRmNYH7NNYmon/eUmsXOSRSMUAj6iZo7JehXrIMAmaP39gABAtn4Q==
X-Received: by 2002:a65:5a0e:: with SMTP id y14mr13626457pgs.90.1585313083520;
        Fri, 27 Mar 2020 05:44:43 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id fa16sm3723219pjb.39.2020.03.27.05.44.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 05:44:42 -0700 (PDT)
Message-ID: <5e7df53a.1c69fb81.32c88.0334@mx.google.com>
Date:   Fri, 27 Mar 2020 05:44:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200327
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 227 builds: 14 failed, 213 passed, 21 errors,
 606 warnings (next-20200327)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 227 builds: 14 failed, 213 passed, 21 errors, 606 warnin=
gs (next-20200327)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200327/

Tree: next
Branch: master
Git Describe: next-20200327
Git Commit: 975f7a88c64dfdfde014530730ba7a6f3141f773
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-9) FAIL
    allmodconfig: (gcc-8) FAIL

arm:
    allmodconfig: (clang-9) FAIL
    allmodconfig: (gcc-8) FAIL
    mmp2_defconfig: (gcc-8) FAIL
    omap2plus_defconfig: (gcc-8) FAIL
    pxa168_defconfig: (gcc-8) FAIL
    pxa910_defconfig: (gcc-8) FAIL
    qcom_defconfig: (gcc-8) FAIL
    vf610m4_defconfig: (gcc-8) FAIL

mips:
    mtx1_defconfig: (gcc-8) FAIL

riscv:
    allnoconfig: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL

x86_64:
    defconfig: (clang-9) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (gcc-8): 2 errors
    allmodconfig (clang-9): 2 errors
    defconfig (gcc-8): 29 warnings
    defconfig (clang-9): 29 warnings
    defconfig (gcc-8): 29 warnings
    defconfig (gcc-8): 29 warnings
    defconfig (gcc-8): 29 warnings

arm:
    allmodconfig (gcc-8): 1 error, 17 warnings
    allmodconfig (clang-9): 1 error, 17 warnings
    aspeed_g4_defconfig (gcc-8): 4 warnings
    aspeed_g5_defconfig (gcc-8): 4 warnings
    aspeed_g5_defconfig (clang-9): 4 warnings
    bcm2835_defconfig (gcc-8): 14 warnings
    cm_x300_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    mmp2_defconfig (gcc-8): 1 error
    multi_v5_defconfig (clang-9): 4 warnings
    multi_v5_defconfig (gcc-8): 4 warnings
    multi_v7_defconfig (gcc-8): 36 warnings
    multi_v7_defconfig (clang-9): 38 warnings
    multi_v7_defconfig (gcc-8): 36 warnings
    multi_v7_defconfig (gcc-8): 36 warnings
    multi_v7_defconfig (gcc-8): 36 warnings
    multi_v7_defconfig (gcc-8): 37 warnings
    omap2plus_defconfig (gcc-8): 1 error
    pxa168_defconfig (gcc-8): 1 error
    pxa910_defconfig (gcc-8): 1 error
    pxa_defconfig (gcc-8): 6 warnings
    qcom_defconfig (gcc-8): 1 error
    u8500_defconfig (gcc-8): 18 warnings
    vf610m4_defconfig (gcc-8): 4 errors, 5 warnings

i386:

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 3 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 2 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 2 warnings
    ci20_defconfig (gcc-8): 3 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    cu1000-neo_defconfig (gcc-8): 1 warning
    db1xxx_defconfig (gcc-8): 1 warning
    decstation_64_defconfig (gcc-8): 2 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 2 warnings
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 2 warnings
    ip27_defconfig (gcc-8): 2 warnings
    ip28_defconfig (gcc-8): 2 warnings
    ip32_defconfig (gcc-8): 2 warnings
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 2 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 2 warnings
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 2 warnings
    malta_kvm_guest_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 3 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    markeins_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 2 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 2 errors, 1 warning
    nlm_xlp_defconfig (gcc-8): 2 warnings
    nlm_xlr_defconfig (gcc-8): 2 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 3 warnings
    rt305x_defconfig (gcc-8): 2 warnings
    sb1250_swarm_defconfig (gcc-8): 2 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 2 warnings

riscv:
    allnoconfig (gcc-8): 1 error
    rv32_defconfig (gcc-8): 6 warnings
    tinyconfig (gcc-8): 1 error

x86_64:
    allmodconfig (clang-9): 4 warnings
    defconfig (clang-9): 2 errors
    tinyconfig (gcc-8): 1 warning

Errors summary:

    2    drivers/remoteproc/omap_remoteproc.c:174:2: error: too many argume=
nts to function =E2=80=98timer->timer_ops->set_load=E2=80=99
    2    arch/riscv/kernel/stacktrace.c:78:8: error: =E2=80=98sp_in_global=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98sp=
in_lock=E2=80=99?
    2    ERROR: modpost: "mtk_mmsys_ddp_disconnect" [drivers/gpu/drm/mediat=
ek/mediatek-drm.ko] undefined!
    2    ERROR: modpost: "mtk_mmsys_ddp_connect" [drivers/gpu/drm/mediatek/=
mediatek-drm.ko] undefined!
    2    /mnt/resource/workspace/workspace/kernel-build@7/linux/build/../dr=
ivers/clk/mmp/clk.c:192: undefined reference to `mmp_clk_register_pll'
    1    drivers/remoteproc/omap_remoteproc.c:174:44: error: too many argum=
ents to function call, expected 2, have 3
    1    drivers/clocksource/timer-vf-pit.c:194: error: unterminated argume=
nt list invoking macro "BUG_ON"
    1    drivers/clocksource/timer-vf-pit.c:131:8: error: expected =E2=80=
=98;=E2=80=99 at end of input
    1    drivers/clocksource/timer-vf-pit.c:131:2: error: =E2=80=98BUG_ON=
=E2=80=99 undeclared (first use in this function)
    1    drivers/clocksource/timer-vf-pit.c:131:2: error: expected declarat=
ion or statement at end of input
    1    clang: error: assembler command failed with exit code 1 (use -v to=
 see invocation)
    1    ERROR: modpost: "sysrq_toggle_support" [drivers/tty/serial/serial_=
core.ko] undefined!
    1    ERROR: modpost: "sysrq_mask" [drivers/tty/serial/serial_core.ko] u=
ndefined!
    1    ERROR: modpost: "rd_full" [drivers/gpu/drm/msm/msm.ko] undefined!
    1    /tmp/cpudeadline-de66c1.s:76: Error: `%ecx' not allowed with `orb'
    1    /home/buildslave/workspace/workspace/kernel-build@7/linux/build/..=
/drivers/clk/mmp/clk.c:192: undefined reference to `mmp_clk_register_pll'

Warnings summary:

    125  <stdin>:1520:2: warning: #warning syscall process_madvise not impl=
emented [-Wcpp]
    98   arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_fo=
rmat): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #addre=
ss-cells (2) differs from /soc (1)
    80   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (=
dma_ranges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" p=
roperty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, chil=
d #address-cells =3D=3D 2, #size-cells =3D=3D 1)
    25   scripts/dtc/include-prefixes/arm/bcm2835-rpi.dtsi:18.4-15: Warning=
 (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property=
 but its #address-cells (2) differs from /soc (1)
    15   arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #size-cells (1) differs from / (2)
    15   arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #address-cells (1) differs from / (2)
    14   arch/arm/boot/dts/ste-href-stuib.dtsi:205.6-16: Warning (reg_forma=
t): /soc/mcde@a0350000/dsi@a0351000/panel:reg: property has invalid length =
(4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    14   arch/arm/boot/dts/ste-href-stuib.dtsi:203.11-208.7: Warning (avoid=
_default_addr_size): /soc/mcde@a0350000/dsi@a0351000/panel: Relying on defa=
ult #size-cells value
    14   arch/arm/boot/dts/ste-href-stuib.dtsi:203.11-208.7: Warning (avoid=
_default_addr_size): /soc/mcde@a0350000/dsi@a0351000/panel: Relying on defa=
ult #address-cells value
    11   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    11   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    11   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    11   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    8    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    7    arch/arm/boot/dts/ste-ux500-samsung-skomer.dts:377.6-16: Warning (=
reg_format): /soc/mcde@a0350000/dsi@a0351000/panel:reg: property has invali=
d length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    7    arch/arm/boot/dts/ste-ux500-samsung-skomer.dts:374.11-387.7: Warni=
ng (avoid_default_addr_size): /soc/mcde@a0350000/dsi@a0351000/panel: Relyin=
g on default #size-cells value
    7    arch/arm/boot/dts/ste-ux500-samsung-skomer.dts:374.11-387.7: Warni=
ng (avoid_default_addr_size): /soc/mcde@a0350000/dsi@a0351000/panel: Relyin=
g on default #address-cells value
    7    arch/arm/boot/dts/ste-ux500-samsung-skomer.dtb: Warning (spi_bus_r=
eg): Failed prerequisite 'reg_format'
    7    arch/arm/boot/dts/ste-ux500-samsung-skomer.dtb: Warning (pci_devic=
e_bus_num): Failed prerequisite 'reg_format'
    7    arch/arm/boot/dts/ste-ux500-samsung-skomer.dtb: Warning (i2c_bus_r=
eg): Failed prerequisite 'reg_format'
    7    arch/arm/boot/dts/ste-hrefv60plus-stuib.dtb: Warning (spi_bus_reg)=
: Failed prerequisite 'reg_format'
    7    arch/arm/boot/dts/ste-hrefv60plus-stuib.dtb: Warning (pci_device_b=
us_num): Failed prerequisite 'reg_format'
    7    arch/arm/boot/dts/ste-hrefv60plus-stuib.dtb: Warning (i2c_bus_reg)=
: Failed prerequisite 'reg_format'
    7    arch/arm/boot/dts/ste-hrefprev60-stuib.dtb: Warning (spi_bus_reg):=
 Failed prerequisite 'reg_format'
    7    arch/arm/boot/dts/ste-hrefprev60-stuib.dtb: Warning (pci_device_bu=
s_num): Failed prerequisite 'reg_format'
    7    arch/arm/boot/dts/ste-hrefprev60-stuib.dtb: Warning (i2c_bus_reg):=
 Failed prerequisite 'reg_format'
    6    1 warning generated.
    5    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_range=
s_format): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells=
 (1) differs from / (2)
    5    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_range=
s_format): /soc:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (1) differs from / (2)
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    2    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    #warning This code requires at least version 4.6 of GCC
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/codecs/cros_ec_codec.c:776:12: warning: stack frame size=
 of 1152 bytes in function 'wov_hotword_model_put' [-Wframe-larger-than=3D]
    1    security/integrity/ima/ima_crypto.c:512:5: warning: stack frame si=
ze of 1152 bytes in function 'ima_calc_field_array_hash' [-Wframe-larger-th=
an=3D]
    1    net/sched/cls_flower.c:331:1: warning: the frame size of 1032 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lu=E2=
=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but ar=
gument 2 has type =E2=80=98unsigned int=E2=80=99 [-Wformat=3D]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5648 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3014:6:=
 warning: stack frame size of 1376 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    1    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame s=
ize of 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=
=3D]
    1    drivers/crypto/inside-secure/safexcel_cipher.c:404:12: warning: st=
ack frame size of 1136 bytes in function 'safexcel_aead_setkey' [-Wframe-la=
rger-than=3D]
    1    drivers/clocksource/timer-vf-pit.c:97:20: warning: =E2=80=98pit_ti=
mer_interrupt=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/clocksource/timer-vf-pit.c:56:19: warning: =E2=80=98pit_cl=
ocksource_init=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/clocksource/timer-vf-pit.c:131:2: warning: no return state=
ment in function returning non-void [-Wreturn-type]
    1    drivers/clocksource/timer-vf-pit.c:126:19: warning: =E2=80=98pit_c=
lockevent_init=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/clocksource/timer-vf-pit.c:117:34: warning: =E2=80=98clock=
event_pit=E2=80=99 defined but not used [-Wunused-variable]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0=
x1fa: call to memset() with UACCESS enabled
    1    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1=
f8: call to memset() with UACCESS enabled
    1    arch/mips/configs/ci20_defconfig:178:warning: override: reassignin=
g to symbol LEDS_TRIGGER_ONESHOT
    1    2 warnings generated.
    1    /tmp/test-arm-3e6297.s:18788: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-3e6297.s:18713: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/ccFUnozp.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccFUnozp.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1164:warning: override: UNWINDER_GUESS changes choice state
    1    ...mm/kasan/common.o: warning: objtool: kasan_report()+0x87: call =
to __stack_chk_fail() with UACCESS enabled
    1    ........arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_=
rt_frame()+0x1ef: call to memset() with UACCESS enabled

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x39dc): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()
    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x3684): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()

---
For more info write to <info@kernelci.org>
