Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2C3494A8F
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 18:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfHSQjL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Aug 2019 12:39:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33122 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727870AbfHSQjL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Aug 2019 12:39:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id u16so9408130wrr.0
        for <linux-next@vger.kernel.org>; Mon, 19 Aug 2019 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WN1vTxNvRqforKsIqQIt8oJMrrZM/Xv8BWBp7sqoJB8=;
        b=URCz+M6KQ6wkGFrqMRGx11rdyUZ/NUSY/qsjNDD3v5eTpHj4Iv/VAIbtn4U1CIcozh
         2bZrdUx8h0tPzv6e9j8DdFN1abpT+XtW4M4ZhH22TWTknq8rbtCqWV5+QdqH0Jq2LeEx
         yNk8hdCOv08SK256oYpAFeujfYaswOICZfpIe8w6GCExTDAPaD6V4oIsAIE/ApQ/rdbB
         i8x7gtLF4pkIrkbo058oJDlkk1hnl146M9R9+aA7qhSRvVWJjV/q09nk+ejnJgMV3L89
         qmuU4xniornRlSs2mqv73y+P5ibYsXeoA88jX+bQ29qI4DXQPuLkCSFGnUWanAUS+zJg
         kaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WN1vTxNvRqforKsIqQIt8oJMrrZM/Xv8BWBp7sqoJB8=;
        b=jkHiXGKJ8ucMP0sCmAsowHAYwMrQeBRjECwFo/bsjDCNtt4HbZzMWnSmcvDjvw38gs
         0cB8NZKiqdR5h+KdI+/DZ1q0kRQ7l+83Eq8FeqY95zC3qTSn9koK62mkrCHkeXgjeJX+
         ECh2bvrnK+w3wX4f/7+ZSFtYjca8nzEsj1sPkArqSzif7C2jBet9UQH3w/FaNIuI+0lv
         R7C3xN8ryDuDWhLpNvJEVhP0zRRoCtEb7NRsSsUsQvf4rkHXXzGj+DS0HDlLI7uj2xw8
         CGeX7tT/40WJwkJ0hhELNTsXc2lHmBDn9zi6A2jXn03wufxltzy/+HIHGlHuBBew72ea
         xTLw==
X-Gm-Message-State: APjAAAW9A32b5W+cpLmgm1Ougxje9ZFpkFOceLOtqSmq8GlqV8+lf2Ra
        0ijKHrfdjEvK5+oDKBmg0CmGF8eW9k/j6Q==
X-Google-Smtp-Source: APXvYqw8CC52+ZhD9fSxigge4P7C471j+tznyC4/wSbB3p1IDKx2Lt2LQkAokcXDa4sxrm4PAzWgrQ==
X-Received: by 2002:a05:6000:12c3:: with SMTP id l3mr28594165wrx.100.1566232748302;
        Mon, 19 Aug 2019 09:39:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t198sm25855474wmt.39.2019.08.19.09.39.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 09:39:07 -0700 (PDT)
Message-ID: <5d5ad0ab.1c69fb81.3f2fe.00a4@mx.google.com>
Date:   Mon, 19 Aug 2019 09:39:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190819
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 215 boots: 5 failed, 184 passed with 23 offline,
 2 untried/unknown, 1 conflict (next-20190819)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 215 boots: 5 failed, 184 passed with 23 offline, 2 untrie=
d/unknown, 1 conflict (next-20190819)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190819/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190819/

Tree: next
Branch: master
Git Describe: next-20190819
Git Commit: da6570438d9bc1fff85f8ce7bcd02fe968289ef9
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 76 unique boards, 26 SoC families, 21 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            r8a7795-salvator-x: 1 failed lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
