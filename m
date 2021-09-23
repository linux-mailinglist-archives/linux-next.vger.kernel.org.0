Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6B64158E5
	for <lists+linux-next@lfdr.de>; Thu, 23 Sep 2021 09:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbhIWHQX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Sep 2021 03:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234343AbhIWHQW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Sep 2021 03:16:22 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B4FC061574
        for <linux-next@vger.kernel.org>; Thu, 23 Sep 2021 00:14:51 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id me1so3811471pjb.4
        for <linux-next@vger.kernel.org>; Thu, 23 Sep 2021 00:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jxWvjRCPPNLpYHY2l7C9QCMWVbGB9O4hLwSW5pg0YT0=;
        b=TUK7rrmS3t4SpkmZYh7GIxPMcGgR427eGPzzsl8gviE3Ow4PHL4g5Z4h+dw8SXTSK3
         LbLdFepJFyQAiykv5157tt8e+gejd9/wpqvFmRf4n23dTBZ1NTHEOw+/ssmD2t/1rC2r
         N3rPfRCwy5Qkf/SESxJDwmU0GF+V6khDt5emQhlxkCST0RMwhGe8jSvo55VYhy2UlPGn
         1lpnAfkzkK7tgg6+2j4zbM12P46sAkGxXWjj8bKUw6VbMx3vPLMmySu26Wb6AL5cjQNO
         1AGEVA+Ah3uZqOqDtKHKAMv6oC+5EZF3LRBBNRGAaHviQzvbiSUzETvBD86HelxFkcaj
         0v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jxWvjRCPPNLpYHY2l7C9QCMWVbGB9O4hLwSW5pg0YT0=;
        b=skmyBctSkp2j+6rSyR2R9IfmGGLle7HlWHjvyDCYM3REWCuAZ49ZU9olo9fbfFANEW
         4j/JJTpsH44tx2QeDrFDI/Yu9to+Q0l/8F38iKEq+OMjii0fFIll4+zeoMakC1yOo75z
         Hcz1uwTlTivWUvVkkpsEI32ul6ZMlJ4BMtt2oZguprEevqYkZKohm6+uRgkafIQp2V9v
         7Fy7TCZO6Tp9yz+OCB+UBti4GK073wolNO3UqHv7Bu9p2735pj0GOGnYRIZgKHjRw56Y
         5avLmUcGbcemc8IJWNArNLZLpcxt43bHbysUw0xYUb54M2QuX1oVi+JNw6kYLTvnUcum
         Wh7A==
X-Gm-Message-State: AOAM5324MGAo99y+cIHnMThvtP/ssUr0b9nrTwU17R7EnnGjB1tqX4A2
        4wd8QJZPoqZ57C9okz3eopFML1rGRafUGBe3
X-Google-Smtp-Source: ABdhPJyvpYygjfdjNMY+g/oP9oftNzC1nA0qk2hn99VwgEtbrL6RWnvUyNmhlNzU7QgGzKyMIEiZMg==
X-Received: by 2002:a17:90b:120c:: with SMTP id gl12mr3635230pjb.231.1632381288799;
        Thu, 23 Sep 2021 00:14:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m9sm4454525pfo.44.2021.09.23.00.14.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 00:14:48 -0700 (PDT)
Message-ID: <614c2968.1c69fb81.da0f.cf75@mx.google.com>
Date:   Thu, 23 Sep 2021 00:14:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210923
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 208 builds: 4 failed, 204 passed, 5 errors,
 1677 warnings (next-20210923)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 208 builds: 4 failed, 204 passed, 5 errors, 1677 warning=
s (next-20210923)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210923/

Tree: next
Branch: master
Git Describe: next-20210923
Git Commit: bc5aa70f26995791074a00da8b57ead3a9c1a646
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

mips:
    decstation_64_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL
    xway_defconfig: (gcc-8) FAIL

riscv:
    defconfig+CONFIG_EFI=3Dn: (clang-12) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-8): 3 warnings
    tinyconfig (gcc-8): 1 warning

arm64:
    defconfig (clang-12): 816 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 805 warnings
    defconfig+kselftest (gcc-8): 1 warning

arm:
    bcm2835_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (clang-12): 20 warnings

i386:

mips:
    32r2el_defconfig (gcc-8): 1 warning
    32r2el_defconfig+kselftest (gcc-8): 2 warnings
    ci20_defconfig (gcc-8): 1 warning
    db1xxx_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    xway_defconfig (gcc-8): 2 errors, 3 warnings

riscv:
    defconfig (gcc-8): 1 warning
    defconfig+CONFIG_EFI=3Dn (clang-12): 1 error, 2 warnings
    defconfig+kselftest (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 7 warnings

x86_64:
    allmodconfig (clang-12): 2 errors, 6 warnings
    allnoconfig (clang-10): 3 warnings

Errors summary:

    1    drivers/net/ethernet/lantiq_etop.c:673:8: error: implicit declarat=
ion of function =E2=80=98device_property_read_u32=E2=80=99; did you mean =
=E2=80=98device_driver_attach=E2=80=99? [-Werror=3Dimplicit-function-declar=
ation]
    1    drivers/net/ethernet/lantiq_etop.c:265:55: error: =E2=80=98rx_burs=
t_len=E2=80=99 undeclared (first use in this function)
    1    arch/riscv/include/asm/jump_label.h:49:36: error: Unsupported relo=
cation type

Warnings summary:

    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv7-a' [-Wunused-command-line-argument]
    8    kernel/sched/debug.c:460:41: warning: unused variable =E2=80=98sta=
ts=E2=80=99 [-Wunused-variable]
    2    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/fsl/snd-soc-fsl-audmix.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210=
-i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210=
-dmic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210=
-ahub.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210=
-admaif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra186=
-dspk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra-pc=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra-au=
dio-graph-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/sunxi/sun4i-i2s.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/sh/rcar/snd-soc-rcar.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockc=
hip-pcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockc=
hip-i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rk339=
9-gru-sound.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-lpass-pla=
tform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6routing.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6dsp-commo=
n.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6core.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6asm.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6asm-dai.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe-clock=
s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6adm.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-gx=
-sound-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-g1=
2a-tohdmitx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-co=
dec-glue.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ca=
rd-utils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-toddr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-tdmout.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-tdmin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-tdm-interface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-tdm-formatter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-spdifout.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-spdifin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-pdm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-frddr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-fifo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-simple=
-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-simple=
-card-utils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-sgtl50=
00.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-audmux=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-esai.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-easrc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-asoc-c=
ard.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/imx-pcm-dma.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8994.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8960.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm-hubs=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-simple-=
amplifier.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-sgtl500=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5663.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5659.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5645.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5514-=
spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rl6231.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-pcm3168=
a-i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-msm8916=
-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-max9835=
7a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-lpass-w=
sa-macro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-lpass-v=
a-macro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-hdmi-co=
dec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-gtm601.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-es7241.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-dmic.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-da7219.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-ak4613.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/pci/hda/snd-hda-codec.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/hda/snd-hda-core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/wireless/cfg80211.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_taprio.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_mqprio.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_ingress.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_etf.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/cls_flower.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/act_mirred.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/qrtr/qrtr.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/qrtr/qrtr-tun.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/qrtr/qrtr-smd.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/qrtr/ns.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/nfc/nfc.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/nfc/nci/nci.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_tcpudp.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_nat.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_conntrack.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_addrtype.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_MASQUERADE.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_CHECKSUM.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/x_tables.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/nf_nat.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/nf_log_syslog.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/nf_conntrack.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/mac80211/mac80211.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/llc/llc.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/sit.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/nf_reject_ipv=
6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/nf_defrag_ipv=
6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6table_nat.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6_tables.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/ipv6.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/tunnel4.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/nf_reject_ipv=
4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/iptable_mangl=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/iptable_filte=
r.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/ipt_REJECT.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/ip_tables.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/ip_tunnel.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/dsa/tag_ocelot_8021q.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/dsa/tag_ocelot.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/dsa/dsa_core.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/can/can-raw.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/can/can-bcm.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/bluetooth/hidp/hidp.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/bluetooth/bluetooth.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/8021q/8021q.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/802/stp.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/802/garp.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/raid6/raid6_pq.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/libcrc32c.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libsm4.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/crc-ccitt.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/fs/overlayfs/overlay.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/fs/fuse/fuse.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/fs/btrfs/btrfs.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/sunxi_wdt.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/sl28cpld_wdt.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/qcom-wdt.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/imx_sc_wdt.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/video/backlight/lp855x_b=
l.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/typec.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/tcpm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/tcpci.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/fusb302.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/usbserial.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/usb_wwan.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/option.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/ftdi_sio.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/renesas_usbhs/renesa=
s_usbhs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/host/xhci-pci.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/udc/renesas_u=
sb3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/libcomposite.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_obex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_ncm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_eem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_ecm_subset.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_ecm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/u_se=
rial.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/u_et=
her.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/tegra/tegra-bpmp=
-thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/rockchip_thermal=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/qoriq_thermal.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/broadcom/brcmstb=
_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spidev.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-sh-msiof.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-rpc-if.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-qcom-qspi.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-meson-spifc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-meson-spicc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-imx.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-geni-qcom.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-dw-mmio.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bitbang.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bcm2835aux.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soundwire/soundwire-qcom=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soundwire/soundwire-bus.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/rmtfs_mem.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/pdr_interface.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/mdt_loader.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/apr.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soc/mediatek/mtk-devapc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soc/amlogic/meson-canvas=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/scsi/mpt3sas/mpt3sas.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pcf85363.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pcf2127.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-m41t80.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-imx-sc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-hym8563.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-raspberrypi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-qcom-pdc.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-meson-audio-=
arb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-berlin.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_sysmon.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_q6v5_pas=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_q6v5_mss=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_q6v5.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_pil_info=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_common.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/regulator/vctrl-regulato=
r.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/regulator/tps65132-regul=
ator.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-tegra.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-sl28cpld.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-cros-ec.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/sbs-battery=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/power/reset/qcom-pon.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/platform/chrome/cros_ec_=
typec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/platform/chrome/cros_ec_=
chardev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pinctrl/qcom/pinctrl-lpa=
ss-lpi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/rockchip/phy-rockchi=
p-inno-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/renesas/phy-rcar-gen=
3-usb3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/qualcomm/phy-qcom-qu=
sb2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/qualcomm/phy-qcom-qm=
p.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/mediatek/phy-mtk-hdm=
i-drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/freescale/phy-fsl-im=
x8-mipi-dphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/allwinner/phy-sun6i-=
mipi-dphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/perf/fsl_imx8_ddr_perf.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/perf/arm_smmuv3_pmu.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pci/endpoint/functions/p=
ci-epf-test.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/pcie-rock=
chip-host.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/pcie-brcm=
stb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/nfc/s3fwrn5/s3fwrn5.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ti/wlcore/w=
lcore_sdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ti/wl18xx/w=
l18xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/broadcom/br=
cm80211/brcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/=
ath10k_pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/=
ath10k_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/zaurus.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/sr9800.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/smsc75xx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/rtl8150.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/r8152.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/plusb.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/pegasus.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/mcs7830.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/lan78xx.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/cdc_subset.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/cdc_ncm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/cdc_ether.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/tap.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/microchip.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/marvell.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm7xxx.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm-phy-lib.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/ax88796b.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio/mdio-bcm-unimac=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/macvtap.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/macvlan.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ipa/ipa.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/stmmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/stmmac-platform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-sunxi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-meson8b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/qualcomm/em=
ac/qcom-emac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/broadcom/ge=
net/genet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/atheros/atl=
1c/atl1c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/rcar/rcar_canfd.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/flexcan.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/dev/can-dev.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/misc/pci_endpoint_test.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/misc/eeprom/at25.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/misc/eeprom/at24.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/wm8994.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/wcd934x.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/exynos-lpass.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/videodev=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-mem=
2mem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/usb/uvc/uvcvideo.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tuner-xc202=
8.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tuner-types=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tuner-simpl=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda9887.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda8290.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda18271.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/mc44s803.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/sunxi-cir.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/meson-ir.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-xbox=
-dvd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-xbox=
-360.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-x96m=
ax.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-winf=
ast.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-winf=
ast-usbii-deluxe.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-wete=
k-hub.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-vide=
ostrong-kii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-vide=
omate-tv-pvr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-vide=
omate-m1f.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-vega=
-s9x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-twin=
han1027.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-twin=
han-dtv-cab-ci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tota=
l-media-in-hand.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tivo=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tevi=
i-nec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terr=
atec-slim-2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terr=
atec-cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terr=
atec-cinergy-s2-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tech=
nisat-usb2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tech=
nisat-ts35.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tbs-=
nec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tani=
x-tx5max.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-su30=
00.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-stre=
amzap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-snap=
stream-firefly.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-real=
-audio-220-32-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-rc6-=
mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-purp=
letv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-prot=
eus-2309.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-powe=
rcolor-real-angel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixe=
lview.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixe=
lview-new.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixe=
lview-mk12.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pinn=
acle-pctv-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pinn=
acle-color.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pine=
64.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pctv=
-sedna.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-odro=
id.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-npgt=
ech.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-nec-=
terratec-cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-nebu=
la.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-=
tvanywhere.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-=
digivox-iii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-=
digivox-ii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-mini=
x-neo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-medi=
on-x10-or2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-medi=
on-x10-digitainer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-meco=
ol-kii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-lme2=
510.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-lead=
tek-y04g0051.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kwor=
ld-plus-tv-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kham=
sin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-khad=
as.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kaio=
my.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-it91=
3x-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-it91=
3x-v1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-ioda=
ta-bctv7e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-imon=
-rsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-imon=
-pad.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-imon=
-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-hisi=
-poplar.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-gotv=
iew7135.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-geni=
us-tvgo-a11mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-gadm=
ei-rm008z.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-flyv=
ideo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-eztv=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dvbs=
ky.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dntv=
-live-dvbt-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dib0=
700-rc5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dib0=
700-nec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-ct-9=
0405.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-beho=
ld.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-beho=
ld-columbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-beel=
ink-gs1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-azur=
ewave-ad-tu700.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-aver=
tv-303.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-aver=
media.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-aver=
media-rm-ks.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-aver=
media-m733a-rm-k6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-aver=
media-m135a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-aver=
media-cardbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-ati-=
x10.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-astr=
ometa-t2hybrid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-apac=
-viewcomp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-anys=
ee.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-adst=
ech-dvb-t-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar_fdp1=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar-vin/=
rcar-vin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venu=
s/venus-dec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venu=
s/venus-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/cams=
s/qcom-camss.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/mc/mc.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/dvb-core/dvb-core.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/v=
ideobuf2-vmalloc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/v=
ideobuf2-v4l2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/v=
ideobuf2-memops.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/v=
ideobuf2-dma-contig.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/cec/core/cec.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-region-hash.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-mod.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-mirror.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-log.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/mailbox/bcm-flexrm-mailb=
ox.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/leds/leds-pca9532.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/leds/leds-lm3692x.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-s=
m8150.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/icc-sm=
d-rpm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/imx/imx-int=
erconnect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/input/misc/pwm-vibra.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/input/misc/pm8xxx-vibrat=
or.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/input/keyboard/imx_sc_ke=
y.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn=
_spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/vcnl4000.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/cros_ec_light_=
prox.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/st_ls=
m6dsx_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/rockchip_saradc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-spmi-vadc.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-spmi-adc5.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-qcom-geni=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-bcm2835.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/raspberrypi-hwmon.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/pwm-fan.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/lm90.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/ina3221.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/ina2xx.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hid/i2c-hid/i2c-hid-of.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hid/i2c-hid/i2c-hid-acpi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hid/hid-multitouch.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/host1x/host1x.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/vc4/vc4.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/tegra/tegra-drm.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun8i_tcon=
_top.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun8i-mixe=
r.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun6i_drc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i_tv.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-tcon=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-fron=
tend.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-back=
end.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/scheduler/gpu-sc=
hed.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rockchip/rockchi=
pdrm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_dw_=
hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_cmm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/pl111/pl111_drm.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panfrost/panfros=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-trul=
y-nt35597.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-sitr=
onix-st7703.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-simp=
le.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-rayd=
ium-rm67191.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-mant=
ix-mlaf057we51.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-lvds=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-edp.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-boe-=
tv101wum-nl6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/nouveau/nouveau.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/mxsfb/mxsfb.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/msm/msm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/meson/meson_dw_h=
dmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/meson/meson-drm.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/mediatek/mediate=
k-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/lima/lima.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/imx/dcss/imx-dcs=
s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/i2c/tda998x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/i2c/sil164.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/i2c/ch7006.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/kirin/=
dw_drm_dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/exynos/exynosdrm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/etnaviv/etnaviv.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_kms_helper.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_dp_aux_bus.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/ti-sn65ds=
i86.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/thc63lvd1=
024.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/=
dw-mipi-dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/=
dw-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/=
dw-hdmi-cec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/simple-br=
idge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/parade-ps=
8640.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/nwl-dsi.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/lontium-l=
t9611uxc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/lontium-l=
t9611.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/lontium-l=
t8912b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/display-c=
onnector.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/adv7511/a=
dv7511.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-wcd934x.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-sl28cpld.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-regmap.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-bd9571mwv.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-altera.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/stratix10-soc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/of-fpga-region.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/fpga-region.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/altera-freeze-bridg=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/firmware/stratix10-rsu.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/dma/tegra210-adma.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/dma/sun6i-dma.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/dma/bcm-sba-raid.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/imx8m-ddrc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/imx-bus.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/zip/his=
i_zip.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/trng/hi=
si-trng-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/sec2/hi=
si_sec2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/hpre/hi=
si_hpre.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/hisi_qm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/ccree/ccree.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/error.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/dpaa2_caam.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caamhash_des=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caamalg_desc=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caam_jr.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caam.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/bcm/bcm_crypto_sp=
u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/amlogic/amlogic-g=
xl-crypto.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/allwinner/sun8i-c=
e/sun8i-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/sun50i-cpufreq-n=
vmem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/raspberrypi-cpuf=
req.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/mediatek-cpufreq=
-hw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/cpufreq_powersav=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/clk/qcom/camcc-sdm845.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/clk/meson/sclk-div.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/clk/meson/clk-phase.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/clk/meson/axg-audio.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/clk/clk-bd718x7.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/clk/bcm/clk-raspberrypi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/ipmi/ipmi_si.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/ipmi/ipmi_msghandle=
r.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/ipmi/ipmi_devintf.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/xgene-rng=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/rng-core.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/optee-rng=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/omap-rng.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/mtk-rng.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/meson-rng=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/exynos-tr=
ng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/cavium-rn=
g.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/cavium-rn=
g-vf.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/bus/tegra-aconnect.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/hci_uart.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btusb.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btrtl.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btqca.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btintel.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btbcm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/base/regmap/regmap-slimb=
us.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/xxhash_generic.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/xts.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/xor.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/sm4_generic.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/sm3_generic.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/sha256_generic.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/md5.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/gcm.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/ecdh_generic.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/des_generic.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/curve25519-generic.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/ctr.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/crypto_engine.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/authenc.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/algif_rng.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/af_alg.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/arch/arm64/lib/xor-neon.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/cls_basic.ko
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/rockchip/snd-soc-rockchip-rt5645.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: warning: /=
tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/s=
ound/soc/rockchip/snd-soc-rockchip-spdif.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/qcom/snd-soc-sdm845.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/qcom/snd-soc-lpass-cpu.koaarch64-linux-gnu-stri=
p: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2021=
0923/kernel/sound/soc/qcom/snd-soc-qcom-common.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/qcom/snd-soc-lpass-cpu.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules_/lib/=
modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-sm8250.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/fsl/snd-soc-fsl-sai.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/codecs/snd-soc-wcd934x.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/codecs/snd-soc-wcd-mbhc.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/codecs/snd-soc-tas571x.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/codecs/snd-soc-rt5514.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/sound/pci/hda/snd-hda-tegra.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/net/ipv6/netfilter/ip6table_mangle.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/net/ipv6/netfilter/ip6t_REJECT.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/net/can/can-gw.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/net/bridge/bridge.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/net/802/p8022.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/watchdog/meson_wdt.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/video/backlight/pwm_bl.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/usb/serial/cp210x.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/usb/gadget/udc/tegra-xudc.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/usb/gadget/function/usb_f_serial.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/usb/gadget/function/usb_f_rndis.ko: unsupported G=
NU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: ) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/usb/gadget/function/usb_f_rndis.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/usb/gadget/function/usb_f_mass_storage.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/spi/spi-dw.ko  STRIP   /tmp/kci/linux/build/_modu=
les_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-imx.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/soc/qcom/qmi_helpers.ko: unsupported GNU_PROPERTY=
_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/soundwire/soundwire-bus.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/scsi/ufs/ufs_qcom.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/scsi/raid_class.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/rtc/rtc-rv3028.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/=
_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-rx858=
1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/rtc/rtc-rv3028.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/rtc/rtc-pm8xxx.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xwarning: c0000000/tmp/kci/linux/build/_modules_/lib/modules/5.1=
5.0-rc2-next-20210923/kernel/drivers/rtc/rtc-rk808.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/rpmsg/qcom_glink_smem.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/pwm/pwm-sun4i.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/pwm/pwm-rcar.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/pwm/pwm-meson.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/pwm/pwm-mediatek.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/pwm/pwm-imx27.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.ko: unsupp=
orted GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.15.0-rc2-next-20210923/kernel/drivers/phy/rockchip/phy-rockchip-pcie.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/perf/thunderx2_pmu.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/pci/controller/dwc/pcie-tegra194.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/nvmem/nvmem-rmem.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/net/wireless/ti/wlcore/wlcore.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/net/wireless/ath/ath.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/net/usb/dm9601.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/net/usb/asix.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/net/phy/meson-gxl.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/net/pcs/pcs_xpcs.ko: unsupported GNU_PROPERTY_TYP=
E (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20=
210923/kernel/drivers/net/phy/ax88796b.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/v4l2-core/v4l2-h264.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/tuners/mt20xx.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/rc-core.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-zx-irdec.ko  STRIP   /tmp/kci=
/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/=
media/rc/sunxi-cir.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-wetek-play2.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-videomate-s350.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-total-media-in-hand-02.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-slim.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-tanix-tx3mini.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-reddo.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules_/lib=
/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-snapst=
ream-firefly.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-pv951.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-medion-x10.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-manli.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-kworld-315u.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_module=
s_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-=
mecool-kiii-pro.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-hisi-tv-demo.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-encore-enltv.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-em-terratec.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps=
/rc-dvico-mce.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-dm1105-nec.ko: unsupported GN=
U_PROPERTY_TYPE (warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0=
-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-cinergy.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-budget-ci-old.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia-dvbt.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/platform/s5p-mfc/s5p-mfc.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/media/platform/rcar_drif.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules_/lib/=
modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar_fdp1.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/md/dm-zero.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/input/touchscreen/goodix_ts.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/input/touchscreen/edt-ft5x06.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/input/keyboard/snvs_pwrkey.ko: unsupported GNU_PR=
OPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-r=
c2-next-20210923/kernel/drivers/input/keyboard/imx_sc_key.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/input/keyboard/adc-keys.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/iio/pressure/mpl3115.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/iio/common/st_sensors/st_sensors_spi.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/iio/buffer/kfifo_buf.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/iio/adc/qcom-vadc-common.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/i2c/busses/i2c-gpio.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/gpu/drm/ttm/ttm.ko: unsupported GNU_PROPERTY_TYPE=
 (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/hid/i2c-hid/i2c-hid.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/gpu/drm/sun4i/sun8i-drm-hdmi.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/gpu/drm/hisilicon/kirin/kirin-drm.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/gpu/drm/bridge/analogix/analogix_dp.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/gpu/drm/arm/mali-dp.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/gnss/gnss.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/gnss/gnss-serial.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/base/regmap/regmap-sdw.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/crypto/sha3_generic.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/crypto/ghash-generic.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/crypto/ecc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/crypto/cbc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    warning:   STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15=
.0-rc2-next-20210923/kernel/drivers/soc/qcom/apr.ko
    1    warning:   STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15=
.0-rc2-next-20210923/kernel/drivers/net/wireless/ti/wl18xx/wl18xx.ko
    1    warning:   INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15=
.0-rc2-next-20210923/kernel/drivers/usb/class/cdc-acm.ko
    1    warning:
    1    kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wu=
nused-variable]
    1    drivers/net/ethernet/lantiq_etop.c:284:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:276:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    cc1: some warnings being treated as errors
    1    c0000000aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stm=
icro/stmmac/dwmac-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't f=
ind starting instruction
    1    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't f=
ind starting instruction
    1    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): =
can't find starting instruction
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:473.33-475.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu=
_ev_hw_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pm=
u_cache_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/net/sched/sch_cbs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/lib/crypto/libsha256.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/drivers/net/ethernet/broadcom/bnx2x/bnx2x.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/drivers/media/platform/sunxi/sun6i-csi/sun6i-csi.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/drivers/hid/i2c-hid/i2c-hid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/drivers/gpu/drm/drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/802=
/mrp.ko: unsupported GNU_PROPERTY_TYPE (warning: 5/tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/lib/zstd/zstd_compress.ko=
: unsupported GNU_PROPERTY_TYPE () type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip:   STRIP=
   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kern=
el/drivers/watchdog/sl28cpld_wdt.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/sunxi/sun4i-spdif.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockc=
hip-spdif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockc=
hip-rt5645.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-sm8250.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-sdm845.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-lpass-apq=
8016.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /=
tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/s=
ound/soc/qcom/snd-soc-apq8096.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-lpass-apq=
8016.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-apq8096.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-apq8016-s=
bc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-apq8016-s=
bc.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2=
0210923/kernel/sound/soc/qcom/snd-soc-qcom-common.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe-dai.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe-dai.k=
o: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6core.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-t9=
015.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-t9=
015.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modu=
les_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6adm=
.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-g1=
2a-toacodec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP  =
 /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel=
/sound/soc/meson/snd-soc-meson-g12a-tohdmitx.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-g1=
2a-toacodec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-sound-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP =
  /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/sound/soc/meson/snd-soc-meson-axg-spdifin.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ax=
g-sound-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-ai=
u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-audio-=
graph-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-li=
nux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-r=
c2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-aiu.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-audio-=
graph-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-spdif.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-spdif.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/s=
nd-soc-audio-graph-card.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-audmix=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-audmix=
.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules=
_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-aud=
mux.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-ssi.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-spdif.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-spdif.=
ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-spdi=
f.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-sai.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-micfil=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-asrc.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wsa881x=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8962.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-str=
ip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/codecs/snd-soc-wsa881x.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8962.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-str=
ip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/codecs/snd-soc-wm8904.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8904.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wcd934x=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wcd-mbh=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-tas571x=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-spdif-t=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-spdif-r=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-s=
trip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2=
0210923/kernel/sound/soc/codecs/snd-soc-spdif-tx.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-spdif-r=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-simple-=
mux.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-simple-=
mux.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modu=
les_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-w=
m-hubs.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5514.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-pcm3168=
a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-max9892=
7.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sou=
nd/soc/codecs/snd-soc-msm8916-digital.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-max9892=
7.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-es7134.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-cros-ec=
-codec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-cros-ec=
-codec.ko  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-ne=
xt-20210923/kernel/sound/soc/codecs/snd-soc-da7219.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/bcm/snd-soc-bcm2835-i2=
s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/pci/hda/snd-hda-tegra.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/sound/pci/hda/snd-hda-codec-hdmi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_cbs.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/cls_basic.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/act_gate.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/act_gact.ko: unsupport=
ed GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/act_gate=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/act_gact.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_LOG.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_LOG.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modul=
es/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_addrtype.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6table_mang=
le.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6table_filt=
er.koaarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6t_REJECT.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/nf_defrag_ipv=
4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/iptable_nat.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/can/can.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/can/can.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_modules_/lib/modu=
les/5.15.0-rc2-next-20210923/kernel/net/dsa/dsa_core.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/can/can-gw.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/bridge/bridge.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/802/psnap.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/802/p8022.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/net/802/mrp.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/zstd/zstd_compress.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libsha256.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libdes.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libcurve25519-generic=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libchacha.koaarch64-l=
inux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-=
rc2-next-20210923/kernel/lib/crypto/libarc4.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libchacha.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/lib/crypto/libcurve25519-generic.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libarc4.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/fs/nfs/blocklayout/blocklayoutdr=
iver.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/fs/nfs/blocklayout/blocklayoutdr=
iver.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/fs/overlayfs/overlay.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/fs/fuse/cuse.ko  INSTALL /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/lib/cry=
pto/libcurve25519-generic.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/meson_gxbb_wdt.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tipd/tps6598x.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/li=
nux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/wat=
chdog/sl28cpld_wdt.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tipd/tps6598x.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/hd3ss3220.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/hd3ss3220.ko: =
unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/li=
b/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/fusb302.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/cp210x.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/host/xhci-pci-renesa=
s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-s=
trip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/host/xhci-pci-renesa=
s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/udc/tegra-xud=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_serial.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_mass_storage.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_fs.koaarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_fs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_acm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-g=
nu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-ne=
xt-20210923/kernel/drivers/usb/class/cdc-acm.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_=
f_acm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb/class/cdc-acm.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/tegra/tegra-soct=
herm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/k=
ci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/driver=
s/usb/gadget/function/u_ether.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/tegra/tegra-soct=
herm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/qcom/qcom-spmi-t=
emp-alarm.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warni=
ng: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/ker=
nel/drivers/thermal/imx_sc_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/qcom/qcom-spmi-t=
emp-alarm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/imx_sc_thermal.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/imx8mm_thermal.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/imx8mm_thermal.k=
o  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210=
923/kernel/drivers/thermal/tegra/tegra-bpmp-thermal.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/broadcom/bcm2835=
_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/broadcom/bcm2835=
_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-st=
rip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20=
210923/kernel/drivers/thermal/broadcom/bcm2711_thermal.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/broadcom/bcm2711=
_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/staging/media/hantro/han=
tro-vpu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-dw.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bcm2835.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/socinfo.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bc=
m2835aux.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/socinfo.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/qmi_helpers.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slimbus.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slimbus.ko: unsu=
pported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.15.0-rc2-next-20210923/kernel/drivers/soc/mediatek/mtk-devapc.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slim-qcom-ngd-ct=
rl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slim-qcom-ctrl.k=
o: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slimbus.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/scsi/ufs/ufs_qcom.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-snvs.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-rx8581.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-rv8803.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-rk808.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pm8xxx.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-meson-vrtc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-fsl-ftm-alarm.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-ds1307.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: warni=
ng: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/ker=
nel/drivers/rtc/rtc-fsl-ftm-alarm.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-ds1307.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rpmsg/qcom_glink_smem.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-visconti.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-sun4i.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-rcar.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/b=
uild/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-=
mtk-disp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-mtk-disp.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-meson.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-mediatek.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-imx27.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-bcm2835.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-bcm2835.ko  INST=
ALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/ker=
nel/drivers/pwm/pwm-meson.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/max17042_ba=
ttery.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/bq25980_cha=
rger.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/bq25890_cha=
rger.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/tegra/phy-tegra194-p=
2u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/rockchip/phy-rockchi=
p-pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/rockchip/phy-rockchi=
p-pcie.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_m=
odules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/bq=
25890_charger.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/mediatek/phy-mtk-mip=
i-dsi-drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/mediatek/phy-mtk-mip=
i-dsi-drv.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build=
/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/qualcomm=
/phy-qcom-qusb2.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/perf/thunderx2_pmu.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/dwc/pcie-=
tegra194.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/dwc/pci-m=
eson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/nvmem/nvmem_meson_efuse.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/nvmem/nvmem-rmem.koaarch=
64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.1=
5.0-rc2-next-20210923/kernel/drivers/pci/controller/dwc/pci-meson.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/nvme/host/nvme.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/nvme/host/nvme-core.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ti/wlcore/w=
lcore.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/marvell/mwi=
fiex/mwifiex_pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/marvell/mwi=
fiex/mwifiex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-=
linux-gnu-strip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/marvell/mwi=
fiex/mwifiex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/broadcom/br=
cm80211/brcmutil/brcmutil.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-=
gnu-strip: 5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/=
ath10k_snoc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/=
ath10k_snoc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu=
-strip: c0000000warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-=
rc2-next-20210923/kernel/drivers/net/wireless/broadcom/brcm80211/brcmutil/b=
rcmutil.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/veth.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/veth.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modules_/lib=
/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/marvell/mwifi=
ex/mwifiex.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/usbnet.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/smsc95xx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/smsc95xx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /t=
mp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dr=
ivers/net/usb/usbnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/net1080.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/peg=
asus.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/net1080.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/dm9601.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/ax88179_178a.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/ax88179_178a.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/dm9601=
.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/asix.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/smsc.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/smsc.ko: unsuppo=
rted GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/module=
s/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/asix.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/meson-gxl.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/marvell10g.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/broadcom.ko: uns=
upported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/m=
odules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/meson-gxl.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm54140.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/pcs/pcs_xpcs.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio/mdio-mux-meson-=
g12a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio/mdio-mux-meson-=
g12a.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm-phy-l=
ib.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-visconti.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/l=
inux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac-platform.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/k=
ci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sunxi.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000000=
0  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210=
923/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-ipq806x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTA=
LL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kern=
el/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-altr-socfpga.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/b=
uild/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethe=
rnet/qualcomm/rmnet/rmnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stm=
mac/dwmac-altr-socfpga.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/qualcomm/rm=
net/rmnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mscc/mscc_o=
celot_switch_lib.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mscc/mscc_o=
celot_switch_lib.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linu=
x/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/e=
thernet/stmicro/stmmac/dwmac-imx.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mellanox/ml=
x5/core/mlx5_core.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/li=
nux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net=
/usb/cdc_ether.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mellanox/ml=
x4/mlx4_en.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mellanox/ml=
x4/mlx4_en.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci=
/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/=
net/ethernet/mellanox/mlx4/mlx4_core.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mellanox/ml=
x4/mlx4_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/broadcom/bn=
x2x/bnx2x.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build=
/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet=
/stmicro/stmmac/dwmac-generic.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/dsa/ocelot/mscc_feli=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/rcar/rcar_can.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/rcar/rcar_can.ko=
: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/=
lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/broadcom/g=
enet/genet.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/misc/uacce/uacce.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/misc/uacce/uacce.ko  STR=
IP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/ke=
rnel/drivers/net/can/rcar/rcar_can.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/memory/renesas-rpc-if.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-h26=
4.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20=
210923/kernel/drivers/memory/renesas-rpc-if.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-fwn=
ode.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/media/v4l2-core/v4l2-mem2mem.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-fwn=
ode.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-dv-=
timings.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warnin=
g: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kern=
el/drivers/media/v4l2-core/v4l2-async.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-dv-=
timings.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-asy=
nc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/xc5000.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/=
build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v=
4l2-core/v4l2-h264.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/xc5000.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/xc4000.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/xc4000.ko  =
INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923=
/kernel/drivers/media/v4l2-core/v4l2-mem2mem.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda827x.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda827x.ko =
 INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2021092=
3/kernel/drivers/media/tuners/tuner-simple.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/mt20xx.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/rc-core.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-zx-i=
rdec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-wete=
k-play2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-vide=
omate-s350.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tt-1=
500.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-trek=
stor.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tota=
l-media-in-hand-02.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terr=
atec-slim.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terr=
atec-cinergy-c-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terr=
atec-cinergy-c-pci.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5=
.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-slim-2.=
ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tani=
x-tx3mini.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-redd=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pv95=
1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixe=
lview-002t.koaarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (warn=
ing: 5) type: 0x/tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-=
20210923/kernel/drivers/media/rc/keymaps/rc-pinnacle-grey.koc0000000: unsup=
ported GNU_PROPERTY_TYPE (
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixe=
lview-002t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pinn=
acle-grey.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-norw=
ood.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-norw=
ood.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/=
rc-pinnacle-color.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-=
tvanywhere-plus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-medi=
on-x10.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-meco=
ol-kiii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-meco=
ol-kiii-pro.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/k=
eymaps/rc-medion-x10-or2x.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-manl=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kwor=
ld-pc150u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kwor=
ld-315u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-hisi=
-tv-demo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-haup=
pauge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/=
kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drive=
rs/media/rc/keymaps/rc-hisi-poplar.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-haup=
pauge.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_m=
odules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymap=
s/rc-hisi-poplar.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-geek=
box.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-geek=
box.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/=
rc-hisi-poplar.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-fusi=
onhdtv-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-flyd=
vb.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: 5warning: ) =
type: 0x/tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923=
/kernel/drivers/media/rc/keymaps/rc-fusionhdtv-mce.koc0000000: unsupported =
GNU_PROPERTY_TYPE (5
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-flyd=
vb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-evga=
-indtube.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-evga=
-indtube.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build=
/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/key=
maps/rc-geekbox.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-enco=
re-enltv2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-enco=
re-enltv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-enco=
re-enltv-fm53.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-em-t=
erratec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dvic=
o-portable.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: war=
ning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/k=
ernel/drivers/media/rc/keymaps/rc-dvico-mce.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dvic=
o-portable.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dvic=
o-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dtt2=
00u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-digi=
ttrade.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-digi=
ttrade.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keyma=
ps/rc-dvico-portable.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-digi=
talnow-tinytwin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-delo=
ck-61959.koaarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (warnin=
g: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kern=
el/drivers/media/rc/keymaps/rc-d680-dmb.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-delo=
ck-61959.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-d680=
-dmb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-cine=
rgy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-cine=
rgy-1400.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-budg=
et-ci-old.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-aver=
media-dvbt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-aver=
media-a16d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-ati-=
tv-wonder-hd-600.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-asus=
-ps3-100.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/l=
inux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/me=
dia/rc/keymaps/rc-asus-pc39.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-asus=
-pc39.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: =
5/tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel=
/drivers/media/rc/keymaps/rc-asus-ps3-100.ko) type: 0x: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-asus=
-pc39.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-alin=
k-dtu-m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-alin=
k-dtu-m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/li=
nux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/med=
ia/rc/keymaps/rc-asus-pc39.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/vsp1/vsp1=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/sunxi/sun=
6i-csi/sun6i-csi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/s5p-mfc/s=
5p-mfc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/s5p-jpeg/=
s5p-jpeg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar_drif=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar-vin/=
rcar-csi2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar-fcp.=
ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/k=
ci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/driver=
s/media/platform/rcar-vin/rcar-csi2.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar-fcp.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venu=
s/venus-enc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venu=
s/venus-enc.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/bu=
ild/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/pla=
tform/rcar-fcp.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/exynos-gs=
c/exynos-gsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/exynos-gs=
c/exynos-gsc.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-=
rc2-next-20210923/kernel/drivers/media/platform/qcom/venus/venus-enc.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/ov5645.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/ir-kbd-i2c.koa=
arch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules=
/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/ov5645.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/ir-kbd-i2c.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/imx219.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/imx219.ko: uns=
upported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/m=
odules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venus/ve=
nus-core.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/v=
ideobuf2-dma-sg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/v=
ideobuf2-dma-sg.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux=
/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/=
common/videobuf2/videobuf2-vmalloc.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/md/md-mod.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/md/md-mod.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/=
linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/m=
edia/common/videobuf2/videobuf2-common.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-s=
m8350.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_m=
odules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-region-ha=
sh.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-s=
m8250.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning:=
 /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel=
/drivers/interconnect/qcom/qnoc-sm8350.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-s=
m8250.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-nex=
t-20210923/kernel/drivers/leds/leds-lm3692x.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-m=
sm8916.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/icc-os=
m-l3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/imx/imx8mq-=
interconnect.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: wa=
rning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/=
kernel/drivers/interconnect/qcom/qnoc-msm8916.ko5) type: 0xc0000000: unsupp=
orted GNU_PROPERTY_TYPE (5
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/imx/imx8mq-=
interconnect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/input/touchscreen/goodix=
_ts.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom=
/icc-osm-l3.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/input/touchscreen/edt-ft=
5x06.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/input/touchscreen/atmel_=
mxt_ts.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/input/keyboard/snvs_pwrk=
ey.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/input/keyboard/adc-keys.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/pressure/mpl3115.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/pressure/cros_ec_bar=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn=
_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/isl29018.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/isl29018.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/st_ls=
m6dsx_spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/st_ls=
m6dsx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/st_ls=
m6dsx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linu=
x/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/l=
ight/vcnl4000.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/st_sensors/st=
_sensors_spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/st_sensors/st=
_sensors_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/st_sensors/st=
_sensors.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/cros_ec_senso=
rs/cros_ec_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/cros_ec_senso=
rs/cros_ec_sensors.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-str=
ip: 5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/cros_ec_senso=
rs/cros_ec_sensors.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/buffer/kfifo_buf.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/buffer/industrialio-=
triggered-buffer.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/cro=
s_ec_sensors/cros_ec_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/buffer/industrialio-=
triggered-buffer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-vadc-common=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/max9611.koaarch6=
4-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/max9611.ko: unsu=
pported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-spmi-adc5.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-qcom-cci.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-gpio.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/sl28cpld-hwmon.ko:=
 unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/=
linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/i=
2c/busses/i2c-qcom-cci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/sl28cpld-hwmon.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/hid/i2c-hid/i2c-hid.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun6i_mipi=
_dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-drm.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-drm.=
ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules=
_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/msm/msm.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-drm-=
hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_lvd=
s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/=
linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/g=
pu/drm/scheduler/gpu-sched.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_lvd=
s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/mediatek/mediate=
k-drm-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/kirin/=
kirin-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/hibmc/=
hibmc-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_vram_helper.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_ttm_helper.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_ttm_helper.k=
o: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/kiri=
n/kirin-drm.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_m=
odules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilic=
on/kirin/kirin-drm.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/=
dw-hdmi-i2s-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/=
dw-hdmi-ahb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aar=
ch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5=
.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-=
audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/=
dw-hdmi-ahb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/sii902x.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/sii902x.k=
o: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/simple-=
bridge.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/analogix/=
analogix_dp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/arm/mali-dp.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gnss/gnss.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gnss/gnss-serial.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gnss/gnss-mtk.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/fpga-bridge.ko: uns=
upported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/of-fpga-region.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/extcon/extcon-ptn5150.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/edac/layerscape_edac_mod=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/dma/sh/usb-dmac.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/dma/sh/usb-dmac.ko: unsu=
pported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.15.0-rc2-next-20210923/kernel/drivers/edac/layerscape_edac_mod.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/governor_userspa=
ce.koaarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (warning: 5/t=
mp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dr=
ivers/crypto/qcom-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/governor_userspa=
ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/qcom-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/imx-cpufreq-dt.k=
oaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modul=
es/5.15.0-rc2-next-20210923/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/imx-cpufreq-dt.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/cpufreq_conserva=
tive.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/cppc_cpufreq.ko:=
 unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci=
/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/=
cpufreq/cpufreq_conservative.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/cppc_cpufreq.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/clk/qcom/lpass-gfm-sm825=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/iproc-rng=
200.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/iproc-rng=
200.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/me=
son-rng.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/hisi-rng.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/hisi-rng.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_ran=
dom/meson-rng.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/bcm2835-r=
ng.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dri=
vers/char/hw_random/arm_smccc_trng.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/bcm2835-r=
ng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/arm_smccc=
_trng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/block/nbd.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/drivers/base/regmap/regmap-sdw.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/sha3_generic.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/ghash-generic.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/ecb.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/dh_generic.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/dh_generic.ko: unsupporte=
d GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5=
.15.0-rc2-next-20210923/kernel/crypto/gcm.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/cmac.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/ccm.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/blake2b_generic.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: warni=
ng: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/ker=
nel/crypto/authencesn.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/blake2b_generic.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.15.0-rc2-next-20210923/kernel/crypto/authencesn.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: ) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-s=
oc-msm8916-analog.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm7xx=
x.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/wm8994.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keyma=
ps/rc-dntv-live-dvbt-pro.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keyma=
ps/rc-dib0700-rc5.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keyma=
ps/rc-ati-x10.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/v=
ideobuf2/videobuf2-dma-contig.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm=
6dsx/st_lsm6dsx_spi.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/meson/=
meson_dw_hdmi.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisili=
con/hibmc/hibmc-drm.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/of-fpga-r=
egion.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-s=
oc-max98927.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/nf_=
defrag_ipv6.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libchacha.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/scsi/raid_clas=
s.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pcf853=
63.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/nvmem/nvmem-rm=
em.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/b=
roadcom/bnx2x/bnx2x.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keyma=
ps/rc-avermedia-cardbus.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/q=
com/qnoc-sm8150.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/st_=
sensors/st_sensors_spi.ko
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/drivers/video/backlight/pwm_bl.ko: unsupported GNU_PROPERTY_TYPE (/tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/watchdog/meson_wdt.ko5: unsupported GNU_PROPERTY_TYPE () type: 0xc00000005
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/drivers/power/supply/max17042_battery.ko/tmp/kci/linux/build/_modules_/li=
b/modules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/bq25890_char=
ger.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55)=
 type: 0x) type: 0xc0000000c0000000aarch64-linux-gnu-strip:
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/drivers/net/phy/broadcom.ko/tmp/kci/linux/build/_modules_/lib/modules/5.1=
5.0-rc2-next-20210923/kernel/drivers/net/phy/marvell10g.ko: unsupported GNU=
_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) type: 0xc000=
0000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/drivers/media/rc/keymaps/rc-tt-1500.ko/tmp/kci/linux/build/_modules_/lib/=
modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-treksto=
r.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) t=
ype: 0x) type: 0xc0000000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/crypto/ccm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/s=
oc/qcom/snd-soc-sm8250.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/s=
oc/qcom/snd-soc-qcom-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/s=
oc/fsl/snd-soc-fsl-ssi.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gn=
u-strip: ) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/s=
oc/fsl/snd-soc-fsl-asrc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/s=
oc/codecs/snd-soc-pcm3168a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/p=
ci/hda/snd-hda-codec-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv=
4/netfilter/iptable_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/802=
/psnap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/slimbus/slim-qcom-ctrl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/rtc/rtc-rv8803.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/pwm/pwm-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/phy/tegra/phy-tegra194-p2u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/nvme/host/nvme-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/net/ethernet/mellanox/mlx5/core/mlx5_core.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/media/rc/keymaps/rc-msi-tvanywhere-plus.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/media/rc/keymaps/rc-kworld-pc150u.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/media/rc/keymaps/rc-encore-enltv2.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/media/rc/keymaps/rc-encore-enltv-fm53.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/media/rc/keymaps/rc-dtt200u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/media/common/videobuf2/videobuf2-common.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/input/touchscreen/atmel_mxt_ts.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/iio/pressure/cros_ec_baro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/=
modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn_i2=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/gpu/drm/sun4i/sun8i-drm-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-ne=
xt-20210923/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top.ko
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/gnss/gnss-mtk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/extcon/extcon-ptn5150.kowarning: : unsupported GNU_PROPERTY_TYPE (/tmp/kci=
/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/=
edac/layerscape_edac_mod.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x5c00=
00000) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/block/nbd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/crypto/=
ecc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/crypto/=
ecb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning:   INSTA=
LL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kern=
el/drivers/media/rc/keymaps/rc-astrometa-t2hybrid.ko
    1    1 warning generated.
    1    /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2021092=
3/kernel/drivers/iio/common/st_sensors/st_sensors_i2c.koaarch64-linux-gnu-s=
trip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2=
0210923/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2021092=
3/kernel/crypto/cbc.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/crypto/cmac.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    kernel/sched/debug.c:460:41: warning: unused variable =E2=80=98stats=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-12) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 sec=
tion mismatches

Errors:
    kernel/locking/test-ww_mutex.c:138:7: error: variable 'ret' is used uni=
nitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitializ=
ed]
    drivers/staging/greybus/audio_topology.c:977:12: error: stack frame siz=
e of 3288 bytes in function 'gbaudio_tplg_create_widget' [-Werror,-Wframe-l=
arger-than=3D]

Warnings:
    ./usr/include/linux/bcache.h:354:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    ./usr/include/linux/bcache.h:355:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    2 warnings generated.
    vmlinux.o: warning: objtool: .altinstructions+0x30: don't know how to h=
andle non-section reloc symbol x86_early_init_platform_quirks
    kernel/locking/test-ww_mutex.c:125:9: note: initialize the variable 're=
t' to silence this warning
    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete()+0x=
10cd: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): can't=
 find starting instruction
    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find s=
tarting instruction
    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find s=
tarting instruction

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/sched/debug.c:460:41: warning: unused variable =E2=80=98stats=E2=
=80=99 [-Wunused-variable]

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
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:473.33-475.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/sched/debug.c:460:41: warning: unused variable =E2=80=98stats=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/sched/debug.c:460:41: warning: unused variable =E2=80=98stats=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 816 warnings, 0 secti=
on mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/arch/arm64/lib/xor-neon.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/af_alg.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/algif_rng.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/authenc.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/blake2b_generic.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: warning: /=
tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/c=
rypto/authencesn.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/crypto/cbc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/crypto_engine.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/ccm.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/ctr.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/cmac.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/curve25519-generic.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/des_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/ecb.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/dh_generic.ko: unsupported GNU=
_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0=
-rc2-next-20210923/kernel/crypto/gcm.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/ecdh_generic.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/crypto/ecc.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/crypto/ghash-generic.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/gcm.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/md5.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/sha256_generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/sha3_generic.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/sm4_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/xor.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/sm3_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/xts.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/xxhash_generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/base/regmap/regmap-slimbus.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/bloc=
k/nbd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/base/regmap/regmap-sdw.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btbcm.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btintel.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btrtl.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btqca.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btusb.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/bcm2835-rng.ko=
: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci=
/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/=
char/hw_random/arm_smccc_trng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bus/tegra-aconnect.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/hci_uart.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/cavium-rng-vf.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/cavium-rng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/exynos-trng.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/iproc-rng200.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/hisi-rng.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/m=
eson-rng.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/meson-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/mtk-rng.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/omap-rng.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/optee-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/rng-core.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/xgene-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/ipmi/ipmi_devintf.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/ipmi/ipmi_msghandler.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/ipmi/ipmi_si.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/bcm/clk-raspberrypi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/meson/clk-phase.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/clk-bd718x7.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/meson/sclk-div.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/meson/axg-audio.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/qcom/camcc-sdm845.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/cpufreq_powersave.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/cppc_cpufreq.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/imx-cpufreq-dt.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/mediatek-cpufreq-hw.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/cpufreq_conservative.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/raspberrypi-cpufreq.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/sun50i-cpufreq-nvmem.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/allwinner/sun8i-ce/sun=
8i-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/amlogic/amlogic-gxl-cr=
ypto.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/bcm/bcm_crypto_spu.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caam.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caamalg_desc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caam_jr.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/dpaa2_caam.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/error.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caamhash_desc.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/hisi_qm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/ccree/ccree.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/hpre/hisi_hp=
re.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/sec2/hisi_se=
c2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/trng/hisi-tr=
ng-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/governor_userspace.ko=
aarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (warning: 5/tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/crypto/qcom-rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/zip/hisi_zip=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/imx-bus.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/dma/bcm-sba-raid.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/imx8m-ddrc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/dma/sh/usb-dmac.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/dma/sun6i-dma.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/dma/tegra210-adma.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/extc=
on/extcon-ptn5150.kowarning: : unsupported GNU_PROPERTY_TYPE (/tmp/kci/linu=
x/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/edac/=
layerscape_edac_mod.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x5c0000000=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/firmware/stratix10-rsu.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/altera-freeze-bridge.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/of-fpga-region=
.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/fpga-region.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/of-fpga-region.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/stratix10-soc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gnss/gnss-mtk.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/gnss/gnss-serial.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gnss/gnss.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-bd9571mwv.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-altera.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-regmap.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-sl28cpld.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-wcd934x.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/gpu/drm/arm/mali-dp.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/adv7511/adv751=
1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/display-connec=
tor.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/gpu/drm/bridge/analogix/analogix_dp.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/lontium-lt8912=
b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/lontium-lt9611=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/lontium-lt9611=
uxc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/parade-ps8640.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/simple-bridge.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/sii902x.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-hd=
mi-cec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-hd=
mi-ahb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-=
linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0=
-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-hd=
mi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-mi=
pi-dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/thc63lvd1024.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_ttm_helper.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_kms_helper.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_vram_helper.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/hibmc/hibmc=
-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_module=
s_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/ki=
rin/kirin-drm.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/etnaviv/etnaviv.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/kirin/dw_dr=
m_dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/i2c/ch7006.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/gpu/drm/hisilicon/kirin/kirin-drm.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/i2c/sil164.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/exynos/exynosdrm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/i2c/tda998x.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/imx/dcss/imx-dcss.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/lima/lima.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/mediatek/mediatek-drm=
-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/meson/meson-drm.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/mediatek/mediatek-drm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/mxsfb/mxsfb.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-boe-tv101=
wum-nl6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-edp.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/meson/meson_dw_hdmi.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-lvds.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-raydium-r=
m67191.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-mantix-ml=
af057we51.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-simple.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-sitronix-=
st7703.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-truly-nt3=
5597.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panfrost/panfrost.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/pl111/pl111_drm.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_cmm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_lvds.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/scheduler/gpu-sched.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-backend.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rockchip/rockchipdrm.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/msm/msm.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-drm.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-frontend.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-tcon.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun6i_drc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/gpu/drm/sun4i/sun8i-drm-hdmi.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/tegra/tegra-drm.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/gpu/drm/ttm/ttm.ko: unsupported GNU_PROPERTY_TYPE (5  =
INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923=
/kernel/drivers/hid/i2c-hid/i2c-hid.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hid/hid-multitouch.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/host1x/host1x.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/vc4/vc4.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hid/i2c-hid/i2c-hid-of.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hid/i2c-hid/i2c-hid.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/ina2xx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hid/i2c-hid/i2c-hid-acpi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/ina3221.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/lm90.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/raspberrypi-hwmon.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/pwm-fan.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/sl28cpld-hwmon.ko: unsu=
pported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/linux=
/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/bu=
sses/i2c-qcom-cci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-bcm2835.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-qcom-geni.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/max9611.koaarch64-lin=
ux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/i2c/busses/i2c-gpio.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-spmi-vadc.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/rockchip_saradc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/buffer/industrialio-trigg=
ered-buffer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/cros_ec_sensors/cr=
os_ec_sensors.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: 5=
) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/iio/buffer/kfifo_buf.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/iio/adc/qcom-vadc-common.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/cros_ec_sensors/cr=
os_ec_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/st_senso=
rs/st_sensors_spi.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/st_sensors/st_sens=
ors_spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/=
st_lsm6dsx_spi.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/vcnl4000.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/ker=
nel/drivers/iio/common/st_sensors/st_sensors_i2c.koaarch64-linux-gnu-strip:=
 warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202109=
23/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/cros_ec_light_prox.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx=
_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/isl29018.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn_i2c.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn_spi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/pressure/cros_ec_baro.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/pressure/mpl3115.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/input/keyboard/adc-keys.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/input/keyboard/snvs_pwrkey.ko: unsupported GNU_PROPERT=
Y_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-ne=
xt-20210923/kernel/drivers/input/keyboard/imx_sc_key.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/misc/pm8xxx-vibrator.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/misc/pwm-vibra.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/keyboard/imx_sc_key.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/touchscreen/edt-ft5x06.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/inpu=
t/touchscreen/atmel_mxt_ts.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/input/touchscreen/goodix_ts.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/imx/imx-intercon=
nect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/icc-osm-l3.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/imx/imx8mq-inter=
connect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/icc-smd-rpm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-sm8150=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-msm891=
6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-sm8250=
.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/leds/leds-lm3692x.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-sm8350=
.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_module=
s_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-region-hash.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/leds/leds-lm3692x.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/leds/leds-pca9532.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/mailbox/bcm-flexrm-mailbox.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-log.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-mirror.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-region-hash.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-mod.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/medi=
a/common/videobuf2/videobuf2-common.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/md/dm-zero.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-dma-contig.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/cec/core/cec.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/md-mod.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-dma-sg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-v4l2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-memops.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-vmalloc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/imx219.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/dvb-core/dvb-core.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/ir-kbd-i2c.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/ov5645.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/mc/mc.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/exynos-gsc/exy=
nos-gsc.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-n=
ext-20210923/kernel/drivers/media/platform/qcom/venus/venus-enc.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/nouveau/nouveau.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venus/ven=
us-dec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venus/ven=
us-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/camss/qco=
m-camss.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venus/ven=
us-enc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar-vin/rcar-=
csi2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar-fcp.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar-vin/rcar-=
vin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/platform/rcar_drif.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar_fdp1.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar_fdp1.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dri=
vers/media/platform/sunxi/sun6i-csi/sun6i-csi.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-alink-dtu=
-m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-adstech-d=
vb-t-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-anysee.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning:   INSTALL /t=
mp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dr=
ivers/media/rc/keymaps/rc-astrometa-t2hybrid.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/platform/s5p-mfc/s5p-mfc.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-apac-view=
comp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-astrometa=
-t2hybrid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-asus-pc39=
.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: 5/tmp=
/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/driv=
ers/media/rc/keymaps/rc-asus-ps3-100.ko) type: 0x: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-ati-tv-wo=
nder-hd-600.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc=
-avermedia-cardbus.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-ati-x10.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-cardbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-avermedia-dvbt.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-m135a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-m733a-rm-k6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-rm-ks.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avertv-30=
3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-azurewave=
-ad-tu700.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-beelink-g=
s1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-behold-co=
lumbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-behold.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-budget-ci=
-old.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-cinergy.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-cinergy-1=
400.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-ct-90405.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-delock-61=
959.koaarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (warning: /t=
mp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dr=
ivers/media/rc/keymaps/rc-d680-dmb.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dib0700-n=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dib0700-r=
c5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-digittrad=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-dm1105-nec.ko: unsupported GNU_PRO=
PERTY_TYPE (warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-=
next-20210923/kernel/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dntv-live=
-dvbt-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dvbsky.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dtt200u.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dvico-por=
table.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dvico-mce=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/medi=
a/rc/keymaps/rc-encore-enltv-fm53.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-em-terratec.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/medi=
a/rc/keymaps/rc-encore-enltv2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-encore-enltv.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-evga-indt=
ube.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-eztv.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-flyvideo.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-flydvb.ko=
: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: 5warning: ) type:=
 0x/tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kern=
el/drivers/media/rc/keymaps/rc-fusionhdtv-mce.koc0000000: unsupported GNU_P=
ROPERTY_TYPE (5
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-gadmei-rm=
008z.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-geekbox.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-genius-tv=
go-a11mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-hauppauge=
.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_module=
s_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-=
hisi-poplar.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-gotview71=
35.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-hisi-tv-d=
emo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-hisi-popl=
ar.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-imon-mce.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-imon-rsc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-iodata-bc=
tv7e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-imon-pad.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-it913x-v2=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-it913x-v1=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kaiomy.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-khadas.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-khamsin.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kworld-31=
5u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kworld-pc=
150u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kworld-pl=
us-tv-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-lme2510.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-leadtek-y=
04g0051.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-manli.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-mecool-ki=
i-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-medion-x1=
0-digitainer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-mecool-ki=
ii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-medion-x1=
0-or2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-minix-neo=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-medion-x1=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-digiv=
ox-ii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-digiv=
ox-iii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-tvany=
where-plus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-tvany=
where.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-nec-terra=
tec-cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-nebula.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-npgtech.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-norwood.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-odroid.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pctv-sedn=
a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pine64.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pinnacle-=
color.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pinnacle-=
grey.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pinnacle-=
pctv-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixelview=
-002t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixelview=
-new.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixelview=
-mk12.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixelview=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-proteus-2=
309.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-powercolo=
r-real-angel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-purpletv.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pv951.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-rc6-mce.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-real-audi=
o-220-32-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-reddo.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-snapstrea=
m-firefly.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-streamzap=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-su3000.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-tanix-tx3mini.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tbs-nec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tanix-tx5=
max.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-technisat=
-ts35.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-technisat=
-usb2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-=
cinergy-s2-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-=
cinergy-c-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-=
cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-terratec-slim.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-=
slim-2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-total-media-in-hand-02.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tevii-nec=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tivo.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-total-med=
ia-in-hand.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tt-1500.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-trekstor.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-twinhan-d=
tv-cab-ci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-twinhan10=
27.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-videomate=
-m1f.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-vega-s9x.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-videomate=
-tv-pvr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-videomate=
-s350.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-videostro=
ng-kii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-wetek-hub=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-winfast-u=
sbii-deluxe.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-wetek-play2.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-winfast.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-x96max.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-xbox-360.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-zx-irdec.ko  STRIP   /tmp/kci/linu=
x/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media=
/rc/sunxi-cir.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/meson-ir.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-xbox-dvd.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/rc-core.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/mc44s803.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/sunxi-cir.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/mt20xx.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda827x.ko  INST=
ALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/ker=
nel/drivers/media/tuners/tuner-simple.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda8290.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda18271.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda9887.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tuner-xc2028.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tuner-simple.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/xc4000.ko  INSTA=
LL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kern=
el/drivers/media/v4l2-core/v4l2-mem2mem.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/xc5000.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build=
/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-c=
ore/v4l2-h264.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-dv-timin=
gs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/usb/uvc/uvcvideo.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-async.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-fwnode.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/medi=
a/v4l2-core/v4l2-mem2mem.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-h264.ko =
 INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2021092=
3/kernel/drivers/memory/renesas-rpc-if.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-mem2mem.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/memory/renesas-rpc-if.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/wcd934x.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/exynos-lpass.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/videodev.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/wm8994.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/misc/eeprom/at24.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/misc/eeprom/at25.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/misc/pci_endpoint_test.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/misc/uacce/uacce.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/flexcan.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/rcar/rcar_can.ko: uns=
upported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/m=
odules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/broadcom/genet/=
genet.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/dev/can-dev.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/rcar/rcar_canfd.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/dsa/ocelot/mscc_felix.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/atheros/atl1c/at=
l1c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/broadcom/genet/g=
enet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/broadcom/bnx2x/b=
nx2x.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmi=
cro/stmmac/dwmac-generic.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mellanox/mlx4/ml=
x4_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/qualcomm/emac/qc=
om-emac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mellanox/mlx4/ml=
x4_en.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mscc/mscc_ocelot=
_switch_lib.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-altr-socfpga.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/qualcomm/rmnet/r=
mnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-meson8b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-sunxi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-visconti.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/=
build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/eth=
ernet/stmicro/stmmac/stmmac-platform.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/s=
tmmac-platform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/macvtap.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/macvlan.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ipa/ipa.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio/mdio-bcm-unimac.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio/mdio-mux-meson-g12a.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/s=
tmmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/pcs/pcs_xpcs.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/ax88796b.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm-phy-lib.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm54140.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm7xxx.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/marvell.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dri=
vers/net/phy/broadcom.ko/tmp/kci/linux/build/_modules_/lib/modules/5.15.0-r=
c2-next-20210923/kernel/drivers/net/phy/marvell10g.ko: unsupported GNU_PROP=
ERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) type: 0xc0000000c=
0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/=
ethernet/mellanox/mlx5/core/mlx5_core.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/net/phy/meson-gxl.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/microchip.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/smsc.ko: unsupported =
GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.1=
5.0-rc2-next-20210923/kernel/drivers/net/usb/asix.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/tap.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/net/usb/asix.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/cdc_ether.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/cdc_ncm.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/ax88179_178a.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/net/usb/dm9601.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/cdc_subset.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/lan78xx.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/mcs7830.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/net1080.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/pegasus.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/rtl8150.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/r8152.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/plusb.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/smsc75xx.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/smsc95xx.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/sr9800.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/usbnet.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/zaurus.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/veth.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/ath10=
k_pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/ath10=
k_snoc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-stri=
p: c0000000warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-n=
ext-20210923/kernel/drivers/net/wireless/broadcom/brcm80211/brcmutil/brcmut=
il.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/marvell/mwifiex/=
mwifiex_pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/ath10=
k_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/broadcom/brcm802=
11/brcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ti/wl18xx/wl18xx=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ti/wlcore/wlcore=
_sdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/marvell/mwifiex/=
mwifiex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux=
-gnu-strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/net/wireless/ti/wlcore/wlcore.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/nfc/s3fwrn5/s3fwrn5.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/nvme/host/nvme-core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/nvmem/nvmem-rmem.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/nvmem/nvmem-rmem.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/nvmem/nvmem_meson_efuse.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/dwc/pci-meson.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/pcie-brcmstb.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/dwc/pcie-tegra=
194.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pci/endpoint/functions/pci-ep=
f-test.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/pcie-rockchip-=
host.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/perf/arm_smmuv3_pmu.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/perf/fsl_imx8_ddr_perf.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/perf/thunderx2_pmu.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/allwinner/phy-sun6i-mipi-=
dphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/freescale/phy-fsl-imx8-mi=
pi-dphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/mediatek/phy-mtk-hdmi-drv=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/mediatek/phy-mtk-mipi-dsi=
-drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/qualcomm/phy-qcom-qmp.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/renesas/phy-rcar-gen3-usb=
3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/rockchip/phy-rockchip-inn=
o-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/rockchip/phy-rockchip-pci=
e.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_module=
s_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/bq25890=
_charger.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/tegra/phy-tegra194-p2u.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pinctrl/qcom/pinctrl-lpass-lp=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/bq25890_charger.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/platform/chrome/cros_ec_chard=
ev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/power/reset/qcom-pon.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/bq25980_charger.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/platform/chrome/cros_ec_typec=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/max17042_battery=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/sbs-battery.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-bcm2835.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-cros-ec.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/pwm/pwm-imx27.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-rcar.ko: unsupported =
GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/=
_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-mtk-d=
isp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-meson.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/pwm/pwm-mediatek.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-sl28cpld.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-tegra.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-sun4i.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-visconti.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/regulator/tps65132-regulator.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/regulator/vctrl-regulator.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_common.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_pil_info.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_q6v5_pas.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_q6v5.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_q6v5_mss.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_sysmon.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-berlin.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-meson-audio-arb.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-qcom-pdc.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-raspberrypi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/rpmsg/qcom_glink_smem.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-fsl-ftm-alarm.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-ds1307.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-hym8563.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-imx-sc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-meson-vrtc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-m41t80.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pcf2127.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pcf85363.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pm8xxx.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-rk808.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/rtc/rtc-rv3028.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-rv8803.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-rx8581.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-snvs.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/scsi/ufs/ufs_qcom.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/scsi/raid_class.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/scsi/mpt3sas/mpt3sas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slim-qcom-ctrl.ko: un=
supported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/=
modules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slimbus.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/amlogic/meson-canvas.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slimbus.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/mediatek/mtk-devapc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/mdt_loader.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/apr.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/pdr_interface.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/rmtfs_mem.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/socinfo.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/soc/qcom/qmi_helpers.ko: unsupported GNU_PROPERTY_TYPE=
 (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/soundwire/soundwire-bus.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soundwire/soundwire-qcom.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soundwire/soundwire-bus.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: ) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bcm2835aux.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-dw.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-dw-mmio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bitbang.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-geni-qcom.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-imx.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-meson-spicc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-qcom-qspi.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-rpc-if.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-meson-spifc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-sh-msiof.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spidev.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/broadcom/bcm2711_ther=
mal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/staging/media/hantro/hantro-v=
pu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/imx8mm_thermal.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/broadcom/bcm2835_ther=
mal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/qcom/qcom-spmi-temp-a=
larm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/broadcom/brcmstb_ther=
mal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/imx_sc_thermal.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/qoriq_thermal.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/rockchip_thermal.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/tegra/tegra-bpmp-ther=
mal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/tegra/tegra-soctherm.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/class/cdc-acm.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/u_serial.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/u_ether.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_acm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_ecm=
_subset.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_eem=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_ecm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_fs.=
koaarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/usb/gadget/function/usb_f_mass_storage.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_obe=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_ncm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/usb/gadget/function/usb_f_rndis.ko: unsupported GNU_PR=
OPERTY_TYPE (5aarch64-linux-gnu-strip: ) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/usb/gadget/function/usb_f_serial.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/libcomposite.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/udc/renesas_usb3.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/host/xhci-pci-renesas.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/usb/gadget/udc/tegra-xudc.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/host/xhci-pci.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/ftdi_sio.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/renesas_usbhs/renesas_usb=
hs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/usb/serial/cp210x.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/option.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/usb_wwan.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/usbserial.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/tcpci.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/hd3ss3220.ko: unsup=
ported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/fusb302.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/fusb302.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tipd/tps6598x.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/tcpm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/typec.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/video/backlight/lp855x_bl.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/imx_sc_wdt.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/meson_gxbb_wdt.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dri=
vers/video/backlight/pwm_bl.ko: unsupported GNU_PROPERTY_TYPE (/tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/watc=
hdog/meson_wdt.ko5: unsupported GNU_PROPERTY_TYPE () type: 0xc00000005
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/qcom-wdt.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/sl28cpld_wdt.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/sunxi_wdt.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libchacha.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/fs/fuse/fuse.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/fs/nfs/blocklayout/blocklayoutdriver.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crc-ccitt.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/fs/overlayfs/overlay.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libchacha.koaarch64-linux-=
gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-n=
ext-20210923/kernel/lib/crypto/libarc4.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libcurve25519-generic.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/lib=
/crypto/libsha256.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/libcrc32c.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libsm4.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/raid6/raid6_pq.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/zstd/zstd_compress.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/802/garp.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/802/mrp.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/802/psna=
p.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/net/802/p8022.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/fs/btrfs/btrfs.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/802/stp.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/can/can-bcm.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/8021q/8021q.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/can/can-raw.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/bluetooth/hidp/hidp.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/bluetooth/bluetooth.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/can/can-gw.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/can/can.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/net/bridge/bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/dsa/tag_ocelot.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/dsa/tag_ocelot_8021q.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/dsa/dsa_core.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/ip_tables.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/ip_tunnel.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/ipt_REJECT.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/iptable_filter.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/iptable_mangle.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/iptable_nat.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/tunnel4.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6_tables.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6t_REJECT.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6table_filter.ko=
aarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/net/ipv6/netfilter/ip6table_mangle.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6table_nat.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/sit.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/llc/llc.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/ipv6.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/nf_log_syslog.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/x_tables.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/nf_conntrack.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/nf_nat.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_CHECKSUM.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_LOG.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_MASQUERADE.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_nat.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_conntrack.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_tcpudp.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/mac80211/mac80211.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_addrtype.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/nfc/nci/nci.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/nfc/nfc.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/qrtr/qrtr-smd.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/qrtr/ns.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/qrtr/qrtr-tun.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/qrtr/qrtr.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/cls_basic.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/act_gact.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/act_mirred.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/act_gate.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/cls_basic.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/cls_flower.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_cbs.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_ingress.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_etf.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_mqprio.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_taprio.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/hda/snd-hda-core.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/pci/hda/snd-hda-codec.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/wireless/cfg80211.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/pci/hda/snd-hda-tegra.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-ak4613.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-dmic.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-cros-ec-code=
c.ko  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20=
210923/kernel/sound/soc/codecs/snd-soc-da7219.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-es7134.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-es7241.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-gtm601.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-da7219.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-lpass-va-mac=
ro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-hdmi-codec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-max98357a.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-lpass-wsa-ma=
cro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-msm8916-anal=
og.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-max98927.ko:=
 unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci=
/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/so=
c/codecs/snd-soc-msm8916-digital.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2c=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rl6231.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5514-spi.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/co=
decs/snd-soc-pcm3168a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/codecs/snd-soc-rt5514.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5645.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5659.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-sgtl5000.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5663.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-simple-ampli=
fier.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-simple-mux.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-spdif-tx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-spdif-rx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-tas571x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wcd-mbhc.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8960.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm-hubs.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wcd934x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8962.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: w=
arning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923=
/kernel/sound/soc/codecs/snd-soc-wm8904.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wsa881x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/imx-pcm-dma.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8994.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-asoc-card.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-asrc.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/fsl/snd-soc-fsl-audmix.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-easrc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-spdif.ko: u=
nsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/=
modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fs=
l/snd-soc-fsl-ssi.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-str=
ip: ) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/fsl/snd-soc-fsl-sai.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-audmux.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-audmix.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-sgtl5000.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-so=
c-audio-graph-card.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-simple-card=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-fif=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-frd=
dr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-audio-graph=
-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-g=
nu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-ne=
xt-20210923/kernel/sound/soc/meson/snd-soc-meson-aiu.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-simple-card=
-utils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-pdm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-sou=
nd-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-spd=
ifin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-spd=
ifout.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tdm=
-formatter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tdm=
-interface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tdm=
out.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tod=
dr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tdm=
in.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-card-ut=
ils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-codec-g=
lue.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-g12a-to=
acodec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp=
/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/soun=
d/soc/meson/snd-soc-meson-g12a-tohdmitx.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-g12a-to=
hdmitx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-t9015.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-gx-soun=
d-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe-clocks.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6adm.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe-dai.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6asm-dai.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6asm.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6dsp-common.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6routing.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-apq8016-sbc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-lpass-platform=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-lpass-apq8016.=
ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/k=
ci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/=
soc/qcom/snd-soc-apq8096.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qc=
om/snd-soc-sm8250.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/qcom/snd-soc-lpass-cpu.koaarch64-linux-gnu-strip: wa=
rning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/=
kernel/sound/soc/qcom/snd-soc-qcom-common.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-sdm845.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rk3399-gru=
-sound.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockchip-i=
2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/rockchip/snd-soc-rockchip-rt5645.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: warning: /tmp/k=
ci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/=
soc/rockchip/snd-soc-rockchip-spdif.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockchip-p=
cm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/sunxi/sun4i-i2s.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/sh/rcar/snd-soc-rcar.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra-pcm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra-audio-g=
raph-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra186-dspk=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210-adma=
if.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210-ahub=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210-dmic=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210-i2s.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-12) =E2=80=94 PASS, 0 er=
rors, 805 warnings, 0 section mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/arch/arm64/lib/xor-neon.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/authenc.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/af_alg.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/algif_rng.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/authencesn.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/blake2b_generic.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/cry=
pto/ccm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/ker=
nel/crypto/cbc.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.15.0-rc2-next-20210923/kernel/crypto/cmac.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/crypto_engine.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/ctr.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/curve25519-generic.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/des_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/dh_generic.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/crypto/ecb.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/crypto/ecc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/ecdh_generic.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/gcm.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/ghash-generic.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/md5.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/sha256_generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/crypto/sha3_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/sm3_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/sm4_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/xor.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/base/regmap/regmap-sdw.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/xxhash_generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/base/regmap/regmap-slimbus.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/crypto/xts.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btbcm.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/block/nbd.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btintel.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btqca.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btrtl.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/btusb.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bus/tegra-aconnect.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/bluetooth/hci_uart.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/arm_smccc_trng=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/bcm2835-rng.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/cavium-rng-vf.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/exynos-trng.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/cavium-rng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/iproc-rng200.k=
o: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/meson-r=
ng.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/hisi-rng.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/meson-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/mtk-rng.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/omap-rng.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/optee-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/rng-core.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/hw_random/xgene-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/ipmi/ipmi_msghandler.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/ipmi/ipmi_devintf.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/char/ipmi/ipmi_si.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/bcm/clk-raspberrypi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/clk-bd718x7.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/meson/axg-audio.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/meson/clk-phase.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/qcom/camcc-sdm845.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/cppc_cpufreq.ko: unsu=
pported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linu=
x/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/cpufr=
eq/cpufreq_conservative.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/imx-cpufreq-dt.koaarc=
h64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.=
15.0-rc2-next-20210923/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/clk/meson/sclk-div.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/cpufreq_powersave.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/mediatek-cpufreq-hw.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/raspberrypi-cpufreq.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/cpufreq/sun50i-cpufreq-nvmem.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/allwinner/sun8i-ce/sun=
8i-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/amlogic/amlogic-gxl-cr=
ypto.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caamalg_desc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/bcm/bcm_crypto_spu.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caamhash_desc.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caam.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/caam_jr.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/error.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/caam/dpaa2_caam.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/hisi_qm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/ccree/ccree.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/sec2/hisi_se=
c2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/zip/hisi_zip=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/hpre/hisi_hp=
re.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/hisilicon/trng/hisi-tr=
ng-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/crypto/qcom-rng.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/governor_userspace.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/imx-bus.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/dma/bcm-sba-raid.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/dma/sh/usb-dmac.ko: unsupport=
ed GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/=
5.15.0-rc2-next-20210923/kernel/drivers/edac/layerscape_edac_mod.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/dma/tegra210-adma.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/edac/layerscape_edac_mod.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/devfreq/imx8m-ddrc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/extcon/extcon-ptn5150.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/firmware/stratix10-rsu.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/dma/sun6i-dma.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/altera-freeze-bridge.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/fpga-region.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/fpga-bridge.ko: unsuppor=
ted GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules=
/5.15.0-rc2-next-20210923/kernel/drivers/fpga/of-fpga-region.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/of-fpga-region.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/fpga/stratix10-soc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gnss/gnss-serial.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gnss=
/gnss-mtk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/gnss/gnss.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-bd9571mwv.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-altera.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-regmap.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-sl28cpld.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/arm/mali-dp.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpio/gpio-wcd934x.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/display-connec=
tor.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/lontium-lt8912=
b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/adv7511/adv751=
1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/analogix/analo=
gix_dp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/lontium-lt9611=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/lontium-lt9611=
uxc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/parade-ps8640.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/sii902x.ko: un=
supported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/=
modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/simple-bridg=
e.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-hd=
mi-ahb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/thc63lvd1024.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-mi=
pi-dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-hd=
mi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-hd=
mi-i2s-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/simple-bridge.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/bridge/synopsys/dw-hd=
mi-cec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_ttm_helper.ko: un=
supported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/=
modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/kirin/kir=
in-drm.ko
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/h=
ibmc/hibmc-drm.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/kirin/dw_dr=
m_dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dri=
vers/gpu/drm/drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/drm_kms_helper.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/exynos/exynosdrm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/etnaviv/etnaviv.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/hisilicon/kirin/kirin=
-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/i2c/sil164.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/i2c/ch7006.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/i2c/tda998x.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/imx/dcss/imx-dcss.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/meson/meson=
_dw_hdmi.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/lima/lima.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/mediatek/mediatek-drm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/meson/meson_dw_hdmi.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/mxsfb/mxsfb.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/meson/meson-drm.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-boe-tv101=
wum-nl6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-edp.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-mantix-ml=
af057we51.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-raydium-r=
m67191.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-lvds.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-simple.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-truly-nt3=
5597.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panel/panel-sitronix-=
st7703.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/panfrost/panfrost.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/pl111/pl111_drm.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_cmm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rcar-du/rcar_lvds.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux=
/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/dr=
m/scheduler/gpu-sched.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/rockchip/rockchipdrm.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-backend.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/scheduler/gpu-sched.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-drm.ko: u=
nsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib=
/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/msm/msm.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/msm/msm.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-frontend.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun6i_drc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun4i-tcon.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/=
drm/sun4i/sun8i-drm-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20=
210923/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dri=
vers/hid/i2c-hid/i2c-hid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hid/hid-multitouch.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/tegra/tegra-drm.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hid/i2c-hid/i2c-hid-of.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/host1x/host1x.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hid/i2c-hid/i2c-hid-acpi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/ina2xx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/vc4/vc4.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/ina3221.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/lm90.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/pwm-fan.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/raspberrypi-hwmon.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-qcom-cci.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/hwmon/sl28cpld-hwmon.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-bcm2835.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-gpio.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/i2c/busses/i2c-qcom-geni.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/max9611.ko: unsupport=
ed GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/=
5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-spmi-adc5.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-spmi-vadc.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/qcom-vadc-common.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/adc/rockchip_saradc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/cros_ec_sensors/cr=
os_ec_sensors.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/buffer/industrialio-trigg=
ered-buffer.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/cros_ec_=
sensors/cros_ec_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/buffer/kfifo_buf.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/st_sensors/st_sens=
ors.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/common/st_sensors/st_sens=
ors_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx=
_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/cros_ec_light_prox.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/=
vcnl4000.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/isl29018.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/iio/common/st_sensors/st_sensors_spi.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/light/vcnl4000.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx=
_spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/iio/=
pressure/cros_ec_baro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000000=
0aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modul=
es/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn_i2c.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/keyboard/adc-keys.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/iio/pressure/mpl3115.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/iio/magnetometer/st_magn_spi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/keyboard/imx_sc_key.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/keyboard/snvs_pwrkey.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/misc/pm8xxx-vibrator.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/misc/pwm-vibra.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/touchscreen/atmel_mxt_t=
s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/input/touchscreen/goodix_ts.k=
o: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/icc-=
osm-l3.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/imx/imx-intercon=
nect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/input/touchscreen/edt-ft5x06.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/q=
noc-sm8150.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/imx/imx8mq-inter=
connect.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kerne=
l/drivers/interconnect/qcom/qnoc-msm8916.ko5) type: 0xc0000000: unsupported=
 GNU_PROPERTY_TYPE (5
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/icc-smd-rpm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-sm8150=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/interconnect/qcom/qnoc-sm8250=
.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp=
/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/driv=
ers/interconnect/qcom/qnoc-sm8350.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/leds/leds-lm3692x.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/leds/leds-pca9532.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/mailbox/bcm-flexrm-mailbox.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-log.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-mirror.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-region-hash.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/dm-mod.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videob=
uf2/videobuf2-dma-contig.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/cec/core/cec.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/md/md-mod.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/linux=
/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/=
common/videobuf2/videobuf2-common.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-dma-contig.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-dma-sg.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/commo=
n/videobuf2/videobuf2-vmalloc.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-memops.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-v4l2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/common/videobuf2/videob=
uf2-vmalloc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/imx219.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/module=
s/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venus/venus-c=
ore.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/dvb-core/dvb-core.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/i2c/ir-kbd-i2c.koaarch6=
4-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15=
.0-rc2-next-20210923/kernel/drivers/media/i2c/ov5645.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/mc/mc.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/gpu/drm/nouveau/nouveau.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/exynos-gsc/exy=
nos-gsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venus/ven=
us-dec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venus/ven=
us-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/camss/qco=
m-camss.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/qcom/venus/ven=
us-enc.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform=
/rcar-fcp.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar-fcp.ko: u=
nsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/li=
nux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/med=
ia/platform/rcar-vin/rcar-csi2.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar-vin/rcar-=
vin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar_fdp1.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/s5p-jpeg/s5p-j=
peg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/sunxi/sun6i-cs=
i/sun6i-csi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/rcar_drif.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/s5p-mfc/s5p-mf=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/platform/vsp1/vsp1.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-adstech-d=
vb-t-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-alink-dtu=
-m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/b=
uild/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc=
/keymaps/rc-asus-pc39.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-anysee.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-apac-view=
comp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-astrometa=
-t2hybrid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-asus-ps3-=
100.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/=
build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/r=
c/keymaps/rc-asus-pc39.ko
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc=
-ati-x10.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-asus-pc39=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-ati-x10.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-a16d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-cardbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-dvbt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-m135a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-m733a-rm-k6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avertv-30=
3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-beelink-g=
s1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-azurewave=
-ad-tu700.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-avermedia=
-rm-ks.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-behold-co=
lumbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-behold.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-budget-ci-old.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc=
-dib0700-rc5.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-ct-90405.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-d680-dmb.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-cinergy.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dib0700-r=
c5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-delock-61=
959.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dib0700-n=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-digitalno=
w-tinytwin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc=
-dntv-live-dvbt-pro.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-digittrad=
e.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc=
-dvico-portable.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/medi=
a/rc/keymaps/rc-dtt200u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules=
_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-d=
vico-mce.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dvico-por=
table.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning:=
 /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel=
/drivers/media/rc/keymaps/rc-dvico-mce.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dntv-live=
-dvbt-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-dvbsky.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-encore-en=
ltv-fm53.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-em-terrat=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-encore-en=
ltv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-evga-indt=
ube.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/=
rc-geekbox.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-eztv.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-flydvb.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-encore-en=
ltv2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-flyvideo.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-fusionhdt=
v-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-gadmei-rm=
008z.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-genius-tv=
go-a11mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-geekbox.k=
o: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-hi=
si-poplar.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-gotview71=
35.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-hauppauge=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/l=
inux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/me=
dia/rc/keymaps/rc-hisi-poplar.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-hisi-popl=
ar.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-hisi-tv-demo.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-imon-pad.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-imon-mce.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-imon-rsc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-iodata-bc=
tv7e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-it913x-v1=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-it913x-v2=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kaiomy.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-khadas.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-khamsin.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/medi=
a/rc/keymaps/rc-kworld-pc150u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-kworld-315u.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/li=
b/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-mecoo=
l-kiii-pro.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-leadtek-y=
04g0051.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-kworld-pl=
us-tv-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-lme2510.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-manli.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-mecool-ki=
i-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-mecool-ki=
ii-pro.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_m=
odules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymap=
s/rc-medion-x10-or2x.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-medion-x1=
0-digitainer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-medion-x1=
0-or2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-digiv=
ox-iii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-digiv=
ox-ii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/medi=
a/rc/keymaps/rc-msi-tvanywhere-plus.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-medion-x10.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-minix-neo=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-msi-tvany=
where.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-nebula.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-nec-terra=
tec-cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-norwood.k=
o: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pi=
nnacle-color.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-odroid.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-npgtech.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pctv-sedn=
a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pine64.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pinnacle-=
color.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixelview=
-002t.koaarch64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (warning: =
5) type: 0x/tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210=
923/kernel/drivers/media/rc/keymaps/rc-pinnacle-grey.koc0000000: unsupporte=
d GNU_PROPERTY_TYPE (
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pinnacle-=
pctv-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixelview=
-new.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixelview=
-mk12.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-pixelview=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-powercolo=
r-real-angel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-proteus-2=
309.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-purpletv.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-pv951.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-rc6-mce.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-reddo.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules_/lib/modu=
les/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-snapstream-=
firefly.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-real-audi=
o-220-32-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-streamzap=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-su3000.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-snapstrea=
m-firefly.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tanix-tx3=
mini.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tanix-tx5=
max.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-technisat=
-ts35.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tbs-nec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-=
cinergy-c-pci.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0=
-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-slim-2.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-technisat=
-usb2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-=
cinergy-s2-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-=
cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-=
slim-2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-terratec-=
slim.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tevii-nec=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-tivo.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-total-med=
ia-in-hand-02.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-total-med=
ia-in-hand.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dri=
vers/media/rc/keymaps/rc-tt-1500.ko/tmp/kci/linux/build/_modules_/lib/modul=
es/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-trekstor.ko:=
 unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: =
0x) type: 0xc0000000c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-vega-s9x.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-twinhan-d=
tv-cab-ci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-twinhan10=
27.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-videomate=
-m1f.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/keymaps/rc-videomate-s350.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-videomate=
-tv-pvr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-videostro=
ng-kii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-wetek-hub=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-wetek-pla=
y2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-winfast-u=
sbii-deluxe.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-winfast.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-x96max.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-xbox-360.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-xbox-dvd.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/keymaps/rc-zx-irdec.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/meson-ir.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/rc/rc-core.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/rc/sunxi-cir.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/tuners/mt20xx.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda18271.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/mc44s803.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda827x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda8290.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tuner-simple.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tda9887.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/tuner-xc2028.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/xc5000.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/tuners/xc4000.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-dv-timin=
gs.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /t=
mp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dr=
ivers/media/v4l2-core/v4l2-async.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/usb/uvc/uvcvideo.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-fwnode.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/media/v4l2-core/v4l2-h264.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/v4l2-mem2mem.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/wm8994.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/exynos-lpass.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/wcd934x.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/media/v4l2-core/videodev.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/misc/eeprom/at24.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/mfd/wm8994.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/misc/eeprom/at25.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/misc/uacce/uacce.ko  STRIP   =
/tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/=
drivers/net/can/rcar/rcar_can.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/flexcan.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/misc/pci_endpoint_test.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/rcar/rcar_can.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/rcar/rcar_canfd.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/can/dev/can-dev.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/broadc=
om/bnx2x/bnx2x.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/atheros/atl1c/at=
l1c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/broadcom/genet/g=
enet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/qualcomm/emac/qc=
om-emac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mscc/mscc_ocelot=
_switch_lib.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethern=
et/stmicro/stmmac/dwmac-imx.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mellanox/mlx4/ml=
x4_en.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linu=
x/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/e=
thernet/mellanox/mlx4/mlx4_core.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-altr-socfpga.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/=
_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/=
qualcomm/rmnet/rmnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dri=
vers/net/ethernet/broadcom/bnx2x/bnx2x.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /t=
mp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-ipq806x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-meson8b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  IN=
STALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/k=
ernel/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/li=
nux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net=
/ethernet/stmicro/stmmac/dwmac-sunxi.ko
    c0000000aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules=
_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/=
stmmac/dwmac-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-sunxi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/d=
wmac-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/s=
tmmac-platform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/macvlan.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ipa/ipa.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/macvtap.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/stmicro/stmmac/s=
tmmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio/mdio-bcm-unimac.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/mdio/mdio-mux-meson-g12a.=
ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm-phy-lib.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/net/pcs/pcs_xpcs.ko: unsupported GNU_PROPERTY_TYPE (5 =
 STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2021092=
3/kernel/drivers/net/phy/ax88796b.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm-phy-lib.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/ax88796b.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm7xxx.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/broadcom.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/module=
s/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/meson-gxl.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/bcm7xxx.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/marvell.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/marvell10g.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/meson-gxl.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/microchip.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/phy/smsc.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/ethernet/mellanox/mlx5/co=
re/mlx5_core.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/b=
uild/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/=
cdc_ether.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/ax88179_178a.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/dm9601.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/asix.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/tap.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/cdc_ether.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/cdc_ncm.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/cdc_subset.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/dm9601.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/lan78xx.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/mcs7830.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/net1080.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/pegasus.=
ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/pegasus.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/plusb.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/r8152.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/smsc75xx.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/rtl8150.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/smsc95xx.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers=
/net/usb/usbnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/sr9800.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/usb/zaurus.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/veth.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modules_/lib/modu=
les/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/marvell/mwifiex/mw=
ifiex.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/ath10=
k_pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/net/wireless/ath/ath.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/ath10=
k_snoc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/broadcom/brcm802=
11/brcmutil/brcmutil.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-s=
trip: 5) type: 0xc0000000
    warning:   STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc=
2-next-20210923/kernel/drivers/net/wireless/ti/wl18xx/wl18xx.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ti/wl18xx/wl18xx=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/broadcom/brcm802=
11/brcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ath/ath10k/ath10=
k_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ti/wlcore/wlcore=
_sdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/marvell/mwifiex/=
mwifiex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/nvme=
/host/nvme-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/net/wireless/ti/wlcore/wlcore=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/nfc/s3fwrn5/s3fwrn5.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/nvme/host/nvme.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/nvmem/nvmem-rmem.koaarch64-li=
nux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-r=
c2-next-20210923/kernel/drivers/pci/controller/dwc/pci-meson.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/pci/controller/dwc/pcie-tegra194.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/pcie-brcmstb.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pci/controller/pcie-rockchip-=
host.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pci/endpoint/functions/pci-ep=
f-test.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/perf/arm_smmuv3_pmu.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/perf/thunderx2_pmu.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/perf/fsl_imx8_ddr_perf.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/allwinner/phy-sun6i-mipi-=
dphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/freescale/phy-fsl-imx8-mi=
pi-dphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/mediatek/phy-mtk-hdmi-drv=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/mediatek/phy-mtk-mipi-dsi=
-drv.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/qualcomm/phy-=
qcom-qusb2.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/qualcomm/phy-qcom-qmp.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/renesas/phy-rcar-gen3-usb=
3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/rockchip/phy-rockchip-inn=
o-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/phy/=
tegra/phy-tegra194-p2u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.ko: unsupported=
 GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.=
15.0-rc2-next-20210923/kernel/drivers/phy/rockchip/phy-rockchip-pcie.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/phy/rockchip/phy-rockchip-pci=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pinctrl/qcom/pinctrl-lpass-lp=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/platform/chrome/cros_ec_chard=
ev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/platform/chrome/cros_ec_typec=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/power/reset/qcom-pon.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dri=
vers/power/supply/max17042_battery.ko/tmp/kci/linux/build/_modules_/lib/mod=
ules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/bq25890_charger.k=
o: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type=
: 0x) type: 0xc0000000c0000000aarch64-linux-gnu-strip:
    warning:
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/power/supply/sbs-battery.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-cros-ec.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-bcm2835.ko  INSTALL /=
tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/d=
rivers/pwm/pwm-meson.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-imx27.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-mediatek.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/pwm/pwm-meson.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/pwm/pwm-rcar.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-mtk-disp.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-sl28cpld.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/pwm-tegra.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/pwm/=
pwm-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/pwm/pwm-sun4i.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/regulator/tps65132-regulator.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/regulator/vctrl-regulator.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_common.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_pil_info.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_q6v5_mss.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_sysmon.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_q6v5.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/remoteproc/qcom_q6v5_pas.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-berlin.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-meson-audio-arb.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-qcom-pdc.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/reset/reset-raspberrypi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rpmsg/qcom_glink_smem.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-ds1307.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: warning: /=
tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/d=
rivers/rtc/rtc-fsl-ftm-alarm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-hym8563.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-imx-sc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-m41t80.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pcf85363.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pcf2127.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-pcf85363.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/rtc/rtc-pm8xxx.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xwarning: c0000000/tmp/kci/linux/build/_modules_/lib/modules/5.15.0-r=
c2-next-20210923/kernel/drivers/rtc/rtc-rk808.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/=
rtc-rv8803.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/rtc/rtc-rv3028.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modu=
les_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/rtc/rtc-rx8581.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/scsi/raid_class.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/scsi/ufs/ufs_qcom.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/slim=
bus/slim-qcom-ctrl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/scsi/mpt3sas/mpt3sas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/slimbus/slimbus.ko: unsupport=
ed GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/=
5.15.0-rc2-next-20210923/kernel/drivers/soc/mediatek/mtk-devapc.ko
    warning:   STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc=
2-next-20210923/kernel/drivers/soc/qcom/apr.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/amlogic/meson-canvas.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/mediatek/mtk-devapc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/apr.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/mdt_loader.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/pdr_interface.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/qmi_helpers.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/rmtfs_mem.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soc/qcom/socinfo.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_m=
odules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bcm2835=
aux.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bcm2835.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soundwire/soundwire-qcom.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/soundwire/soundwire-bus.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bcm2835aux.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-bitbang.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-dw-mmio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/spi/spi-dw.ko  STRIP   /tmp/kci/linux/build/_modules_/=
lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-imx.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-meson-spicc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-geni-qcom.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-meson-spifc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-qcom-qspi.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-imx.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-rpc-if.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spi-sh-msiof.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/spi/spidev.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/broadcom/bcm2835_ther=
mal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: =
warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-2021092=
3/kernel/drivers/thermal/broadcom/bcm2711_thermal.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/imx8mm_thermal.ko  IN=
STALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/k=
ernel/drivers/thermal/tegra/tegra-bpmp-thermal.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/qcom/qcom-spmi-temp-a=
larm.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /=
tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/d=
rivers/thermal/imx_sc_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/qoriq_thermal.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/rockchip_thermal.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning:   INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc=
2-next-20210923/kernel/drivers/usb/class/cdc-acm.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/broadcom/brcmstb_ther=
mal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/tegra/tegra-bpmp-ther=
mal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/thermal/tegra/tegra-soctherm.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/li=
nux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/usb=
/gadget/function/u_ether.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/u_ether.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_acm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-st=
rip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20=
210923/kernel/drivers/usb/class/cdc-acm.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/u_serial.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_ecm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_ecm=
_subset.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_eem=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_fs.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_mas=
s_storage.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_ncm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_obe=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/usb/gadget/function/usb_f_rndis.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/function/usb_f_ser=
ial.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/libcomposite.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/udc/renesas_usb3.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/gadget/udc/tegra-xudc.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/host/xhci-pci-renesas.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/host/xhci-pci.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/cp210x.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/ftdi_sio.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/renesas_usbhs/renesas_usb=
hs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/usb_wwan.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/option.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/serial/usbserial.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/hd3ss3220.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/fusb302.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/tcpm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tcpm/tcpci.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/tipd/tps6598x.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/b=
uild/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog=
/sl28cpld_wdt.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/video/backlight/lp855x_bl.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/usb/typec/typec.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/imx_sc_wdt.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/video/backlight/pwm_bl.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip:   STRIP   /t=
mp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/dr=
ivers/watchdog/sl28cpld_wdt.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/drivers/watchdog/meson_wdt.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/sl28cpld_wdt.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/qcom-wdt.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/drivers/watchdog/sunxi_wdt.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/fs/fuse/cuse.ko  INSTALL /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/lib/crypto/l=
ibcurve25519-generic.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/fs/nfs/blocklayout/blocklayoutdriver.=
ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/fs/overlayfs/overlay.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/fs/fuse/fuse.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/fs/overlayfs/overlay.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crc-ccitt.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libarc4.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libchacha.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/lib=
/crypto/libcurve25519-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libdes.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libsha256.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/libcrc32c.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/crypto/libsm4.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/802/garp.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/lib/raid6/raid6_pq.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/802/mrp.=
ko: unsupported GNU_PROPERTY_TYPE (warning: 5/tmp/kci/linux/build/_modules_=
/lib/modules/5.15.0-rc2-next-20210923/kernel/lib/zstd/zstd_compress.ko: uns=
upported GNU_PROPERTY_TYPE () type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/802/psnap.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/802/p8022.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/fs/btrfs/btrfs.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/8021q/8021q.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/802/stp.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/bluetooth/hidp/hidp.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/can/can-bcm.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/bluetooth/bluetooth.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/can/can.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5=
.15.0-rc2-next-20210923/kernel/net/dsa/dsa_core.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/net/can/can-gw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/can/can-raw.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/dsa/dsa_core.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/dsa/tag_ocelot.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/bridge/bridge.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/dsa/tag_ocelot_8021q.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/ip_tunnel.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/ip_tables.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/ipt_REJECT.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/iptable_filter.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/iptable_mangle.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv4/net=
filter/iptable_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv4/tunnel4.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6_tables.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/net/ipv6/netfilter/ip6t_REJECT.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/nf_defra=
g_ipv6.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6table_mangle.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/ip6table_nat.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/sit.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/ipv6/ipv6.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/nf_log_syslog.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/llc/llc.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/nf_nat.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/x_tables.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/nf_conntrack.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_LOG.ko: unsupported =
GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.=
15.0-rc2-next-20210923/kernel/net/netfilter/xt_addrtype.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_CHECKSUM.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/mac80211/mac80211.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_MASQUERADE.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_conntrack.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_addrtype.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_tcpudp.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/netfilter/xt_nat.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/nfc/nfc.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/nfc/nci/nci.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/qrtr/ns.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/qrtr/qrtr-smd.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/qrtr/qrtr-tun.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/qrtr/qrtr.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/cls_basic.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/act_gact.ko: unsupported GN=
U_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_m=
odules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net/sched/act_gate.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/act_mirred.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/cls_flower.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/net=
/sched/sch_cbs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_ingress.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_etf.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_taprio.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/sched/sch_mqprio.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/hda/snd-hda-core.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/net/wireless/cfg80211.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/pci/hd=
a/snd-hda-codec-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/pci/hda/snd-hda-tegra.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/pci/hda/snd-hda-codec.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-ak4613.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-cros-ec-code=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-da7219.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-dmic.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-ma=
x98927.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-gtm601.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-es7241.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-lpass-va-mac=
ro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-hdmi-codec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-lpass-wsa-ma=
cro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-max98357a.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-max98927.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-ms=
m8916-analog.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-msm8916-anal=
og.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-pcm3168a.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2c=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rl6231.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5514-spi.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5514.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5659.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5645.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-rt5663.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-sgtl5000.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-simple-ampli=
fier.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-simple-mux.k=
o: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/=
lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm-hub=
s.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/codecs/snd-soc-tas571x.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-spdif-rx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:=
 warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202109=
23/kernel/sound/soc/codecs/snd-soc-spdif-tx.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/codecs/snd-soc-wcd-mbhc.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm-hubs.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/codecs/snd-soc-wcd934x.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8904.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8960.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8962.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: w=
arning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923=
/kernel/sound/soc/codecs/snd-soc-wsa881x.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/codecs/snd-soc-wm8994.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/imx-pcm-dma.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-asoc-card.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fs=
l/snd-soc-fsl-asrc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/fsl/snd-soc-fsl-audmix.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-sai.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-easrc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-spdif.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-fsl-ssi.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-audmix.ko: =
unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib=
/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-audmux.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-audmux.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-sgtl5000.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-audio-graph=
-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-simple-card=
-utils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/generic/snd-soc-simple-card=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-frd=
dr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-aiu.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-pdm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-fif=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-sou=
nd-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tm=
p/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sou=
nd/soc/meson/snd-soc-meson-axg-spdifin.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-spd=
ifin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tdm=
-formatter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-spd=
ifout.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tdm=
in.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tdm=
-interface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tdm=
out.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-axg-tod=
dr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-card-ut=
ils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-codec-g=
lue.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-g12a-to=
acodec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-g12a-to=
hdmitx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-gx-soun=
d-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/meson/snd-soc-meson-t9015.k=
o: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/=
lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6adm.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6adm.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe-clocks.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe-dai.ko: un=
supported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/=
modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6core.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6afe.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6asm-dai.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6asm.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6dsp-common.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-apq8016-sbc.ko=
  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202109=
23/kernel/sound/soc/qcom/snd-soc-qcom-common.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/qdsp6/q6routing.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-apq8096.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-lpass-platform=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/qcom/snd-soc-lpass-cpu.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-sm8250.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/sound/soc/qc=
om/snd-soc-qcom-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-sm8250.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/qcom/snd-soc-sdm845.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/qcom/snd-soc-lpass-apq8016.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rk3399-gru=
-sound.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockchip-i=
2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockchip-r=
t5645.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockchip-p=
cm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/rockchip/snd-soc-rockchip-s=
pdif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/sunxi/sun4i-i2s.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-202=
10923/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra-audio-g=
raph-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/sh/rcar/snd-soc-rcar.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra-pcm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra186-dspk=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210-adma=
if.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210-ahub=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210-dmic=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.15.0-rc2-next-20210923/kernel/sound/soc/tegra/snd-soc-tegra210-i2s.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-12) =E2=80=94 FAIL, 1 error, 2 warni=
ngs, 0 section mismatches

Errors:
    arch/riscv/include/asm/jump_label.h:49:36: error: Unsupported relocatio=
n type

Warnings:
    kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wunused=
-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/sched/debug.c:460:41: warning: unused variable =E2=80=98stats=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/sched/debug.c:460:41: warning: unused variable =E2=80=98stats=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 wa=
rnings, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pmu_cac=
he_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu_ev_h=
w_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/sched/debug.c:460:41: warning: unused variable =E2=80=98stats=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 20 warnings, 0=
 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

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
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/sched/debug.c:460:41: warning: unused variable =E2=80=98stats=E2=
=80=99 [-Wunused-variable]
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
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
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 3 warnings, 0 sectio=
n mismatches

Errors:
    drivers/net/ethernet/lantiq_etop.c:265:55: error: =E2=80=98rx_burst_len=
=E2=80=99 undeclared (first use in this function)
    drivers/net/ethernet/lantiq_etop.c:673:8: error: implicit declaration o=
f function =E2=80=98device_property_read_u32=E2=80=99; did you mean =E2=80=
=98device_driver_attach=E2=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    drivers/net/ethernet/lantiq_etop.c:276:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_res=
ult [-Wunused-result]
    drivers/net/ethernet/lantiq_etop.c:284:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_res=
ult [-Wunused-result]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---
For more info write to <info@kernelci.org>
