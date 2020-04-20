Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5351B0D10
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 15:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgDTNpv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 09:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728354AbgDTNpv (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 09:45:51 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2455DC061A0C
        for <linux-next@vger.kernel.org>; Mon, 20 Apr 2020 06:45:50 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id w11so5059258pga.12
        for <linux-next@vger.kernel.org>; Mon, 20 Apr 2020 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=R80bi5lxv+a2ILzipa/lEoTrwFhJFuAKV/83PeLaD9k=;
        b=Ns0IilfG+Tw7d3TzYiczejsJQyS7PVx/5uINxbYkMrbV2Bib1ZJeqhgvBOMHUxbmkF
         XczdZ1a0MEGV9FIcjxEoJMSgN7uFgLIBeaVN2mWaV00jv4Ln9xDbx+Ek7a+5ySlYYNGR
         i+ftuUavU0vQNx+jRDRu0qEgrmQr9bkd7DkY0t2Tm/YugFc4hhAjbqv2x88lb1PB2fGS
         UYAtPNPiwaPqVcSS2fV6F92RRh82K6lnBn9FepeNTW2pRMOalUi3gEYD6S5miKmMhcAG
         QQr6DeIKL7q82iJFXx73CosnPFshJoFfy+h3SNtnMKWGhUqrSdUR4rHBZp8s5hqVX//o
         HCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=R80bi5lxv+a2ILzipa/lEoTrwFhJFuAKV/83PeLaD9k=;
        b=j7yEg5sb0mTqOy3RxL1zYPSIi1gREIe7YJCzalLBfmq3O8G0OCZTOh3LPIJC5zYilN
         4Dt3wcKz0DUohwW/EOLTE+hTfx4U6Chc7BM35muZZOoyALJ/kYX2iDdopR42oiLNoFoK
         Ujxl6U+PkC4GUy5si/bcQhMsP8hir2VchZFGvTzZaLtmm/9aYoNIfy1o0QJ9uMKIb7Hh
         AGDF5fOiV0WAwjSD5A6jN9qj3tHQBpJfhJnwUxZCo3ftKXBGlzQUsiT05tJpug1Vk7d6
         EtPen1OaojU8DJeWSGuPCO5LZqGKLcicXiuHVjktnZIIB8KHxrfWb7egVUooJyfyZSQj
         dsTw==
X-Gm-Message-State: AGi0Pua57QCf3FoG9EiiAI5fXwjwpkIhqAmDoFPuFlYk/YnF+HSVQqJZ
        dtvqUaGEY9nrLxs7eV6hDArreuStFWc=
X-Google-Smtp-Source: APiQypIN9zFnuKtbXAM6mqKaY4GzjRnPuYdkabWq+SFEIUHd3H6HxVmbfzUzk7jOZTdRXTeXsrno3Q==
X-Received: by 2002:a65:57c3:: with SMTP id q3mr17499159pgr.106.1587390349233;
        Mon, 20 Apr 2020 06:45:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u24sm1203381pgo.65.2020.04.20.06.45.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 06:45:48 -0700 (PDT)
Message-ID: <5e9da78c.1c69fb81.a1b46.2ba7@mx.google.com>
Date:   Mon, 20 Apr 2020 06:45:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc2-194-gf507be28f9e5
Subject: next/pending-fixes boot: 97 boots: 2 failed,
 89 passed with 6 offline (v5.7-rc2-194-gf507be28f9e5)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 97 boots: 2 failed, 89 passed with 6 offline (v5.7=
-rc2-194-gf507be28f9e5)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc2-194-gf507be28f9e5/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc2-194-gf507be28f9e5/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc2-194-gf507be28f9e5
Git Commit: f507be28f9e5516bf0b1e32f0be6d55f130c2de9
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 52 unique boards, 18 SoC families, 18 builds out of 217

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-369-gd=
dfbb969755d)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 6 days (last pass: v5.6-3095-g771732=
386d6d - first fail: v5.6-12726-gcb0447b07277)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-369-gd=
dfbb969755d)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-369-gd=
dfbb969755d)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-369-gd=
dfbb969755d)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 9 days (last pass: v5.6-1=
2182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
