Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A99B99B3
	for <lists+linux-next@lfdr.de>; Sat, 21 Sep 2019 00:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393818AbfITWcf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Sep 2019 18:32:35 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45887 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387598AbfITWcf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2019 18:32:35 -0400
Received: by mail-wr1-f67.google.com with SMTP id r5so8214599wrm.12
        for <linux-next@vger.kernel.org>; Fri, 20 Sep 2019 15:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tXvlGBAD0PBzh2+fSuv2JNJnuPdXuSfegcMHuHFKRxQ=;
        b=yAhr+nc7/DAUOT4WCSGtxhe2SOPfJVtNmh5xj3v17ZR+SuuC5qzYtdfXN19aZhaMEn
         99pKHAUMTinh1HIOyurkxPa8C8dBDZqWxlzm7f6teJdhfkYwxByKS5SaGqT3y4ixB0/U
         O4YbF2t3rkSaJV08Ag5H95ltBefO1A8tnU/IDX34qPbk+E0DWgI4HdxWvRmn7Di6vjqH
         fzensn8JNsC6ZiRMQA0W3jAGzswDqy9S7biiC3z4DL7DtACJeQZLDbq0tB2XfoS2zXnB
         5FWxaNZ6CQ6jK8RbtPiYPI45Y2in9F+PdK+XfRrrAk+6brcPvNqC7ftlKDwkkJI3xdTr
         F4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tXvlGBAD0PBzh2+fSuv2JNJnuPdXuSfegcMHuHFKRxQ=;
        b=aV8IuY+rKtFeCYCgvwlFT+S8PMBQIoyHqRz5tt7cdGuq/nlOzu2h6VhekrrWJvtPcW
         FkkHfk4kgfSRYm35lux5/CWO0x1o1OTVK/NwkexkTLoFHpmLm/zhvOsC9i/V5n5cyhlf
         Sni0s+XpUxMwgjS4wA6TVfTNLVn2thfYGAxHzFN4G30OvshojExRgEMiKumo1m4gOLlD
         tG6vYX4Vl/rpjl2HufWlne7hefNRtZ5efZQazMxqKAWVAMKrPhSLzElnjuWeTZPSNMct
         MBWkkbb1Ymtfoft+DeqUijyULE2HNTRqI84O3OKU1wBGkYAaP8O2uoOjm4nfzgM92YS8
         Kzrg==
X-Gm-Message-State: APjAAAWN1CFSLvrkPPNNpdePW/s5X7XwvX0P1ylUfg/IEshEyeWVLvYT
        RMG99FaKbH4yF7RDr9ZXXrdM3vswQ9u/Gw==
X-Google-Smtp-Source: APXvYqwaCogu5Gg4IEduiEFRCcvgbZHLBe56qd9RAn4vpg+OTp+eu/cuPWa6xpQvVz9aYiAz08k63A==
X-Received: by 2002:adf:e749:: with SMTP id c9mr1127632wrn.384.1569018751659;
        Fri, 20 Sep 2019 15:32:31 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e6sm3652115wrp.91.2019.09.20.15.32.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 15:32:30 -0700 (PDT)
Message-ID: <5d85537e.1c69fb81.59d09.3b50@mx.google.com>
Date:   Fri, 20 Sep 2019 15:32:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190920
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 335 boots: 16 failed, 305 passed with 10 offline,
 3 untried/unknown, 1 conflict (next-20190920)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 335 boots: 16 failed, 305 passed with 10 offline, 3 untri=
ed/unknown, 1 conflict (next-20190920)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190920/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190920/

Tree: next
Branch: master
Git Describe: next-20190920
Git Commit: b5b3bd898ba99fb0fb6aed3b23ec6353a1724d6f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 27 SoC families, 26 builds out of 218

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
            meson-g12b-odroid-n2: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            imx6dl-riotboard: 1 failed lab
            rk3288-rock2-square: 1 failed lab
            sun7i-a20-cubieboard2: 1 failed lab

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
            dm365evm,legacy: 1 offline lab

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
    exynos_defconfig:
        exynos5422-odroidxu3:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
