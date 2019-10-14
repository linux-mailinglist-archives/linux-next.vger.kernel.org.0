Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F153D5A2D
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2019 06:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfJNEVg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Oct 2019 00:21:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:47084 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfJNEVg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Oct 2019 00:21:36 -0400
Received: by mail-wr1-f68.google.com with SMTP id o18so17860630wrv.13
        for <linux-next@vger.kernel.org>; Sun, 13 Oct 2019 21:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cFATIKrOdEYkckM2z8/XeTtk0ClYOuTO5ZiHDQ5juEs=;
        b=HXNs18DLoN4xTNfuwW3odvcFqEUENK5CjYWq6fBqY5CxLihV27wcdEtst/qu8v/yqv
         ChlnB6payyYe6DLhuzQbfE6SBwAIG3Nk9lnGW+Ydx2X6MNg78ZAWm3XgvgoN3oehFCvT
         o3Qhed/5WJU2Qf3jdQipfpkLE7xnhjlRRcyh0JuwAW/qHZwp405OA5MZn62wwEFiQofQ
         bAKJrBJO5RwcvVZ7DSPSxXDr7u212rlxxypP6fejTM8v3B1GKZeozkOoxrDBpbpPcuJI
         1tMrPs6I00746N3K8+/B/squrrgZXN6YG4X0800zUg8SSYTryyUtDGLvR2HQhjkTiSKb
         l6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cFATIKrOdEYkckM2z8/XeTtk0ClYOuTO5ZiHDQ5juEs=;
        b=Ef6i5zXZFw1Ps2rY9qDs0+O6TZJKruRfTcEyUBTEieuDLDBMgkl4+FO9rMT1as9YNy
         4+05DnzxirzOsFpeLM4EBtqZgr4np8kGfL1BbL1RxN0SEwB3+MZNiO37LKyyaRGHWDXV
         wa0r9QXJ6r1elMnm0igegIq5lCBWdn2syjG5l/pBj9QRPS6DfxB7CDQp03OlIaEGc8gU
         lrmYBndNf/vy9jWVOASTZtNES1pVi/Bc2lKCJRkQ4/mTja9Tj9kcJ9vtSbic5Xl0ayBn
         dfZYyrFLXV/tcQSWLZE06FlxUEU1QuelQnThp7MByGPaABKE8PGsjWq0BYzrxkUJxVK7
         C7Mg==
X-Gm-Message-State: APjAAAXeXwSVRxg2bePsOKwPpTkh5Rg017yxJCVeUeq2b2i31IHtAKx0
        Rr6tBSHCAqQZhdACVr25PZ8GPXln7N8=
X-Google-Smtp-Source: APXvYqzYwqtqMbpXzxPLHgxe1HIhvFLz7YglepxwwAEW1QI0wR8WMaz40AF8bQBu7R97KGzSW76UOQ==
X-Received: by 2002:a05:6000:12d1:: with SMTP id l17mr13230077wrx.2.1571026892346;
        Sun, 13 Oct 2019 21:21:32 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t83sm39846240wmt.18.2019.10.13.21.21.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Oct 2019 21:21:31 -0700 (PDT)
Message-ID: <5da3f7cb.1c69fb81.3a5fa.59eb@mx.google.com>
Date:   Sun, 13 Oct 2019 21:21:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc2-630-gfdf8dc3f1fdb
Subject: next/pending-fixes boot: 291 boots: 9 failed,
 264 passed with 15 offline, 2 untried/unknown,
 1 conflict (v5.4-rc2-630-gfdf8dc3f1fdb)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 291 boots: 9 failed, 264 passed with 15 offline, 2=
 untried/unknown, 1 conflict (v5.4-rc2-630-gfdf8dc3f1fdb)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc2-630-gfdf8dc3f1fdb/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc2-630-gfdf8dc3f1fdb/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc2-630-gfdf8dc3f1fdb
Git Commit: fdf8dc3f1fdb186036212aabebdd08a2cdd73038
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 26 SoC families, 28 builds out of 215

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            mt7623n-bananapi-bpi-r2: 1 offline lab
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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm64:
    defconfig+kselftest:
        meson-gxl-s905x-libretech-cc:
            lab-baylibre: PASS (gcc-8)
            lab-clabbe: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
