Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D73B110D35E
	for <lists+linux-next@lfdr.de>; Fri, 29 Nov 2019 10:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfK2Jkx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Nov 2019 04:40:53 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:41665 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2Jkw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Nov 2019 04:40:52 -0500
Received: by mail-wr1-f54.google.com with SMTP id b18so34296147wrj.8
        for <linux-next@vger.kernel.org>; Fri, 29 Nov 2019 01:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OV434vzLJZNgO2KS7Iow9ZjsA9CwSO/5RuHpfgApuIU=;
        b=0v/p+6mEhIO1PkQNCXsDsbqZhDEE+CDf9fK5n0piHJE1Btn6r64S0DsDaF2Gd9n/qb
         uERnsgVC5cLZdqEOOgCVE7ADrxDk52kTHpEjFPBp6M4z504RsnwupwNFIYBP1zFqn5cC
         GCe2/2trXKMYSLW2Dr4VF9XBY7Xt7L1pyThOKistxODWExWLj9lL99h4x4L4Yt+rO2Jk
         RMU5pyLxTlgANIlzFBQfnNnezPh9qJVbBMf95nX0qSdR+QGs7IGJHTILFxGk2ME7rZnG
         akB1AhftjP4Iy8ilwvWVGFGjB4b5B6p0+WPikseEodz0kQutKJvpHXlWCuQPreShfcaT
         NHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OV434vzLJZNgO2KS7Iow9ZjsA9CwSO/5RuHpfgApuIU=;
        b=PBRjwvsvvRIOTYxxOl5UAtUSyzefjQJBVbwQ+AUrw/JZhJtjxknDJHAP/usN8lci7W
         GcacvVu3EN2PUfoLop+mlOBIqW9zPe+kw4OebUCgx0vA/0z1quOaYC5UzEAHfRtKdklf
         aWjbcprJD4Oslu9A/OFmp2Wva+nlXfQnNAwDAJoTBYC8+UrsCZnIt5FBdVDoEX0WbrHY
         cpC0yReIc80Le/LiJQC8RMtwci3hciksIujNoPvaoRTiiTbJvMuaJDj1gOhVsij4mTz8
         TrkooPlk8JzL/iui585lVP93wM1XyUxXpw6RfIvUkWFIUX44WxLCjHBCjx6Q5iooxYkM
         VSiw==
X-Gm-Message-State: APjAAAWeHbBnh81G48aArIZhgQzA3aJcLYA1tJHIbJCbnKAPl6UZKOH2
        gkdvaZnHv9fLH6iS5Dh971E6lB3HVYaSLw==
X-Google-Smtp-Source: APXvYqz5XSxyfpotqZp/vsBB5auwGPcRtrNxtyu4rJdTyoZOR3u6pC1CU198w+4YJkrgjP85TX/5AA==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr16487086wrq.206.1575020448712;
        Fri, 29 Nov 2019 01:40:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b14sm12952994wmj.18.2019.11.29.01.40.46
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 01:40:47 -0800 (PST)
Message-ID: <5de0e79f.1c69fb81.5b1bc.2524@mx.google.com>
Date:   Fri, 29 Nov 2019 01:40:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191129
X-Kernelci-Report-Type: boot
Subject: next/master boot: 273 boots: 8 failed,
 258 passed with 7 offline (next-20191129)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 273 boots: 8 failed, 258 passed with 7 offline (next-2019=
1129)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191129/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191129/

Tree: next
Branch: master
Git Describe: next-20191129
Git Commit: 419593dad8439007452bb6f267861863b572c520
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 27 SoC families, 28 builds out of 217

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5250-snow: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxm-q200: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

---
For more info write to <info@kernelci.org>
