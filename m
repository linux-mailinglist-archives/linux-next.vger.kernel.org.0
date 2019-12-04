Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADD5C112929
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2019 11:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfLDKUu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Dec 2019 05:20:50 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35300 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbfLDKUu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Dec 2019 05:20:50 -0500
Received: by mail-wr1-f65.google.com with SMTP id g17so7894453wro.2
        for <linux-next@vger.kernel.org>; Wed, 04 Dec 2019 02:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xg/cZt8dhzA3n+pj2RFDplfM9lZIExq+EXTKwroQdhk=;
        b=UJE/etr1Si5lk1RUlK83do/1gXcKXGwewoDoxs8XKk7i2Gy1pStSUnxcN1uzozRk49
         BtSi13ZcOu06kMYCR/8Bdyd/cEtlLkqq7IJMdP0YYzdR7McorplYKyuLIuX99qS2e5uo
         3WtbNhG3hT7jxpV1cGoCKZtqrNc5T3yETvM25OGS/JLkYpRF/lLVcZc/96++nLnHDooL
         cxLKRI2A9+luZSz3CSfJsuQtDE3eNsYq1teO3e9vEdkkgYIi0xAAXS5eyax/9pAZobAl
         2Tgn2pt6u28V1seG2hY6OZYKLM10vPbqGzxzOTeRb7bNWDd63GADCSm1S9eZ7/WsCFLs
         vKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xg/cZt8dhzA3n+pj2RFDplfM9lZIExq+EXTKwroQdhk=;
        b=d0yon5GyssDqKgQtgwkuw5zf1RXklr1CwRQoD9O3qT+EwGwevDCXhE4erRNcgTckfZ
         uTwjR6AhCV2alXBq5OIC1CeKRqKqDoTeypsbj7wukXFflrkUQ5+ibtgho6c7UfMTzXTE
         +zqs/K9xbq3HaYFHDVLtyVS/hulR5JJVoOJCGh23H8X9rEAuqMI+m5F1O6OqWvwTFjP9
         CRQ0wf7Od9l/FiDx07cMoklS4Tf5uZnFVdvwQpUqP3uGgVCo5P4Ba3K7zkXA5EPsZg+E
         /PJODtuIPaLCnfLWkWzjweC4EjaiGIg+EwWXfNCdB+KLL5+qAlSelhU3tMJFznPGrYK9
         2JhQ==
X-Gm-Message-State: APjAAAUW+AXNddmZt3Hqg5BKJUxDFBHf1h+xC0QI1/hlOuJvKGRHw5NA
        AViCAMWXmVLDudjbNvVxY5ysVOwHTwR8IA==
X-Google-Smtp-Source: APXvYqz2Yfm90d1lZlbGWlU6XHBv4WVQrmM9nqNFpPLLpy5CmwUt+kSz86DKPOPvsyYJ5rlLZJoFtQ==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr3154881wru.220.1575454847673;
        Wed, 04 Dec 2019 02:20:47 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h17sm7943745wrs.18.2019.12.04.02.20.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 02:20:47 -0800 (PST)
Message-ID: <5de7887f.1c69fb81.2a9ee.5963@mx.google.com>
Date:   Wed, 04 Dec 2019 02:20:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191204
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 263 boots: 7 failed, 245 passed with 9 offline,
 1 untried/unknown, 1 conflict (next-20191204)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 263 boots: 7 failed, 245 passed with 9 offline, 1 untried=
/unknown, 1 conflict (next-20191204)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191204/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191204/

Tree: next
Branch: master
Git Describe: next-20191204
Git Commit: c7c32c43e831640996f86998452681ff54d17dfb
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 26 SoC families, 30 builds out of 213

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            juno-r2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig:
        gcc-8
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-sm1-khadas-vim3l: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
