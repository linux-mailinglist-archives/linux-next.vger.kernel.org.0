Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4775C9624E
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2019 16:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbfHTOVD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 10:21:03 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45563 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbfHTOVD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Aug 2019 10:21:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id q12so12590675wrj.12
        for <linux-next@vger.kernel.org>; Tue, 20 Aug 2019 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ShGHPCCry6YXBsLvu6n/VAXjThrNYGs1tF2N40hzl/c=;
        b=mE6eG5Hjpg4VDQJHmR8SkETZ/1bX8NaeMI0etqMdx6nqRUrhe8gOYaamxywM9+QrNw
         1sKcH9BzBJxlgJ7Hj1wHNdoG2v4eKmLsN4kNtp+fC6Np27wTFssUWalFz4KvIB80cB4u
         IhvmQ/+jy082+lJ3IjLv8XGmirkD9iwUNgWAGmGWyQim7If1cvR8gPubYtWmSvCnPBag
         RMikZp4id9/M7q5MP+gvlAECJnoG1UlPoePwAWUO21iizXrsl/8IQBkIx1/zBuijNjrJ
         Nt8p5HtdLjjWlaAC/E4IJD0pMbKA9FmhRO9/91rrxXCBP01fu27Keg3Rf4dhok2CXLvn
         DNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ShGHPCCry6YXBsLvu6n/VAXjThrNYGs1tF2N40hzl/c=;
        b=UnbXQWaBuu9u1s676Eg11CzapQx3OCuHC06OfQnc6sT4uTZE5Sk/IkJaGSzMEF9mBK
         0hpp2nmhmgzvbqHXvtz/UXvjXk1SuEHBfdUTo5mqQGli5855f671EJhxms9Je90WmGfo
         5uuNdXrhU9RSWmJNcq7FSr4LGPTvPHso+AdKaQ2PfU1eq/jWa9PHAYE+b+EH5hzNgG4p
         En4EKYRCHOS2TsAbOdxqsewOTzPBtwccnW2YRDLYrx3jWea/hMy8aIMFb6gddYSpbS85
         bKTGWaxidbgWrSpjWiBuulIudV7oyh5GlfJgjlxs0JJeJI4i9wr2N5Sgg+jVJa4E2t/m
         leSA==
X-Gm-Message-State: APjAAAXwcSW1lOODnn2CBwOnKZA0f//BdCcHE8yVJUzoEVhdCnsSRU0Q
        xZ1SaIsnp58yYkGNdQSizOOoL073763fCg==
X-Google-Smtp-Source: APXvYqxueEMC4qWjHegmvjhmp0SLHQZVs29o/X1rcnKwpzZjZ7PJhF1BMU1IoHkOaPALcRc2Uuj7OA==
X-Received: by 2002:a5d:63d0:: with SMTP id c16mr34624066wrw.22.1566310861021;
        Tue, 20 Aug 2019 07:21:01 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f197sm259760wme.22.2019.08.20.07.20.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 07:20:59 -0700 (PDT)
Message-ID: <5d5c01cb.1c69fb81.f7cf.124f@mx.google.com>
Date:   Tue, 20 Aug 2019 07:20:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc5-221-g5995e3fbeb96
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 232 boots: 3 failed,
 205 passed with 23 offline, 1 untried/unknown (v5.3-rc5-221-g5995e3fbeb96)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 232 boots: 3 failed, 205 passed with 23 offline, 1=
 untried/unknown (v5.3-rc5-221-g5995e3fbeb96)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc5-221-g5995e3fbeb96/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc5-221-g5995e3fbeb96/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc5-221-g5995e3fbeb96
Git Commit: 5995e3fbeb96d0aadc8164ab68d66360d96c6359
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 28 SoC families, 22 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
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

---
For more info write to <info@kernelci.org>
