Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F536BD635
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2019 03:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfIYByE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Sep 2019 21:54:04 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:53282 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfIYByE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Sep 2019 21:54:04 -0400
Received: by mail-wm1-f45.google.com with SMTP id i16so2620428wmd.3
        for <linux-next@vger.kernel.org>; Tue, 24 Sep 2019 18:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BOn5u1E9lsnGTGnbCg1QLUFHEaOkZuuH3wq6uqUN3/U=;
        b=jvZ1rTNaV7PySyqNkrlXPHHylDUzTNPxDH8bR+r9Y+p4nI+4BaHfJ3+VJ38uGTsxgI
         tJPrpdY8eh76WD/AbpvDo3AfhwfCVmroADy3vsdTmt5QQku9ANIM5CcsHnIYV+B+/KB1
         fCguL65D2wwRMnSiBIYcpHpUlJVYqMcpq3nyRmbbj2jarp3hnen+nDkviCZtetKe63Ln
         zu1eSUk3hERBw5oZQv1tFolT74wQ6iPff1aCcEXU0p3UkfcWr1JZTOUNIG9OtLD4ClC9
         Zm7yICe+xh0UsR73B7kOXhD6UY1lfTF1dpzoVeWWQbJsalqwggKVbXNRYmj6FksS0IFW
         CHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BOn5u1E9lsnGTGnbCg1QLUFHEaOkZuuH3wq6uqUN3/U=;
        b=IHwPC/Cpp1PhwRksXBkvftwpBPFqFa2Ji0lD8n5CZklMmIEvrEOOOWlLiXWX+1VE29
         BBo66EsmBdkzEU76rx8RuE34OZ/d3G2zy/5DAhl8ZclgbyB5lCQY+PSeXLSikF2eGacK
         9mLxyyNUcFZUvDMjwb344q2+hHvVVjE+BgyYEVnKNbntCXhCRsTHagfioONeNZlTuv45
         ixUSZuYNHMA3CqxwW9cpk+032wTTSlloZZzTsJbn3aE7QkqWvhFYU8WoIh1J6KHx40o6
         Gedg4hOK0uBY0mPbMC3lbyVHAgNZcytM9dC+ULyK9GVE0U9hza2qwnM8WXuKPBZbTWO3
         VhrQ==
X-Gm-Message-State: APjAAAVLVozuZIr7UEpZl14LD8DxGLjvLsW44+/1sndc+ime2HdiWpAT
        Vx+R1rB4lRsg7h3B7cBVYCGwdJBVjGu0qw==
X-Google-Smtp-Source: APXvYqzgPBxzWTn7hwemgDhua45CzqzRfIlwwbsBYxNBDPZfM27G9cYPfmAPdzpkpavgREXvkw/A4g==
X-Received: by 2002:a05:600c:118a:: with SMTP id i10mr4055268wmf.80.1569376440626;
        Tue, 24 Sep 2019 18:54:00 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r18sm2129555wme.48.2019.09.24.18.53.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 18:54:00 -0700 (PDT)
Message-ID: <5d8ac8b8.1c69fb81.269f7.b572@mx.google.com>
Date:   Tue, 24 Sep 2019 18:54:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190924
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 332 boots: 13 failed,
 308 passed with 11 offline (next-20190924)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 332 boots: 13 failed, 308 passed with 11 offline (next-20=
190924)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190924/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190924/

Tree: next
Branch: master
Git Describe: next-20190924
Git Commit: 9e88347dedd8a211784431b49e2bea9c6370a7e4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 27 SoC families, 26 builds out of 218

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
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
