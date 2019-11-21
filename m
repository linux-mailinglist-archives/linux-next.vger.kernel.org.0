Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09AA210506E
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 11:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUKYA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 05:24:00 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:44237 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUKYA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Nov 2019 05:24:00 -0500
Received: by mail-wr1-f43.google.com with SMTP id i12so3633937wrn.11
        for <linux-next@vger.kernel.org>; Thu, 21 Nov 2019 02:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=C4MN/saK6AevwfhrMEB/qktjFXyD4AlnRUMWliWtP1Y=;
        b=zIL6EQXPgonHQDhjwBfr/uw7NsyM0vf2d3xZsPp9hef8YweDhCbH4PkxMANsxwPbLy
         DOynV12afVgb8iFI/6BwbDmZiYB2Fn/YwjF7whftKdlIkBiK9wVK2IiqSM6iCOTRpRCd
         ifCMD2nxmwo1QcUG9gjOA9IQu3IjbCQ4+Fz7VprhAeb+oFKFat1SlC9JiNgpyZ8wKtCD
         tWLYph6Dvm4n/B/xIQ+H/8R54r5g1XCoGpMgVMFHRU6jjhIQ2hMdZhf+wZUstfLxQg6U
         xz9UL/e1UK529tQ4MQx8VZ6CRXIRijrzsDVKAwhaVvqp3KFv5wpM+FNnWCE50C0nyenp
         R7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=C4MN/saK6AevwfhrMEB/qktjFXyD4AlnRUMWliWtP1Y=;
        b=tCgfmbSeKC6aJsZ21HevjK7T4uf8JmSxGcibof206xTFOdiwFZt5vKFZTdU8UdnMhL
         M4fVPz+D/Kq55aM8d4JWQAGDGJrzwjR1j8inygzxlNo7byi4T6WIpROYp6JPk/0uDkRu
         d+GpgjDXVVSYXhf7zDsI3dzZ+LY4tIMa85KX5sHEZ1vAGTYkIUidKFGjoDN/osXNw3+8
         7RCDyUl/s93ifiQ/Wnpz5n0ruPSbLyjt1VJ25Bhr5hRSZdU3yRPNlLDLAiDUFkfMswZe
         M6eYqP1mg4Q5dRcx1K1oHgq3+iW08c2t4QkVrnHZcEOn/okN5ZKlYcKQsTbQHITqkmbx
         GmnA==
X-Gm-Message-State: APjAAAWN87zH3sIvYYPb58HzvjjzCCcJzmX2/7TCXlXQvYBIrJDk6en0
        BD1VtdccgB2vyOxL5gUFkM4unM3b2IbL4A==
X-Google-Smtp-Source: APXvYqziRdTGWypSLDCaCdGntkx+PNb+ZOGfTxbKUlzBLruXaPJWsrXrJp9KeNm6+MCSFUHEkZbAkA==
X-Received: by 2002:adf:e944:: with SMTP id m4mr9868819wrn.49.1574331838061;
        Thu, 21 Nov 2019 02:23:58 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d202sm2222834wmd.47.2019.11.21.02.23.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 02:23:56 -0800 (PST)
Message-ID: <5dd665bc.1c69fb81.56f7d.ae31@mx.google.com>
Date:   Thu, 21 Nov 2019 02:23:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc8-126-g232aa1d5e73c
Subject: next/pending-fixes boot: 273 boots: 4 failed,
 263 passed with 5 offline, 1 untried/unknown (v5.4-rc8-126-g232aa1d5e73c)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 273 boots: 4 failed, 263 passed with 5 offline, 1 =
untried/unknown (v5.4-rc8-126-g232aa1d5e73c)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc8-126-g232aa1d5e73c/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc8-126-g232aa1d5e73c/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc8-126-g232aa1d5e73c
Git Commit: 232aa1d5e73ce18369cd98f2ddc3c14d6dbeb28b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 27 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.4-rc8-85-g0632e899eb=
04)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.4-rc8-85-g0632e899eb=
04)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.4-rc8-95-g08504765f7=
73)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            juno-r2: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am335x-boneblack: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
