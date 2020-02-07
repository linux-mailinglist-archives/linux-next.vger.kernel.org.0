Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F6915591F
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2020 15:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgBGOSO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 Feb 2020 09:18:14 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:38329 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgBGOSO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Feb 2020 09:18:14 -0500
Received: by mail-wr1-f54.google.com with SMTP id y17so2890244wrh.5
        for <linux-next@vger.kernel.org>; Fri, 07 Feb 2020 06:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X7aOd98kjfGR7itvk/mEOkacwFBEKKE/lI58Sm64Br4=;
        b=dKCxTemJPy2FPLZR8xjW6uQSySDxav13lqHT4cto6BukyrHwLe4D2MEs+Agf744ebu
         ghm6hpPJIw9zGJI+4yfOTh/4osugxNKUWzapukkzkxTrbEw280YLddqw8+Q/K6QlXvJL
         uWAd8r1mMlhO6bqLQHaCIAJ23lDUt0yC8o+Au/vlxCRjYvIbKLTv5xzfyPFgY+KTzUG4
         mlEhzEU2WTJWSCR6D47BVaRNIKcz+LKYOAd4eta73LZFIYVKRLyWu7rsay5KTjmQBxSw
         pZ9yLkdYZTlXCrPqk0K7EeYZKfciOlpEfB4wjXk9bSMl5QD28ykjiK3Sz7FTOV2th8WJ
         ckLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X7aOd98kjfGR7itvk/mEOkacwFBEKKE/lI58Sm64Br4=;
        b=Wcu/kNIzcTuxqwcK/U+xRcU5xW44fJnt6ibNsPzOgGgdMNqXItFth7UhQRFPODMe/I
         n2OeDBP69sM2MIvdEcQ6dcPAHNrCY9cXf0waV0fiUE94irIzYWfa4cB/a8t6K/o4lyGs
         3AdawPLrCqP8yJhd0hbdFzPIPom7jUZU0hTTO/nwdfoFGehUKxMUAD44ms/e3vBD+4eU
         4wyqOE3W8XheDnfDbh46NoUs6YGLkzrB0SGtNjNI3DyLt9xko7Rl6i0jF4xTAkyibOLl
         SFG/HtiX2uARxOvpZTho0SNI996YZo3xjFiqZmHM4g3426S8+Kx53KN4qnDbYKNswbJ9
         Cgzw==
X-Gm-Message-State: APjAAAVjFfU/i45C16VxKCUGOoo1+Gxka9qObBKQcuek4stZAMFnsINe
        Vt3bXxutRfl4FwzqavWqJR/cQfSNNPB/Bw==
X-Google-Smtp-Source: APXvYqy98k1vvbcQAJjlQuEY1JkzymUGiRFflVVVsDlfnlCZu3WRMH3E6RP+S8AoA0q++Px+WQYV6Q==
X-Received: by 2002:adf:82ee:: with SMTP id 101mr4911068wrc.130.1581085091851;
        Fri, 07 Feb 2020 06:18:11 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d22sm3579048wmd.39.2020.02.07.06.18.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 06:18:11 -0800 (PST)
Message-ID: <5e3d71a3.1c69fb81.58e38.ff5e@mx.google.com>
Date:   Fri, 07 Feb 2020 06:18:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200207
Subject: next/master boot: 211 boots: 6 failed, 197 passed with 7 offline,
 1 untried/unknown (next-20200207)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 211 boots: 6 failed, 197 passed with 7 offline, 1 untried=
/unknown (next-20200207)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200207/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200207/

Tree: next
Branch: master
Git Describe: next-20200207
Git Commit: 6dff1565d69c518e49afb00f2c5c3214c554e0e9
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 23 SoC families, 30 builds out of 215

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 6 days (last pass: next-20200130 - f=
irst fail: next-20200131)
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200206)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200206)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200206)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200206)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200206)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200206)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200206)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
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
