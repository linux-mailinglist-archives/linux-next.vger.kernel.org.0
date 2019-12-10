Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E44351186A3
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 12:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfLJLlR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 06:41:17 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34656 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbfLJLlR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 06:41:17 -0500
Received: by mail-wm1-f65.google.com with SMTP id f4so2095095wmj.1
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2019 03:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=65ebJhxyAbnYKZ8M54/BQBoCZiLgwFA8Kv4C7jBo8Pk=;
        b=LOAuVG+ssDS5KlyRS/42Ba+Udd/+lRQU8V+8OQ9SM14epmNpW6tJ+R2crEARZZaKCQ
         jRX1tKWA9U1UkyNvKxtOWwGwTxKmR2wEm884QHQbQPQ3XQnDfeNBBRgY42P8D2xO7v2Z
         5jKDabq3Gqm+usbMe4tfTV58c67iPH4H0tYY3LzZMjjzsygCvFjGb3cp0Lvf8kaFj3uL
         CFLO74UwmPJpr6LwIPyDRtpPBvUv8O8tbj2RLECbJMo+yCE/gWVYJb4qziOz7DS+/UzF
         iQUo10NE6nsDgW3j1Si5KZBnTYZiyRnR9/aSwFbTXWuQtmOxLBl2bSJDC6MjHqY0aX5h
         ilAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=65ebJhxyAbnYKZ8M54/BQBoCZiLgwFA8Kv4C7jBo8Pk=;
        b=BI02aSqT/37SehRjxRN7BzCwFmyVjqNEyREl1RsYiKzlll4do0qDNH7kXY7t5z01vV
         TCQEkx3rKsnKQUX4gIKMlJSlxa3p9HNIzG4Vt4F1BT2oTcda7NcTx+5CBMpb9X+0bRnk
         q2YMSkxQXyDplXLIekhTHOgCm7dx8O7vKc7FyvEnki8r2XTUXZxgdKcvbSFAoXYFrX+I
         bkSfvsFg0OYC3Z1FCkYI0H6Ylro3cg75t/7/m46x0VnOwj04aThyKgaid/ZZjFkoHyZI
         1BwfAnovaB4nmmR/oBmN9j/ne88w9KnXVJ6oTp3Hd7jNg81rJTMs6BxL0mPoyfd5a3ZF
         wC+w==
X-Gm-Message-State: APjAAAXFZmef/6JApaRunhp2L1lJDHM21yhppfVxtucxs8lD4sFFUXZr
        jQ9+iGasO1zyTuuMFOivrShH7C2gBIUGug==
X-Google-Smtp-Source: APXvYqzE+QCCYSFcPb5keoxff5MFI6YIFQkoao8AS+iwkGIOEoD9pbKaEL3lH4+ftaC4LdGnNgI/wg==
X-Received: by 2002:a7b:c1d8:: with SMTP id a24mr4597508wmj.130.1575978074813;
        Tue, 10 Dec 2019 03:41:14 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g2sm2940162wrw.76.2019.12.10.03.41.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 03:41:14 -0800 (PST)
Message-ID: <5def845a.1c69fb81.19dda.f20c@mx.google.com>
Date:   Tue, 10 Dec 2019 03:41:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-198-g40b53c8a7710
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 258 boots: 2 failed,
 246 passed with 8 offline, 1 untried/unknown,
 1 conflict (v5.5-rc1-198-g40b53c8a7710)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 258 boots: 2 failed, 246 passed with 8 offline, 1 =
untried/unknown, 1 conflict (v5.5-rc1-198-g40b53c8a7710)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc1-198-g40b53c8a7710/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc1-198-g40b53c8a7710/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc1-198-g40b53c8a7710
Git Commit: 40b53c8a7710919a7512a312e1f96320578d5e33
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 26 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
