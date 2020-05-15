Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112E81D4891
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 10:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgEOIfN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 May 2020 04:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727869AbgEOIfE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 May 2020 04:35:04 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7252FC061A0C
        for <linux-next@vger.kernel.org>; Fri, 15 May 2020 01:35:04 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b12so622770plz.13
        for <linux-next@vger.kernel.org>; Fri, 15 May 2020 01:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AVNYD2+VxOGaNbstTyJbu16rTaLPHRwONq65RtfMI+8=;
        b=XMywIFv1bafJI0jLLFbqiMpV7AK2wzqjDc+ClhTxcwFWH3jg8lVpR0VRqUY6jsiMVb
         IC+yTBNvN2OSqmiaP92M2Kh1q2OuBNUnaT9GmkF6onaxdDByTn5IgL9/I8Ya9N0L3zfS
         pV+JSjOTSCulCU2JH/9JWe0pM6hHbrEztJkjhgDmusFacfdvayZ1A9OME6rK46ujaLyG
         0cEjpqPDy8KDNdNW2zpOA3ywbP4ItRsyo0TdwVLPLGi7afkiDJ6ubZFIef5FDXRZqBEZ
         Aeim+9zyi+JVUhBQ/I1YyIv+C+pTAWPhmpnz0fWuJG63+TYfpsZrHAcnkYoPat294ng3
         MRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AVNYD2+VxOGaNbstTyJbu16rTaLPHRwONq65RtfMI+8=;
        b=hWjPhP9PaYTyyqhdRS+ieK9nhzOK5mdhoBQ2FdqtbavYS8rrHogWJrMx22lK68cjKe
         EcKgaSXlLFwQUYkh+LJvNuhw1yG4i3hfVdMmBvj5trBbA8IbqI0wRoIC02gFWD19FfBC
         jN0VAa1XAX/nUBG2QGsbHvZQAlehm8M9aqYNap13s8p4BW0RjeiX2a4r5NAmlGInBOAT
         aEFS7GYEjQT6WTRSMgZjpOy2xUKGOhc26Yl0VhJ4OblZ1W3qHlwmm2XFqwXi+QJZPp/l
         9DrPQ7BY6jkObhWdWjNZC88DzYb9ypzpxjv0nq00UGHJbln3JtrKMxrG5SW1KEnJAvKv
         hgMw==
X-Gm-Message-State: AOAM5310x9XKSaNKuQ8dGE5rCXEVU4MX1/7c6S9L1FNHPECryNPGOsuZ
        3X/k1S/2TxSQ/ThUSFJfcnH0FAsPJbg=
X-Google-Smtp-Source: ABdhPJyuWpnsdPEBgAqO8577gZSPJkZBeUkyA7rjcYt8JtC517xGKMJGqaL/Cy4YDpinK8Uq/JbFVA==
X-Received: by 2002:a17:90a:d103:: with SMTP id l3mr163752pju.167.1589531703480;
        Fri, 15 May 2020 01:35:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o68sm1310759pfb.206.2020.05.15.01.35.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 01:35:02 -0700 (PDT)
Message-ID: <5ebe5436.1c69fb81.6aa49.48b9@mx.google.com>
Date:   Fri, 15 May 2020 01:35:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc5-433-g662b55c6e1a2
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 229 boots: 8 failed,
 213 passed with 5 offline, 3 untried/unknown (v5.7-rc5-433-g662b55c6e1a2)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 229 boots: 8 failed, 213 passed with 5 offline, 3 =
untried/unknown (v5.7-rc5-433-g662b55c6e1a2)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc5-433-g662b55c6e1a2/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc5-433-g662b55c6e1a2/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc5-433-g662b55c6e1a2
Git Commit: 662b55c6e1a2c852247de024e791fc65db62e0ef
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 23 SoC families, 31 builds out of 217

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          stm32mp157c-dk2:
              lab-baylibre: new failure (last pass: v5.7-rc5-310-g752f10c4a=
54e)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 9 days (last pass: v5.7-rc3-277-g=
a37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

arm64:

    defconfig:
        gcc-8:
          sm8150-mtp:
              lab-bjorn: failing since 14 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.7-rc5-310-g752f10c4a=
54e)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: v5.7-rc5-310-g752f10c4a=
54e)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 34 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

i386:
    i386_defconfig:
        gcc-8:
            qemu_i386: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            imx7s-warp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
