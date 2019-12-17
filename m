Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A54051225FD
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 08:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfLQH6Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 02:58:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33890 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbfLQH6Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Dec 2019 02:58:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id f4so1611921wmj.1
        for <linux-next@vger.kernel.org>; Mon, 16 Dec 2019 23:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TohxYsnswd9YRxDxfO+8zic0mquIuVRiboQvIPoAG5c=;
        b=vPYKQtm+a8+G9dfyQSVxZpUlppG+kxRAl5CRhsrtotBK0+RT0ZDsmUkkNOnam5rrCP
         +5g74d3G3yn6g2r1Vdl8XSYFADs0VYY3DbYTIVI+UJepusPjwsIkT3miaNLoQ125dTrg
         7JoFtVxYxelKY1EoVUoNtbN9YdzA+67NLXgtQ1IV8v03/spSGeacD7fgLjnUofZthl5a
         tWiQlInXS1WDgbFg7KRKD1jwxLrfMIQL3zJ+wE49wPG4M7u2isSi9AheS69xrNdv9rhh
         jJ0L6wuP0rrZWouGwqU64ZlKnna16h/1dmPU0EusPT8j17olRyBNW6Uw+ZdLt+ITvxBu
         2Drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TohxYsnswd9YRxDxfO+8zic0mquIuVRiboQvIPoAG5c=;
        b=lSLDQAkKCE0hyi9ExPAd86asA0jx9fjXDTXFGNemkFWmPDamn20Ttdgf6gK4z5uEEA
         ciOIn3E6lmNclVnLPgxPf2eS1vUJrjZL2qfBNHpHxcAPpI47Oh7Vsrlsbr+eieyxv88u
         9hvlipJvdNp0ivLbtoXNH2LPHsJVE2mAzckhl0IcfAI2aeqKGuaV3AmpUSZWq/UthlGj
         0TRFJHcmsqWXqyYofFiNAd1A6EcNt+6yDcLKXF3fb0Zy2Mj5o9O6GWgiw3jwKN3PsUae
         IIx+uGiP+CosekvDfqXvPwzDVQfX7bupJl4VlNGuQhCeZ9PWN6gA7VcC/l5IF822Cqq8
         hmIw==
X-Gm-Message-State: APjAAAUoAyaNcYSHJg9ndBkLHgjctcoqr8TXk79gduQSfCpqrVtj6evZ
        82Xgui4Dbfxfg4Ps9Hze4l7sMcOTtUM=
X-Google-Smtp-Source: APXvYqxjOnGUVdhXAG/bMSAch/JQiHPwCZu/PFeC4813HVEmo12c005P7rEaAH1/kC/J5x5H4GUZPw==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr3907754wmh.21.1576569501768;
        Mon, 16 Dec 2019 23:58:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x11sm1995670wmg.46.2019.12.16.23.58.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 23:58:21 -0800 (PST)
Message-ID: <5df88a9d.1c69fb81.eff7.a078@mx.google.com>
Date:   Mon, 16 Dec 2019 23:58:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc2-313-g8dd4dfbde178
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 241 boots: 5 failed,
 212 passed with 23 offline, 1 untried/unknown (v5.5-rc2-313-g8dd4dfbde178)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 241 boots: 5 failed, 212 passed with 23 offline, 1=
 untried/unknown (v5.5-rc2-313-g8dd4dfbde178)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc2-313-g8dd4dfbde178/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc2-313-g8dd4dfbde178/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc2-313-g8dd4dfbde178
Git Commit: 8dd4dfbde1789d2367e9be50ab6a865840f229d5
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 26 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

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

    omap2plus_defconfig:
        gcc-8
            omap4-panda: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7629-rfb: 1 offline lab
            omap4-panda: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab

---
For more info write to <info@kernelci.org>
