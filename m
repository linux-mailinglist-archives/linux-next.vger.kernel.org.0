Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1081EDCA4
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 07:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgFDFIB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 01:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgFDFIA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 01:08:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA4DC05BD43
        for <linux-next@vger.kernel.org>; Wed,  3 Jun 2020 22:08:00 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id fs4so558344pjb.5
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2020 22:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UadbWU193Y5iiBy4XvakOIKFMa/7+yhzJy8q8MLgn78=;
        b=byFluaL5em4Bvak8V2NQcMQlbz9tKyZ0tzBSnGcxv8xbDXt1uiBoIlUaZuRZiNxzE7
         zj04yhNAYuAO8SeqqOThZLQlJSQvf7cZwAkvQOY4dxLjJ/ufHvXxrlEFBB8pmcKghugz
         pVQmTaYI2svF4E2GRF9/UvKqOUBp4QrjZU2NXcHEQGEJQBud0c9Yna6DvBoNeoSUuIy+
         R45AJG1dDRuOBqLiGwU9losXkmJVVhYMvvT644blwJ5+KUWAI3imHgRwWuWzG6rpDWVq
         9Cq63FFKWZntlLN27uRp8xlmsWRuP6Mk2h4sE7LHP5Gk+C8Tia1NEqHGaiAxVgvVKS0a
         UOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UadbWU193Y5iiBy4XvakOIKFMa/7+yhzJy8q8MLgn78=;
        b=oCWPj0Kt9LE+x/jtCy7/yB8aOPafPYMpPUj92/nfuJOCxbKZc/z1CIbG1/76JUZ/GJ
         4EV8gENuPoBF0SwXPL3jhekUtFUpeFQk7JkqvMMA0FHISwGdpaSyjvTiXgE1WYGf3446
         Px4whUsoK0Ge4cuhwqESS8clq8uKjnGdgLZhHHopYX+wWKSja2v8NkLdT8dsOLiwzL1E
         D9MC4oNR8LhpSaY9qGLhW755ifcANAUl3rZB2KlU4YqXcVDUsEtV7xtEj9EeD5M0mMzg
         w6FnoGHAISOi8hw6dlhqaixqQbsMoYF45PNV2L/IsFP9b2gazhza9O5xd94H5AF6L4E6
         imzA==
X-Gm-Message-State: AOAM530LPFtBUoUrwvmFzLgWlGdznLPJwb5zXy7b/II5dwZ07oGq+621
        DRzNfDqZWHd3FvlT7nFUYX1u1LS+CtQ=
X-Google-Smtp-Source: ABdhPJy/UspzZsz3S5RlZpRz+nclBGdxSef69lZ+fjbtmcX+x8kR7npPEGVuwN8EjQjDvYSITBs4XA==
X-Received: by 2002:a17:90a:3669:: with SMTP id s96mr3906430pjb.149.1591247279658;
        Wed, 03 Jun 2020 22:07:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x11sm3165443pfm.196.2020.06.03.22.07.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 22:07:58 -0700 (PDT)
Message-ID: <5ed881ae.1c69fb81.6a9b0.9aa7@mx.google.com>
Date:   Wed, 03 Jun 2020 22:07:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-4607-g4ce9138f1bd4
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 225 boots: 9 failed,
 212 passed with 3 offline, 1 untried/unknown (v5.7-4607-g4ce9138f1bd4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-4607-g4=
ce9138f1bd4/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 225 boots: 9 failed, 212 passed with 3 offline, 1 =
untried/unknown (v5.7-4607-g4ce9138f1bd4)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-4607-g4ce9138f1bd4/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-4607-g4ce9138f1bd4/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-4607-g4ce9138f1bd4
Git Commit: 4ce9138f1bd4aa7b70d042445b6ac98c39e569ed
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 97 unique boards, 24 SoC families, 21 builds out of 152

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 110 days (last pass: v5.5-8839-g=
56c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 1 day (last pass: v5.7-rc7-238-g5=
9fcbde6ab90 - first fail: v5.7-930-g3a1d4c3e458b)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-3707-g4973fabb59f=
6)

i386:

    i386_defconfig+kselftest:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: v5.7-rc7-144-g6edb22d0=
7477)
              lab-baylibre: new failure (last pass: v5.7-rc7-144-g6edb22d07=
477)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 54 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

x86_64:

    x86_64_defconfig+kselftest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-3707-g4973fabb59f=
6)
              lab-baylibre: new failure (last pass: v5.7-3707-g4973fabb59f6)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

x86_64:
    x86_64_defconfig+kselftest:
        gcc-8:
            qemu_x86_64: 2 failed labs

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

i386:
    i386_defconfig+kselftest:
        gcc-8:
            qemu_i386: 2 failed labs

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

---
For more info write to <info@kernelci.org>
