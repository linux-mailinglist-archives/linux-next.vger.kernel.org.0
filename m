Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5B8DB5A2F
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 05:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfIRDye (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 23:54:34 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:34046 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfIRDye (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 23:54:34 -0400
Received: by mail-wr1-f51.google.com with SMTP id a11so5305927wrx.1
        for <linux-next@vger.kernel.org>; Tue, 17 Sep 2019 20:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Jc2LRG9LhfMS7Reqo+3JLKFBSRrFYDlQmwWtp4sUvHg=;
        b=uIaT5UZod8gzkg4yecyHykKB/vKJWmwxWpV+o6XGwCv0PSNlc2NfMWnSBzXx1iRUsA
         vLpGiDGDLfW3UYERH276J3e3lRIuTO5nG9231TNWWVPUuFR2LwaGZYmDBiTtAkanySaW
         cSHBAyH011amI3b9g/ah9nzCwgFd4qw8Eb5vDxuWXs5UOzQuL76p8SK7FGhVEB+7hx1Z
         CXdn/XZeryEvzdyp9Ov8zrcvqyrliclIRX9ggl4w2eYanG8vuagVzuzLtw9kXTB45cKm
         xhs7fjjX8cs7klk8Rjcu8h5UM2LgF4+7U86WZB1KWoLqGr0I0Li25BlKMEn43cP+61wq
         3GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Jc2LRG9LhfMS7Reqo+3JLKFBSRrFYDlQmwWtp4sUvHg=;
        b=dduddjNXZxvRwiqr+3nzH17siQsMtCUJvCMkVcoMsIqv3cJT39ARNyJ9UeJJSlU2HV
         VSy+U2cAskXxDdnrIlN+F2EaFlY+7od8yNCXenvfZTDU8UG+d4gqt+YuQH3ZciLSJ9SX
         7MSlIKoWGp+HLo3OiV4Mg2GwnZauqGvSv6GoeArS6d/cshWuGu3FwmjZ3iydPhEaurV7
         968Qz3j+qdwWNXGoXrnJsfEctNXcWESdLFAMIznt7A8Faeud/QoeVXZMh/ZNKCRokmHS
         sUbIsHoeD5vhu179uLCbpwThipMW/pm0MKJrYS7dVfrcrKCnefOe5+rMY2H4+wU8Z/ct
         wAWw==
X-Gm-Message-State: APjAAAUzVnZYNxC0zT56zmTzNBcDW5+fP1Ee7ahoUOP60o4yUoaNVjv0
        jKliiy79mJ3+IW04/mJ+K3LlpDwv4L5rzw==
X-Google-Smtp-Source: APXvYqzyOTCiGL0dGeDGlySOD5lWjJxboiglJ/d6Yz5hSaFHEZomvWx3n8z5AoKNUWhZW0TYxrJAfA==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr1299254wrj.56.1568778870633;
        Tue, 17 Sep 2019 20:54:30 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l1sm4877277wrb.1.2019.09.17.20.54.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 20:54:29 -0700 (PDT)
Message-ID: <5d81aa75.1c69fb81.bf544.6854@mx.google.com>
Date:   Tue, 17 Sep 2019 20:54:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190917
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 357 boots: 20 failed,
 326 passed with 11 offline (next-20190917)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 357 boots: 20 failed, 326 passed with 11 offline (next-20=
190917)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190917/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190917/

Tree: next
Branch: master
Git Describe: next-20190917
Git Commit: a4b5b2e06e424454b690b31a9a965990b9eb60c1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 28 SoC families, 27 builds out of 218

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: next-20190916)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: next-20190916)

arm64:

    defconfig:
        clang-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20190916)

    defconfig+kselftest:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20190916)

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
            meson-gxl-s805x-libretech-ac: 1 failed lab
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

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
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
