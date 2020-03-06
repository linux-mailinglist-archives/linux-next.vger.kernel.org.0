Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72BF617B522
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 04:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgCFDzC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 22:55:02 -0500
Received: from mail-pf1-f174.google.com ([209.85.210.174]:38944 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgCFDzC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2020 22:55:02 -0500
Received: by mail-pf1-f174.google.com with SMTP id l7so424625pff.6
        for <linux-next@vger.kernel.org>; Thu, 05 Mar 2020 19:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nesDU20nzEK6pfP4o8vYQHx8Nl0awgLC8eMVn19xiHU=;
        b=bMhA7ayTgJDXkG+y2xKhosoFb6LRACzyi9W9RtTXdsHXi40pszj0n+T6Z8CuEZ7xOE
         Edj+SjEwJAoMsaIT2lsQhyfEVsMVsFuP6fKz9ApzqR2GqOPZ72s8JGeYMG/vRHbXAfSb
         bmxxKSmOnHi+FpCEYCjsdEJzPVeB/W/TQSUJge81/8FCHdrXMwXcbJhAtEjVuH/lUNvg
         g65m6K3YOsiAqH6d8gMDAmVFZ4FBnsASSXv9RPr/3sHix74vfRXUMJgHvL7HwsYiRMMd
         I//FN+vexV4kaf8exWORZpqd0lFPAQZtqlf+s2tlQErpbpfThXdbkQCFeh5T+tygOsng
         5ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nesDU20nzEK6pfP4o8vYQHx8Nl0awgLC8eMVn19xiHU=;
        b=GcRGJzWa9DyeEEsXqm0RPp/T/30G76/ABvOdDloRiycAvrGPjwlzv82T/f3Os1jbRa
         xW0Jr7YYmvXQEH6/kL8911coEUpNjNPA3Te8p1QWKWS8z1HMRpG3hLJD3GA/2qzv2Wk/
         pLbq2bktijZCTMh9cwBTrC5q0dL/qPvS8GwqsM2qbUXUjusp8m3q8vOBSu0oBrIIltTT
         RvWRbC1UF2FVy6MsvVKOEixOwg8ygKO4nh51wcdWjxzVN9Bs8Y970HFOjDW1z3FIeihW
         8Dt54P+PP7k+OOTX3v6UUMJyWHnpzOzk5KWuLC74eK6QiWLAhik8RsdvynpZuHEZSk2k
         8RoQ==
X-Gm-Message-State: ANhLgQ3j9qN3xQVZXKvF1RF6fbaXeLOiS1jwlvevBBTOBg2Wul5xEnZO
        oo8EfnHafgG+8h8UUKWJQ+cLKKZYnf4=
X-Google-Smtp-Source: ADFU+vu2AuBxXKRu95aqkDrOx49GEVTg+O3hRDQs9s9mm4y2MGS89FPstfZwll1prD5Ygky8Bmu4Wg==
X-Received: by 2002:a63:4752:: with SMTP id w18mr1306139pgk.379.1583466899101;
        Thu, 05 Mar 2020 19:54:59 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m70sm7745185pje.45.2020.03.05.19.54.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 19:54:58 -0800 (PST)
Message-ID: <5e61c992.1c69fb81.5711b.4dbc@mx.google.com>
Date:   Thu, 05 Mar 2020 19:54:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.6-rc4-399-g7f925373eccf
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 197 boots: 4 failed,
 185 passed with 5 offline, 2 untried/unknown,
 1 conflict (v5.6-rc4-399-g7f925373eccf)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 197 boots: 4 failed, 185 passed with 5 offline, 2 =
untried/unknown, 1 conflict (v5.6-rc4-399-g7f925373eccf)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc4-399-g7f925373eccf/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc4-399-g7f925373eccf/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc4-399-g7f925373eccf
Git Commit: 7f925373eccf3ba4d761a9cdd382cf2d6f1fd5c3
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 98 unique boards, 24 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.6-rc4-359-gd038c5ce=
bb94)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc4-359-gd038c5ce=
bb94)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc4-359-gd=
038c5cebb94)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc4-359-gd=
038c5cebb94)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc4-359-gd038c5ceb=
b94)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc4-359-gd=
038c5cebb94)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-rc4-359-gd038c5ceb=
b94)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-baylibre: new failure (last pass: v5.6-rc4-359-gd038c5ceb=
b94)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

x86_64:
    x86_64_defconfig:
        qemu_x86_64:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
