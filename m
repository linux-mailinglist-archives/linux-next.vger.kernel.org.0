Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE0CB47D5
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 09:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404346AbfIQHDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 03:03:45 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:53929 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403930AbfIQHDp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 03:03:45 -0400
Received: by mail-wm1-f51.google.com with SMTP id i16so1864413wmd.3
        for <linux-next@vger.kernel.org>; Tue, 17 Sep 2019 00:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZbnGc7V+mvFNX2rGJywFP3QomCi3kbgNVHSrPNX88jA=;
        b=0VAzJWjeKFgPircZt/fZ5QPD8PCrU0yfPJHMGX5Y99gzx7IniR76x7qhJ1C79L0P2X
         EYMQDuOHXdAYnWY6nT2umsAP65pMRBgci1GCxk9rQvPtE7TTvv9H/7QHqjXUkKYEzNg0
         fGhXyuYrnhAG5VSKlfITLJOnaD6INRjrBVHrJywbU5GmyzDxHfKAWQnHT1i5q40AJrgM
         3LKRDkjZgHKP60PSuDFlC2rTXZjZs8JvltdiwGeC6oO3ErZGy4hJVWLB5zXFB8mFdQjl
         3DQIh1+JmbVkWtO4Ps9Kzm+F22yItKIvKOR8yee8m7hZlAL/tQtPzegPtjUpgalpiC78
         XQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZbnGc7V+mvFNX2rGJywFP3QomCi3kbgNVHSrPNX88jA=;
        b=XkMu40jCxz+5SYeKhaTgVNwbTa80CjLI4JMKBOMdkZi0rBIWF8U85zU0Cc1x8NysKc
         R7emwrOLlvCUuRPC32TecyUjNJH+i1ttNXuiPyRzOSjDFfctjb3ogy1XaBr1sjk2zm2l
         x3VEAiPh2aBO8V1p/WRKo8wQnRr1l4kavvmj7YW7lV6JloEyim1QzIIfMr3tA0CLFu6X
         JpM0uST3WumVE3eQtwOnaybd/0PMa14u7PG0iX1sAGqR3FiINPs1VM5n1Ew7WBFHy5Cg
         CTXi/WMB7FFA4xNAhB04OBiIZt+Y8SCm58FT/9ROzAJCZirE0ixXGYaACE2wkzVGSPIs
         7Nig==
X-Gm-Message-State: APjAAAVD2Ig2W2HB2+NKoYBSdrq0oBi6wParv/Mfy4K+hVx7aZt8amoN
        mTzaWWeh6CwXJCYncGaVKf72z87J0nceSQ==
X-Google-Smtp-Source: APXvYqyi76aqJrRn/4bzoNJ3TYb1JByztnSb7ZUT6AVegb7mdqnZvKu7QQSSlWLKx3+L3sSEKP/YKA==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr2134759wme.89.1568703822403;
        Tue, 17 Sep 2019 00:03:42 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q15sm1749085wrg.65.2019.09.17.00.03.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 00:03:41 -0700 (PDT)
Message-ID: <5d80854d.1c69fb81.ab172.6f3c@mx.google.com>
Date:   Tue, 17 Sep 2019 00:03:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190916
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 349 boots: 18 failed, 319 passed with 11 offline,
 1 untried/unknown (next-20190916)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 349 boots: 18 failed, 319 passed with 11 offline, 1 untri=
ed/unknown (next-20190916)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190916/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190916/

Tree: next
Branch: master
Git Describe: next-20190916
Git Commit: f84e1c16f08d7d1d6955f8f1c2e6cc0587d6d14c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 28 SoC families, 27 builds out of 218

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab
            synquacer-acpi: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

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
