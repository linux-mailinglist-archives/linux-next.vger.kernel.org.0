Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCC711655B
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2019 04:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfLIDVS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Dec 2019 22:21:18 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:43629 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbfLIDVS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Dec 2019 22:21:18 -0500
Received: by mail-wr1-f54.google.com with SMTP id d16so14360678wre.10
        for <linux-next@vger.kernel.org>; Sun, 08 Dec 2019 19:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gvJneCftfCN9PlIcmUCVr6B+Hf6HdExtwRsbsfJUd/I=;
        b=NmUo5tVGvMq/fXjUsjnV0o7i11FK8RT2tGt9szN6MBGhqh4IfjhI3E0vpLXOiEOZte
         GxS+ReyEUFGE393+U7XruplCOsj4fqkhB4nJfauKlwblmNJTCRsU4YM2G6pRA6Y+tqK7
         UNtOuPnxKfWefKuuoqZ+0L/mKz76AAKTSgd4neHp23/RUrqokSACSWbjDyNUULY/I2OI
         v2imADly4fTpBFsh3MQGN+MhfxtUfP4WcPUiZDlg2VINVlQ3M6N95fy5EtBxB9lqrE+I
         81rAg8vfUz6bfj+dt96o4EiTnAEiq3Atx/BSouXUdGA/NacvL11vwJkJlKAFM5/1Eqw6
         7psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gvJneCftfCN9PlIcmUCVr6B+Hf6HdExtwRsbsfJUd/I=;
        b=SEBL29zT/SOSHhhvFbmzuNe/kbxKqPcCQHO2RXdlgOjyautqcN8b7wGteOsJfvMkJD
         h2UNQ4XsTUwipZXKU0Q+ZLv8CE8yDf34qpiI05yNmI0P/aYkg1eIWQMRSVnoCTrxwSy6
         ex1qPiJad89/KGkhkRhiJgf6Q95yPKZatovvSJjfC+6gFYmWTZlNrYNgJDB3yZHKI70V
         O3AAyN7mnOsiOpT9sB5Uyh1fSG8AL8Pu3HZ2aTEj2bOmxEdHXt6GpYg3oJ0QaIFG6j2s
         7yP8Zv5KKrNUtw1KMko2MHhOoVaD17B0WhBj+nfEbt98iubMPzRXPDhzti4HNjfG8te+
         rurQ==
X-Gm-Message-State: APjAAAVe6qD+GrX4xt+0evkXFaYynTua7w6oVaRwX6HtDiuRDNuf6wAu
        NMdoq5Mt8nfXg1ruUk1+M9/yI+Exqnc=
X-Google-Smtp-Source: APXvYqwk3sGdpqlRiCmKiwRWWJT9pOFDKzvBrkunVHQ3HPmpxClsX9AvTNTrIA9a5CP96QKPm8gstA==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr27146229wro.234.1575861675599;
        Sun, 08 Dec 2019 19:21:15 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a127sm12781587wmh.43.2019.12.08.19.21.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 19:21:15 -0800 (PST)
Message-ID: <5dedbdab.1c69fb81.708f5.7ca3@mx.google.com>
Date:   Sun, 08 Dec 2019 19:21:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-13541-g4663b79ece60
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 276 boots: 4 failed,
 262 passed with 8 offline, 1 untried/unknown,
 1 conflict (v5.4-13541-g4663b79ece60)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 276 boots: 4 failed, 262 passed with 8 offline, 1 =
untried/unknown, 1 conflict (v5.4-13541-g4663b79ece60)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-13541-g4663b79ece60/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-13541-g4663b79ece60/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-13541-g4663b79ece60
Git Commit: 4663b79ece608f2dc6167bfa2f05227ce40c0835
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 97 unique boards, 26 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

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

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    exynos_defconfig:
        exynos5422-odroidxu3:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
