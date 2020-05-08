Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0F91CADF1
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 15:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729806AbgEHNGN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 09:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730310AbgEHNGL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 09:06:11 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED12C05BD43
        for <linux-next@vger.kernel.org>; Fri,  8 May 2020 06:06:11 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id s10so718900plr.1
        for <linux-next@vger.kernel.org>; Fri, 08 May 2020 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qUg0uulGr6AAZE0/MkmmHIUHdY+5vkbQAs4+t0WeM4Y=;
        b=sUIKj09dHgywhulOqiyLONaOZxNbWi1UfR0fXzPOOcFaNgNk312pU+CInHEQDaE/i8
         WUX8jrHJAV4udd7+b5nAE+2tNveCCRNKz0CBSLPXTaIqs3mv1ne5kD/WgWB0b/0p1bJu
         PYw5N9xH/NVXys6drzFrecaXCMS4P73TAweoHaunB+LW60Rjp+hlu86t7TroA3rFIzCq
         LzpC/WC4tkPUafUA8Sgo84B2ufjVyW8+AYuvEudAQMW+6I7cVfN/ulPSW2iyxQ/ao7Ol
         2vu0ATMHHV2toaRUpgDWoYJqPVxc1/SPp3NKwShiPS7NtBU+URA/MVQ4YBha2sk8MDe9
         817w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qUg0uulGr6AAZE0/MkmmHIUHdY+5vkbQAs4+t0WeM4Y=;
        b=BMRPjvpREmvNGHgPANNqkjxBPlWZ8W0uxnqDQ5U1UTddK4vRJ8WFR9kAdm8mmNb4fd
         KCK6cZOX2Zyeq74jtZaVlMZFjUYJWiRbu0/KTZZIM7cxJr+jGhYWO3/OyiX559hJLMvL
         N9lpxfo4cX1uLgIUUQ+IXc40WkIbS6u+ubmpY9R6b3aj+6iZ9CBx8LJRNFw58MxAZUCZ
         nSHp/5qBS7nrgoeOcP2PRShxdfxSaFX2KHc8x9eycXEHkk0Ucnr0T/Vr3AH13dPg1coT
         7puaefvmIyk+3G5uh61UX82tzMDA0yrUU2CzO2ATadVCakZGRsyyaCtyW0WVYCZ1HuIY
         yYpQ==
X-Gm-Message-State: AGi0PubiQVImEdmDP/1kD3IJU8GXNnuMLVK7PfRTS9z/WqOS97o5w8OE
        XTZEP/wYJKy1ChtyCJlSDoOsLM1ol0k=
X-Google-Smtp-Source: APiQypJIKygMsd1q8vbmEn55Yvj/i0TlT2o9ZAKJkF4Ui7drtIncD1a5sfnWsz86RoQ8OmuIHNnk+A==
X-Received: by 2002:a17:90a:a012:: with SMTP id q18mr5456569pjp.220.1588943170702;
        Fri, 08 May 2020 06:06:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a129sm1851886pfb.102.2020.05.08.06.06.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 06:06:09 -0700 (PDT)
Message-ID: <5eb55941.1c69fb81.7d92e.861b@mx.google.com>
Date:   Fri, 08 May 2020 06:06:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc4-407-g604da24420e3
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 253 boots: 6 failed,
 235 passed with 6 offline, 6 untried/unknown (v5.7-rc4-407-g604da24420e3)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 253 boots: 6 failed, 235 passed with 6 offline, 6 =
untried/unknown (v5.7-rc4-407-g604da24420e3)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc4-407-g604da24420e3/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc4-407-g604da24420e3/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc4-407-g604da24420e3
Git Commit: 604da24420e3235abb205b203fa86d3ad13ddf35
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 25 SoC families, 31 builds out of 217

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: v5.7-rc4-364-ga267cf470=
4df)

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 83 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.7-rc4-364-ga267cf4704df)
          sm8150-mtp:
              lab-bjorn: failing since 7 days (last pass: v5.7-rc3-194-g163=
1e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.7-rc4-364-ga267cf4704d=
f)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 27 days (last pass: v5.6-=
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
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

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

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
