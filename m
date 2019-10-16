Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB79D9079
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2019 14:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732429AbfJPMMP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Oct 2019 08:12:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46690 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbfJPMMO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Oct 2019 08:12:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id o18so27723653wrv.13
        for <linux-next@vger.kernel.org>; Wed, 16 Oct 2019 05:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=B/hRYCrQYb9A+zpgzMtUkiNkYDs20MnWa+JAF6rG8MA=;
        b=tbr37+Qa4jjkHuzwLCF5rbJWXfNHwKr7Cwtn8NdLzG9xnYmu7CjmakbhDksTyw7RbH
         C5armvMcD5Sb78nsLbptPOmuuhd2Rf7Fwikeju8gvTDfUy9kQa8epUbT+4ISN45lo3F+
         G4Mu5GXXbMiQpOQwOKp4SZeUTh+RGhOOx8CV1WoKyBK++POoroQt24s5Le3zZL0FmKNF
         ftpFc9mGULfV5McMexZesntOHs8ApWm603ARqbo5iHJWf2/8bcu12V+qyN41XzAtSeWq
         8HgEyqWx/PVD6SjffeAGCefa9slecGG+3i6kAvcoXyB1vu/go6LwD1PnC6NMxY2qH6v/
         aQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=B/hRYCrQYb9A+zpgzMtUkiNkYDs20MnWa+JAF6rG8MA=;
        b=QgmsyYW9IvFDMH+09+HZ+9QX4cpBjuEkCzHCDeEMxm19Y6q2lZCgBE4EqGRvny2WBm
         ILD8FcjsYjfkuMwW4ZLNoydjdwBYudkACBwM8D/UmGjU3qhqcn3WYl9I+641xaFGhApV
         wO2Vtn+laSHw+MEdb1k5WR5UDaQykKhr2Z9AL93iPjYiw4zGAK4kQXfIjC0dSO4XtExd
         Y4Xt4sQ6EbfQNQUADEtUwMEmoY6n2vceTjO+cX7kXKiiFsg3x1sxpDs16jH8PZ0aSJBy
         V0Adzq2ta7ZAd8k7PU56UBkk8LPED/DDJBeFSCPUOOrD12XoCbA+s0AqiHCXJEmBEE+v
         G2RQ==
X-Gm-Message-State: APjAAAWteCoY6PMm6fKk7Z92LlmZHidEb8RT1WKlA3ln//Q59GtPmJIH
        93q8oHyTDdLgtGTXYzUAlhD9ZxCr+8wXkw==
X-Google-Smtp-Source: APXvYqxkK16Y3rTVOJ8g7DM5NvFOitDtLbw9g7vJ8L6P/2H8pSDDE6h822tqrECkV4gdV3suZg9vzQ==
X-Received: by 2002:adf:cd8e:: with SMTP id q14mr2339191wrj.86.1571227932572;
        Wed, 16 Oct 2019 05:12:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d78sm2341859wmd.47.2019.10.16.05.12.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 05:12:12 -0700 (PDT)
Message-ID: <5da7091c.1c69fb81.450aa.c803@mx.google.com>
Date:   Wed, 16 Oct 2019 05:12:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191016
Subject: next/master boot: 307 boots: 15 failed, 283 passed with 7 offline,
 2 untried/unknown (next-20191016)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 307 boots: 15 failed, 283 passed with 7 offline, 2 untrie=
d/unknown (next-20191016)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191016/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191016/

Tree: next
Branch: master
Git Describe: next-20191016
Git Commit: 78662bffde37ccbb66ac3311fa709d8960435e98
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 25 SoC families, 28 builds out of 219

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            mt7623n-bananapi-bpi-r2: 1 failed lab

    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

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
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
