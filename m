Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC6A2261AE
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 16:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgGTONF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 10:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgGTONE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 10:13:04 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FA9C061794
        for <linux-next@vger.kernel.org>; Mon, 20 Jul 2020 07:13:04 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id k1so539164pjt.5
        for <linux-next@vger.kernel.org>; Mon, 20 Jul 2020 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MWeZm81e7N/q2MuVBTNVMR4Wsq7+edObj0i8MAHJpWg=;
        b=xh/oAFhVTwk0MNcXSHlwpNS2nfRVjyK9BA8RyjyawlvpYdj5MXWCPlC6z8ukfyuv9Y
         4zCB+NmhNURSxqH2QoHP4EILffzftEmNpO6ASruMHVPfDvjcF5SSTYpAJnT6HksT3Nba
         KyUzudH4kO5BDxQrpDmjV+orxRDCZ0dn3XTcroZz3D6YymBlbjBSAy/LapTkPczFLE61
         iK4PJ4o2+sW4nn8XCC8ma/NnEMLkpLjiFPOsccHBFrfL0o5HjlfV2zAZHgN17r5X+7Gc
         uAAZ7ZzlVu9G3W3R29+e2oKRa2jyvoKsLa0VKPGm+PxJexEKfnpDMP01rcSHGUanXjea
         wsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MWeZm81e7N/q2MuVBTNVMR4Wsq7+edObj0i8MAHJpWg=;
        b=nbu05dWmcuyJ7CI1Qdt6MTiFGvQwH2AllXt7pLdHhqsa18ojFeE01zT3gWLcj6vi1r
         5U4r+MHITlgznTV7V2mG7HeJxBVO0HWJj3QHYBnVRT8/SWv/DMjbq4cw9+a64nRcAkkk
         hZq2glcW5Zj1qYdnIFcYnL96xP1nRTM7WmrZZThKkYGyO2z+M9a4yy+YjTh1Gy3iwOot
         oJFWHVeHo/jkcGTO3Dqe4aGKNxL9+nBlzeCMkFTP5UuqIzEX223pElXZfUkvHrkiMoPs
         v+ziZAfGcESLOImoa6xpmvEpKNJdUsFqMdIZdY7eXcNhVyE7J3Pwt0Wr0F6j1cP5vj52
         2SJg==
X-Gm-Message-State: AOAM5316cpX/jkKCZUUBlplFq8lLZr8tobSFuKdWkH+3OWAl1XA9j1J5
        VbLR4N9KErlORUYMJ1em45I1eJI7ZOw=
X-Google-Smtp-Source: ABdhPJyi0nWWiKgpESojuU0lEvEaywNcFoP2IAYg3mJ1SU1mYkCs9Y8fBlOp/F0OR7QlESxAVxPj8g==
X-Received: by 2002:a17:902:ff0c:: with SMTP id f12mr18615735plj.254.1595254379860;
        Mon, 20 Jul 2020 07:12:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e5sm12375265pjy.26.2020.07.20.07.12.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 07:12:57 -0700 (PDT)
Message-ID: <5f15a669.1c69fb81.f4cd0.aa4b@mx.google.com>
Date:   Mon, 20 Jul 2020 07:12:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200720
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 150 builds: 7 failed, 143 passed, 12 errors,
 1936 warnings (next-20200720)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 150 builds: 7 failed, 143 passed, 12 errors, 1936 warnin=
gs (next-20200720)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200720/

Tree: next
Branch: master
Git Describe: next-20200720
Git Commit: ab8be66e724ecf4bffb2895c9c91bbd44fa687c7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 6 unique architectures

Build Failures Detected:

arm64:
    defconfig: (clang-9) FAIL
    allmodconfig: (gcc-8) FAIL

arm:
    allmodconfig: (clang-9) FAIL
    multi_v7_defconfig: (clang-9) FAIL
    multi_v7_defconfig+kselftest: (gcc-8) FAIL

mips:
    ip22_defconfig: (gcc-8) FAIL

x86_64:
    x86_64_defconfig+kselftest: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    hsdk_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (gcc-8): 1 error
    defconfig (clang-9): 1 error
    defconfig (gcc-8): 8 warnings
    defconfig (clang-10): 1856 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 8 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 8 warnings
    defconfig+kselftest (gcc-8): 8 warnings

arm:
    allmodconfig (clang-9): 1 error, 24 warnings
    allmodconfig (gcc-8): 6 warnings
    aspeed_g4_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (clang-9): 1 error
    multi_v7_defconfig+kselftest (gcc-8): 1 error
    omap2plus_defconfig (gcc-8): 1 warning

mips:
    decstation_64_defconfig (gcc-8): 1 warning
    gcw0_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 5 errors
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    mtx1_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    rs90_defconfig (gcc-8): 1 warning

riscv:
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    x86_64_defconfig+kselftest (gcc-8): 2 errors, 1 warning

Errors summary:

    2    include/linux/rculist.h:727:30: error: left-hand operand of comma =
expression has no effect [-Werror=3Dunused-value]
    1    ip6_vti.c:(.text+0x1b74): undefined reference to `xfrm6_tunnel_spi=
_lookup'
    1    drivers/video/console/newport_con.c:598:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    drivers/video/console/newport_con.c:594:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    drivers/video/console/newport_con.c:370:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    drivers/video/console/newport_con.c:368:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    drivers/video/console/newport_con.c:365:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    ERROR: modpost: "__cpu_logical_map" [drivers/cpufreq/tegra194-cpuf=
req.ko] undefined!
    1    ERROR: modpost: "__compiletime_assert_610" [drivers/gpu/drm/vc4/vc=
4.ko] undefined!
    1    ERROR: modpost: "__compiletime_assert_531" [drivers/gpu/drm/vc4/vc=
4.ko] undefined!
    1    ERROR: modpost: "__compiletime_assert_529" [drivers/gpu/drm/vc4/vc=
4.ko] undefined!

Warnings summary:

    84   aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    15   arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #size-cells (1) differs from / (2)
    15   arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #address-cells (1) differs from / (2)
    10   aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    8    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    8    1 warning generated.
    5    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_range=
s_format): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells=
 (1) differs from / (2)
    5    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_range=
s_format): /soc:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (1) differs from / (2)
    4    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/li=
b/raid6/raid6_pq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ipa/ipa.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut2=
24.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774e1-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_tra=
ce.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exy=
nos-arm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-s=
ys.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-p=
eri.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-m=
io.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallba=
ck_table.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.as=
n1.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-=
ctype.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    3    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/wireless/cfg80211.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    3    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/msm/msm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    3    aarch64-linux-gnu-ld: warning: lib/raid6/raid6_pq.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    3    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    include/linux/compiler_attributes.h:214:41: warning: statement wil=
l never be executed [-Wswitch-unreachable]
    2    drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warning: cast fr=
om pointer to integer of different size [-Wpointer-to-int-cast]
    2    drivers/gpu/drm/omapdrm/omap_connector.c:92:9: warning: braces aro=
und scalar initializer
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/hda/snd-hda-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/mac80211/mac80211.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/ath/ath10k/ath10k_snoc.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/tuner-types.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    2    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/vc4/vc4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/tegra/tegra-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    2    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/lima/lima.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    2    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-objcopy: warning: vmlinux: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-nm: warning: vmlinux: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms1: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-ld: warning: net/wireless/cfg80211.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    WARNING: unmet direct dependencies detected for CLK_HSDK
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    #warning This code requires at least version 4.6 of GCC
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
    1    warning: sound/soc/meson/snd-soc-meson-axg-tdm-formatter.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: sound/soc/codecs/snd-soc-wcd934x.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    warning: sound/soc/codecs/snd-soc-spdif-rx.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: sound/soc/codecs/snd-soc-rl6231.mod.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    1    warning: sound/soc/codecs/snd-soc-pcm3168a.mod.oaarch64-linux-gnu-=
ld: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: net/qrtr/qrtr-tun.mod.o: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: net/dsa/tag_ocelot.mod.o: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    warning: net/bluetooth/hidp/hidp.mod.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: lib/crypto/libarc4.mod.o: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    warning: fs/nfs/flexfilelayout/nfs_layout_flexfiles.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: fs/fuse/cuse.mod.o: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    warning: drivers/usb/typec/typec.mod.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: drivers/usb/typec/tcpm/tcpm.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    warning: drivers/spi/spi-geni-qcom.mod.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: drivers/spi/spi-bitbang.mod.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: drivers/soc/qcom/rmtfs_mem.mod.o: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: drivers/reset/reset-meson-audio-arb.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/regulator/vctrl-regulator.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/pwm/pwm-cros-ec.mod.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: drivers/phy/tegra/phy-tegra194-p2u.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/phy/renesas/phy-rcar-gen3-usb3.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/pci/controller/pcie-brcmstb.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/net/wireless/ath/ath10k/ath10k_snoc.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/net/usb/cdc_ether.mod.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: drivers/mfd/exynos-lpass.mod.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: drivers/media/v4l2-core/v4l2-fwnode.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/media/rc/keymaps/rc-twinhan1027.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/media/rc/keymaps/rc-real-audio-220-32-keys.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/media/rc/keymaps/rc-pixelview.mod.o: unsupported =
GNU_PROPERTY_TYPE (aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/=
rc-pv951.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/media/rc/keymaps/rc-astrometa-t2hybrid.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/media/platform/qcom/camss/qcom-camss.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/gpu/drm/ttm/ttm.mod.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: drivers/gpu/drm/panel/panel-truly-nt35597.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/gpu/drm/drm_kms_helper.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/gpu/drm/drm.o: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    warning: drivers/gpu/drm/drm.mod.o: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: drivers/gpu/drm/bridge/thc63lvd1024.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/gpu/drm/bridge/sii902x.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/dma/sun6i-dma.mod.o: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: drivers/cpufreq/cppc_cpufreq.mod.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/clk/qcom/camcc-sdm845.mod.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: drivers/bluetooth/btrtl.mod.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: drivers/base/regmap/regmap-sdw.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: crypto/xts.mod.o: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    warning: crypto/md5.mod.o: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    warning: crypto/cbc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    security/integrity/ima/ima_crypto.c:592:12: warning: stack frame s=
ize of 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larg=
er-than=3D]
    1    mm/hugetlb.c:50:20: warning: =E2=80=98hugetlb_cma=E2=80=99 defined=
 but not used [-Wunused-variable]
    1    kernel/rcu/tasks.h:593:13: warning: =E2=80=98show_rcu_tasks_classi=
c_gp_kthread=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1824 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
rger-than=3D]
    1    drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.mod.oaarch64-lin=
ux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    drivers/net/ethernet/intel/igc/igc_mac.c:374:6: warning: variable =
'link' is used uninitialized whenever 'if' condition is true [-Wsometimes-u=
ninitialized]
    1    drivers/net/ethernet/intel/igc/igc_mac.c:367:11: note: initialize =
the variable 'link' to silence this warning
    1    drivers/net/ethernet/intel/ice/ice_flow.h:198:32: warning: cast to=
 pointer from integer of different size [-Wint-to-pointer-cast]
    1    drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-ld: warning: driv=
ers/media/rc/keymaps/rc-wetek-hub.mod.o: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    drivers/iio/iio_core_trigger.h:42:13: warning: =E2=80=98iio_device=
_unregister_trigger_consumer=E2=80=99 defined but not used [-Wunused-functi=
on]
    1    drivers/iio/iio_core_trigger.h:33:12: warning: =E2=80=98iio_device=
_register_trigger_consumer=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/gpu/drm/omapdrm/omap_connector.c:92:39: warning: braces ar=
ound scalar initializer [-Wbraced-scalar-init]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5648 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3014:6:=
 warning: stack frame size of 1376 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    1    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1232 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1    drivers/crypto/inside-secure/safexcel_cipher.c:404:12: warning: st=
ack frame size of 1136 bytes in function 'safexcel_aead_setkey' [-Wframe-la=
rger-than=3D]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    cc1: all warnings being treated as errors
    1    aarch64-linux-gnu-strip: warning: drivers/firmware/efi/libstub/lib=
-ctype.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/sunxi/sun4i-spdif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/sh/rcar/snd-soc-rcar.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/rockchip/snd-soc-rockchip-spdif.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/rockchip/snd-soc-rockchip-rt5645.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/rockchip/snd-soc-rockchip-pcm.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/rockchip/snd-soc-rockchip-i2s.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/rockchip/snd-soc-rk3399-gru-sound.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/snd-soc-sdm845.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/snd-soc-qcom-common.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/qdsp6/q6routing.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/qdsp6/q6dsp-common.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/qdsp6/q6core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/qdsp6/q6asm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/qdsp6/q6asm-dai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/qdsp6/q6afe.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/qdsp6/q6afe-dai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/qcom/qdsp6/q6adm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-t9015.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-gx-sound-card.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-g12a-tohdmitx.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-g12a-toacodec.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-codec-glue.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-card-utils.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-toddr.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-tdmout.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-tdmin.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-tdm-interface.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-tdm-formatter.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-spdifout.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-spdifin.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-sound-card.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-pdm.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-frddr.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-axg-fifo.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/meson/snd-soc-meson-aiu.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/generic/snd-soc-simple-card.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/generic/snd-soc-simple-card-utils.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/generic/snd-soc-audio-graph-card.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/fsl/snd-soc-fsl-sai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-wsa881x.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-wm8904.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-wcd934x.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-tas571x.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-spdif-tx.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-spdif-rx.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-simple-amplifier.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-rt5663.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-rt5645.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-rt5514.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-rt5514-spi.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-rl6231.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-pcm3168a.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-pcm3168a-i2c.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-max98927.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-max98357a.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-hdmi-codec.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-es7241.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-es7134.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-dmic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-da7219.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-cros-ec-codec.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/codecs/snd-soc-ak4613.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/soc/bcm/snd-soc-bcm2835-i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/pci/hda/snd-hda-tegra.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/pci/hda/snd-hda-codec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/so=
und/pci/hda/snd-hda-codec-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/sch_taprio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/sch_mqprio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/sch_ingress.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/sch_etf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/sch_cbs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/cls_flower.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/cls_basic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/act_mirred.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/act_gate.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/sched/act_gact.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/rfkill/rfkill.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/qrtr/qrtr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/qrtr/qrtr-tun.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/qrtr/qrtr-smd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/qrtr/ns.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/xt_tcpudp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/xt_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/xt_conntrack.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/xt_addrtype.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/xt_MASQUERADE.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/xt_LOG.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/xt_CHECKSUM.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/x_tables.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/nf_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/nf_log_common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/netfilter/nf_conntrack.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/llc/llc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/sit.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/netfilter/nf_reject_ipv6.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/netfilter/nf_log_ipv6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/netfilter/nf_defrag_ipv6.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/netfilter/ip6table_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/netfilter/ip6table_mangle.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/netfilter/ip6table_filter.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/netfilter/ip6t_REJECT.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/netfilter/ip6_tables.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv6/ipv6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/tunnel4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/netfilter/nf_reject_ipv4.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/netfilter/nf_log_ipv4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/netfilter/nf_defrag_ipv4.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/netfilter/iptable_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/netfilter/iptable_mangle.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/netfilter/iptable_filter.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/netfilter/ipt_REJECT.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/netfilter/ip_tables.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/ipv4/ip_tunnel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/dsa/tag_ocelot.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/dsa/dsa_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/can/can.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/can/can-raw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/can/can-gw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/can/can-bcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/bridge/bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/bluetooth/hidp/hidp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/bluetooth/bluetooth.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/8021q/8021q.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/802/stp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/802/psnap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/802/p8022.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/802/mrp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ne=
t/802/garp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/li=
b/zstd/zstd_decompress.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/li=
b/zstd/zstd_compress.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/li=
b/libcrc32c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/li=
b/crypto/libdes.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/li=
b/crypto/libchacha.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/li=
b/crypto/libarc4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/li=
b/crc-ccitt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs=
/overlayfs/overlay.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs=
/nfs/flexfilelayout/nfs_layout_flexfiles.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs=
/nfs/blocklayout/blocklayoutdriver.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs=
/fuse/fuse.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs=
/fuse/cuse.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs=
/btrfs/btrfs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/watchdog/sunxi_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/watchdog/qcom-wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/watchdog/meson_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/watchdog/meson_gxbb_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/watchdog/imx_sc_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/video/backlight/pwm_bl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/video/backlight/lp855x_bl.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/video/backlight/generic_bl.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/usb/typec/typec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/usb/typec/tcpm/tcpm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/usb/typec/tcpm/fusb302.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/usb/typec/hd3ss3220.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/usb/renesas_usbhs/renesas_usbhs.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/usb/gadget/udc/tegra-xudc.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/usb/gadget/udc/renesas_usb3.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/thermal/tegra/tegra-bpmp-thermal.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/thermal/rockchip_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/thermal/qoriq_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/thermal/qcom/qcom-spmi-temp-alarm.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/thermal/imx_sc_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/thermal/imx8mm_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/thermal/broadcom/brcmstb_thermal.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/thermal/broadcom/bcm2835_thermal.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/thermal/broadcom/bcm2711_thermal.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spidev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spi-sh-msiof.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spi-qcom-qspi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spi-meson-spifc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spi-meson-spicc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spi-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spi-geni-qcom.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spi-bitbang.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spi-bcm2835aux.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/spi/spi-bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/soundwire/soundwire-qcom.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/soundwire/soundwire-bus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/soc/qcom/socinfo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/soc/qcom/rmtfs_mem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/soc/qcom/qmi_helpers.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/soc/qcom/pdr_interface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/soc/qcom/mdt_loader.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/soc/qcom/apr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/soc/amlogic/meson-canvas.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/slimbus/slimbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/slimbus/slim-qcom-ngd-ctrl.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/slimbus/slim-qcom-ctrl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/scsi/ufs/ufs-qcom.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/scsi/raid_class.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/scsi/mpt3sas/mpt3sas.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-snvs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-rx8581.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-rv8803.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-rk808.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-pm8xxx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-pcf85363.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-pcf2127.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-meson-vrtc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-imx-sc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rtc/rtc-ds1307.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/rpmsg/qcom_glink_smem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/reset/reset-qcom-pdc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/reset/reset-meson-audio-arb.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/remoteproc/qcom_sysmon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/remoteproc/qcom_q6v5_pas.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/remoteproc/qcom_q6v5_mss.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/remoteproc/qcom_q6v5_ipa_notify.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/remoteproc/qcom_q6v5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/remoteproc/qcom_pil_info.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/remoteproc/qcom_common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/regulator/vctrl-regulator.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/pwm/pwm-tegra.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/pwm/pwm-sun4i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/pwm/pwm-rcar.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/pwm/pwm-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/pwm/pwm-cros-ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/pwm/pwm-bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/power/supply/sbs-battery.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/platform/chrome/cros_ec_typec.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/platform/chrome/cros_ec_chardev.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/phy/tegra/phy-tegra194-p2u.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/phy/rockchip/phy-rockchip-pcie.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/phy/rockchip/phy-rockchip-inno-hdmi.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/phy/renesas/phy-rcar-gen3-usb3.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/phy/qualcomm/phy-qcom-qusb2.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/phy/qualcomm/phy-qcom-qmp.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/phy/allwinner/phy-sun6i-mipi-dphy.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/perf/thunderx2_pmu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/perf/fsl_imx8_ddr_perf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/perf/arm_smmuv3_pmu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/pci/controller/pcie-rockchip-host.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/pci/controller/pcie-brcmstb.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/pci/controller/dwc/pcie-tegra194.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/nvmem/nvmem_meson_efuse.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/nvme/host/nvme.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/nvme/host/nvme-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/ti/wlcore/wlcore_sdio.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/ti/wlcore/wlcore.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/ti/wl18xx/wl18xx.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/marvell/mwifiex/mwifiex_pcie.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/marvell/mwifiex/mwifiex.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/broadcom/brcm80211/brcmutil/brcmutil.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/broadcom/brcm80211/brcmfmac/brcmfmac.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/ath/ath10k/ath10k_pci.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/ath/ath10k/ath10k_core.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/wireless/ath/ath.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/veth.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/zaurus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/usbnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/sr9800.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/smsc95xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/smsc75xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/rtl8150.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/r8152.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/plusb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/pegasus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/net1080.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/mcs7830.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/lan78xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/dm9601.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/cdc_subset.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/cdc_ncm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/cdc_ether.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/ax88179_178a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/usb/asix.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/tap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/realtek.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/microchip.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/meson-gxl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/mdio-xpcs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/mdio-mux-meson-g12a.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/mdio-bcm-unimac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/marvell10g.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/marvell.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/broadcom.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/bcm7xxx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/phy/bcm-phy-lib.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/mdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/macvtap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/macvlan.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/stmmac.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/stmmac-platform.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-rk.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-meson.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-imx.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-generic.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-altr-socfpga.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/qualcomm/rmnet/rmnet.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/qualcomm/emac/qcom-emac.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/mellanox/mlx4/mlx4_en.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/mellanox/mlx4/mlx4_core.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/broadcom/genet/genet.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/broadcom/bnx2x/bnx2x.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/ethernet/atheros/atl1c/atl1c.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/dsa/ocelot/mscc_felix.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/can/rcar/rcar_canfd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/can/rcar/rcar_can.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/can/flexcan.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/net/can/can-dev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/misc/uacce/uacce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/misc/eeprom/at25.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/misc/eeprom/at24.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/mfd/wcd934x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/mfd/exynos-lpass.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/v4l2-core/videodev.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/v4l2-core/v4l2-mem2mem.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/v4l2-core/v4l2-fwnode.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/v4l2-core/v4l2-dv-timings.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/usb/uvc/uvcvideo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/usb/gspca/gspca_main.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/xc5000.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/xc4000.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/tuner-xc2028.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/tuner-simple.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/tda9887.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/tda8290.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/tda827x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/tda18271.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/mt20xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/tuners/mc44s803.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/sunxi-cir.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/rc-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/meson-ir.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-zx-irdec.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-xbox-dvd.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-x96max.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-winfast.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-winfast-usbii-deluxe.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-wetek-play2.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-wetek-hub.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-videostrong-kii-pro.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-videomate-tv-pvr.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-videomate-s350.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-videomate-m1f.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-vega-s9x.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-twinhan1027.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-tt-1500.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-trekstor.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-total-media-in-hand.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-total-media-in-hand-02.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-tivo.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-tevii-nec.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-terratec-slim.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-terratec-slim-2.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-terratec-cinergy-xs.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-technisat-usb2.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-technisat-ts35.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-tbs-nec.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-tanix-tx5max.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-tanix-tx3mini.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-tango.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-su3000.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-streamzap.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-snapstream-firefly.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-reddo.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-real-audio-220-32-keys.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-rc6-mce.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-pv951.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-purpletv.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-proteus-2309.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-powercolor-real-angel.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-pixelview.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-pixelview-new.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-pixelview-mk12.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-pixelview-002t.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-pinnacle-pctv-hd.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-pinnacle-grey.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-pinnacle-color.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-pctv-sedna.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-odroid.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-npgtech.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-norwood.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-nebula.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-msi-tvanywhere.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-msi-tvanywhere-plus.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-msi-digivox-iii.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-msi-digivox-ii.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-medion-x10.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-medion-x10-or2x.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-medion-x10-digitainer.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-manli.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-lme2510.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-leadtek-y04g0051.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-kworld-plus-tv-analog.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-kworld-pc150u.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-kworld-315u.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-khadas.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-kaiomy.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-it913x-v2.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-it913x-v1.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-iodata-bctv7e.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-imon-rsc.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-imon-pad.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-imon-mce.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-hisi-tv-demo.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-hisi-poplar.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-hauppauge.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-gotview7135.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-genius-tvgo-a11mce.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-geekbox.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-gadmei-rm008z.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-fusionhdtv-mce.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-flyvideo.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-flydvb.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-eztv.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-evga-indtube.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-encore-enltv2.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-encore-enltv.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-encore-enltv-fm53.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-em-terratec.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-dvico-portable.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-dvico-mce.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-dvbsky.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-dtt200u.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-dntv-live-dvb-t.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-dm1105-nec.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-digittrade.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-digitalnow-tinytwin.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-dib0700-rc5.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-dib0700-nec.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-delock-61959.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-d680-dmb.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-cinergy.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-cinergy-1400.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-cec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-budget-ci-old.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-behold.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-behold-columbus.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-beelink-gs1.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-azurewave-ad-tu700.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-avertv-303.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-avermedia.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-avermedia-rm-ks.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-avermedia-m135a.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-avermedia-dvbt.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-avermedia-cardbus.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-avermedia-a16d.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-ati-x10.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-asus-ps3-100.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-asus-pc39.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-astrometa-t2hybrid.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-apac-viewcomp.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-anysee.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-alink-dtu-m.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/rc/keymaps/rc-adstech-dvb-t-pci.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/vsp1/vsp1.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/sunxi/sun6i-csi/sun6i-csi.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/s5p-mfc/s5p-mfc.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/s5p-jpeg/s5p-jpeg.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/rcar_fdp1.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/rcar_drif.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/rcar-vin/rcar-vin.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/rcar-vin/rcar-csi2.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/rcar-fcp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/qcom/camss/qcom-camss.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/platform/exynos-gsc/exynos-gsc.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/mc/mc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/i2c/ov5645.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/i2c/ir-kbd-i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/i2c/imx219.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/dvb-core/dvb-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/common/videobuf2/videobuf2-vmalloc.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/common/videobuf2/videobuf2-v4l2.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/common/videobuf2/videobuf2-memops.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/common/videobuf2/videobuf2-dma-sg.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/common/videobuf2/videobuf2-dma-contig.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/common/videobuf2/videobuf2-common.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/media/cec/core/cec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/md/md-mod.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/md/dm-zero.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/md/dm-region-hash.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/md/dm-mod.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/md/dm-mirror.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/md/dm-log.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/mailbox/bcm-flexrm-mailbox.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/input/touchscreen/atmel_mxt_ts.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/input/misc/pm8xxx-vibrator.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/input/keyboard/snvs_pwrkey.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/input/keyboard/imx_sc_key.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/input/keyboard/adc-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/pressure/mpl3115.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/pressure/cros_ec_baro.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/light/isl29018.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/light/cros_ec_light_prox.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/common/cros_ec_sensors/cros_ec_sensors.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/buffer/kfifo_buf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/buffer/industrialio-triggered-buffer.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/adc/rockchip_saradc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/adc/qcom-vadc-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/adc/qcom-spmi-adc5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/iio/adc/max9611.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/i2c/busses/i2c-qcom-geni.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/i2c/busses/i2c-qcom-cci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/i2c/busses/i2c-gpio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/i2c/busses/i2c-bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/hwmon/raspberrypi-hwmon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/hwmon/pwm-fan.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/hwmon/lm90.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/hwmon/ina3221.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/hwmon/ina2xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/hid/i2c-hid/i2c-hid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/host1x/host1x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/ttm/ttm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun8i_tcon_top.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun8i-mixer.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun8i-drm-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun6i_mipi_dsi.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun6i_drc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun4i_tv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun4i-tcon.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun4i-frontend.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun4i-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/sun4i/sun4i-backend.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/scheduler/gpu-sched.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/rockchip/rockchipdrm.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/rcar-du/rcar_lvds.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/rcar-du/rcar_dw_hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/rcar-du/rcar_cmm.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/rcar-du/rcar-du-drm.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/pl111/pl111_drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/panfrost/panfrost.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/panel/panel-truly-nt35597.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/panel/panel-simple.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/panel/panel-lvds.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/meson/meson_dw_hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/meson/meson-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/i2c/tda998x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/i2c/sil164.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/i2c/ch7006.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/hisilicon/kirin/kirin-drm.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/hisilicon/hibmc/hibmc-drm.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/exynos/exynosdrm.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/etnaviv/etnaviv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/drm_vram_helper.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/drm_ttm_helper.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/drm_kms_helper.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/ti-sn65dsi86.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/thc63lvd1024.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/synopsys/dw-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/simple-bridge.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/sii902x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/display-connector.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/analogix/analogix_dp.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/bridge/adv7511/adv7511.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpu/drm/arm/mali-dp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpio/gpio-wcd934x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpio/gpio-bd9571mwv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/gpio/gpio-altera.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/fpga/stratix10-soc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/fpga/of-fpga-region.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/fpga/fpga-region.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/fpga/fpga-bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/fpga/altera-freeze-bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/firmware/stratix10-rsu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/dma/sun6i-dma.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/dma/sh/usb-dmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/dma/bcm-sba-raid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/virtio/virtio_crypto.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/qcom-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/hisilicon/zip/hisi_zip.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/hisilicon/sec2/hisi_sec2.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/hisilicon/hpre/hisi_hpre.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/hisilicon/hisi_qm.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/ccree/ccree.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/caam/error.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/caam/dpaa2_caam.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/caam/caamhash_desc.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/caam/caamalg_desc.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/caam/caam_jr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/caam/caam.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/bcm/bcm_crypto_spu.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/amlogic/amlogic-gxl-crypto.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/crypto/allwinner/sun8i-ce/sun8i-ce.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/cpufreq/sun50i-cpufreq-nvmem.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/cpufreq/raspberrypi-cpufreq.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/cpufreq/imx-cpufreq-dt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/cpufreq/cpufreq_powersave.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/cpufreq/cpufreq_conservative.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/cpufreq/cppc_cpufreq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/clk/qcom/camcc-sdm845.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/clk/meson/sclk-div.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/clk/meson/clk-phase.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/clk/meson/axg-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/clk/bcm/clk-raspberrypi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/ipmi/ipmi_si.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/ipmi/ipmi_msghandler.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/ipmi/ipmi_devintf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/xgene-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/rng-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/optee-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/omap-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/mtk-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/meson-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/iproc-rng200.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/hisi-trng-v2.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/hisi-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/exynos-trng.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/cavium-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/cavium-rng-vf.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/char/hw_random/bcm2835-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/bluetooth/hci_uart.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/bluetooth/btusb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/bluetooth/btrtl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/bluetooth/btqca.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/bluetooth/btintel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/bluetooth/btbcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/block/nbd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/base/regmap/regmap-slimbus.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/dr=
ivers/base/regmap/regmap-sdw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/xxhash_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/xts.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/xor.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/sm4_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/sm3_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/sha512_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/sha3_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/md5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/ghash-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/gcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/ecdh_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/ecc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/ecb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/dh_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/des_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/ctr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/crypto_engine.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/cmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/ccm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/cbc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/blake2b_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/authencesn.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/authenc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/algif_rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/cr=
ypto/af_alg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ar=
ch/arm64/lib/xor-neon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ar=
ch/arm64/crypto/sm3-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ar=
ch/arm64/crypto/sha512-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ar=
ch/arm64/crypto/sha512-arm64.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ar=
ch/arm64/crypto/sha3-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ar=
ch/arm64/crypto/crct10dif-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ar=
ch/arm64/crypto/chacha-neon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ar=
ch/arm64/crypto/aes-neon-bs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kerne=
l-build/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/ar=
ch/arm64/crypto/aes-neon-blk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-objdump: warning: drivers/firmware/efi/libstub/l=
ib-ctype.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-objcopy: warning: drivers/firmware/efi/libstub/l=
ib-ctype.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/sunxi/sun4i-spdif.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/sh/rcar/snd-soc-rcar.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/rockchip/snd-soc-rockchip=
-spdif.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/rockchip/snd-soc-rockchip=
-rt5645.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/rockchip/snd-soc-rockchip=
-pcm.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/rockchip/snd-soc-rockchip=
-i2s.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/snd-soc-sdm845.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/snd-soc-qcom-common.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6routing.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6dsp-common.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6core.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6asm.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6asm-dai.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6afe.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6afe-dai.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6adm.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-t9015=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-gx-so=
und-card.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-g12a-=
tohdmitx.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-g12a-=
toacodec.mod.o: unsupported GNU_PROPERTY_TYPE (  LD [M]  sound/soc/qcom/qds=
p6/q6adm.ko
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-codec=
-glue.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-card-=
utils.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-t=
dmout.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-ld=
: warning: sound/soc/meson/snd-soc-meson-axg-toddr.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-t=
dmin.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-t=
dm-interface.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-s=
pdifout.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-s=
pdifin.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-f=
rddr.mod.o: unsupported GNU_PROPERTY_TYPE (5  LD [M]  sound/soc/meson/snd-s=
oc-meson-axg-sound-card.ko
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-f=
ifo.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-aiu.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/generic/snd-soc-simple-ca=
rd.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/generic/snd-soc-simple-ca=
rd-utils.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/generic/snd-soc-audio-gra=
ph-card.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/fsl/snd-soc-fsl-sai.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-wsa881x.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-wm8904.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-tas571x.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-spdif-tx.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-simple-amp=
lifier.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-rt5645.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-rt5514.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-rt5514-spi=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-pcm3168a-i=
2c.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-max98927.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-max98357a.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-hdmi-codec=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-es7241.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-es7134.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-dmic.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-da7219.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-cros-ec-co=
dec.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-ak4613.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/soc/bcm/snd-soc-bcm2835-i2s.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/pci/hda/snd-hda-tegra.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/pci/hda/snd-hda-codec.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/pci/hda/snd-hda-codec-hdmi.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/hda/trace.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/hda/snd-hda-core.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/hda/snd-hda-core.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/wireless/trace.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/wireless/shipped-certs.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/wireless/cfg80211.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/sched/sch_taprio.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/sched/sch_ingress.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/sched/sch_etf.mod.o  LD [M]  ne=
t/sched/sch_ingress.ko
    1    aarch64-linux-gnu-ld: warning: net/sched/sch_cbs.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-ld: warning: net/=
sched/sch_mqprio.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/sched/cls_basic.mod.oaarch64-li=
nux-gnu-ld: warning: net/sched/cls_flower.mod.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/sched/act_mirred.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/sched/act_gate.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/sched/act_gact.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5  LD [M]  net/sched/cls_basic.ko
    1    aarch64-linux-gnu-ld: warning: net/rfkill/rfkill.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/qrtr/qrtr-smd.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/qrtr/ns.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/xt_tcpudp.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/xt_nat.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/xt_conntrack.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/xt_addrtype.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/xt_MASQUERADE.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/xt_LOG.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/xt_CHECKSUM.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/x_tables.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/nf_nat.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/nf_log_common.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/netfilter/nf_conntrack.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/mac80211/trace.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/mac80211/mac80211.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/llc/llc.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/sit.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/nf_reject_ipv6.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/nf_log_ipv6.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/nf_defrag_ipv6.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6table_nat.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6table_mangle.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6table_filter.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6t_REJECT.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6_tables.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv6/ipv6.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv4/tunnel4.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/nf_reject_ipv4.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/nf_log_ipv4.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/nf_defrag_ipv4.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/iptable_nat.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/iptable_mangle.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/iptable_filter.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/ip_tables.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/ipv4/ip_tunnel.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/dsa/dsa_core.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/can/can.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/can/can-raw.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/can/can-bcm.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/bridge/bridge.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-ld: warning: net/=
can/can-gw.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/bluetooth/bluetooth.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/8021q/8021q.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/802/stp.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/802/psnap.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/802/p8022.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/802/mrp.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/802/garp.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/zstd/zstd_decompress.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/zstd/zstd_compress.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/raid6/tables.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/raid6/raid6_pq.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/raid6/int32.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/raid6/int16.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/libcrc32c.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/crypto/libdes.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/crypto/libchacha.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: fs/overlayfs/overlay.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: fs/nfs/blocklayout/blocklayoutdrive=
r.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: fs/fuse/fuse.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/watchdog/qcom-wdt.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-ld: warni=
ng: drivers/watchdog/sunxi_wdt.mod.o: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/watchdog/imx_sc_wdt.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/video/backlight/lp855x_bl.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/video/backlight/generic_bl.=
mod.o: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-ld: warning: driver=
s/video/backlight/pwm_bl.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-ld: warning: drivers/usb/typec/tcpm/fusb302.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/usb/typec/hd3ss3220.mod.oaa=
rch64-linux-gnu-ld: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/usb/renesas_usbhs/renesas_u=
sbhs.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/tegra-xudc.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/renesas_usb3=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/thermal/tegra/tegra-bpmp-th=
ermal.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/thermal/rockchip_thermal.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  LD [M]  drivers/us=
b/gadget/udc/tegra-xudc.ko
    1    aarch64-linux-gnu-ld: warning: drivers/thermal/qoriq_thermal.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/qcom-spmi-temp=
-alarm.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/thermal/imx8mm_thermal.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/thermal/broadcom/brcmstb_th=
ermal.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/thermal/broadcom/bcm2711_th=
ermal.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/spi/spidev.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/spi/spi-qcom-qspi.mod.o: un=
supported GNU_PROPERTY_TYPE (aarch64-linux-gnu-ld: 5) type: 0xwarning: c000=
0000drivers/spi/spi-sh-msiof.mod.o
    1    aarch64-linux-gnu-ld: warning: drivers/spi/spi-imx.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/spi/spi-bcm2835aux.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/spi/spi-bcm2835.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/soundwire/soundwire-qcom.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/soundwire/soundwire-bus.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/soc/qcom/socinfo.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/soc/qcom/qmi_helpers.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/soc/qcom/mdt_loader.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/soc/qcom/apr.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/soc/amlogic/meson-canvas.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/slimbus/slimbus.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/slimbus/slim-qcom-ngd-ctrl.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/slimbus/slim-qcom-ctrl.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/scsi/ufs/ufs-qcom.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/scsi/raid_class.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/scsi/mpt3sas/mpt3sas.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-snvs.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-rx8581.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-rv8803.mod.o: unsup=
ported GNU_PROPERTY_TYPE (  LD [M]  drivers/scsi/mpt3sas/mpt3sas.ko
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-rk808.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-pm8xxx.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-pcf85363.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-pcf2127.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-meson-vrtc.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  LD [M]  drivers/rtc/rtc-=
pcf2127.ko
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-imx-sc.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-ds1307.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/rpmsg/qcom_glink_smem.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_sysmon.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_q6v5_pas.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_q6v5_mss.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_q6v5_ipa_no=
tify.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_q6v5.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_pil_info.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_common.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/pwm/pwm-sun4i.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/pwm/pwm-rcar.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/pwm/pwm-meson.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/pwm/pwm-bcm2835.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/power/supply/sbs-battery.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_typ=
ec.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_cha=
rdev.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/phy/rockchip/phy-rockchip-p=
cie.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/phy/rockchip/phy-rockchip-i=
nno-hdmi.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/phy/allwinner/phy-sun6i-mip=
i-dphy.mod.oaarch64-linux-gnu-ld: warning: drivers/perf/thunderx2_pmu.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/perf/fsl_imx8_ddr_perf.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/perf/arm_smmuv3_pmu.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/pci/controller/pcie-rockchi=
p-host.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/nvme/host/nvme.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/nvme/host/nvme-core.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ti/wlcore/wlco=
re_sdio.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ti/wlcore/wlco=
re.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ti/wl18xx/wl18=
xx.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/marvell/mwifie=
x/mwifiex_pcie.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/marvell/mwifie=
x/mwifiex.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/broadcom/brcm8=
0211/brcmutil/brcmutil.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/broadcom/brcm8=
0211/brcmfmac/brcmfmac.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/qmi=
_wlfw_v01.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/ath=
10k_snoc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/ath=
10k_pci.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/ath=
10k_core.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/veth.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/zaurus.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/usbnet.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/sr9800.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/smsc95xx.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/smsc75xx.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/rtl8150.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/r8152.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/plusb.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/pegasus.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/net1080.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/mcs7830.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/lan78xx.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/dm9601.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0x  LD [M]  drivers/net/usb/lan78xx.ko
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/cdc_subset.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/cdc_ncm.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/ax88179_178a.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/usb/asix.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/tap.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/realtek.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/microchip.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/meson-gxl.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/mdio-xpcs.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/mdio-mux-meson-g12a=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/mdio-bcm-unimac.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/marvell10g.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/marvell.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/broadcom.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/bcm7xxx.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/phy/bcm-phy-lib.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/mdio.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/macvtap.mod.oaarch64-li=
nux-gnu-ld: warning: drivers/net/ipa/ipa.mod.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/macvlan.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_qmi_msg.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_data-sdm845.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_data-sc7180.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac=
/stmmac-platform.mod.o: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-l=
d: warning: drivers/net/ethernet/stmicro/stmmac/stmmac.mod.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac=
/dwmac-sunxi.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac=
/dwmac-sun8i.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac=
/dwmac-rk.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac=
/dwmac-qcom-ethqos.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac=
/dwmac-meson.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac=
/dwmac-imx.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac=
/dwmac-generic.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac=
/dwmac-altr-socfpga.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/qualcomm/rmnet=
/rmnet.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/qualcomm/emac/=
qcom-emac.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/mscc/mscc_ocel=
ot_switch_lib.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/mellanox/mlx5/=
core/mlx5_core.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/mellanox/mlx4/=
mlx4_en.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-li=
nux-gnu-ld: warning: drivers/net/ethernet/mellanox/mlx4/mlx4_core.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/broadcom/genet=
/genet.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/broadcom/bnx2x=
/bnx2x.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/atheros/atl1c/=
atl1c.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/dsa/ocelot/mscc_felix.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/can/rcar/rcar_canfd.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/can/rcar/rcar_can.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/can/flexcan.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/can/can-dev.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/misc/uacce/uacce.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/misc/eeprom/at25.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/misc/eeprom/at24.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/mfd/wcd934x.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/v4l2-core/v4l2-dv-tim=
ings.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/usb/uvc/uvcvideo.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/usb/gspca/gspca_main.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/xc5000.mod.o: =
unsupported GNU_PROPERTY_TYPE (  LD [M]  drivers/media/v4l2-core/v4l2-fwnod=
e.ko
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/xc4000.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tuner-xc2028.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tuner-types.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tuner-types.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tuner-simple.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tda9887.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tda8290.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tda827x.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tda18271.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/mt20xx.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/tuners/mc44s803.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/sunxi-cir.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/rc-core.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/meson-ir.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-zx-irde=
c.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-xbox-dv=
d.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-x96max.=
mod.o  LD [M]  drivers/media/tuners/mc44s803.ko
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-winfast=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-videost=
rong-kii-pro.mod.o: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-ld: 5)=
 type: 0xwarning: c0000000drivers/media/rc/keymaps/rc-videomate-tv-pvr.mod.o
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-videoma=
te-s350.mod.o  LD [M]  drivers/media/rc/keymaps/rc-wetek-play2.ko
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-videoma=
te-m1f.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-vega-s9=
x.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tt-1500=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-treksto=
r.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-total-m=
edia-in-hand.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-total-m=
edia-in-hand-02.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tivo.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tevii-n=
ec.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terrate=
c-slim.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terrate=
c-slim-2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terrate=
c-cinergy-xs.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terrate=
c-cinergy-s2-hd.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terrate=
c-cinergy-c-pci.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-technis=
at-usb2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-technis=
at-ts35.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tbs-nec=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tanix-t=
x5max.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  LD [M]  dr=
ivers/media/rc/keymaps/rc-technisat-ts35.ko
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tanix-t=
x3mini.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tango.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-su3000.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-streamz=
ap.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-snapstr=
eam-firefly.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-reddo.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-rc6-mce=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-purplet=
v.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-proteus=
-2309.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-powerco=
lor-real-angel.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pixelvi=
ew-new.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pixelvi=
ew-mk12.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pixelvi=
ew-002t.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pinnacl=
e-pctv-hd.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pinnacl=
e-grey.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pinnacl=
e-color.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pctv-se=
dna.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-odroid.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-npgtech=
.mod.oaarch64-linux-gnu-ld: : unsupported GNU_PROPERTY_TYPE (5warning: ) ty=
pe: 0xdrivers/media/rc/keymaps/rc-msi-tvanywhere.mod.oc0000000: unsupported=
 GNU_PROPERTY_TYPE (
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-norwood=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-nec-ter=
ratec-cinergy-xs.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-nebula.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-msi-tva=
nywhere-plus.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-msi-dig=
ivox-iii.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-msi-dig=
ivox-ii.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-medion-=
x10.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-medion-=
x10-or2x.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-medion-=
x10-digitainer.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-manli.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-lme2510=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-leadtek=
-y04g0051.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-kworld-=
plus-tv-analog.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-kworld-=
pc150u.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-kworld-=
315u.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-khadas.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-kaiomy.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-it913x-=
v2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-it913x-=
v1.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-iodata-=
bctv7e.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-imon-rs=
c.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-imon-pa=
d.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-imon-mc=
e.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-hisi-tv=
-demo.mod.o: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-ld: 5) type: =
0xwarning: c0000000drivers/media/rc/keymaps/rc-hauppauge.mod.o
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-hisi-po=
plar.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-gotview=
7135.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-genius-=
tvgo-a11mce.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-geekbox=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-gadmei-=
rm008z.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-fusionh=
dtv-mce.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-flyvide=
o.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-flydvb.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-eztv.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-evga-in=
dtube.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-encore-=
enltv2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-encore-=
enltv.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-encore-=
enltv-fm53.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-em-terr=
atec.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dvico-p=
ortable.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dvico-m=
ce.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dvbsky.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dtt200u=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dntv-li=
ve-dvbt-pro.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dntv-li=
ve-dvb-t.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dm1105-=
nec.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-digittr=
ade.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-digital=
now-tinytwin.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dib0700=
-rc5.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dib0700=
-nec.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-delock-=
61959.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-d680-dm=
b.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-cinergy=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-cinergy=
-1400.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-cec.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-budget-=
ci-old.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-behold.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-behold-=
columbus.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-beelink=
-gs1.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-azurewa=
ve-ad-tu700.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avertv-=
303.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermed=
ia.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermed=
ia-rm-ks.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermed=
ia-m135a.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermed=
ia-dvbt.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermed=
ia-cardbus.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermed=
ia-a16d.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-ati-x10=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-ati-tv-=
wonder-hd-600.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-asus-ps=
3-100.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-asus-pc=
39.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-apac-vi=
ewcomp.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-anysee.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-alink-d=
tu-m.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-adstech=
-dvb-t-pci.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/vsp1/vsp1.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/sunxi/sun6i-=
csi/sun6i-csi.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/s5p-mfc/s5p-=
mfc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/s5p-jpeg/s5p=
-jpeg.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar_fdp1.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar_drif.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar-vin/rca=
r-vin.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar-vin/rca=
r-csi2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar-fcp.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/platform/exynos-gsc/e=
xynos-gsc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/mc/mc.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/i2c/ov5645.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/i2c/ir-kbd-i2c.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/i2c/imx219.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/dvb-core/dvb-core.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/vide=
obuf2-vmalloc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/vide=
obuf2-v4l2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/vide=
obuf2-memops.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/vide=
obuf2-dma-sg.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/vide=
obuf2-dma-contig.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/vide=
obuf2-common.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/media/cec/core/cec.mod.o: u=
nsupported GNU_PROPERTY_TYPE (  LD [M]  drivers/media/common/videobuf2/vide=
obuf2-dma-sg.ko
    1    aarch64-linux-gnu-ld: warning: drivers/md/md-mod.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/md/dm-zero.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/md/dm-region-hash.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/md/dm-mod.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/md/dm-mirror.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/md/dm-log.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/mailbox/bcm-flexrm-mailbox.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/input/touchscreen/atmel_mxt=
_ts.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/input/misc/pm8xxx-vibrator.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/input/keyboard/snvs_pwrkey.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/input/keyboard/imx_sc_key.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/input/keyboard/adc-keys.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/pressure/mpl3115.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/light/isl29018.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/common/cros_ec_sensors/=
cros_ec_sensors_core.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/common/cros_ec_sensors/=
cros_ec_sensors.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/buffer/kfifo_buf.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/buffer/industrialio-tri=
ggered-buffer.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/adc/rockchip_saradc.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/adc/qcom-vadc-common.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/adc/qcom-spmi-adc5.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/iio/adc/max9611.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/i2c/busses/i2c-qcom-geni.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/i2c/busses/i2c-qcom-cci.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/i2c/busses/i2c-gpio.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/i2c/busses/i2c-bcm2835.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/hwmon/raspberrypi-hwmon.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/hwmon/pwm-fan.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/hwmon/lm90.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/hwmon/ina3221.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/hwmon/ina2xx.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/hid/i2c-hid/i2c-hid.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/host1x/host1x.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/vc4/vc4_trace_point=
s.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/vc4/vc4.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/tegra/trace.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/tegra/tegra-drm.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/tegra/tegra-drm.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun8i_tcon_to=
p.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun8i-mixer.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun8i-drm-hdm=
i.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun6i_mipi_ds=
i.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun6i_drc.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i_tv.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i-tcon.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i-fronten=
d.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i-drm.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i-drm-hdm=
i.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-ld: wa=
rning: drivers/gpu/drm/sun4i/sun4i-backend.mod.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/scheduler/gpu-sched=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rockchip/rockchipdr=
m.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rcar-du/rcar_lvds.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rcar-du/rcar_dw_hdm=
i.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rcar-du/rcar_cmm.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rcar-du/rcar-du-drm=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/pl111/pl111_drm.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/panfrost/panfrost.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/panel/panel-simple.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/panel/panel-lvds.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/subdev=
/pci/agp.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/subdev=
/bios/shadowof.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgp107.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgp104.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgk208.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgk110b.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgf119.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgf110.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgf104.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: =
unsupported GNU_PROPERTY_TYPE (5  LD [M]  drivers/gpu/drm/panel/panel-lvds.=
ko
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm_gpu_tracepo=
ints.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm_atomic_trac=
epoints.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/meson/meson_dw_hdmi=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/meson/meson-drm.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/lima/lima_trace.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/lima/lima.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/lima/lima.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/i2c/tda998x.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/i2c/sil164.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/i2c/ch7006.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/hisilicon/kirin/kir=
in-drm.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/hisilicon/kirin/dw_=
drm_dsi.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/hisilicon/hibmc/hib=
mc-drm.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/etnaviv/etnaviv.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/drm_vram_helper.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/drm_ttm_helper.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/drm_trace_points.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/ti-sn65dsi86=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/synopsys/dw-=
hdmi.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/synopsys/dw-=
hdmi-cec.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/synopsys/dw-=
hdmi-ahb-audio.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/simple-bridg=
e.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/display-conn=
ector.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/analogix/ana=
logix_dp.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/adv7511/adv7=
511.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/arm/mali-dp.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpio/gpio-wcd934x.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpio/gpio-bd9571mwv.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpio/gpio-altera.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/fpga/stratix10-soc.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/fpga/of-fpga-region.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/fpga/fpga-region.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/fpga/fpga-bridge.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/fpga/altera-freeze-bridge.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/firmware/stratix10-rsu.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/dma/sh/usb-dmac.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/dma/bcm-sba-raid.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/virtio/virtio_crypto=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/qcom-rng.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/hisilicon/zip/hisi_z=
ip.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/hisilicon/sec2/hisi_=
sec2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/hisilicon/hpre/hisi_=
hpre.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/hisilicon/hisi_qm.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/ccree/ccree.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/error.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/dpaa2_caam.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/caamhash_desc.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/caamalg_desc.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/caam_jr.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/caam.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/bcm/bcm_crypto_spu.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/amlogic/amlogic-gxl-=
crypto.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/crypto/allwinner/sun8i-ce/s=
un8i-ce.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/cpufreq/sun50i-cpufreq-nvme=
m.mod.o  LD [M]  drivers/crypto/amlogic/amlogic-gxl-crypto.ko
    1    aarch64-linux-gnu-ld: warning: drivers/cpufreq/raspberrypi-cpufreq=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/cpufreq/imx-cpufreq-dt.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/cpufreq/cpufreq_conservativ=
e.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/clk/meson/sclk-div.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/clk/meson/clk-phase.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/clk/meson/axg-audio.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/clk/bcm/clk-raspberrypi.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/ipmi/ipmi_si.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/ipmi/ipmi_msghandler.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/ipmi/ipmi_devintf.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/xgene-rng.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/rng-core.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/optee-rng.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/omap-rng.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/mtk-rng.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/meson-rng.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/iproc-rng200=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/hisi-trng-v2=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/hisi-rng.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/exynos-trng.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/cavium-rng.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/cavium-rng-v=
f.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/bcm2835-rng.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/bluetooth/hci_uart.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/bluetooth/btusb.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/bluetooth/btqca.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/bluetooth/btintel.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/bluetooth/btbcm.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/xxhash_generic.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/xor.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/sm4_generic.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/sm3_generic.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/sha512_generic.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/sha3_generic.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/ghash-generic.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/gcm.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/ecdh_generic.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/ecc.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/ecb.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/dh_generic.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/des_generic.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/ctr.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/crypto_engine.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/cmac.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/ccm.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/blake2b_generic.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/authencesn.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/authenc.mod.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/algif_rng.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: crypto/af_alg.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: arch/arm64/lib/xor-neon.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/sm3-ce.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/sha512-ce.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/sha512-arm64.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/sha3-ce.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/crct10dif-ce.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/chacha-neon.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/aes-neon-bs.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/aes-neon-blk.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: aarch64-linux-gnu-ld: warning: soun=
d/soc/meson/snd-soc-meson-axg-pdm.mod.o: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: aarch64-linux-gnu-ld: warning: driv=
ers/thermal/imx_sc_thermal.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-ld: warning: aarch64-linux-gnu-ld: warning: driv=
ers/media/rc/keymaps/rc-wetek-play2.mod.o: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: aarch64-linux-gnu-ld: drivers/spi/s=
pi-meson-spifc.mod.o: unsupported GNU_PROPERTY_TYPE (warning: 5) type: 0xdr=
ivers/spi/spi-meson-spicc.mod.oc0000000: unsupported GNU_PROPERTY_TYPE (
    1    aarch64-linux-gnu-ld: warning:   LD [M]  sound/soc/rockchip/snd-so=
c-rockchip-rt5645.ko
    1    aarch64-linux-gnu-ld: warning:   LD [M]  net/netfilter/nf_log_comm=
on.ko
    1    aarch64-linux-gnu-ld: warning:   LD [M]  net/ipv4/netfilter/iptabl=
e_filter.ko
    1    aarch64-linux-gnu-ld: warning:   LD [M]  drivers/net/ethernet/stmi=
cro/stmmac/dwmac-sun8i.ko
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: warning: driv=
ers/iio/light/cros_ec_light_prox.mod.odrivers/iio/pressure/cros_ec_baro.mod=
.o: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: sound/soc/cod=
ecs/snd-soc-rt5663.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: net/qrtr/qrtr=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: lib/crc-ccitt=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: fs/btrfs/btrf=
s.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/watch=
dog/meson_wdt.mod.o: unsupported GNU_PROPERTY_TYPE (warning: 5drivers/watch=
dog/meson_gxbb_wdt.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/soc/q=
com/pdr_interface.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/reset=
/reset-qcom-pdc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/pwm/p=
wm-tegra.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/phy/q=
ualcomm/phy-qcom-qusb2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/nvmem=
/nvmem_meson_efuse.mod.oaarch64-linux-gnu-ld: warning: drivers/pci/controll=
er/dwc/pcie-tegra194.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/media=
/rc/keymaps/rc-twinhan-dtv-cab-ci.mod.o: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/gpu/d=
rm/vc4/vc4.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/gpu/d=
rm/exynos/exynosdrm.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/gpu/d=
rm/bridge/synopsys/dw-mipi-dsi.mod.o: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/cpufr=
eq/cpufreq_powersave.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/block=
/nbd.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/base/=
regmap/regmap-slimbus.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: aarch64-linux=
-gnu-ld: warning: drivers/media/v4l2-core/videodev.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: : unsupported GNU_PROPERTY_TYPE (aarch64-lin=
ux-gnu-ld: warning: drivers/phy/qualcomm/phy-qcom-qmp.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: lib/nmi_backtrace.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: lib/irq_regs.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: lib/ctype.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: lib/clz_tab.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: drivers/firmware/efi/libstub/lib-ct=
ype.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    2 warnings generated.
    1    /tmp/test-arm-306ef5.s:18788: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-306ef5.s:18713: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/ccyi7rBf.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccyi7rBf.s:18119: Warning: using r15 results in unpredictable=
 behaviour

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x2bb4): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()
    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x2950): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    ERROR: modpost: "__cpu_logical_map" [drivers/cpufreq/tegra194-cpufreq.k=
o] undefined!

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 24 warnings, 0 section=
 mismatches

Errors:
    ERROR: modpost: "__compiletime_assert_529" [drivers/gpu/drm/vc4/vc4.ko]=
 undefined!

Warnings:
    security/integrity/ima/ima_crypto.c:592:12: warning: stack frame size o=
f 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larger-th=
an=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1232 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    /tmp/test-arm-306ef5.s:18713: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-306ef5.s:18788: Warning: using r15 results in unpredictab=
le behaviour
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    drivers/gpu/drm/omapdrm/omap_connector.c:92:39: warning: braces around =
scalar initializer [-Wbraced-scalar-init]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
824 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/crypto/inside-secure/safexcel_cipher.c:404:12: warning: stack f=
rame size of 1136 bytes in function 'safexcel_aead_setkey' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/net/ethernet/intel/igc/igc_mac.c:374:6: warning: variable 'link=
' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninit=
ialized]
    drivers/net/ethernet/intel/igc/igc_mac.c:367:11: note: initialize the v=
ariable 'link' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3014:6: warn=
ing: stack frame size of 1376 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5648 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section m=
ismatches

Warnings:
    /tmp/ccyi7rBf.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccyi7rBf.s:18191: Warning: using r15 results in unpredictable beha=
viour
    drivers/gpu/drm/omapdrm/omap_connector.c:92:9: warning: braces around s=
calar initializer
    drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warning: cast from po=
inter to integer of different size [-Wpointer-to-int-cast]
    drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warning: cast from po=
inter to integer of different size [-Wpointer-to-int-cast]
    drivers/net/ethernet/intel/ice/ice_flow.h:198:32: warning: cast to poin=
ter from integer of different size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-9) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:593:13: warning: =E2=80=98show_rcu_tasks_classic_gp_=
kthread=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    mm/hugetlb.c:50:20: warning: =E2=80=98hugetlb_cma=E2=80=99 defined but =
not used [-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x2bb4): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x2950): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    ERROR: modpost: "__compiletime_assert_610" [drivers/gpu/drm/vc4/vc4.ko]=
 undefined!

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (=
1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) =
differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 1856 warnings, 0 sect=
ion mismatches

Warnings:
    aarch64-linux-gnu-ar: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ar: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ar: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ar: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: drivers/firmware/efi/libstub/lib-ctyp=
e.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objdump: warning: drivers/firmware/efi/libstub/lib-ct=
ype.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: drivers/firmware/efi/libstub/lib-ct=
ype.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ar: warning: drivers/firmware/efi/libstub/lib-ctype.s=
tub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-ctype=
.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exynos-a=
rm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut224.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-sys.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-mio.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-peri.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774e1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallback_ta=
ble.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_trace.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-ctype=
.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exynos-a=
rm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut224.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-sys.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-mio.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-peri.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774e1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallback_ta=
ble.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_trace.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms1: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms1: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-ctype=
.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exynos-a=
rm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut224.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-sys.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-mio.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-peri.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774e1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallback_ta=
ble.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_trace.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-ctype=
.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exynos-a=
rm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut224.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-sys.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-mio.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-peri.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774e1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallback_ta=
ble.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_trace.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: vmlinux: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: vmlinux: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/hda/trace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/tables.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/int16.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/int32.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/vc4/vc4_trace_points.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/wireless/trace.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/wireless/shipped-certs.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/tegra/trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/lima/lima_trace.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm_atomic_tracepoin=
ts.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm_gpu_tracepoints.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/mac80211/trace.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/qmi_wlfw=
_v01.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_qmi_msg.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_data-sdm845.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_data-sc7180.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/drm_trace_points.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/subdev/bios=
/shadowof.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/subdev/pci/=
agp.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgf104.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgf110.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgf119.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgk110b.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgk208.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgp104.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgp107.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/aes-neon-blk.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/aes-neon-bs.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/chacha-neon.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/crct10dif-ce.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/sha3-ce.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/sha512-arm64.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/sha512-ce.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: arch/arm64/crypto/sm3-ce.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: arch/arm64/lib/xor-neon.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/af_alg.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/algif_rng.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/authenc.mod.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/authencesn.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/blake2b_generic.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: crypto/cbc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-ld: warning: crypto/ccm.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/cmac.mod.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/crypto_engine.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/des_generic.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/ctr.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/dh_generic.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/ecb.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/ecc.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/gcm.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/ecdh_generic.mod.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/ghash-generic.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: crypto/md5.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-ld: warning: crypto/sha3_generic.mod.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/sm3_generic.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/sha512_generic.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/sm4_generic.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/xor.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/xxhash_generic.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/base/regma=
p/regmap-slimbus.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: crypto/xts.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-ld: warning: drivers/bluetooth/btbcm.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/block/nbd.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/base/regmap/regmap-sdw.mod.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/bluetooth/btintel.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/bluetooth/btqca.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/bluetooth/btusb.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/bluetooth/hci_uart.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/bluetooth/btrtl.mod.o: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/cavium-rng-vf.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/bcm2835-rng.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/cavium-rng.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/exynos-trng.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/hisi-rng.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/hisi-trng-v2.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/iproc-rng200.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/meson-rng.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/mtk-rng.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/omap-rng.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/optee-rng.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/rng-core.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/ipmi/ipmi_devintf.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/hw_random/xgene-rng.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/ipmi/ipmi_msghandler.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/char/ipmi/ipmi_si.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/meson/clk-phase.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/bcm/clk-raspberrypi.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/meson/axg-audio.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/meson/sclk-div.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/cpufreq/cpufreq_conservative.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/cpufreq/cp=
ufreq_powersave.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/clk/qcom/camcc-sdm845.mod.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/cpufreq/imx-cpufreq-dt.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/cpufreq/cppc_cpufreq.mod.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/cpufreq/raspberrypi-cpufreq.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/cpufreq/sun50i-cpufreq-nvmem.mod=
.o  LD [M]  drivers/crypto/amlogic/amlogic-gxl-crypto.ko
    aarch64-linux-gnu-ld: warning: drivers/crypto/amlogic/amlogic-gxl-crypt=
o.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/allwinner/sun8i-ce/sun8i-=
ce.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/bcm/bcm_crypto_spu.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/caam.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/caamalg_desc.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/dpaa2_caam.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/caamhash_desc.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/caam_jr.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/ccree/ccree.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/caam/error.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/hisilicon/hisi_qm.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/hisilicon/hpre/hisi_hpre.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/hisilicon/sec2/hisi_sec2.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/hisilicon/zip/hisi_zip.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/qcom-rng.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/crypto/virtio/virtio_crypto.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/bcm-sba-raid.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/sh/usb-dmac.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/dma/sun6i-dma.mod.o: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/fpga/altera-freeze-bridge.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/firmware/stratix10-rsu.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/fpga/fpga-bridge.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/fpga/of-fpga-region.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/fpga/fpga-region.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/fpga/stratix10-soc.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpio/gpio-bd9571mwv.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpio/gpio-altera.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpio/gpio-wcd934x.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/arm/mali-dp.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/adv7511/adv7511.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/analogix/analogix=
_dp.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/display-connector=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/simple-bridge.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/gpu/drm/bridge/sii902x.mod.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/synopsys/dw-hdmi-=
cec.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/synopsys/dw-hdmi-=
ahb-audio.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/synopsys/dw-hdmi.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/gpu/drm/br=
idge/synopsys/dw-mipi-dsi.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    warning: drivers/gpu/drm/bridge/thc63lvd1024.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/bridge/ti-sn65dsi86.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/drm_ttm_helper.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/gpu/drm/drm_kms_helper.mod.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    warning: drivers/gpu/drm/drm.o: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/etnaviv/etnaviv.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/gpu/drm/ex=
ynos/exynosdrm.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/gpu/drm/drm.mod.o: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/drm_vram_helper.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/hisilicon/kirin/dw_drm_d=
si.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/hisilicon/hibmc/hibmc-dr=
m.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/i2c/ch7006.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/hisilicon/kirin/kirin-dr=
m.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/i2c/sil164.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/lima/lima.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/lima/lima.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/meson/meson_dw_hdmi.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/i2c/tda998x.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/meson/meson-drm.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: unsup=
ported GNU_PROPERTY_TYPE (5  LD [M]  drivers/gpu/drm/panel/panel-lvds.ko
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nouveau.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/panel/panel-simple.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/panel/panel-lvds.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/gpu/drm/panel/panel-truly-nt35597.mod.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/pl111/pl111_drm.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/panfrost/panfrost.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rcar-du/rcar-du-drm.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rcar-du/rcar_cmm.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rcar-du/rcar_dw_hdmi.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rcar-du/rcar_lvds.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/rockchip/rockchipdrm.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/scheduler/gpu-sched.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i-drm-hdmi.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-ld: warning=
: drivers/gpu/drm/sun4i/sun4i-backend.mod.o: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i-drm.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i-frontend.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i-tcon.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun6i_drc.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun4i_tv.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun8i-drm-hdmi.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun6i_mipi_dsi.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun8i_tcon_top.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/sun4i/sun8i-mixer.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/tegra/tegra-drm.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/tegra/tegra-drm.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/gpu/drm/vc=
4/vc4.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/gpu/drm/ttm/ttm.mod.o: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/vc4/vc4.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/host1x/host1x.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/hid/i2c-hid/i2c-hid.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/hwmon/ina2xx.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/hwmon/ina3221.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/hwmon/lm90.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/hwmon/pwm-fan.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/i2c/busses/i2c-bcm2835.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/hwmon/raspberrypi-hwmon.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/i2c/busses/i2c-gpio.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/i2c/busses/i2c-qcom-cci.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/adc/max9611.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/i2c/busses/i2c-qcom-geni.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/adc/qcom-spmi-adc5.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/adc/qcom-vadc-common.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/adc/rockchip_saradc.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/buffer/industrialio-triggere=
d-buffer.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/buffer/kfifo_buf.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/common/cros_ec_sensors/cros_=
ec_sensors.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/common/cros_ec_sensors/cros_=
ec_sensors_core.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/light/isl29018.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: warning: drivers/i=
io/light/cros_ec_light_prox.mod.odrivers/iio/pressure/cros_ec_baro.mod.o: u=
nsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-ld: warning: drivers/iio/pressure/mpl3115.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/input/keyboard/adc-keys.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/input/keyboard/imx_sc_key.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/input/keyboard/snvs_pwrkey.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/input/misc/pm8xxx-vibrator.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/input/touchscreen/atmel_mxt_ts.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/md/dm-log.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mailbox/bcm-flexrm-mailbox.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/md/dm-mirror.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/md/dm-region-hash.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/md/dm-mod.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/md/dm-zero.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/md/md-mod.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/cec/core/cec.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (  LD [M]  drivers/media/common/videobuf2/videobuf2=
-dma-sg.ko
    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/videobuf2=
-dma-contig.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/videobuf2=
-common.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/videobuf2=
-memops.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/videobuf2=
-dma-sg.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/videobuf2=
-v4l2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/common/videobuf2/videobuf2=
-vmalloc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/i2c/ir-kbd-i2c.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/dvb-core/dvb-core.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/i2c/imx219.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/i2c/ov5645.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/exynos-gsc/exynos=
-gsc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar-fcp.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/media/platform/qcom/camss/qcom-camss.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar-vin/rcar-csi=
2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/mc/mc.mod.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar-vin/rcar-vin=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar_drif.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/rcar_fdp1.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/s5p-jpeg/s5p-jpeg=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/s5p-mfc/s5p-mfc.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/sunxi/sun6i-csi/s=
un6i-csi.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/platform/vsp1/vsp1.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-adstech-dvb-=
t-pci.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-anysee.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/media/rc/keymaps/rc-astrometa-t2hybrid.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-apac-viewcom=
p.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-asus-pc39.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-alink-dtu-m.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-ati-tv-wonde=
r-hd-600.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-asus-ps3-100=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermedia-a1=
6d.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermedia-ca=
rdbus.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-ati-x10.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermedia-dv=
bt.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermedia-m1=
35a.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermedia-rm=
-ks.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avertv-303.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-avermedia.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-azurewave-ad=
-tu700.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-beelink-gs1.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-behold-colum=
bus.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-budget-ci-ol=
d.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-cec.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-behold.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-cinergy-1400=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-cinergy.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-d680-dmb.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-delock-61959=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dib0700-nec.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dib0700-rc5.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-digitalnow-t=
inytwin.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-digittrade.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dntv-live-dv=
bt-pro.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dntv-live-dv=
b-t.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dm1105-nec.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dtt200u.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dvico-mce.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dvbsky.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-dvico-portab=
le.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-em-terratec.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-encore-enltv=
-fm53.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-encore-enltv=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-encore-enltv=
2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-eztv.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-evga-indtube=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-flydvb.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-flyvideo.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-fusionhdtv-m=
ce.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-gadmei-rm008=
z.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-geekbox.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-genius-tvgo-=
a11mce.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-gotview7135.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-hisi-tv-demo=
.mod.o: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-ld: 5) type: 0xwar=
ning: c0000000drivers/media/rc/keymaps/rc-hauppauge.mod.o
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-hisi-poplar.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-imon-mce.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-imon-pad.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-iodata-bctv7=
e.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-imon-rsc.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-it913x-v2.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-it913x-v1.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-khadas.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-kaiomy.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-kworld-315u.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-kworld-pc150=
u.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-kworld-plus-=
tv-analog.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-leadtek-y04g=
0051.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-lme2510.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-medion-x10-d=
igitainer.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-manli.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-medion-x10-o=
r2x.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-medion-x10.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-msi-digivox-=
ii.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-msi-digivox-=
iii.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-msi-tvanywhe=
re-plus.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-nebula.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-nec-terratec=
-cinergy-xs.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-npgtech.mod.=
oaarch64-linux-gnu-ld: : unsupported GNU_PROPERTY_TYPE (5warning: ) type: 0=
xdrivers/media/rc/keymaps/rc-msi-tvanywhere.mod.oc0000000: unsupported GNU_=
PROPERTY_TYPE (
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-norwood.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-odroid.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pctv-sedna.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pinnacle-col=
or.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pinnacle-pct=
v-hd.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pinnacle-gre=
y.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pixelview-mk=
12.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pixelview-00=
2t.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pixelview-ne=
w.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-powercolor-r=
eal-angel.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-proteus-2309=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-purpletv.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/media/rc/keymaps/rc-pixelview.mod.o: unsupported GNU_P=
ROPERTY_TYPE (aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-pv=
951.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-rc6-mce.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/media/rc/keymaps/rc-real-audio-220-32-keys.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-reddo.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-streamzap.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-snapstream-f=
irefly.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-su3000.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tanix-tx5max=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  LD [M]  drivers=
/media/rc/keymaps/rc-technisat-ts35.ko
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tanix-tx3min=
i.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tbs-nec.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tango.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-technisat-ts=
35.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-technisat-us=
b2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terratec-cin=
ergy-s2-hd.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terratec-cin=
ergy-c-pci.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terratec-cin=
ergy-xs.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terratec-sli=
m-2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-terratec-sli=
m.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tevii-nec.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-total-media-=
in-hand.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-total-media-=
in-hand-02.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tivo.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-tt-1500.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/media/rc/k=
eymaps/rc-twinhan-dtv-cab-ci.mod.o: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    warning: drivers/media/rc/keymaps/rc-twinhan1027.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-vega-s9x.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-trekstor.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-videomate-m1=
f.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-videomate-s3=
50.mod.o  LD [M]  drivers/media/rc/keymaps/rc-wetek-play2.ko
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-videostrong-=
kii-pro.mod.o: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-ld: 5) type=
: 0xwarning: c0000000drivers/media/rc/keymaps/rc-videomate-tv-pvr.mod.o
    aarch64-linux-gnu-ld: warning: aarch64-linux-gnu-ld: warning: drivers/m=
edia/rc/keymaps/rc-wetek-play2.mod.o: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-ld: warning: drivers/m=
edia/rc/keymaps/rc-wetek-hub.mod.o: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-winfast.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-xbox-dvd.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-x96max.mod.o=
  LD [M]  drivers/media/tuners/mc44s803.ko
    aarch64-linux-gnu-ld: warning: drivers/media/rc/meson-ir.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/keymaps/rc-zx-irdec.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/sunxi-cir.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/mc44s803.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/rc/rc-core.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tda18271.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tda827x.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tda9887.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tda8290.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/mt20xx.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tuner-simple.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tuner-types.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tuner-types.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/tuner-xc2028.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/xc4000.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/tuners/xc5000.mod.o: unsup=
ported GNU_PROPERTY_TYPE (  LD [M]  drivers/media/v4l2-core/v4l2-fwnode.ko
    aarch64-linux-gnu-ld: warning: drivers/media/usb/gspca/gspca_main.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/usb/uvc/uvcvideo.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/media/v4l2-core/v4l2-dv-timings.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: aarch64-linux-gnu-=
ld: warning: drivers/media/v4l2-core/videodev.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    warning: drivers/media/v4l2-core/v4l2-fwnode.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    warning: drivers/mfd/exynos-lpass.mod.o: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mfd/wcd934x.mod.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/misc/eeprom/at25.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/misc/uacce/uacce.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/can/can-dev.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/misc/eeprom/at24.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/can/flexcan.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/can/rcar/rcar_canfd.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/can/rcar/rcar_can.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/dsa/ocelot/mscc_felix.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/broadcom/bnx2x/bnx2=
x.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/broadcom/genet/gene=
t.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/atheros/atl1c/atl1c=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/mellanox/mlx4/mlx4_=
en.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-g=
nu-ld: warning: drivers/net/ethernet/mellanox/mlx4/mlx4_core.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/mellanox/mlx5/core/=
mlx5_core.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/mscc/mscc_ocelot_sw=
itch_lib.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/qualcomm/emac/qcom-=
emac.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/qualcomm/rmnet/rmne=
t.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwma=
c-altr-socfpga.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwma=
c-generic.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwma=
c-imx.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwma=
c-meson.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning:   LD [M]  drivers/net/ethernet/stmicro/s=
tmmac/dwmac-sun8i.ko
    drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.mod.oaarch64-linux-gn=
u-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwma=
c-rk.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwma=
c-qcom-ethqos.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwma=
c-sun8i.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/stmm=
ac-platform.mod.o: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-ld: wa=
rning: drivers/net/ethernet/stmicro/stmmac/stmmac.mod.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ethernet/stmicro/stmmac/dwma=
c-sunxi.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/macvlan.mod.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/macvtap.mod.oaarch64-linux-g=
nu-ld: warning: drivers/net/ipa/ipa.mod.o: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/mdio.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/bcm-phy-lib.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/broadcom.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/bcm7xxx.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/marvell10g.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/mdio-bcm-unimac.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/mdio-mux-meson-g12a.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/mdio-xpcs.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/marvell.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/microchip.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/realtek.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/phy/meson-gxl.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/tap.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/ax88179_178a.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/net/usb/cdc_ether.mod.o: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/cdc_ncm.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/cdc_subset.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/asix.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/dm9601.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0x  LD [M]  drivers/net/usb/lan78xx.ko
    aarch64-linux-gnu-ld: warning: drivers/net/usb/lan78xx.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/mcs7830.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/net1080.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/pegasus.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/plusb.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/r8152.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/smsc75xx.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/smsc95xx.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/rtl8150.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/sr9800.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/usbnet.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/usb/zaurus.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/veth.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/ath10k_c=
ore.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/broadcom/brcm80211/=
brcmfmac/brcmfmac.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/net/wireless/ath/ath10k/ath10k_snoc.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/ath10k_s=
noc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/broadcom/brcm80211/=
brcmutil/brcmutil.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/ath10k_p=
ci.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/marvell/mwifiex/mwi=
fiex.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ti/wl18xx/wl18xx.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/marvell/mwifiex/mwi=
fiex_pcie.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ti/wlcore/wlcore.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/nvme/host/nvme-core.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ti/wlcore/wlcore_sd=
io.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/nvme/host/nvme.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/nvmem/nvme=
m_meson_efuse.mod.oaarch64-linux-gnu-ld: warning: drivers/pci/controller/dw=
c/pcie-tegra194.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/pci/controller/pcie-brcmstb.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pci/controller/pcie-rockchip-hos=
t.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/perf/fsl_imx8_ddr_perf.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/perf/arm_smmuv3_pmu.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/phy/allwinner/phy-sun6i-mipi-dph=
y.mod.oaarch64-linux-gnu-ld: warning: drivers/perf/thunderx2_pmu.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: : unsupported GNU_PROPERTY_TYPE (aarch64-linux-gn=
u-ld: warning: drivers/phy/qualcomm/phy-qcom-qmp.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    warning: drivers/phy/renesas/phy-rcar-gen3-usb3.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/phy/qualco=
mm/phy-qcom-qusb2.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/phy/tegra/phy-tegra194-p2u.mod.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/phy/rockchip/phy-rockchip-pcie.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/phy/rockchip/phy-rockchip-inno-h=
dmi.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_chardev.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_typec.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/power/supply/sbs-battery.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pwm/pwm-bcm2835.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/pwm/pwm-cros-ec.mod.o: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pwm/pwm-meson.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pwm/pwm-rcar.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/pwm/pwm-te=
gra.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pwm/pwm-sun4i.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/regulator/vctrl-regulator.mod.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_common.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_pil_info.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_q6v5.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_q6v5_ipa_notify.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_q6v5_mss.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_q6v5_pas.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/remoteproc/qcom_sysmon.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/reset/rese=
t-qcom-pdc.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/reset/reset-meson-audio-arb.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/rpmsg/qcom_glink_smem.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-ds1307.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-imx-sc.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-meson-vrtc.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000  LD [M]  drivers/rtc/rtc-pcf21=
27.ko
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-pcf85363.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-pcf2127.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-pm8xxx.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-rk808.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-rv8803.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (  LD [M]  drivers/scsi/mpt3sas/mpt3sas.ko
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-snvs.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/rtc/rtc-rx8581.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/scsi/mpt3sas/mpt3sas.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/scsi/ufs/ufs-qcom.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/scsi/raid_class.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/slimbus/slim-qcom-ctrl.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/slimbus/slim-qcom-ngd-ctrl.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/slimbus/slimbus.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/amlogic/meson-canvas.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/qcom/apr.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/qcom/mdt_loader.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/soc/qcom/p=
dr_interface.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/soc/qcom/rmtfs_mem.mod.o: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/qcom/qmi_helpers.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/qcom/socinfo.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soundwire/soundwire-bus.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/spi/spi-bcm2835.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/spi/spi-geni-qcom.mod.o: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    warning: drivers/spi/spi-bitbang.mod.o: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/spi/spi-bcm2835aux.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soundwire/soundwire-qcom.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/spi/spi-imx.mod.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/spi/spi-qcom-qspi.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (aarch64-linux-gnu-ld: 5) type: 0xwarning: c0000000d=
rivers/spi/spi-sh-msiof.mod.o
    aarch64-linux-gnu-ld: warning: aarch64-linux-gnu-ld: drivers/spi/spi-me=
son-spifc.mod.o: unsupported GNU_PROPERTY_TYPE (warning: 5) type: 0xdrivers=
/spi/spi-meson-spicc.mod.oc0000000: unsupported GNU_PROPERTY_TYPE (
    aarch64-linux-gnu-ld: warning: drivers/spi/spidev.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/broadcom/bcm2711_thermal=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/broadcom/brcmstb_thermal=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/imx8mm_thermal.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: aarch64-linux-gnu-ld: warning: drivers/t=
hermal/imx_sc_thermal.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/qcom-spmi-temp-alar=
m.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/rockchip_thermal.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  LD [M]  drivers/usb/gad=
get/udc/tegra-xudc.ko
    aarch64-linux-gnu-ld: warning: drivers/thermal/qoriq_thermal.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/tegra/tegra-bpmp-thermal=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/renesas_usb3.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/tegra-xudc.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/renesas_usbhs/renesas_usbhs.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/typec/tcpm/fusb302.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/typec/hd3ss3220.mod.oaarch64=
-linux-gnu-ld: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: drivers/usb/typec/tcpm/tcpm.mod.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    warning: drivers/usb/typec/typec.mod.o: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/video/backlight/generic_bl.mod.o=
: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-ld: warning: drivers/vid=
eo/backlight/pwm_bl.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-ld: warning: drivers/video/backlight/lp855x_bl.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: drivers/watchdog/m=
eson_wdt.mod.o: unsupported GNU_PROPERTY_TYPE (warning: 5drivers/watchdog/m=
eson_gxbb_wdt.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/watchdog/imx_sc_wdt.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/watchdog/qcom-wdt.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-ld: warning: d=
rivers/watchdog/sunxi_wdt.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: fs/btrfs/btrfs.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: fs/fuse/cuse.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-ld: warning: fs/fuse/fuse.mod.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/blocklayout/blocklayoutdriver.mod=
.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/overlayfs/overlay.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: lib/crc-ccitt.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: lib/crypto/libarc4.mod.o: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    warning: fs/nfs/flexfilelayout/nfs_layout_flexfiles.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/crypto/libdes.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/libcrc32c.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/crypto/libchacha.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/raid6_pq.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/raid6_pq.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/raid6_pq.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/raid6_pq.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zstd/zstd_compress.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zstd/zstd_decompress.mod.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/802/garp.mod.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/802/p8022.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/802/mrp.mod.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/802/stp.mod.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/802/psnap.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/8021q/8021q.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/bluetooth/bluetooth.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: net/bluetooth/hidp/hidp.mod.o: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/bridge/bridge.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-ld: warning: net/can/c=
an-gw.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/can/can-bcm.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/can/can-raw.mod.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/can/can.mod.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/dsa/dsa_core.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    warning: net/dsa/tag_ocelot.mod.o: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/ip_tunnel.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/ip_tables.mod.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning:   LD [M]  net/ipv4/netfilter/iptable_fil=
ter.ko
    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/iptable_mangle.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/iptable_filter.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/nf_defrag_ipv4.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/iptable_nat.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/nf_reject_ipv4.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/netfilter/nf_log_ipv4.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/tunnel4.mod.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6t_REJECT.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/ipv6.mod.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6_tables.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6table_filter.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6table_nat.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/ip6table_mangle.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/nf_defrag_ipv6.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/nf_reject_ipv6.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/netfilter/nf_log_ipv6.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv6/sit.mod.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/llc/llc.mod.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/mac80211/mac80211.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning:   LD [M]  net/netfilter/nf_log_common.ko
    aarch64-linux-gnu-ld: warning: net/netfilter/nf_conntrack.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/nf_log_common.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/nf_nat.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/x_tables.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/xt_CHECKSUM.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/xt_LOG.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/xt_MASQUERADE.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/xt_addrtype.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/xt_nat.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/xt_conntrack.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/netfilter/xt_tcpudp.mod.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/qrtr/ns.mod.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/qrtr/qrtr-smd.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: net/qrtr/qrtr.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/rfkill/rfkill.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sched/act_gate.mod.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    warning: net/qrtr/qrtr-tun.mod.o: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sched/act_gact.mod.o: unsupported GN=
U_PROPERTY_TYPE (5  LD [M]  net/sched/cls_basic.ko
    aarch64-linux-gnu-ld: warning: net/sched/act_mirred.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sched/cls_basic.mod.oaarch64-linux-g=
nu-ld: warning: net/sched/cls_flower.mod.o: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sched/sch_etf.mod.o  LD [M]  net/sch=
ed/sch_ingress.ko
    aarch64-linux-gnu-ld: warning: net/sched/sch_cbs.mod.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-ld: warning: net/sched=
/sch_mqprio.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sched/sch_taprio.mod.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/wireless/cfg80211.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/wireless/cfg80211.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/wireless/cfg80211.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sched/sch_ingress.mod.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/pci/hda/snd-hda-codec-hdmi.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/pci/hda/snd-hda-codec.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/hda/snd-hda-core.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/hda/snd-hda-core.mod.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/pci/hda/snd-hda-tegra.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/bcm/snd-soc-bcm2835-i2s.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-ak4613.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-da7219.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-cros-ec-codec.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-dmic.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-es7134.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-es7241.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-hdmi-codec.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-max98357a.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-max98927.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-pcm3168a-i2c.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: sound/soc/codecs/snd-soc-pcm3168a.mod.oaarch64-linux-gnu-ld: :=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: sound/soc/codecs/snd-soc-rl6231.mod.o: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-rt5514-spi.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: aarch64-linux-gnu-ld: warning: sound/soc/codecs/s=
nd-soc-rt5663.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-simple-amplifie=
r.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-rt5514.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-rt5645.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: sound/soc/codecs/snd-soc-spdif-rx.mod.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-spdif-tx.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-tas571x.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: sound/soc/codecs/snd-soc-wcd934x.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-wsa881x.mod.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/fsl/snd-soc-fsl-sai.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/codecs/snd-soc-wm8904.mod.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/generic/snd-soc-audio-graph-ca=
rd.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/generic/snd-soc-simple-card-ut=
ils.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/generic/snd-soc-simple-card.mo=
d.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-aiu.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-fifo.m=
od.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-frddr.=
mod.o: unsupported GNU_PROPERTY_TYPE (5  LD [M]  sound/soc/meson/snd-soc-me=
son-axg-sound-card.ko
    aarch64-linux-gnu-ld: warning: aarch64-linux-gnu-ld: warning: sound/soc=
/meson/snd-soc-meson-axg-pdm.mod.o: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-spdifi=
n.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-spdifo=
ut.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: sound/soc/meson/snd-soc-meson-axg-tdm-formatter.mod.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-tdmout=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-ld: war=
ning: sound/soc/meson/snd-soc-meson-axg-toddr.mod.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-tdm-in=
terface.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-axg-tdmin.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-card-utils=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-codec-glue=
.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-g12a-toaco=
dec.mod.o: unsupported GNU_PROPERTY_TYPE (  LD [M]  sound/soc/qcom/qdsp6/q6=
adm.ko
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-g12a-tohdm=
itx.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-t9015.mod.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6adm.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6afe-dai.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/meson/snd-soc-meson-gx-sound-c=
ard.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6afe.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6asm-dai.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6asm.mod.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6dsp-common.mod.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6core.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/qdsp6/q6routing.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/snd-soc-qcom-common.mod.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/qcom/snd-soc-sdm845.mod.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/rockchip/snd-soc-rockchip-i2s.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning:   LD [M]  sound/soc/rockchip/snd-soc-roc=
kchip-rt5645.ko
    aarch64-linux-gnu-ld: warning: sound/soc/rockchip/snd-soc-rockchip-pcm.=
mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/rockchip/snd-soc-rockchip-rt56=
45.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/rockchip/snd-soc-rockchip-spdi=
f.mod.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/sh/rcar/snd-soc-rcar.mod.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/soc/sunxi/sun4i-spdif.mod.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (=
1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) =
differs from / (2)
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/arch/ar=
m64/crypto/aes-neon-blk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/arch/ar=
m64/crypto/aes-neon-bs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/arch/ar=
m64/crypto/chacha-neon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/arch/ar=
m64/crypto/crct10dif-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/arch/ar=
m64/crypto/sha3-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/arch/ar=
m64/crypto/sha512-arm64.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/arch/ar=
m64/crypto/sha512-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/arch/ar=
m64/crypto/sm3-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/arch/ar=
m64/lib/xor-neon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
af_alg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
algif_rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
authenc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
authencesn.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
blake2b_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
cbc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
ccm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
cmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
crypto_engine.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
ctr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
des_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
dh_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
ecb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
ecc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
ecdh_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
gcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
ghash-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
md5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
sha3_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
sha512_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
sm3_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
sm4_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
xor.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
xts.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/crypto/=
xxhash_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/base/regmap/regmap-sdw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/base/regmap/regmap-slimbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/block/nbd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/bluetooth/btbcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/bluetooth/btintel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/bluetooth/btqca.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/bluetooth/btrtl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/bluetooth/btusb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/bluetooth/hci_uart.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/bcm2835-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/cavium-rng-vf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/cavium-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/exynos-trng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/hisi-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/hisi-trng-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/iproc-rng200.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/meson-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/mtk-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/omap-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/optee-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/rng-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/hw_random/xgene-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/ipmi/ipmi_devintf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/ipmi/ipmi_msghandler.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/char/ipmi/ipmi_si.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/clk/bcm/clk-raspberrypi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/clk/meson/axg-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/clk/meson/clk-phase.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/clk/meson/sclk-div.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/clk/qcom/camcc-sdm845.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/cpufreq/cppc_cpufreq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/cpufreq/cpufreq_conservative.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/cpufreq/cpufreq_powersave.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/cpufreq/imx-cpufreq-dt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/cpufreq/raspberrypi-cpufreq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/cpufreq/sun50i-cpufreq-nvmem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/allwinner/sun8i-ce/sun8i-ce.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/amlogic/amlogic-gxl-crypto.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/bcm/bcm_crypto_spu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/caam/caam.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/caam/caam_jr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/caam/caamalg_desc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/caam/caamhash_desc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/caam/dpaa2_caam.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/caam/error.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/ccree/ccree.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/hisilicon/hisi_qm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/hisilicon/hpre/hisi_hpre.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/hisilicon/sec2/hisi_sec2.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/hisilicon/zip/hisi_zip.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/qcom-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/crypto/virtio/virtio_crypto.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/dma/bcm-sba-raid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/dma/sh/usb-dmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/dma/sun6i-dma.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/firmware/stratix10-rsu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/fpga/altera-freeze-bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/fpga/fpga-bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/fpga/fpga-region.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/fpga/of-fpga-region.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/fpga/stratix10-soc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpio/gpio-altera.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpio/gpio-bd9571mwv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpio/gpio-wcd934x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/arm/mali-dp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/adv7511/adv7511.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/analogix/analogix_dp.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/display-connector.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/sii902x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/simple-bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/synopsys/dw-hdmi-cec.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/synopsys/dw-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/synopsys/dw-mipi-dsi.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/thc63lvd1024.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/bridge/ti-sn65dsi86.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/drm_kms_helper.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/drm_ttm_helper.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/drm_vram_helper.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/etnaviv/etnaviv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/exynos/exynosdrm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/hisilicon/hibmc/hibmc-drm.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/hisilicon/kirin/dw_drm_dsi.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/hisilicon/kirin/kirin-drm.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/i2c/ch7006.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/i2c/sil164.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/i2c/tda998x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/lima/lima.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/lima/lima.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/meson/meson-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/meson/meson_dw_hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/msm/msm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/msm/msm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/msm/msm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/nouveau/nouveau.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/panel/panel-lvds.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/panel/panel-simple.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/panel/panel-truly-nt35597.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/panfrost/panfrost.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/pl111/pl111_drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/rcar-du/rcar-du-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/rcar-du/rcar_cmm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/rcar-du/rcar_dw_hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/rcar-du/rcar_lvds.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/rockchip/rockchipdrm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/scheduler/gpu-sched.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun4i-backend.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun4i-drm-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun4i-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun4i-frontend.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun4i-tcon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun4i_tv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun6i_drc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun6i_mipi_dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun8i-drm-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun8i-mixer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/sun4i/sun8i_tcon_top.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/tegra/tegra-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/tegra/tegra-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/ttm/ttm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/vc4/vc4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/drm/vc4/vc4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/gpu/host1x/host1x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/hid/i2c-hid/i2c-hid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/hwmon/ina2xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/hwmon/ina3221.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/hwmon/lm90.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/hwmon/pwm-fan.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/hwmon/raspberrypi-hwmon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/i2c/busses/i2c-bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/i2c/busses/i2c-gpio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/i2c/busses/i2c-qcom-cci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/i2c/busses/i2c-qcom-geni.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/adc/max9611.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/adc/qcom-spmi-adc5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/adc/qcom-vadc-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/adc/rockchip_saradc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/buffer/industrialio-triggered-buffer.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/buffer/kfifo_buf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/common/cros_ec_sensors/cros_ec_sensors.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/common/cros_ec_sensors/cros_ec_sensors_core.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/light/cros_ec_light_prox.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/light/isl29018.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/pressure/cros_ec_baro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/iio/pressure/mpl3115.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/input/keyboard/adc-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/input/keyboard/imx_sc_key.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/input/keyboard/snvs_pwrkey.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/input/misc/pm8xxx-vibrator.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/input/touchscreen/atmel_mxt_ts.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/mailbox/bcm-flexrm-mailbox.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/md/dm-log.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/md/dm-mirror.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/md/dm-mod.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/md/dm-region-hash.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/md/dm-zero.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/md/md-mod.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/cec/core/cec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/common/videobuf2/videobuf2-common.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/common/videobuf2/videobuf2-dma-contig.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/common/videobuf2/videobuf2-dma-sg.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/common/videobuf2/videobuf2-memops.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/common/videobuf2/videobuf2-v4l2.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/common/videobuf2/videobuf2-vmalloc.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/dvb-core/dvb-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/i2c/imx219.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/i2c/ir-kbd-i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/i2c/ov5645.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/mc/mc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/exynos-gsc/exynos-gsc.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/qcom/camss/qcom-camss.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/rcar-fcp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/rcar-vin/rcar-csi2.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/rcar-vin/rcar-vin.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/rcar_drif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/rcar_fdp1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/s5p-jpeg/s5p-jpeg.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/s5p-mfc/s5p-mfc.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/sunxi/sun6i-csi/sun6i-csi.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/platform/vsp1/vsp1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-adstech-dvb-t-pci.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-alink-dtu-m.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-anysee.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-apac-viewcomp.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-astrometa-t2hybrid.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-asus-pc39.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-asus-ps3-100.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-ati-tv-wonder-hd-600.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-ati-x10.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-avermedia-a16d.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-avermedia-cardbus.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-avermedia-dvbt.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-avermedia-m135a.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-avermedia-m733a-rm-k6.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-avermedia-rm-ks.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-avermedia.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-avertv-303.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-azurewave-ad-tu700.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-beelink-gs1.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-behold-columbus.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-behold.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-budget-ci-old.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-cec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-cinergy-1400.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-cinergy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-d680-dmb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-delock-61959.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-dib0700-nec.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-dib0700-rc5.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-digitalnow-tinytwin.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-digittrade.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-dm1105-nec.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-dntv-live-dvb-t.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-dntv-live-dvbt-pro.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-dtt200u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-dvbsky.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-dvico-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-dvico-portable.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-em-terratec.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-encore-enltv-fm53.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-encore-enltv.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-encore-enltv2.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-evga-indtube.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-eztv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-flydvb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-flyvideo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-fusionhdtv-mce.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-gadmei-rm008z.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-geekbox.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-genius-tvgo-a11mce.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-gotview7135.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-hauppauge.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-hisi-poplar.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-hisi-tv-demo.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-imon-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-imon-pad.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-imon-rsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-iodata-bctv7e.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-it913x-v1.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-it913x-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-kaiomy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-khadas.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-kworld-315u.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-kworld-pc150u.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-kworld-plus-tv-analog.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-leadtek-y04g0051.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-lme2510.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-manli.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-medion-x10-digitainer.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-medion-x10-or2x.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-medion-x10.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-msi-digivox-ii.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-msi-digivox-iii.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-msi-tvanywhere-plus.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-msi-tvanywhere.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-nebula.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-nec-terratec-cinergy-xs.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-norwood.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-npgtech.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-odroid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-pctv-sedna.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-pinnacle-color.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-pinnacle-grey.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-pinnacle-pctv-hd.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-pixelview-002t.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-pixelview-mk12.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-pixelview-new.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-pixelview.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-powercolor-real-angel.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-proteus-2309.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-purpletv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-pv951.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-rc6-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-real-audio-220-32-keys.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-reddo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-snapstream-firefly.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-streamzap.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-su3000.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-tango.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-tanix-tx3mini.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-tanix-tx5max.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-tbs-nec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-technisat-ts35.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-technisat-usb2.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-terratec-cinergy-c-pci.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-terratec-cinergy-s2-hd.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-terratec-cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-terratec-slim-2.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-terratec-slim.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-tevii-nec.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-tivo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-total-media-in-hand-02.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-total-media-in-hand.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-trekstor.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-tt-1500.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-twinhan-dtv-cab-ci.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-twinhan1027.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-vega-s9x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-videomate-m1f.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-videomate-s350.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-videomate-tv-pvr.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-videostrong-kii-pro.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-wetek-hub.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-wetek-play2.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-winfast-usbii-deluxe.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-winfast.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-x96max.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-xbox-dvd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/keymaps/rc-zx-irdec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/meson-ir.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/rc-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/rc/sunxi-cir.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/mc44s803.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/mt20xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/tda18271.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/tda827x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/tda8290.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/tda9887.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/tuner-simple.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/tuner-types.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/tuner-types.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/tuner-xc2028.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/xc4000.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/tuners/xc5000.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/usb/gspca/gspca_main.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/usb/uvc/uvcvideo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/v4l2-core/v4l2-dv-timings.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/v4l2-core/v4l2-fwnode.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/v4l2-core/v4l2-mem2mem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/media/v4l2-core/videodev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/mfd/exynos-lpass.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/mfd/wcd934x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/misc/eeprom/at24.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/misc/eeprom/at25.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/misc/uacce/uacce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/can/can-dev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/can/flexcan.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/can/rcar/rcar_can.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/can/rcar/rcar_canfd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/dsa/ocelot/mscc_felix.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/atheros/atl1c/atl1c.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/broadcom/bnx2x/bnx2x.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/broadcom/genet/genet.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/mellanox/mlx4/mlx4_core.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/mellanox/mlx4/mlx4_en.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/mellanox/mlx5/core/mlx5_core.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/mscc/mscc_ocelot_switch_lib.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/qualcomm/emac/qcom-emac.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/qualcomm/rmnet/rmnet.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-altr-socfpga.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-generic.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-imx.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-ipq806x.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-meson.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-meson8b.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-rk.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-sun8i.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/dwmac-sunxi.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/stmmac-platform.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ethernet/stmicro/stmmac/stmmac.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ipa/ipa.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ipa/ipa.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ipa/ipa.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/ipa/ipa.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/macvlan.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/macvtap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/mdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/bcm-phy-lib.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/bcm7xxx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/broadcom.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/marvell.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/marvell10g.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/mdio-bcm-unimac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/mdio-mux-meson-g12a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/mdio-xpcs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/meson-gxl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/microchip.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/phy/realtek.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/tap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/asix.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/ax88179_178a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/cdc_ether.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/cdc_ncm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/cdc_subset.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/dm9601.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/lan78xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/mcs7830.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/net1080.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/pegasus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/plusb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/r8152.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/rtl8150.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/smsc75xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/smsc95xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/sr9800.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/usbnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/usb/zaurus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/veth.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/ath/ath.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/ath/ath10k/ath10k_core.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/ath/ath10k/ath10k_pci.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/ath/ath10k/ath10k_snoc.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/ath/ath10k/ath10k_snoc.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/broadcom/brcm80211/brcmfmac/brcmfmac.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/broadcom/brcm80211/brcmutil/brcmutil.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/marvell/mwifiex/mwifiex.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/marvell/mwifiex/mwifiex_pcie.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/ti/wl18xx/wl18xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/ti/wlcore/wlcore.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/net/wireless/ti/wlcore/wlcore_sdio.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/nvme/host/nvme-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/nvme/host/nvme.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/nvmem/nvmem_meson_efuse.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/pci/controller/dwc/pcie-tegra194.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/pci/controller/pcie-brcmstb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/pci/controller/pcie-rockchip-host.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/perf/arm_smmuv3_pmu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/perf/fsl_imx8_ddr_perf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/perf/thunderx2_pmu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/phy/allwinner/phy-sun6i-mipi-dphy.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/phy/qualcomm/phy-qcom-qmp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/phy/qualcomm/phy-qcom-qusb2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/phy/renesas/phy-rcar-gen3-usb3.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/phy/rockchip/phy-rockchip-inno-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/phy/rockchip/phy-rockchip-pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/phy/tegra/phy-tegra194-p2u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/platform/chrome/cros_ec_chardev.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/platform/chrome/cros_ec_typec.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/power/supply/sbs-battery.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/pwm/pwm-bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/pwm/pwm-cros-ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/pwm/pwm-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/pwm/pwm-rcar.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/pwm/pwm-sun4i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/pwm/pwm-tegra.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/regulator/vctrl-regulator.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/remoteproc/qcom_common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/remoteproc/qcom_pil_info.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/remoteproc/qcom_q6v5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/remoteproc/qcom_q6v5_ipa_notify.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/remoteproc/qcom_q6v5_mss.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/remoteproc/qcom_q6v5_pas.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/remoteproc/qcom_sysmon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/reset/reset-meson-audio-arb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/reset/reset-qcom-pdc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rpmsg/qcom_glink_smem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-ds1307.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-imx-sc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-meson-vrtc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-pcf2127.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-pcf85363.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-pm8xxx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-rk808.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-rv8803.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-rx8581.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/rtc/rtc-snvs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/scsi/mpt3sas/mpt3sas.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/scsi/raid_class.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/scsi/ufs/ufs-qcom.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/slimbus/slim-qcom-ctrl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/slimbus/slim-qcom-ngd-ctrl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/slimbus/slimbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/soc/amlogic/meson-canvas.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/soc/qcom/apr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/soc/qcom/mdt_loader.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/soc/qcom/pdr_interface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/soc/qcom/qmi_helpers.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/soc/qcom/rmtfs_mem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/soc/qcom/socinfo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/soundwire/soundwire-bus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/soundwire/soundwire-qcom.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spi-bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spi-bcm2835aux.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spi-bitbang.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spi-geni-qcom.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spi-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spi-meson-spicc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spi-meson-spifc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spi-qcom-qspi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spi-sh-msiof.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/spi/spidev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/thermal/broadcom/bcm2711_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/thermal/broadcom/bcm2835_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/thermal/broadcom/brcmstb_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/thermal/imx8mm_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/thermal/imx_sc_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/thermal/qcom/qcom-spmi-temp-alarm.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/thermal/qoriq_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/thermal/rockchip_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/thermal/tegra/tegra-bpmp-thermal.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/usb/gadget/udc/renesas_usb3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/usb/gadget/udc/tegra-xudc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/usb/renesas_usbhs/renesas_usbhs.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/usb/typec/hd3ss3220.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/usb/typec/tcpm/fusb302.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/usb/typec/tcpm/tcpm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/usb/typec/typec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/video/backlight/generic_bl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/video/backlight/lp855x_bl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/video/backlight/pwm_bl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/watchdog/imx_sc_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/watchdog/meson_gxbb_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/watchdog/meson_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/watchdog/qcom-wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/drivers=
/watchdog/sunxi_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs/btrf=
s/btrfs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs/fuse=
/cuse.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs/fuse=
/fuse.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs/nfs/=
blocklayout/blocklayoutdriver.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs/nfs/=
flexfilelayout/nfs_layout_flexfiles.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/fs/over=
layfs/overlay.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/crc=
-ccitt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/cry=
pto/libarc4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/cry=
pto/libchacha.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/cry=
pto/libdes.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/lib=
crc32c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/rai=
d6/raid6_pq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/rai=
d6/raid6_pq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/rai=
d6/raid6_pq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/rai=
d6/raid6_pq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/zst=
d/zstd_compress.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/lib/zst=
d/zstd_decompress.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/802=
/garp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/802=
/mrp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/802=
/p8022.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/802=
/psnap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/802=
/stp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/802=
1q/8021q.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/blu=
etooth/bluetooth.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/blu=
etooth/hidp/hidp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/bri=
dge/bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/can=
/can-bcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/can=
/can-gw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/can=
/can-raw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/can=
/can.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/dsa=
/dsa_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/dsa=
/tag_ocelot.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/ip_tunnel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/netfilter/ip_tables.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/netfilter/ipt_REJECT.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/netfilter/iptable_filter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/netfilter/iptable_mangle.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/netfilter/iptable_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/netfilter/nf_defrag_ipv4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/netfilter/nf_log_ipv4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/netfilter/nf_reject_ipv4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
4/tunnel4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/ipv6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/netfilter/ip6_tables.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/netfilter/ip6t_REJECT.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/netfilter/ip6table_filter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/netfilter/ip6table_mangle.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/netfilter/ip6table_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/netfilter/nf_defrag_ipv6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/netfilter/nf_log_ipv6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/netfilter/nf_reject_ipv6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/ipv=
6/sit.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/llc=
/llc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/mac=
80211/mac80211.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/mac=
80211/mac80211.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/nf_conntrack.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/nf_log_common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/nf_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/x_tables.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/xt_CHECKSUM.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/xt_LOG.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/xt_MASQUERADE.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/xt_addrtype.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/xt_conntrack.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/xt_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/net=
filter/xt_tcpudp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/qrt=
r/ns.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/qrt=
r/qrtr-smd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/qrt=
r/qrtr-tun.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/qrt=
r/qrtr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/rfk=
ill/rfkill.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/act_gact.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/act_gate.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/act_mirred.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/cls_basic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/cls_flower.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/sch_cbs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/sch_etf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/sch_ingress.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/sch_mqprio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/sch=
ed/sch_taprio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/wir=
eless/cfg80211.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/wir=
eless/cfg80211.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/net/wir=
eless/cfg80211.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/h=
da/snd-hda-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/h=
da/snd-hda-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/p=
ci/hda/snd-hda-codec-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/p=
ci/hda/snd-hda-codec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/p=
ci/hda/snd-hda-tegra.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/bcm/snd-soc-bcm2835-i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-ak4613.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-cros-ec-codec.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-da7219.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-dmic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-es7134.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-es7241.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-hdmi-codec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-max98357a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-max98927.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-pcm3168a-i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-pcm3168a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-rl6231.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-rt5514-spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-rt5514.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-rt5645.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-rt5663.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-simple-amplifier.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-spdif-rx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-spdif-tx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-tas571x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-wcd934x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-wm8904.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/codecs/snd-soc-wsa881x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/fsl/snd-soc-fsl-sai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/generic/snd-soc-audio-graph-card.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/generic/snd-soc-simple-card-utils.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/generic/snd-soc-simple-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-aiu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-fifo.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-frddr.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-pdm.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-sound-card.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-spdifin.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-spdifout.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-tdm-formatter.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-tdm-interface.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-tdmin.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-tdmout.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-axg-toddr.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-card-utils.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-codec-glue.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-g12a-toacodec.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-g12a-tohdmitx.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-gx-sound-card.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/meson/snd-soc-meson-t9015.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/qdsp6/q6adm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/qdsp6/q6afe-dai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/qdsp6/q6afe.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/qdsp6/q6asm-dai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/qdsp6/q6asm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/qdsp6/q6core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/qdsp6/q6dsp-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/qdsp6/q6routing.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/snd-soc-qcom-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/qcom/snd-soc-sdm845.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/rockchip/snd-soc-rk3399-gru-sound.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/rockchip/snd-soc-rockchip-i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/rockchip/snd-soc-rockchip-pcm.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/rockchip/snd-soc-rockchip-rt5645.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/rockchip/snd-soc-rockchip-spdif.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/sh/rcar/snd-soc-rcar.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /home/buildslave/workspace/kernel-bui=
ld/linux/build/_modules_/lib/modules/5.8.0-rc6-next-20200720/kernel/sound/s=
oc/sunxi/sun4i-spdif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 8 warnings, 0 section mismatches

Warnings:
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (=
1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) =
differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 8 warnings, 0 section mismatches

Warnings:
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (=
1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) =
differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 =
section mismatches

Warnings:
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (=
1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) =
differs from / (2)

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/iio/iio_core_trigger.h:42:13: warning: =E2=80=98iio_device_unre=
gister_trigger_consumer=E2=80=99 defined but not used [-Wunused-function]
    drivers/iio/iio_core_trigger.h:33:12: warning: =E2=80=98iio_device_regi=
ster_trigger_consumer=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: unmet direct dependencies detected for CLK_HSDK
    WARNING: unmet direct dependencies detected for CLK_HSDK

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 FAIL, 5 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/video/console/newport_con.c:365:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?
    drivers/video/console/newport_con.c:368:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?
    drivers/video/console/newport_con.c:370:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?
    drivers/video/console/newport_con.c:594:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?
    drivers/video/console/newport_con.c:598:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/compiler_attributes.h:214:41: warning: statement will nev=
er be executed [-Wswitch-unreachable]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    ERROR: modpost: "__compiletime_assert_531" [drivers/gpu/drm/vc4/vc4.ko]=
 undefined!

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnin=
gs, 0 section mismatches

Errors:
    ip6_vti.c:(.text+0x1b74): undefined reference to `xfrm6_tunnel_spi_look=
up'

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/gpu/drm/omapdrm/omap_connector.c:92:9: warning: braces around s=
calar initializer

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/compiler_attributes.h:214:41: warning: statement will nev=
er be executed [-Wswitch-unreachable]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warn=
ing, 0 section mismatches

Errors:
    include/linux/rculist.h:727:30: error: left-hand operand of comma expre=
ssion has no effect [-Werror=3Dunused-value]
    include/linux/rculist.h:727:30: error: left-hand operand of comma expre=
ssion has no effect [-Werror=3Dunused-value]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
