Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E73315CE35
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 23:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbgBMWkQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Feb 2020 17:40:16 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:38651 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgBMWkQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Feb 2020 17:40:16 -0500
Received: by mail-wm1-f44.google.com with SMTP id a9so8583451wmj.3
        for <linux-next@vger.kernel.org>; Thu, 13 Feb 2020 14:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1unxZH4a0J5s4fGD/MbmbhwzjrqDuf+Ds716hPKgKB4=;
        b=j1n8AL6i7mLvV2RksJyaxR6iMW5dYd7UBezN/ISouiRDdAxHQvBNpWAMHpyXjgDfPN
         A/GKvQyciZUVmONEEc9nhLoHIaQXtI5iS9+EkOmjnQ2ck77/U0UjCxpmXoAahSf+fwbm
         c5nU5n2h0mhJQV5fU38T8hnR/LMbRx/HIER0Ml1C5Gs3+IZj9qn8nImn/hCumCTUazM3
         DwjzlnsNfY2m2nygyBxSU39xB5mE1bthOyHmqO5JYBuaDkE33KmVgLt0OKVpaYFzWkqo
         LaSduFc639uMmYEyudmstMPe+FWymFSAOTPisQ+hyqCj8HNVNdoCn/I53vpevtnd+iyv
         rYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1unxZH4a0J5s4fGD/MbmbhwzjrqDuf+Ds716hPKgKB4=;
        b=O3VgekfjvWqjRVLbOZRpclcPvvWlP6MKAAHHqOOlzI11F5IvsrvBRdaSmD56xjZoEO
         Zlxwr3kHhtknz0+G0Aew8mqdDOmy8KBnaEgrx+fXBqSagWsgD53KkC/Bwv62//z0b0KX
         Oi0ZkyEiQsxsh9stHjodshmNxxz59B4GTPtBpcxg3OkZcihYYbZnCOQQjJDFRAOO4z15
         ll1O95UUeGxM5RTmgcTs5pYpwYVBQrx8VwSEQqryzCbcibgrWw6HQbHTFBHINVSezXsk
         trREmhmR6r1AgT1HDD1HDWlC0NAaybk6B9M9esSgId2NcX9DKG7hkmz1aaA6vBLAiN/d
         gasw==
X-Gm-Message-State: APjAAAUQGi1wp8bPPPgVMUw/XM7CD5+Z0yd6LOQh/eknViSzk30fkpIp
        /38D7KbddiuuIZrwgYK9caGQjR3KZr5cFA==
X-Google-Smtp-Source: APXvYqxUp2+nXCvcevVJ6nvgyuqWI94rjXga81oXS1kXwI2oEuzqRm71dKpG75h01ALzJSqgnRNmJA==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr264068wmb.155.1581633614317;
        Thu, 13 Feb 2020 14:40:14 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o15sm4687968wra.83.2020.02.13.14.40.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 14:40:13 -0800 (PST)
Message-ID: <5e45d04d.1c69fb81.93bb2.5359@mx.google.com>
Date:   Thu, 13 Feb 2020 14:40:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200213
Subject: next/master boot: 227 boots: 8 failed, 213 passed with 4 offline,
 2 untried/unknown (next-20200213)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 227 boots: 8 failed, 213 passed with 4 offline, 2 untried=
/unknown (next-20200213)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200213/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200213/

Tree: next
Branch: master
Git Describe: next-20200213
Git Commit: 51d5d207918d2a5a1da6c7a0a9e249db75521501
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 25 SoC families, 24 builds out of 179

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
200211 - first fail: next-20200212)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 13 days (last pass: next-20200130 - =
first fail: next-20200131)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200212)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200212)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200212)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            sun4i-a10-cubieboard: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
