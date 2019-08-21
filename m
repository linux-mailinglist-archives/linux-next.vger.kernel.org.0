Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C63097F86
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 17:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfHUP6j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 11:58:39 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38021 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbfHUP6j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Aug 2019 11:58:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id m125so2670804wmm.3
        for <linux-next@vger.kernel.org>; Wed, 21 Aug 2019 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=//PZmhQxBIVjl7tmjKyC5NMgk0pgdddNTXjFO4PE13c=;
        b=nAEKWfc8RdX+YU/ujBGL/oFGdtlqUV0JKFfu2wZW8rTSaD3HUW/gD0VCxQfdI9VECl
         5q5OVJaP99XJx57cnZ7dI0j2feVJLJihLdGZ6d4GFmz8ZhLrcOPZUA4JVcDVmCdYJoVk
         hh/eknaBtpKta8ajObbCrU4aazw5h0Jtw8OTSoIEL3Nqvpbw1aU1YzzXLMSdXvp7Ym2s
         XI2446ljODswmMeZXpQJVlvLqxaMmBDFB3AMcvmyX5W1gfIjTLsYU04w4SAYdUej7plu
         q+QzMMlTXEF53zfUgUeI/vfHui1BP4SFdz6LyPsWxbBDb3NfmbDHV7FODbu4qkWDrJsN
         NX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=//PZmhQxBIVjl7tmjKyC5NMgk0pgdddNTXjFO4PE13c=;
        b=PunBlnlUguKrifuHd4rqeymevEOT8SzdbC8nXfUA7pvmxN5l0AabpxL9CY/jicUxl6
         5SAenTjyr6xXEQqdN1qbbkupTJaH3PhBfzEsXJz1Yhm9f8OyN4TMf2J9GuQeO5FCpyx9
         YQ9aTltnBqtGDJJlfJgIx5TiOCPS2VHxlXuco6w34Xo4vqWeCUkDNRUFdutyWw7uiTXT
         lacWjRKtNgJQzniFFShV58P0fzmgh+O+K5HeX4XD4WVpHT+XioDlXf4WpmlbmT2jYY19
         DmjjHPE25LufNyQinSCF0KtQ9hAbOMXG0w2brLMeL1h2bb4hKMUmDu17nW7LQVKZnhN1
         sUOw==
X-Gm-Message-State: APjAAAV3+L9gVo3wtjmzZlgjBuVlvblc/EiMWwTZRc2DU5mb1mT00cyq
        JemxXomycxVLgKJ6c62Z+nwQkIAKvXeiUw==
X-Google-Smtp-Source: APXvYqxA3CBEpPAu0AWCNcnXXkTgoNrjUtGcu5GEWsKqY/SW3AksM+6R7tzRHtlS/cEamjQUU3ZPLA==
X-Received: by 2002:a05:600c:24cf:: with SMTP id 15mr856041wmu.76.1566403117435;
        Wed, 21 Aug 2019 08:58:37 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s64sm855637wmf.16.2019.08.21.08.58.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Aug 2019 08:58:36 -0700 (PDT)
Message-ID: <5d5d6a2c.1c69fb81.e22c4.4255@mx.google.com>
Date:   Wed, 21 Aug 2019 08:58:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc5-278-gbbbb139a1070
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 212 boots: 4 failed,
 181 passed with 27 offline (v5.3-rc5-278-gbbbb139a1070)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 212 boots: 4 failed, 181 passed with 27 offline (v=
5.3-rc5-278-gbbbb139a1070)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc5-278-gbbbb139a1070/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc5-278-gbbbb139a1070/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc5-278-gbbbb139a1070
Git Commit: bbbb139a10709b5fb994eb10750549b71b002660
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 27 SoC families, 22 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
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

---
For more info write to <info@kernelci.org>
