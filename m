Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74D41D70CF
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 08:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgERGWJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 02:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgERGWJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 May 2020 02:22:09 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35308C061A0C
        for <linux-next@vger.kernel.org>; Sun, 17 May 2020 23:22:08 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f23so4346635pgj.4
        for <linux-next@vger.kernel.org>; Sun, 17 May 2020 23:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iDcm4l2ZsxAJU2nUSLZlnY/nRv1qOoObNQ0VImP5kLw=;
        b=UCzjTMoiU/fvMoMO6lAYQ/6vrdJDhM71en3ya377DY72ytytAY9HyFOK256lLfcMoP
         f+vHXOxkVV2JrcdDUse5UtQwRPAn1xa2EWCc7g7HmWi0Wi3f07x5+NuCAgD2MdQrSvwz
         6FjwWPTddq9afcW936jG3LBzOuJTeYV23a06h7B1I2sMNFAZUpZzDqc7PAV4odcq/piN
         CWHgVg93v9Jl05p2Hl2v4FMuyM/3YKwBvDTi4bYIXhN3p7nmZft4dAk5G69A3vlOKAyy
         2ZzCfs5FDEFjry3jUNY/H9TooRMFooxJNOTqRzLP3A/LmgoAeEZNQMdR2wC6JRN/Zvhd
         qWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iDcm4l2ZsxAJU2nUSLZlnY/nRv1qOoObNQ0VImP5kLw=;
        b=W1nX/E8qvJ2GaKl1DjCoyFWXjQrQmFAAjb+UrPHJbMhyC8EU1YDUGU121eOaKu8KGh
         Ai0MdOL1uEIsSx3y3MLr0tdXPW5lv8jy9vgbDNZO/zIl2dU4F3t/U0SuirQttNQHVuWW
         I05yr1cTDPdXys2/vGjFrVOC7ATldfQcIvaQDsiKj9aH2yQKl31YH+oUq8VhAAYi29Ia
         /CXoRwJNyYQVM3BsQLoYBq5vzK/9+W87WTI+txcwb/fu3iM1E1Wt9sQo188Lp84yUbwp
         fn/eaFoeCeCAVh7TkTRz47irQU4sbuIdOvttcnI0AsMKJtZqxS8TH+PMvxkF3+wnoybO
         IhJw==
X-Gm-Message-State: AOAM531C6uyEL/juawleImoPgnUBQiArNoGLAaf4FWzJUeprgBQ/0Sj/
        JTVqPX+RTQwquXZApNAiDwvnDUUqJGQ=
X-Google-Smtp-Source: ABdhPJwaPhxXTeouMY2ZPBO71pXcaXd1XIDpMf0QkCO2pLCTjEeFWi5LAaOP8IdyUrHWDT1BZbzdNw==
X-Received: by 2002:a62:2ac3:: with SMTP id q186mr15836141pfq.101.1589782927406;
        Sun, 17 May 2020 23:22:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i184sm7174478pgc.36.2020.05.17.23.22.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 23:22:06 -0700 (PDT)
Message-ID: <5ec2298e.1c69fb81.dd297.3309@mx.google.com>
Date:   Sun, 17 May 2020 23:22:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc5-557-gf7a4ee5329e2
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 236 boots: 10 failed,
 217 passed with 5 offline, 4 untried/unknown (v5.7-rc5-557-gf7a4ee5329e2)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 236 boots: 10 failed, 217 passed with 5 offline, 4=
 untried/unknown (v5.7-rc5-557-gf7a4ee5329e2)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc5-557-gf7a4ee5329e2/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc5-557-gf7a4ee5329e2/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc5-557-gf7a4ee5329e2
Git Commit: f7a4ee5329e2ea5cbbe17eaa8fff8d4e29b9bd7f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 103 unique boards, 24 SoC families, 32 builds out of 217

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 12 days (last pass: v5.7-rc3-277-=
ga37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.7-rc5-433-g662b55c6e=
1a2)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.7-rc5-433-g662b55c6e=
1a2)
          sm8150-mtp:
              lab-bjorn: failing since 17 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.7-rc5-433-g662b55c6e=
1a2)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.7-rc5-433-g662b55c6e=
1a2)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.7-rc5-433-g662b55c6e=
1a2)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.7-rc5-433-g662b55c6e=
1a2)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.7-rc5-433-g662b55c6e=
1a2)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.7-rc5-433-g662b55c6e=
1a2)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 37 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxm-q200: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

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
