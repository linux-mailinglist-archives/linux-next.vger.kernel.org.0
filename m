Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F112BB52E9
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 18:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfIQQ1T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 12:27:19 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:53545 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfIQQ1S (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 12:27:18 -0400
Received: by mail-wm1-f49.google.com with SMTP id i16so2097565wmd.3
        for <linux-next@vger.kernel.org>; Tue, 17 Sep 2019 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6einYmQd0t6IHDIMHe/VJ3GJB7o+M7MpGrhUWfxEwL0=;
        b=ZbOUOwUCW1sDgKRh9UrQAE4a38RYeWMrHqgaI+DEyabngv3eoLrRcLVvdOYHbocBvw
         p/cYlujA6ku+wny5fwh44Ikdbfy0/Ar1Y+v+Xa3laaFBDFFpG97zOfjncHUEso+RBlOJ
         8eoAh1NnGIYku52MtN7jBfFhOUl2aPgMv2PaWGksIB+DDLx0nbavBRf3WMECOC1XfFgc
         RcNizGbT+rDk4i0lAQMFEz7zzkJDnz0adachkF6d64NGN1nM459ABtWzF01fWHo4LQXz
         0fGorecqDg0egyY3wgxuyVz5c+y3+D2lPReiG+pSzTCHPD6/S+0SdaHZkLi19uiPPKje
         FuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6einYmQd0t6IHDIMHe/VJ3GJB7o+M7MpGrhUWfxEwL0=;
        b=N96KpfCznTzye7cdQWd5wkL2/DqLTRHwu+ONS4iiou/XnO+DfKCl8c40Uogrk7Puey
         pK9Aq3pbNCZPQNo8FibxsZdvcX0ILqPQoCaazV3xNru6BunRJRz1ZnsUI6EdBulA3S2m
         FzQ/Y3QoQQUPy+Uil6KmhMrRkMe8p9Wgv8G/pnuPi4XX8eM0Lus9SGNF6zs/M1S8BYw5
         b9YwevftHa8zzZ51ZM3OtLJ8aQxucSaVCaDSnj58+wT7c1Od2F1suS1CV0wKCpzjRblJ
         7Xml04i2Xn7mlMPh0eUsL55ip0F9IhjuLkZ6xU8zyGvJbXxkPLUJvcVjT4XPqg10g/oa
         7gSQ==
X-Gm-Message-State: APjAAAUoLS4H580l8KN38sKSY0drlyl3pB+XasSr2tiVlyymOnuSv6xU
        yeKrtZbrk66wl4kuVadokrsErYfEcdXOWg==
X-Google-Smtp-Source: APXvYqzZITZ/g9bUQ4mudJkzLnlrSe7CrDQQ/hsuftLH2BeeCFAY+YK5+Eh/CqJMVUaNJxwEtHXfAQ==
X-Received: by 2002:a1c:7409:: with SMTP id p9mr1449981wmc.162.1568737636169;
        Tue, 17 Sep 2019 09:27:16 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c8sm3293510wrr.49.2019.09.17.09.27.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 09:27:15 -0700 (PDT)
Message-ID: <5d810963.1c69fb81.81c9c.f7f9@mx.google.com>
Date:   Tue, 17 Sep 2019 09:27:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-3007-gf8654cb23405
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 329 boots: 17 failed,
 301 passed with 11 offline (v5.3-3007-gf8654cb23405)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 329 boots: 17 failed, 301 passed with 11 offline (=
v5.3-3007-gf8654cb23405)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-3007-gf8654cb23405/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-3007-gf8654cb23405/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-3007-gf8654cb23405
Git Commit: f8654cb234051f3e595b700c1f977d0b6743d6f7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 28 SoC families, 27 builds out of 214

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            mt7622-rfb1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab
            sun7i-a20-cubietruck: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-cubietruck: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubietruck: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

---
For more info write to <info@kernelci.org>
