Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 815CBDE362
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 06:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfJUEnT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 00:43:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45943 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJUEnS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 00:43:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id q13so7203176wrs.12
        for <linux-next@vger.kernel.org>; Sun, 20 Oct 2019 21:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZKXJFcpZ//enAJq8VI14H5nwSM3fr2DtsdZZ+pMlmXw=;
        b=a1FmXmp4/RLFN0pw8RdXwe1syUhHmAFn6pWZ+cYaE3xz9kJtTfZAbI0TBsZiylTvMI
         GXpSGCg7dTuMDX9Rpmz2LVSGY96yvwgpC2DedEbtcZfbHmOUdz7QO7wymuuLk2NQk2W1
         JNTOpCRJbrXn7W7BmGB+MTgyQbQZppahY5IGxRM47fyUIMWwPS9h0zVT0F4Ema72vMt/
         JM1zeXdNoc/vKeSjGfNmtJz3Ok+/WIcfAOpFMVjY2UDLuoYJdQZm2MmXbLSVACb50KcJ
         0NIi0PnFyRsdDHcYCD6BZFWzNs0qkI026l4cl6w9velc2aCQEyshwndc3dDiKkMfS2Uz
         TlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZKXJFcpZ//enAJq8VI14H5nwSM3fr2DtsdZZ+pMlmXw=;
        b=jOu2M5ZZ1SvMocYke/eeDt4Yfvw9YtUcwzaU/srTWO+ELrzgKrpd6zO/Po2ouqZqxt
         i3QK+MWhHnd7RZuVNcNZKk90MNGRHaNgBuDPtnTO+vcsXpN/LYK+9VdV/ZmbRV6G2qDn
         548vZSKzN/X1ndDwfkzXMQjfd6I7/SL8ZJNR1H35G+xKdWRcOYdjOQfUOpxpXikc9qJz
         FginTmqAV8Q8nGyPV68T/0jvlE4yRhaXuZN2SBdwlW+vxZplyGXmTmit9urKID7wdUYP
         i9eR/nY3AQSiz4JeRh0QQX9+tu9Cs8Yrmm6u5idFGOygi/7D6ix+P5wyDKXzlRQdKTA0
         taqw==
X-Gm-Message-State: APjAAAVzEXAw6jeShL1FxthL8iXrKRnXfW4LveudDAJR4iszXuwxZGUt
        rG1ox3A+9Pg7etPRS8BjJwJ/A/7fHno=
X-Google-Smtp-Source: APXvYqxcxUiuLNLcJ/jSF7rrpWpndimuiqyMxEubYz3PvG6SMsp/sUbKAKzyVLL7PxZNGqHphChSzg==
X-Received: by 2002:a05:6000:11c4:: with SMTP id i4mr17570300wrx.277.1571632995609;
        Sun, 20 Oct 2019 21:43:15 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 36sm7149056wrj.42.2019.10.20.21.43.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 21:43:14 -0700 (PDT)
Message-ID: <5dad3762.1c69fb81.923a.fd84@mx.google.com>
Date:   Sun, 20 Oct 2019 21:43:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-193-gedd7b4ec4e71
Subject: next/pending-fixes boot: 244 boots: 16 failed,
 221 passed with 6 offline, 1 untried/unknown (v5.4-rc4-193-gedd7b4ec4e71)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 244 boots: 16 failed, 221 passed with 6 offline, 1=
 untried/unknown (v5.4-rc4-193-gedd7b4ec4e71)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc4-193-gedd7b4ec4e71/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc4-193-gedd7b4ec4e71/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc4-193-gedd7b4ec4e71
Git Commit: edd7b4ec4e71bdca29b49d514b76d67199ff9fca
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 24 SoC families, 28 builds out of 215

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
