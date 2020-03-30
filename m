Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45A07197273
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 04:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgC3CbG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Mar 2020 22:31:06 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:38686 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728231AbgC3CbG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Mar 2020 22:31:06 -0400
Received: by mail-pl1-f174.google.com with SMTP id w3so6138913plz.5
        for <linux-next@vger.kernel.org>; Sun, 29 Mar 2020 19:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Jssfjmmy5nkV0XkoRWjMBKaovhmGQ94NCk/p1qylt9w=;
        b=e14zTc8mlXoHP2GAbZHwaZinOty7Lq98KTuZhbxki7ddNkhQjk6eTjRUITp7TDRbnO
         3XE+ndvkAog5+FYxNDyHYHp9t1dlIn8SyI/8Pyo0qopm9oo+Ox+Itr3oVC2/YsE1IC5j
         vjETC+HrmcEq6mJ1aL1Fcszf7TsEGRZfP2LfPvW9JK3rtzXDtc5ypVyYFSt0bK3cjHPY
         VsYOxtYRhOYzKnPCOVvlrYT9Uh57QNgB4YSk2UMf548ljMEUYGuOjJQ+/rMvtAG0MVyG
         vvNGmkGrNit/1o0Xt2ObGVpEQZbAtJ3W56K5oy85iqIUEX+V/wq26v3ZOD0lEttePnRB
         0a0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Jssfjmmy5nkV0XkoRWjMBKaovhmGQ94NCk/p1qylt9w=;
        b=pWFlSFpUbObTTrxYg1oU1VptIACuGKwK1Vgqgdc+Wd4C4uvX2lAEBGqTCkWyAjvqBS
         dPpS6MeaED06qqkyD7ns/gpVW+2bKoxgbF/C35+hDpWUSBHliVm+C7zY8Jlr7lq9oOc2
         n95rjjBEL4vG6KXri0c4FkLInf65AHSSHSezx1KGYHObGLIOvsJztaEbM4ikLgVWzB22
         cT+2KF6DsTUBkPquWLFj28uAibu3u7Up1SFAYjumpCnFqH/QrsvZ6AUz32DW7PC5OZSR
         PRRkWyIOX5akIMn8TggVAV5xIXHzKn+dviPMAgePotcsvvBSkuAR+LTM9++2m5enJJGs
         0X9w==
X-Gm-Message-State: ANhLgQ32bBahsH6ZoxS73mfxl9kWolxzwYG0JzSzWmVPD8OT9/VUIm4A
        SYN1ZHwvt1LohkAbCb7S7WQ+Ljfi/ns=
X-Google-Smtp-Source: ADFU+vvwJP9FDMg+2Zs9SmGu+Qp6p4II0yUiKiG5u3seUSk+lZVHxtwAlVBd6rQEHJe6ak2Zfdnlug==
X-Received: by 2002:a17:902:b692:: with SMTP id c18mr10737026pls.7.1585535464408;
        Sun, 29 Mar 2020 19:31:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r9sm4234283pfg.2.2020.03.29.19.31.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 19:31:03 -0700 (PDT)
Message-ID: <5e8159e7.1c69fb81.d34cb.6feb@mx.google.com>
Date:   Sun, 29 Mar 2020 19:31:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-404-gbcaebd8567a2
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 278 boots: 6 failed,
 262 passed with 5 offline, 5 untried/unknown (v5.6-rc7-404-gbcaebd8567a2)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 278 boots: 6 failed, 262 passed with 5 offline, 5 =
untried/unknown (v5.6-rc7-404-gbcaebd8567a2)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc7-404-gbcaebd8567a2/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc7-404-gbcaebd8567a2/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc7-404-gbcaebd8567a2
Git Commit: bcaebd8567a2ab4f4c551d5c503004a2059e2ac5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 106 unique boards, 24 SoC families, 30 builds out of 216

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 44 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-360-g4=
dc51f5a7118)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc7-360-g4dc51f5a7=
118)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-360-g4=
dc51f5a7118)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-360-g4=
dc51f5a7118)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: failing since 2 days (last pass: v5.6-rc7-236-g=
af338e2cb004 - first fail: v5.6-rc7-337-g9a2ad1626af6)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
