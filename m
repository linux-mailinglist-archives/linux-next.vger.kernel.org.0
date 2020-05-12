Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F7A1CF1AC
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 11:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgELJeV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 05:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725889AbgELJeU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 05:34:20 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686DDC061A0C
        for <linux-next@vger.kernel.org>; Tue, 12 May 2020 02:34:19 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x13so207159pfn.11
        for <linux-next@vger.kernel.org>; Tue, 12 May 2020 02:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5FsDkFIPWhov0rFENNnKgF5eno8dRE+c3ATY91lhRCw=;
        b=IxXPL2Sk9+2iP6efl4Caej/ebdxZ0v8CQkhUYHq5BJkmrMbmBYxUFJabfAWq59SVD/
         4ZTCSZRLVdi33zw8cCQbHTuv8LsESxGC03/gbXGNVkNt/VpMnHvRM5LfGUjVPD12zfBQ
         dkSyWnMrpqLxsOqKqbnZphtLiM5dSJIvqqz9w4Kv2BYtd65qybsCrF/n0MLm69+hHawT
         H+hraf2YWUdwHu9D6kUgM9gsyyqqD8YxkPAxxwL5qxqpXb/tbQ4zo0Jxa0TqpN3SEBjm
         tgH20pVLg9kItyJ+R4v6ilsGY9x+p0EaweHH6MORisrYfiBGhSt8QqvBxvfMNU8QBb0N
         tjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5FsDkFIPWhov0rFENNnKgF5eno8dRE+c3ATY91lhRCw=;
        b=pFP5xVsO6ygz9F6QHu91uD3kze5GnsTuyWXo792tLuSzUSpT7RuPmrr5dHUpNiio60
         QsUwRcZ+lgAa2qZuanyJ8vUvAEE7BJczQE3vM6+Ezl0ecZne5fd+VIMrVaQc1CaGiD51
         RUJxxef4Rw4No/X1YxDZDd+yThiB8TX9nD0PrAHGNTfIh06gpRCKTrhKEWyPgNgIxo6P
         LhcD/yhS5YTRqOtgZB8oAiheZsHo2pWRfue4WHM3+P5GshmYZ5FCoD/vy9M4lWrCa2y6
         lJinTdQuLLnWmgbVu3r9XZuB0NKy4Tbn8e/yCogKHm/SSWdMPcdmjE8LstFzOunc7+Fx
         nYVA==
X-Gm-Message-State: AGi0PuY2akBIF8vQQA52f6rKU/VM97q9iQdnHSLomhVm9wnh70rpXoA7
        W9MOTbE/8UGNf4YfIt4DOstalDjN5Ko=
X-Google-Smtp-Source: APiQypJ0pSkYmdt7oL7HNdIJY1tVCaVV9dK1D3j6k2z/ei0Ox1J5b/mrTFn7htFV7rtZoIrpVZ9f2w==
X-Received: by 2002:a63:190a:: with SMTP id z10mr17931687pgl.331.1589276058586;
        Tue, 12 May 2020 02:34:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k6sm12227760pju.44.2020.05.12.02.34.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 02:34:17 -0700 (PDT)
Message-ID: <5eba6d99.1c69fb81.29d6e.dc39@mx.google.com>
Date:   Tue, 12 May 2020 02:34:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc5-221-gd375d7acb750
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 231 boots: 9 failed,
 212 passed with 5 offline, 5 untried/unknown (v5.7-rc5-221-gd375d7acb750)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 231 boots: 9 failed, 212 passed with 5 offline, 5 =
untried/unknown (v5.7-rc5-221-gd375d7acb750)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc5-221-gd375d7acb750/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc5-221-gd375d7acb750/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc5-221-gd375d7acb750
Git Commit: d375d7acb750f642c8d6d671098c78aaea147791
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 103 unique boards, 24 SoC families, 31 builds out of 217

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-cubietruck:
              lab-baylibre: failing since 3 days (last pass: v5.7-rc4-280-g=
8474014cf12d - first fail: v5.7-rc4-364-ga267cf4704df)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 6 days (last pass: v5.7-rc3-277-g=
a37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 3 days (last pass: v5.7-rc4-364-ga26=
7cf4704df - first fail: v5.7-rc4-407-g604da24420e3)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.7-rc4-552-g1e823790a=
7f1)
          sm8150-mtp:
              lab-bjorn: failing since 11 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.7-rc4-407-g604da24420e=
3)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-sei510:
              lab-baylibre: new failure (last pass: v5.7-rc4-552-g1e823790a=
7f1)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 31 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            imx7s-warp: 1 failed lab
            sun7i-a20-cubietruck: 1 failed lab

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
