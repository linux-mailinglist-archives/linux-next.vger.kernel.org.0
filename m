Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D3287E03
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 17:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfHIPax (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Aug 2019 11:30:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38390 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbfHIPax (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Aug 2019 11:30:53 -0400
Received: by mail-wr1-f68.google.com with SMTP id g17so98624885wrr.5
        for <linux-next@vger.kernel.org>; Fri, 09 Aug 2019 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Zueq/TZ+NpgC89NIbZR6sbWO3F40+HI3f9rI1Sbq2bk=;
        b=Nb5TkHu4QMumwmDYrNIO9fYY+ziYRWF1I/t9WxTSJwOL1Fo4HE78RelmTfYjDIbxsG
         n0zI177jg8nlwIDRfo308Pc272cawGB5HF8l7U1fu9A8dFpURrr1RmvT9htP2K/WoZoK
         qrr2T90MUD3nqsFoNzAVZO5AIUUuo6qYlm64H6iwtTjSmv5/zTkJWWBuvo05QwcKRU1c
         67c/1MKYP6PcWYef01EblrAlIx35Ocxb99DhcVAmwR814gjxAG53OXziw30+Bal9fI91
         9xDHEjpMQ7wAD9UapYId+YUgvh0o5nBbfMoP5D1Wyv6pSAOpT84RnAhg1nmhkPU6koxL
         +2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Zueq/TZ+NpgC89NIbZR6sbWO3F40+HI3f9rI1Sbq2bk=;
        b=UExU5sCcUH/UIz/zkgSx3/GSiTKXZAk+/12/USEOwGMscFL9+nPTRIy3LHtq+AVuBt
         FV8eFjxctgCdrlE9CRX3TFvpFkVzU/zFVmYw4BnlMszzR/ZXH8dDm0YeSRStTxl3SbwG
         RwLYKAGv1BpyUvEwQ+LO3bgBUHBm2oCQHC9KanuKbHKI6UFrn9ClBynifqPgSsfKA2wM
         0+vn5e9LmMzmkwKMg1fe7z583G8WQtMfOyc9n+NeARwA8mRnP3EkSR4IsToLfH0MIuHN
         QXT/Bha/D4NArHjUyr/mgNBwWgVOLKdxHc3cHJceTLi6blFm+JTkn9/UE3PkAnd3333z
         AbnA==
X-Gm-Message-State: APjAAAXqvkomj1YMKHJZqY24ivPwkbT61bGsCiPMs4nkV/C2Vn8lWP40
        dnJi2Xgd73kyW/ch/sHtOiFZaDl42lYJIg==
X-Google-Smtp-Source: APXvYqy5HcthKOrDiqU10MCCFDABxRRZi5+snVGgV1fRD33Y0vK6D685ye67ivaSaMMKTc/wRObztQ==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr12274093wrx.122.1565364650654;
        Fri, 09 Aug 2019 08:30:50 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o9sm458735wrm.88.2019.08.09.08.30.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 08:30:49 -0700 (PDT)
Message-ID: <5d4d91a9.1c69fb81.8cc6f.29b7@mx.google.com>
Date:   Fri, 09 Aug 2019 08:30:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190809
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 261 boots: 9 failed, 227 passed with 20 offline,
 2 untried/unknown, 3 conflicts (next-20190809)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 261 boots: 9 failed, 227 passed with 20 offline, 2 untrie=
d/unknown, 3 conflicts (next-20190809)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190809/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190809/

Tree: next
Branch: master
Git Describe: next-20190809
Git Commit: 87b983f55b8ccaa0aa185e0e7672c1fa007cbf7f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 28 SoC families, 21 builds out of 230

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm64:
    defconfig:
        qemu:
            lab-baylibre: PASS (gcc-8)
            lab-mhart: FAIL (gcc-8)
            lab-linaro-lkft: PASS (gcc-8)
            lab-drue: PASS (gcc-8)
            lab-collabora: PASS (gcc-8)

arm:
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
