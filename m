Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C68118940A
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 03:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgCRCi0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 22:38:26 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:40342 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgCRCi0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Mar 2020 22:38:26 -0400
Received: by mail-pf1-f179.google.com with SMTP id l184so13029742pfl.7
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2020 19:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/EJBEB3n54YiLnmMmjex6mmilbfYe2+TeSmhP9prUCE=;
        b=qS59ROKTFvglSivTGdo7zCRT9ebTbV28wRqaqEe3ipN3Ox3xh+yBhqlfjNW57Jy/XH
         3biNBYlV4D+5yUIh8xs8vt9Wxxk9YN6NevNZ3qLER7D3lp+FNpwitoJrXTIh2n3/AC3b
         TcpGs7BwZo97pO49nbv8/ABJYH+zOJ17DaeW9CguBJvkDMHpVwhEC4L+I4hyNfobboZk
         Nk3jZ/XXypQLXIfvpnQQ/P72FO50sOKwfZlnJqp71JiIUR9SfFI6SPqT9LeVIYE5scXK
         cz1O9gsKp0w49iIgOYVFzUOvGNSskNZgZrp85VAwEB7Sbur1N3aCo29whBQSz0Bqbhio
         aNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/EJBEB3n54YiLnmMmjex6mmilbfYe2+TeSmhP9prUCE=;
        b=FEPeU5zqm7Hyh89s0IWifKQARkdf4GuOa/Mo7U/zPR8Fz00RyoRPX/b+aWRrzz8HKQ
         Jg3HlyvgQnt3HzNwUU8RgDYUWwX5AFVLj/lA+XltqF8F/wbGU/FCfiVmi1bBVU+RAEVc
         5uvy3cun/Grog0EyAC7rXFW787NK4IduHzEtwBfa02GlfO6H0WKkAqpd8Ouk/J2hFRnU
         tx4aye33fqYIs6rNPztb+AIheGHUCerEp3ANSQNv4hatC0PXxK4/lS/0H8iPTER6z5kD
         Z7kSsfamMhQ+buEoa3KCWIVDEtwWD973aY6tsRJ8ZeujJAmsQ24+bH/6a9t6FySbiRUF
         /94g==
X-Gm-Message-State: ANhLgQ3zzH5xxqNuP6YBapxhSE5tjS+JahuiTVKWNB5IdMPR8L8RLT00
        OgvhV1PgzNxS131giO+Z/FWBx1ZfjF0=
X-Google-Smtp-Source: ADFU+vssnoluIPJ+A4iSCD1up85mCS4nJkwa/BAcvhsEAuuvKX4aaCmZxRQFtYykcuMfAWPwWY0EsA==
X-Received: by 2002:a62:3786:: with SMTP id e128mr2022774pfa.124.1584499104539;
        Tue, 17 Mar 2020 19:38:24 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i131sm3971969pgc.18.2020.03.17.19.38.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 19:38:23 -0700 (PDT)
Message-ID: <5e71899f.1c69fb81.369b1.eeab@mx.google.com>
Date:   Tue, 17 Mar 2020 19:38:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc6-220-g39ff0c2fc628
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 282 boots: 6 failed,
 264 passed with 7 offline, 5 untried/unknown (v5.6-rc6-220-g39ff0c2fc628)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 282 boots: 6 failed, 264 passed with 7 offline, 5 =
untried/unknown (v5.6-rc6-220-g39ff0c2fc628)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc6-220-g39ff0c2fc628/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc6-220-g39ff0c2fc628/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc6-220-g39ff0c2fc628
Git Commit: 39ff0c2fc628b3cbff9e9433dade7685692754ad
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 106 unique boards, 23 SoC families, 30 builds out of 213

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.6-rc6-178-g95cd1625=
5210)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 32 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc6-178-g95cd1625=
5210)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-178-g9=
5cd16255210)
          meson-gxl-s905x-libretech-cc:
              lab-clabbe: new failure (last pass: v5.6-rc6-178-g95cd1625521=
0)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc6-178-g95cd16255=
210)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-178-g9=
5cd16255210)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc6-178-g95cd16255=
210)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-178-g9=
5cd16255210)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
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
