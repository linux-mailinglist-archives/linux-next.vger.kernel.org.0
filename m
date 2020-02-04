Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D540151F59
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2020 18:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgBDRYI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Feb 2020 12:24:08 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:41348 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbgBDRYI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Feb 2020 12:24:08 -0500
Received: by mail-wr1-f44.google.com with SMTP id c9so24108175wrw.8
        for <linux-next@vger.kernel.org>; Tue, 04 Feb 2020 09:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=00nuKK+LdYxeG/GhMq0KAQk7fb2U5F5sZi0m88nVBZo=;
        b=zpBCS1hMRZ4QiTlWTulJ4yazjsn99ONvHhkGhS/wvGAXpb6q9nBiGomkei3qAiRpPK
         Z9eXc+dCA/a1l1BDZjSqc7LfxgZZl8dgGu0S0yz7Pzg+ApwFuQu21mbpuct3uh0LZuLk
         QOXRn8Tx2mlorC6yqrwgJe6oj7JJK0v/uuQznzuxWfWuZ++tWyIkrXsFIR2CLE1+BmWm
         E8aDifrlMd2N9j0TUQEmf9Rld3YCTUY1FADCD06x5r1KfpOivNA2fBt3/37i5k+L+EJd
         3iS9JLjM7t6WtJfXuUYLFCclxkFbWTKIiAcZdgHzC2jG8E/OeH19DBFAaKH9lne0loyy
         l8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=00nuKK+LdYxeG/GhMq0KAQk7fb2U5F5sZi0m88nVBZo=;
        b=jkBFH4Ry94gr3P1FUbjPpaJtqalSGJLxXjS9L8Nnpx3AtpgTR76Gj+OaXOawfsVqxj
         9iyFmM/Fuwv1wocFsU2s8lZlqNieV30G/iK9GIy+ySTBtybfNUz2m4nmt0AqiJjXj1Pe
         yMagw4yYS+QvGeEeot28O/M5qaTGapKuo/BL0wbQDpwmpbPc0KdhrEBkAPPaTklhyM8O
         OU0sjXChRdyMLK4XEiO36CIU0bqk9fO+YL7rZveq0A1xMPalpRc3rrUi7Sf6PSJDXbBX
         HdMs/jgYRHIvoXWMzBDrln8F/wDvlgnx/QIMyApBmCS2sUyNjJ022o9iHoJv1daK0Y81
         ZxAg==
X-Gm-Message-State: APjAAAUqvL7nm/hDRV7vQccteBLpnMXrMXttR8yqFRK/XoLE2ngUZ9RR
        x/r4VrewP5zExpPS7k3i+idQCaNObbTswQ==
X-Google-Smtp-Source: APXvYqyKKXcZEKLap9IExNOzeagcNQmU8KoLhC0Th95s2QbhdpEp1I9BF+hfC09vtm8K9aUtU4Py2Q==
X-Received: by 2002:a5d:55d2:: with SMTP id i18mr21773561wrw.287.1580837046237;
        Tue, 04 Feb 2020 09:24:06 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 11sm5237310wmb.14.2020.02.04.09.24.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 09:24:05 -0800 (PST)
Message-ID: <5e39a8b5.1c69fb81.8ed49.8655@mx.google.com>
Date:   Tue, 04 Feb 2020 09:24:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200204
X-Kernelci-Report-Type: boot
Subject: next/master boot: 245 boots: 12 failed,
 231 passed with 2 offline (next-20200204)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 245 boots: 12 failed, 231 passed with 2 offline (next-202=
00204)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200204/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200204/

Tree: next
Branch: master
Git Describe: next-20200204
Git Commit: 03cd8b289266238f8122d11c2aa14763ca1e2971
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 25 SoC families, 29 builds out of 200

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: next-20200203)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20200203)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
200131 - first fail: next-20200203)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 4 days (last pass: next-20200130 - f=
irst fail: next-20200131)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200203)

Boot Failures Detected:

arm:
    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab
            da850-lcdk: 1 failed lab
            dm365evm,legacy: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            sun4i-a10-cubieboard: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

---
For more info write to <info@kernelci.org>
