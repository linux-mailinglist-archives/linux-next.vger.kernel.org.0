Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEFA4E42AA
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2019 06:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387990AbfJYEuR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Oct 2019 00:50:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52860 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392436AbfJYEuO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Oct 2019 00:50:14 -0400
Received: by mail-wm1-f67.google.com with SMTP id p21so568123wmg.2
        for <linux-next@vger.kernel.org>; Thu, 24 Oct 2019 21:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lJoWmkCbzsi7/Q4h+bKt1c18ttssx6yCqyKe+dEBIyQ=;
        b=teCj8mVgm0Y/uc3QhXPg2S4b6qvNIn8r4Mvj07OjltVIIQ7gTLCeo/thLM2ybdryxz
         KkbT4gruWyEMEi6q/uF+yy+WDoCKZlZ2SdAmtaszWv4J/iYGEtEAllgWEBmbsztGxJOq
         wAGvG2GmkFlaZ3gTmoZPmLy5ZUgDgIP3NW2Ku7RGSZ3sQWFwAifT/4+AQ4TWCu5q2LWz
         JS+SJPWjivm3zE+wIuAW+I4n2rU7zYBtyfFyFAP42h4Ai015/n45rhhl76MjLkhFYuR6
         lanyCv1NLGjulBrdPOIm60WQCOoGUe6XuLkomEF1rSmBgs2zvcs/aUowwIG2/mJHXz0n
         sF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lJoWmkCbzsi7/Q4h+bKt1c18ttssx6yCqyKe+dEBIyQ=;
        b=cP3g91Kj06e9DnLdst4jRvB3hrRhMahMihvnUpJMYkFLMUu4uf/v+93vBoUg6+td57
         ERfy4E78JzkxaXGd/QgPdn11WhK4iuhWiwXt3BSzTHL4lak3n5GKyccU2Q1UKkTlq8Bf
         7OYFsBBh+I2LCVaCNqFwz5kS3R1fk2yT0kY64T1xkf0o4Tcp+FUsSlnVxYnGWBv75ftd
         P9XfNDKM2Ewhm6HbtkSoAXF7CKht4P5JFrFQEI5i8GWNFoL95Y5QfvTa6WxOFC5+sRqk
         N2yT1A1He9wuqBScuC94NwFxSBearrNIkkWpmz6X2WbFKnzuwuwLIKW/WrTriKPnEqnS
         +G+g==
X-Gm-Message-State: APjAAAXXmKmIGUYKcsaqhDyX6FNlryD02b+aOV/9OhP9cb2K1TJYwUCu
        9zxyUGWPJP3/otWhnOAObzytBvqL+mKI3A==
X-Google-Smtp-Source: APXvYqw9TNtgVLYvWs9I75x29Lw+wTpTeWWMSIpYgWYj5sQaYlOoBY9dYfj7E9oq5XW6uDr/C6BoIA==
X-Received: by 2002:a7b:cc89:: with SMTP id p9mr1365020wma.99.1571979012241;
        Thu, 24 Oct 2019 21:50:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 36sm2682225wrj.42.2019.10.24.21.50.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 21:50:11 -0700 (PDT)
Message-ID: <5db27f03.1c69fb81.21c85.a5b6@mx.google.com>
Date:   Thu, 24 Oct 2019 21:50:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-405-g61e08e6b0f15
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 229 boots: 16 failed,
 204 passed with 7 offline, 2 untried/unknown (v5.4-rc4-405-g61e08e6b0f15)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 229 boots: 16 failed, 204 passed with 7 offline, 2=
 untried/unknown (v5.4-rc4-405-g61e08e6b0f15)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc4-405-g61e08e6b0f15/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc4-405-g61e08e6b0f15/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc4-405-g61e08e6b0f15
Git Commit: 61e08e6b0f15d065b132e9f2fb19bf00ccffa522
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 25 SoC families, 28 builds out of 215

Boot Failures Detected:

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

arm64:
    defconfig+kselftest:
        gcc-8:
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab
            sun50i-h6-pine-h64: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
