Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6515142AFF
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 13:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgATMhh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jan 2020 07:37:37 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:40205 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgATMhg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jan 2020 07:37:36 -0500
Received: by mail-wm1-f50.google.com with SMTP id t14so14512905wmi.5
        for <linux-next@vger.kernel.org>; Mon, 20 Jan 2020 04:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YQgQtXPRwhkKJ1hPNgb3KV+DAF09pczkjsFjjJeqv00=;
        b=s0u85KEKRC6H/+Fw81l5xUj3RLib4UCIuItKCeK32sKeVcCC0Kf52FpCn92Vphxr5d
         0ZYXPsbkFoKkfPKXt050HqpPgzrxPr/NtKqej+TPtRuACAE5N15Eg8w0UYK5UKDg32YO
         n6x+A9F8oJaqkzbx2mGYfgSpSVI8fMqbdvoTvQXYfvsYmS8+P0dCYoIZ6LyX5kuvfjOy
         VuxubPl7llWwxQlA/w4maSu9WcaX0SsZh8e2mAAhz1FabqW6LRnefr2kjHfui7MpXi3p
         LRCM4yhwK/NsIGWPbwpFBSIVAkX0XUH9eBb8FZIs9d7cITao8QVUMcyMY0KFTvnBJGVw
         hjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YQgQtXPRwhkKJ1hPNgb3KV+DAF09pczkjsFjjJeqv00=;
        b=L8zT+jh3D47I9SvafSjqVWqmXdeU3K8XelOcKWaKfubK0u6qwmWULGq/q3jom37PEY
         lZNkDq/JaTCi51AAmuM8m1y+3IKLNe2J3GSYP7vsctT9awu4HE/Efm5ypS6Ul8lNxT2s
         rVjOWHpcmyl+H+TjjdDd2G06c8hFLmDBRp8amLsaAEjWFFLbSMK/x6QwQ7h3oBu1kxWc
         Cp/90zt9BAJH21dz5CzuZbKIXha0wQDiItOp/E8aXvz5PwKkPZG/F9N47U1dqU/82SOf
         twT4EX2OVbJwiubrIHlnCOoLGTmgrBQ9+JSALvpBc57VAdw1kmKmHyHBY1yK5Bvn4ZOg
         /qKQ==
X-Gm-Message-State: APjAAAVoN3gUNDKepZgXJ+AQ1F2vI4SwQJG0h4qu43ubnU3boMHr3Sy3
        mCctatGRghhzTP8VXxdUcZVoyHxSdZc0Sg==
X-Google-Smtp-Source: APXvYqyZJ+G2gdesfwH3Q96Yzak7KsrMductZFAM8U84t7oyVcjGjg60nWIhiB/TpXTrRimaKLFVUQ==
X-Received: by 2002:a05:600c:2503:: with SMTP id d3mr18404486wma.84.1579523854543;
        Mon, 20 Jan 2020 04:37:34 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x11sm48510085wre.68.2020.01.20.04.37.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 04:37:34 -0800 (PST)
Message-ID: <5e259f0e.1c69fb81.67def.fe15@mx.google.com>
Date:   Mon, 20 Jan 2020 04:37:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200120
Subject: next/master boot: 223 boots: 13 failed, 187 passed with 20 offline,
 3 untried/unknown (next-20200120)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 223 boots: 13 failed, 187 passed with 20 offline, 3 untri=
ed/unknown (next-20200120)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200120/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200120/

Tree: next
Branch: master
Git Describe: next-20200120
Git Commit: ccf0726b5c8e44469a1b4f264a53a259c59d2944
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 23 SoC families, 29 builds out of 215

Boot Regressions Detected:

arm:

    socfpga_defconfig:
        gcc-8:
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: new failure (last pass: next-20200117)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            meson8b-odroidc1: 2 failed labs
            sun4i-a10-cubieboard: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            meson8b-odroidc1: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab
            mt7629-rfb: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

---
For more info write to <info@kernelci.org>
