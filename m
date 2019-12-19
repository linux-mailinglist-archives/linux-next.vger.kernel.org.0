Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEA181262DE
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 14:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfLSNFe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 08:05:34 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:54781 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfLSNFb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Dec 2019 08:05:31 -0500
Received: by mail-wm1-f54.google.com with SMTP id b19so5348322wmj.4
        for <linux-next@vger.kernel.org>; Thu, 19 Dec 2019 05:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cbY85BtfKsaG2j8NtQXeZx/7lovs1CUdgbGAilQHVlw=;
        b=EGSCV+hMYHSBpi9mLhQaHqeXFOT7zUkxb5zSgLByD8Xwa9PpDpMzJRSf2inOUSOMmB
         EoMOawTOZqh4AUFR6pgWuFm+enbVUKJaHF4NIAaqfQfC8+wBpJAFTr4Zn3cvgYUK5zwV
         +j0F4laP4n0E1FcrOChS0zv4rOB3geM4/GXEwuUzj9ylTMtIhQAq928zI6nXYp5bgbMl
         hgnq8mebKk/jhcTLgT9iAQ33WWj+4OveYZIbQ512wcX/RbnVbPVYUokpbXREd6yjPHzO
         HAnPU/vdfNWngF/TaWfGlCAOod0Mhr1jnH/HuFYWtVXY5T3htRu8BPb/D7jWMCy1inTR
         pnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cbY85BtfKsaG2j8NtQXeZx/7lovs1CUdgbGAilQHVlw=;
        b=QMmxmR8068O8TRU9wbXmhqTmeO6vokQyO1hdpeQKtht8uKfdMJpJqMBwbZ/i3WAzAD
         z0oEMKWYhyIzgETzeIJ5hMDlzHQBC5Xkl64eTOYGo9Pr+zMVHlVjdlPTZeUcrR6Nx9ga
         D9VHHf18LoyOyyCNvpWrv41wQ8UJcz/4lhTrnhb+R8p7MM1lVA+Ux57WwHa5S3/Kpu2X
         WhoBYONX3KDfSfsNk0b2+19Z3rkwbz85CsJbd0l2J4zuL/Jub2cCpeCPASu8mCVFJqf+
         T2gETYMO8TG0DS2DVDPxlGQ6orzMGuNBDP13HjkM5+ZB/6Qt6rYh06paBWJRHpGATYoD
         OVLg==
X-Gm-Message-State: APjAAAV+/m9vOUPujftG7CIKSmYYoD9uyfQAfwUom33pB5tvTEOgdkvH
        CKHXec9PRYKrXSDOj7ZBJHF92yB43S7jzw==
X-Google-Smtp-Source: APXvYqxirEQcvUjGTifNZOKg96FDSj/Mko9Mv2IcKHESHnVUVihJByKhNvHVR0dkA2Boe/0ZuGyhBg==
X-Received: by 2002:a1c:e916:: with SMTP id q22mr9791319wmc.92.1576760729127;
        Thu, 19 Dec 2019 05:05:29 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l3sm6236421wrt.29.2019.12.19.05.05.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 05:05:28 -0800 (PST)
Message-ID: <5dfb7598.1c69fb81.8d066.f5af@mx.google.com>
Date:   Thu, 19 Dec 2019 05:05:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191219
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 200 boots: 6 failed, 187 passed with 5 offline,
 2 untried/unknown (next-20191219)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 200 boots: 6 failed, 187 passed with 5 offline, 2 untried=
/unknown (next-20191219)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191219/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191219/

Tree: next
Branch: master
Git Describe: next-20191219
Git Commit: 9f8535c5f75f0e23359962527dbfd31478b2cf16
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 23 SoC families, 28 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
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

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
