Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A7BD287F
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 13:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfJJL60 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 07:58:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35685 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfJJL60 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Oct 2019 07:58:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id v8so7548923wrt.2
        for <linux-next@vger.kernel.org>; Thu, 10 Oct 2019 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LUjFaxC0CrLfAs4pNGp1hHBxeM26CxsAhHdp/idZYG4=;
        b=eZcfnnORLugazDLaac8ikg4AD9j5ycUBzV4qTEZc04LL6gqaNKfuYZuo3NiQUohVBZ
         3FZGldYhemQayFxjTugTSZUrj7UlPTZLadMUp7BjXUQ/pLnm9qeL3CuXO7wFLttAil4p
         RPqwi2xlAsIEf+C9RafYguRCnGuj6DPokE7Ln6TEyEXmXxQFpeyU5/MPOWXMMK3+v9gQ
         yH5nhRq5LOQ30Ti2uem8G5jhxePP3Mb9u1NTeM9DB1hAAfJnR1OuGc7/FQK/19HtlZfO
         84b6/BL2dYJZWyB9G9VAcI6TUF1F1bMoTYIysU85acVn4LxnBeE5Kl7dbbTmf728nOrp
         Bl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LUjFaxC0CrLfAs4pNGp1hHBxeM26CxsAhHdp/idZYG4=;
        b=Lnwqa5BA44CqYU6fGjByPSUF/fOqdwq/KRqXQL/aEr4zDgEQlI5Qp7vXftybooYu/a
         pdoPwzJIs62A3tKrAKLgdMCrvC6hsUOt1bbFWlq0wHSXCnq3CH1yafbV2Sg2AxIm/q3k
         MljhV9uYOGkMbESgNDQNsopcndqlue/D7yC9GzakFgAHo+OmKU1RmxGprOlqloSuLeSM
         QouuE+56yz/DtJc9VjeW4WLlyRWx8W8nok3qjjFAx9NKQrNu6wmz/bh0+VdjN6ojb2Ow
         3TK2cj2Lmz2WhXbAl0cC7i7a1B3XfLZbeYv8f4GgKIZottWIhbvhhwe8FAuZf1KAoahT
         RwEA==
X-Gm-Message-State: APjAAAXkQ+T3amCbrwGbHdPg/V302OFYq5Nu6O+AaYF4n4x21s3YDYjm
        8tjfJLQXre+nqNfHJ3mLKRriD7g3ydGKoQ==
X-Google-Smtp-Source: APXvYqyCrXvfNDmzD75QKzHB4QK+1IWrEK9tNfxPfi9jiVbvEhpkibj5uL8v8WoAajGvazSW7b6fvw==
X-Received: by 2002:adf:fe42:: with SMTP id m2mr8074749wrs.321.1570708704159;
        Thu, 10 Oct 2019 04:58:24 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o9sm8943577wrh.46.2019.10.10.04.58.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 04:58:22 -0700 (PDT)
Message-ID: <5d9f1cde.1c69fb81.cd934.bb2f@mx.google.com>
Date:   Thu, 10 Oct 2019 04:58:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191010
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 301 boots: 12 failed, 274 passed with 13 offline,
 1 untried/unknown, 1 conflict (next-20191010)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 301 boots: 12 failed, 274 passed with 13 offline, 1 untri=
ed/unknown, 1 conflict (next-20191010)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191010/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191010/

Tree: next
Branch: master
Git Describe: next-20191010
Git Commit: 4a9e93dbc796654e6b141897452993da2e61799f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 24 SoC families, 27 builds out of 218

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig+kselftest:
        gcc-8:
            meson-gxbb-p200: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            mt7623n-bananapi-bpi-r2: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    exynos_defconfig:
        exynos5422-odroidxu3:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
