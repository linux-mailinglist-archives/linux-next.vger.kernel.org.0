Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE7C81955B5
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 11:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgC0Kvj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 06:51:39 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:38871 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgC0Kvj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2020 06:51:39 -0400
Received: by mail-pl1-f176.google.com with SMTP id w3so3312606plz.5
        for <linux-next@vger.kernel.org>; Fri, 27 Mar 2020 03:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iUxR4+v90vKGVkhRj/OAvld6l/Rfh4E4fZDEDj6Z4MY=;
        b=pmPFL2aS9boBH4KhYqzheIOG8P+GL2YpJaNTrcr/5aNEgSkPlwdKGjxAkOQNxB2+Kg
         DsrNI3WW1i2lexr9BFio+VrUy2FSPIXbnMlrphMh0kPrAgu1YmBBRdMi9mO6bc0f+MbA
         c/4Jc44KQACSpyiS7xgtb8h1zubZ3W1Ghx0RlolOiP2+kOXTQ847erio1yu6A9folPrP
         1+WA6gMmxibda5k/GA+j2dPfHElKoGt7xhTIWy515d7pT3cXeWrRLCnYAoX0jaBsoUPi
         qF8qgwEpf7hxzpLiSp9bINLRqF0L867HSaLP1EgtAXnlTydWfFFRqQ1Z9cF/ggpSPnog
         Lwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iUxR4+v90vKGVkhRj/OAvld6l/Rfh4E4fZDEDj6Z4MY=;
        b=BAclbLI30YLdSbcET4SEjQhsRDHsiLtvwLGB3nEVMvH2txeDReljjVo0cxpPN1R2l3
         bpqQU/fF3r5gEjSGqm805P4fR2X0CDpdSjUkeI9A3UJcYzJ3JWE4btWYL8zTNTD1acrR
         VGvxyShMTo+1QGt5Tzbx+On2LGc9Bxeju3yyK+dOhyyImctAGmxlM0TXB6/c68nkKtm3
         fGSYLq++l20NoujL+aKIUvZiCxiYGjhEN1rJOhjYALUOXitpVdm8Vs90FpiuaWgYE3Sw
         xPFDuJQDRHeSY96R7DGH1AlCM2fLTe6mg2FW3UZGUJPW1T8oOOWQqDW8Yqn9nsXBAH+9
         g93Q==
X-Gm-Message-State: ANhLgQ3nKlo/02mPVs2MF/kD/0YD54M1LD4eEom++qaAl3oaxU3OA46d
        iaRTBVpiOW1PznZHIYuDrWgijV2gjdk=
X-Google-Smtp-Source: ADFU+vsVTCebLRlaFAQbijPxAyfWlSJ7RBR6ROj3ou4YPokei+5ZosoH/i3dUtLMVYGfsYuJqPtOUw==
X-Received: by 2002:a17:902:a702:: with SMTP id w2mr12843163plq.107.1585306297591;
        Fri, 27 Mar 2020 03:51:37 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r186sm3919007pfc.181.2020.03.27.03.51.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 03:51:36 -0700 (PDT)
Message-ID: <5e7ddab8.1c69fb81.cc4bb.f322@mx.google.com>
Date:   Fri, 27 Mar 2020 03:51:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-360-g4dc51f5a7118
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 272 boots: 4 failed,
 256 passed with 5 offline, 7 untried/unknown (v5.6-rc7-360-g4dc51f5a7118)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 272 boots: 4 failed, 256 passed with 5 offline, 7 =
untried/unknown (v5.6-rc7-360-g4dc51f5a7118)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc7-360-g4dc51f5a7118/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc7-360-g4dc51f5a7118/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc7-360-g4dc51f5a7118
Git Commit: 4dc51f5a71180a89d86e20fe598316356568c951
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 25 SoC families, 31 builds out of 216

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: v5.6-rc7-337-g9a2ad1626=
af6)

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 41 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: v5.6-rc7-337-g9a2ad1626=
af6)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc7-337-g9a2ad162=
6af6)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-337-g9=
a2ad1626af6)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-337-g9=
a2ad1626af6)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-337-g9=
a2ad1626af6)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
