Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 354C5A5CAB
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 21:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfIBTWu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 15:22:50 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:38286 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbfIBTWu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Sep 2019 15:22:50 -0400
Received: by mail-wr1-f50.google.com with SMTP id l11so6185456wrx.5
        for <linux-next@vger.kernel.org>; Mon, 02 Sep 2019 12:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XDtsrwTj1cdnuZIRlVxOFppoBas4A8Di4U2MeLhT0QE=;
        b=VmCULMy5yqgBZnPWPiappOh7toQbpLZF531jTwtjQYICh7lu4p8N8dkpVdmPEW/h6T
         Q+3beUUMNAR0bIjBvJVVD4O3CTNGSoTNsEDR1l+NZ2qGSMG8v+aHemB3BzfSy2W6KgXN
         3RvQrH8mVnG59QEqVAUQVFnifhFw2ZoBaUQBLo8d55EDnoGQHoUSr/2fAHC07b0I99b2
         8cbPNisB15tv+lRKTtLhSDsqXZCRSqlRutuPGpLchdRoxCWLxIBJ2KNEMkE16YPiM92d
         Q0pZ7NK2U4SR1GyoC63aiYYApQqUdt5ISknfzKms4QM0OVpSSuZHHBLmI6iZ5rQn4XX7
         6fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XDtsrwTj1cdnuZIRlVxOFppoBas4A8Di4U2MeLhT0QE=;
        b=tnec3ULEN/QZLWbrWckhb1Yh8wKVSRytyn23Za/wMuctEMN8lVKzsNW2gJhf02dwMH
         2up7WGv7Tvi//bCl68eEoR/XwY7uCzAV6QtqhlV/YKJyleNk1ErvuSllaI8dbKJlZR9u
         yS7ceUZyMW8E9H9HUQAucHo+3qxNpM3KZJHcX0P5LyNCXrB4s3iwyhlF2vZE5l5dbFZO
         Xq31YEn5URHi9GQSVrA5IvHTdKuex5+INU//8/zQ/VG66EkCsjb4+wSNxJx/maEAxHIk
         UeTmjWHJ4LqGEMTNgwmDIHQyphWbYTyUe6k0VlD/O/AiUp4V0NAEUHkdCU3c5QSpTiV9
         8Cmg==
X-Gm-Message-State: APjAAAWvK+uJoyahnca2K91VWWFtv5PDnY6PHO9GIrqvgQFf7xgiqqwQ
        9Ofl0ShC3R0s2Mv7/05sZe9qIVIJrXV1VQ==
X-Google-Smtp-Source: APXvYqzXLHSM87IeywYTLBWqKnUSvCFxAeA7e4v6eRRfHgAupD51Wz/TEsw6sUy8eytl3n8+l/mySg==
X-Received: by 2002:adf:e784:: with SMTP id n4mr21943339wrm.144.1567452167685;
        Mon, 02 Sep 2019 12:22:47 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g201sm14463985wmg.34.2019.09.02.12.22.46
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 12:22:47 -0700 (PDT)
Message-ID: <5d6d6c07.1c69fb81.16f42.dbe8@mx.google.com>
Date:   Mon, 02 Sep 2019 12:22:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190902
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 210 boots: 10 failed, 186 passed with 13 offline,
 1 untried/unknown (next-20190902)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 210 boots: 10 failed, 186 passed with 13 offline, 1 untri=
ed/unknown (next-20190902)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190902/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190902/

Tree: next
Branch: master
Git Describe: next-20190902
Git Commit: b5f466091e130caaf0735976648f72bd5e09aa84
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 27 SoC families, 19 builds out of 218

Boot Regressions Detected:

arm:

    qcom_defconfig:
        gcc-8:
          qcom-msm8974-sony-xperia-castor:
              lab-bjorn: new failure (last pass: next-20190830)

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20190830)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

arm:
    qcom_defconfig:
        gcc-8:
            qcom-msm8974-sony-xperia-castor: 1 failed lab

    vexpress_defconfig:
        gcc-8:
            qemu_arm-virt-gicv3: 5 failed labs

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
