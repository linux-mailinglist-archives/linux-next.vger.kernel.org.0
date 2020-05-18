Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BA11D8919
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 22:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgERUY6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 16:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgERUY6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 May 2020 16:24:58 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408E4C061A0C
        for <linux-next@vger.kernel.org>; Mon, 18 May 2020 13:24:58 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u35so5359490pgk.6
        for <linux-next@vger.kernel.org>; Mon, 18 May 2020 13:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wRrQQEINQ6McbCrNRAAZ/5wvF9cYfnQljiwKKWxMAZU=;
        b=ygFKMkkPR85/boutHTVvk05H5Stp3g6sj/yFEPV/S5/WCzMXtT7dRQjlvrVBB/gxT6
         JgzvtJ4zoOr0TmeZxzLREPat4LG7I5ZTKcPThmn1HSZEEHozOiJHq9L7HBFlVB9UTWFw
         oRvdLkQwjFYLcXszbL1xJCBO6n5qOvKyY6bMbYk0RofZjLU8anA8r76OWmamTHKIIpYs
         fD0Lm3SIjRIvNYBse2d5mB4n8N+vmmubiV7WDbQN5ZfYCRCbL+9C2yTEItRRwd4cUOMi
         yufEaE/JLLjhG2ymoc7rdQrvJPpvvySjOALjEzhaugLqjz5jspejd5mN8J9g+KHHyQAk
         ymGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wRrQQEINQ6McbCrNRAAZ/5wvF9cYfnQljiwKKWxMAZU=;
        b=VnhrUc2ZMN4DhC4ZFcIsR+jYPhPYGSIYlA6B5JjIaZ092thZenzlmvK+ivS44kSCge
         gGocG26qJ0FqadefGU7Ngp7A9SR/bguqQ3BwMN4umCoID9OPnnjBId7KES6ur8Lmic3v
         750HHL5D8pf5uhWkHopEkWcjHcmMDgd54DQnCmtDUw66k47i0Kdre5+rTJOGp7HeIAkQ
         q9IsS2AvxzLAsQRMWu7kEPnN5g5pBwvhZVRfJk5t4d938OJ+n8Y4Nc8v2TluGc6DlxAo
         T9p1uRNHM2+h4E4LnEjwpCO3DOrB5uEFuGvfj8gi3aNeq90Ov2RX5BorJdrD4siHssfW
         4fDw==
X-Gm-Message-State: AOAM533H0jB3jBLfH3/A4J5legOwfqiIysr0qKG1OxxHeYofF95H7YJE
        dAKJ4EyzJD0z0muyFHkMJV0XIPOs7Os=
X-Google-Smtp-Source: ABdhPJx/sHeituhSMU7L14UXuuGzcPEkJdogldr07ug84u/EjkLflu6Jken/QDP1A0EsfrgVrHF3gg==
X-Received: by 2002:aa7:8c44:: with SMTP id e4mr18398236pfd.108.1589833497342;
        Mon, 18 May 2020 13:24:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w126sm9650508pfb.117.2020.05.18.13.24.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 13:24:56 -0700 (PDT)
Message-ID: <5ec2ef18.1c69fb81.e9c4a.ea8c@mx.google.com>
Date:   Mon, 18 May 2020 13:24:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200518
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 175 boots: 8 failed, 159 passed with 5 offline,
 3 untried/unknown (next-20200518)
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
https://kernelci.org/test/job/next/branch/master/kernel/next-20200518/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 175 boots: 8 failed, 159 passed with 5 offline, 3 untried=
/unknown (next-20200518)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200518/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200518/

Tree: next
Branch: master
Git Describe: next-20200518
Git Commit: 72bc15d0018ebfbc9c389539d636e2e9a9002b3b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 24 SoC families, 31 builds out of 227

Boot Regressions Detected:

arm:

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle:
              lab-baylibre-seattle: failing since 4 days (last pass: next-2=
0200501 - first fail: next-20200514)
          omap4-panda:
              lab-baylibre-seattle: failing since 4 days (last pass: next-2=
0200501 - first fail: next-20200514)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200515)

arm64:

    defconfig:
        clang-9:
          sm8150-mtp:
              lab-bjorn: new failure (last pass: next-20200511)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 52 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle: 1 failed lab
            omap4-panda: 2 failed labs

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
