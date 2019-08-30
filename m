Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D808A412E
	for <lists+linux-next@lfdr.de>; Sat, 31 Aug 2019 01:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbfH3X5q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 19:57:46 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37798 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728248AbfH3X5q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Aug 2019 19:57:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id d16so9040759wme.2
        for <linux-next@vger.kernel.org>; Fri, 30 Aug 2019 16:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Zdhq7i+ceYcbpCu691TAfDVnyEvJSvautHI3YdX2wc8=;
        b=Q3trCKzX7RHuvbGaTa7+tBSf7PkVpmChbRRRYh/7k8Qt/NxA6+71vQonAv6S+5Tg7+
         NMHqJD4zwDr57oterCIbP2ETlHVTVePEAefornpBccISiRwNkejUu6qN/bNlDiBZyrod
         KuKh2Z6u4hRwjFWXL8Min4FBnrTyhWtqgNLNQiNEne4rr1oDPzUmVskOztnIyG1tI1lO
         o3j1M0Jh4K3JRnD7vzNhozRwWtttLKzMCbdRU9ftkJu4GREQdR+aIyPr0UZ+hBV/cxEJ
         yuxhB38MRRqCCDpeQgrBWCvEM9WPNyCyHA/VzhqB0X1Z/HV9lFynUpsIVOoTKbT9qKdR
         lMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Zdhq7i+ceYcbpCu691TAfDVnyEvJSvautHI3YdX2wc8=;
        b=CKkBVWQFCP+lzElciiK0WV7Cs9aKgchnVZwkVB6dbO4eLx3rxGzJMm5my/L9RrCZX4
         l9p3+eRphgHkvh55aqs1VGmNkTcs+LKiU1Ryu370eEMcLEVTMiBAgS82/A1Z8uDSmRQy
         CX6gvEMEF8xaGEo/GuBfYXTWJEn4Wb0P6NP9woSC0jPLGfXOgGayWPjElO4+WvMAuh+y
         z0jFo2faokdlDPalsLO0iIyknT61v/Crh+QmEMHn95C4rTY83rTNaZseMkWvug+WMDUo
         YGL+ouKHKfBf+oHEylRzeY7xoQCTPzmSaQDqG171xRGv3xKvVUFBzO1XeeB/P+N+ewga
         56OA==
X-Gm-Message-State: APjAAAXaLdjyIEurvLl0onHCGvN69veIBqb5TI9bPtHFuMl9z2HPQXAV
        MHTdidegTOIc9QhXBZto8HEI+lNIQZhEPA==
X-Google-Smtp-Source: APXvYqye2e588k5irXcuNJZ913K9Js/m0xx6Jlw48qqu7jr62Shma7QgTJx/7SmkCVucJ7i+A5aEpw==
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr20657936wmj.31.1567209464052;
        Fri, 30 Aug 2019 16:57:44 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h125sm15087407wmf.31.2019.08.30.16.57.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 16:57:43 -0700 (PDT)
Message-ID: <5d69b7f7.1c69fb81.659a3.66d4@mx.google.com>
Date:   Fri, 30 Aug 2019 16:57:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190830
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 218 boots: 8 failed, 196 passed with 13 offline,
 1 conflict (next-20190830)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 218 boots: 8 failed, 196 passed with 13 offline, 1 confli=
ct (next-20190830)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190830/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190830/

Tree: next
Branch: master
Git Describe: next-20190830
Git Commit: 6d028043b55e54f48fbdf62ea8ce11a4ad830cac
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 28 SoC families, 19 builds out of 217

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

arm:
    vexpress_defconfig:
        gcc-8:
            qemu_arm-virt-gicv3: 5 failed labs

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    tegra_defconfig:
        tegra124-jetson-tk1:
            lab-baylibre: FAIL (gcc-8)
            lab-mhart: PASS (gcc-8)
            lab-collabora: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
