Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F32FC8DEDB
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 22:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727694AbfHNUcc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 16:32:32 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53146 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfHNUcc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Aug 2019 16:32:32 -0400
Received: by mail-wm1-f67.google.com with SMTP id o4so374709wmh.2
        for <linux-next@vger.kernel.org>; Wed, 14 Aug 2019 13:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZLp+BVUwBqcpMoVl0iNESoA5HGBr9rjuVelobCKUB4M=;
        b=OaO2SP2VB/awqzhszWK8lzNTdaNdoUtwhH+OqkhTv6uoNRNMZ2GQVExMIhSUrW3swQ
         doOMfx1+75uQpruvP8zc607npRBz8hSzZyjg9TU5FvtYdrkgSWVjdfuUDpS9j+49o/cC
         N2UqoOfeu7i8isJqaC2wki+S19deNPr9iylSro0pCKKqf9qAwbBQjpcMmqkOgvQ62pmV
         NDQSY867ZRLkTViT0U9AQgWPmFlz7aXy3KuJOJAyy5nM2fJUmr0Ey/xGZD7gePopgVVV
         a2ixuHxC4bvHIN+BKykk9qDuBmcWGtuBJSNqzHBgptGrH3Uv/D6FB0AoTg3su+epUEa3
         qEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZLp+BVUwBqcpMoVl0iNESoA5HGBr9rjuVelobCKUB4M=;
        b=iItJW4Ix8YQUzFgBULAJWEZH8kIKTFWdfmzqLPoe+H1xCfrGt1KREAbrCnp/7mw4xS
         DPwfAIulxhDI6zkhgwg9D0Anm9EMd2DrWmDEksrXwow+//vIVnl3GBywaPNCgMgkfV0n
         6LnntKygNqRMDB65yqnWu57F/shPNglZPHya8gN/E+95TmTAkSUXiAIVly5byjxfUV34
         FpcRTL1C8PIXNOoQK/XBqVxPdBpo3rWcBY7TYPQNkvd8fibJKbPgPB/6CA1kaPUYf+ny
         75wX/y1ztTN7qcgPbfQQYgVKdpMLAxZuiFkucUSn/yIqmVvlix9rY1rxxZjDUdNxsAFj
         BGzQ==
X-Gm-Message-State: APjAAAWb7AffTkwsz4NuOAqogdqVAQxVDggSmFY2F3RIxa/PMLl/qHsd
        a2XkSma8ww7ed3Snu3iWiF4vfyhQsUalZA==
X-Google-Smtp-Source: APXvYqw34KDtEE8S0PrBRF+gut7EVPVFn4ehjZrDM5i/uENEB/42+mMpgnQEZQcavhAev+iI11rYGQ==
X-Received: by 2002:a05:600c:48b:: with SMTP id d11mr838573wme.124.1565814749477;
        Wed, 14 Aug 2019 13:32:29 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f134sm1044424wmg.20.2019.08.14.13.32.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 13:32:28 -0700 (PDT)
Message-ID: <5d546fdc.1c69fb81.35e0b.56ae@mx.google.com>
Date:   Wed, 14 Aug 2019 13:32:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-220-g1999f09bb019
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 239 boots: 5 failed,
 217 passed with 16 offline, 1 untried/unknown (v5.3-rc4-220-g1999f09bb019)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 239 boots: 5 failed, 217 passed with 16 offline, 1=
 untried/unknown (v5.3-rc4-220-g1999f09bb019)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc4-220-g1999f09bb019/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc4-220-g1999f09bb019/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc4-220-g1999f09bb019
Git Commit: 1999f09bb01916d71158b45acc8f354fa8bf9bdd
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 27 SoC families, 22 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab

---
For more info write to <info@kernelci.org>
