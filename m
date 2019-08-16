Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5C990B83
	for <lists+linux-next@lfdr.de>; Sat, 17 Aug 2019 01:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfHPXo7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 19:44:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39331 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfHPXo7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2019 19:44:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id t16so3012533wra.6
        for <linux-next@vger.kernel.org>; Fri, 16 Aug 2019 16:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=z3lwEkjbGzyAg/ZurtTcJkApMSOr1DVNWb77tFU9VZE=;
        b=RerMt5CqI+6cqvyuUhHufD/M9E5MQh+pCy5mM28h9KJ+izuVGRTLnbx0Y1UEK6M/zt
         vX9xIz0fzro4p1kcmjMvcxdTz/hz5vZXq5I6MXPF8kJfnzBxxt8FjCMynhEec6T1ZeUT
         VH/QQ6fQOBk3FlwUSNBpX9Y2d5J3mmNqElmVqCXEPsSxFlveRZ4S/bcLOm3TWN1C3wdh
         6u1FzlcaZFuHP5nOsNz2ApPTIS/lnZD4y60VmP0s8yaLLUuKSAZGt54J5/PbOUnetjNR
         KRO9VAJ3Gy+R40M+UwHi7eBnuVvMkvsHkaO8cH2TE1yeQPR61D5KyNXfy69IHbK7acX+
         PBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=z3lwEkjbGzyAg/ZurtTcJkApMSOr1DVNWb77tFU9VZE=;
        b=sZovKXKM/WUSLl15i+DRFSWnUqOCDz74DL3dBUw9FVDk3QWVv7qNnD4AQfWNJEzCR0
         qXXBwYUT8o8OSlgNFjtLJW4EUVc1op60ktn9pWmX0/pBtnD6dr3kusrai97vfAggtqgE
         o+VYTvMAWwT1VdLWqS3oE1a6C4YiE+Ob5HC2Yhnxly1gHRQs/ntVennn5AraujiY/Knb
         FEpiP6aDYbSfhokkx+BEQZgR885SwOp3XngVNjKuqDKl09uD37P3GsaeOdFvNpaj2+FT
         FkYtGNlTTSi1H0wBoFBg9ioMFv7nKOAU0EIeZN3oQiM7tCOsqk+tk54PU7IOEeputo2E
         pQwQ==
X-Gm-Message-State: APjAAAXmXJeQXWQGjqxrwKJN0ElhmnPNBMXOtRZ+Mi7QDYwOC4g/E6ta
        NlmablbIhFNnyTxpjrXYAF61XKzTzWw=
X-Google-Smtp-Source: APXvYqz4vfL6dZ9hAnCWjm0FFLgvq23uUjfbrZ8mQARVgtenadLLxFjPxXEcTimLIo9SZmFH5HawBw==
X-Received: by 2002:a5d:4dc6:: with SMTP id f6mr13105834wru.209.1565999096182;
        Fri, 16 Aug 2019 16:44:56 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n14sm19512611wra.75.2019.08.16.16.44.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Aug 2019 16:44:55 -0700 (PDT)
Message-ID: <5d573ff7.1c69fb81.a452d.0e8a@mx.google.com>
Date:   Fri, 16 Aug 2019 16:44:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190816
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 293 boots: 12 failed, 254 passed with 23 offline,
 3 untried/unknown, 1 conflict (next-20190816)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 293 boots: 12 failed, 254 passed with 23 offline, 3 untri=
ed/unknown, 1 conflict (next-20190816)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190816/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190816/

Tree: next
Branch: master
Git Describe: next-20190816
Git Commit: 0c3d3d648b3ed72b920a89bc4fd125e9b7aa5f23
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 28 SoC families, 22 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            qcs404-evb-4k: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

arm:
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
