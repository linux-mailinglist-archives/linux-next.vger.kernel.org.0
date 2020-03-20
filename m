Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B67718C692
	for <lists+linux-next@lfdr.de>; Fri, 20 Mar 2020 05:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgCTEis (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Mar 2020 00:38:48 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40439 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgCTEis (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2020 00:38:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id h11so1985236plk.7
        for <linux-next@vger.kernel.org>; Thu, 19 Mar 2020 21:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KM4nn+vUN7I2c9qdeIJzjiFjj0AGSJ8NOSjI7cHRCqY=;
        b=GBxiMyos+V+7EX590vHG1GhgHINe44CnmMh380KtYasBaZp7h3gmREJT5f5ok8mDhl
         7jJzG1XXqNuVi+6fjIQ4h321wRY6Yk1Cger2skv0I58XFPVoAaf1LpXj1yXAEiP0PrkW
         Xs5qZeJlBULO4gsHCviWI48zMoOXWs7swmqPBZQ48QTrQ5Jnh5NNNI1BEHvs2df0aa0R
         QmdKgx1dL+ByvFeTlQwDRzSiKlVgAPpmvH/XJuJ2YWq9Tpds/+EAyzCYACKnh7yPC/Ol
         P0miFRXdrksRTg5antLqo/s5latYnwggjFLQrV7JoxGLYZD9Pm1cixXjdh3Yh+qW2pN+
         M5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KM4nn+vUN7I2c9qdeIJzjiFjj0AGSJ8NOSjI7cHRCqY=;
        b=XzG5FAgfFD7Uf1lRtT6Q/y+6jcFJySYYSbyrWt1jDMzy8/tKxx6kNv5ljCeju4cKcU
         42JIGCDK67/Loo1iWI0Uv2kq5C5snl8vXb8Cytw42AZqR6z3WNlWbETq8bSWJGU2TVoa
         kWzeKavPSASeC8ftsuWep6ptSHG+rHzrmSbPd2z/MzQh2KLGNS+P80vH8EaEWmpacQTA
         EvkmYVqPjVbJ3Yakrh4vXL2HSWeUwKXcLS8zt+2wpM4uefmJHgpEVzmGyoGHi0EcLB48
         On14nuBOCw1OsBWWcNTIvoeDgCvNKVUwjJcY+UFx8ceN+HkzfUjm5jOqeRKLQZ4wSoab
         6bqQ==
X-Gm-Message-State: ANhLgQ3I3qpwbx2D3VVFeWflQ6lu4eCwMwK+d6889IA8kZ7mHgXP7Byx
        yFhz9E86kpLOU50/XSmpKs8Wb4ZETdg=
X-Google-Smtp-Source: ADFU+vts4PDo/zAOgsc/VmucjI6uHNLMOLaBtORoYlLfJf72xVsiXpTBRuyzEwQQ5zjEzumUukP71A==
X-Received: by 2002:a17:90a:364d:: with SMTP id s71mr7055618pjb.185.1584679126084;
        Thu, 19 Mar 2020 21:38:46 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y193sm3739500pgd.87.2020.03.19.21.38.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 21:38:45 -0700 (PDT)
Message-ID: <5e7448d5.1c69fb81.1cbd8.e6a8@mx.google.com>
Date:   Thu, 19 Mar 2020 21:38:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc6-295-g996cfaad8d71
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 280 boots: 3 failed,
 267 passed with 4 offline, 6 untried/unknown (v5.6-rc6-295-g996cfaad8d71)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 280 boots: 3 failed, 267 passed with 4 offline, 6 =
untried/unknown (v5.6-rc6-295-g996cfaad8d71)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc6-295-g996cfaad8d71/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc6-295-g996cfaad8d71/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc6-295-g996cfaad8d71
Git Commit: 996cfaad8d71b254a245cfbb6f04852fb68fa85e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 106 unique boards, 25 SoC families, 31 builds out of 216

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 34 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc6-269-g4a20aa05=
3992)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-269-g4=
a20aa053992)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc6-269-g4a20aa053=
992)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-269-g4=
a20aa053992)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
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

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
