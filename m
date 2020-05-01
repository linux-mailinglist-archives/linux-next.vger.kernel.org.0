Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F8B1C2140
	for <lists+linux-next@lfdr.de>; Sat,  2 May 2020 01:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgEAX2P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 May 2020 19:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726045AbgEAX2P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2020 19:28:15 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F2BC061A0C
        for <linux-next@vger.kernel.org>; Fri,  1 May 2020 16:28:15 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id mq3so520996pjb.1
        for <linux-next@vger.kernel.org>; Fri, 01 May 2020 16:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zU0p6+7rFhKV4w0trHmO7/rhGCByyJ2dkm1zsGOk8Cw=;
        b=DCABdxoqL93SwaJmKToAxqU6R245JFL3nmr4icxNiwjZK9xhQLLqitNjb5gzGDGk1h
         qIOeJl+VcSjET988QDlUH2Q2So8YQ/d0Ne4DG+Eu3vtKT6YXp8HfKmC6SXTRzeOHK2GA
         VCHw2uqFoIknS29oIN2nSpTpTHhG++H16NBSUPgYafIMY33MVV7q2N4s34SRtxW6NURD
         FlWgLdPWO7ZvW0q7Oy1Rmt04MDYjocBxGiUnD8FgSMB+O6C62uFbDm99KaLp58VPlSYR
         eljSh7DdIsEKiRcUR/H/GNWWWOVOQIVZVt4kC3QJh+qzsjFa4P6oQSZ20yIBVhE2J60n
         1KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zU0p6+7rFhKV4w0trHmO7/rhGCByyJ2dkm1zsGOk8Cw=;
        b=kTOnm9t3uVtvkLmfx7UDgWK/F1TCE/gD6/ie7GNDC8spX7lvUCtbOMWDu/ZtoLzhlb
         KPQuYxQJbyCrQzIzws/V+EgwltfN4vsNVgRLC15Ico+07xvVeyIbKEE4KEDpClhNlk66
         7AWmNPwJyFnpEprmmooRgBrUTLaijZy0xDaDh1q5kH1o1P+K/MhgsFIcbZ+KHRPT+GW1
         yft/YnvbtFKQPMxuROZREIe0nfE/wVEBXDKMth4VftgUk0x+zUPQ4ddMtwQWVj7IskHk
         /gbQ96mI8dsPKkOYYIDowigOZLxTly1SebZ2sB0ggxG6goy0atl/41gwrFXiEDoNTKc6
         jsfQ==
X-Gm-Message-State: AGi0PuZpANSw+SykOsYWFP+oKWWzOTbO4qLJGoQxgr1GK/AZhlOol8Cd
        hjhLQSd9daHzXGRTHKLEibJoXBNndqc=
X-Google-Smtp-Source: APiQypKxsXOWXDFSIONv2cq9+OoohRXmI2MpCSlAOiyFwutULF8XogYNDaGDcFldY+8GAggwfRPVYQ==
X-Received: by 2002:a17:902:c403:: with SMTP id k3mr6915197plk.12.1588375694087;
        Fri, 01 May 2020 16:28:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u5sm3137709pfu.198.2020.05.01.16.28.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 16:28:13 -0700 (PDT)
Message-ID: <5eacb08d.1c69fb81.2dcc.b9df@mx.google.com>
Date:   Fri, 01 May 2020 16:28:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200501
X-Kernelci-Report-Type: boot
Subject: next/master boot: 286 boots: 7 failed, 264 passed with 7 offline,
 7 untried/unknown, 1 conflict (next-20200501)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 286 boots: 7 failed, 264 passed with 7 offline, 7 untried=
/unknown, 1 conflict (next-20200501)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200501/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200501/

Tree: next
Branch: master
Git Describe: next-20200501
Git Commit: fb9d670f57e3f6478602328bbbf71138be06ca4f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 110 unique boards, 25 SoC families, 31 builds out of 231

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20200430)

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 74 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200430)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200430)
          sun50i-h5-nanopi-neo-plus2:
              lab-clabbe: new failure (last pass: next-20200430)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200430)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 35 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            sm8150-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

i386:
    i386_defconfig:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
