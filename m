Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBAC10E48A
	for <lists+linux-next@lfdr.de>; Mon,  2 Dec 2019 03:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfLBC0m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Dec 2019 21:26:42 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50376 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfLBC0m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 1 Dec 2019 21:26:42 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so124854wmg.0
        for <linux-next@vger.kernel.org>; Sun, 01 Dec 2019 18:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Bg95Yqzh6wJUcbes82DW2kyFub+0fmm1lIJGa6bRlWI=;
        b=dLdax7KBhTutYb0/UzUhOT/NmHrtXmgGEg/2uLX3Wt2OHwzNjjrYbQ0z00vd1cXNrd
         Vb1/n9BicBU6sCHvN1oT9asrpsfykseaZSRNk6mMXZnkeyODY8yIuOe3QLOHYfj3CbRl
         JQLXmjnKn2koCxiJXw5HlKlr+SDzK0M4fVQz+MyLbAGkRfTS3pG5mdRZJuPr1Qb3GvSv
         uV4H2MC2bxsrNgMA+tPR/t05LgFeq6TwLqe1AFlNyfEvtoB8GGI5evVM7WqVaYUzC184
         ytp/L+L3rqwcV5h41T36ht3o482AqKmN+i9s7egaYW12UJAMi0kHSgQF6QTAb6Z/jS9T
         eUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Bg95Yqzh6wJUcbes82DW2kyFub+0fmm1lIJGa6bRlWI=;
        b=W+VeZnrIkMUwapdG04XKyjKq5fEBcWI0HFeNnKfgc/tPLywkt7U7mN4kmw1XbUcKAS
         MrztEJz6gDIHPZdEUE1EEDDc+FATn/wORs9n2oXMs2I5fC8xC1+N48MvknswH5qDu+/H
         MalwicHSAQd5ihkSCKL6oORvSpntt990Tgdyhd8YQeURwmbaGCbCyca7C3EYI01OryLr
         AqiAGEVxgb3AiwD40tjHaY30me/SglKIG+b3n7mvzzuLDCy6hhXGFWDT9P/JymkDrkkK
         g1S6waSMBdhVMmTpokf6VPllG+ZN+hK/9niaMrzl61ROQXTFBaDGyMLBNu5vrjF5PRRD
         h75g==
X-Gm-Message-State: APjAAAWGAp+g3yPuTxQF+ol+PujRniGwBPudCi9cydFzjEPEcTdzM4gH
        yogm+gBbwy6iTFj3g91BhhRZd3cC1qE=
X-Google-Smtp-Source: APXvYqzq0hcE7tHDihXBDs77SK8VGhBRz4YchNyL+s/aD/rahlxL+coYNy+Y3bfuLz3mbLivklMLaA==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr25781175wma.140.1575253599588;
        Sun, 01 Dec 2019 18:26:39 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s82sm22378922wms.28.2019.12.01.18.26.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 18:26:39 -0800 (PST)
Message-ID: <5de4765f.1c69fb81.15a74.1f0f@mx.google.com>
Date:   Sun, 01 Dec 2019 18:26:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.4-9508-gd3b3ce7a0e6f
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 276 boots: 3 failed,
 253 passed with 19 offline, 1 conflict (v5.4-9508-gd3b3ce7a0e6f)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 276 boots: 3 failed, 253 passed with 19 offline, 1=
 conflict (v5.4-9508-gd3b3ce7a0e6f)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-9508-gd3b3ce7a0e6f/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-9508-gd3b3ce7a0e6f/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-9508-gd3b3ce7a0e6f
Git Commit: d3b3ce7a0e6febb262b2436f9a586946ecacbd11
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 27 SoC families, 28 builds out of 217

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            mt7629-rfb: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
