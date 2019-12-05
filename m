Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0743113D7F
	for <lists+linux-next@lfdr.de>; Thu,  5 Dec 2019 10:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729039AbfLEJCr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Dec 2019 04:02:47 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40663 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbfLEJCr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Dec 2019 04:02:47 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so2706630wmi.5
        for <linux-next@vger.kernel.org>; Thu, 05 Dec 2019 01:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2UA9Dq+4v19TCypE9yuO6RU7qnL04eTpQxBLgf8ZWmA=;
        b=UGE8x3PRiEJ+vgbFJq6b/LeJXJCEi+4SsvSjyJtmigD9j9JDeqzI1JbzAJROpX37f0
         7xxqENKzVN4LB6nTARKFfZNS28xUvDhTzC3mAk9HI//fSfNt2rURfR6oQdvjpNikNyvy
         rS/J34ehTpyu8Jr+vujDa8xnibSI6EIoqY5SR2LIxSyXr497AEbyU3OApmSUlUrCUM/d
         y5Mfg2UExKRxH2apJjAEgIsL3AoVCwJ8HH+X9InqDYJEO5eKQ1qXitKEjLAMyt9XQBYN
         znFh5wyNQmbqkkhd4kbpyF/etQKXpxOGcggrCly1eOEU1DRq/jBXzX2Ow/ZdvXJFMteg
         D2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2UA9Dq+4v19TCypE9yuO6RU7qnL04eTpQxBLgf8ZWmA=;
        b=HR3m3Ai/RmLm2sQa4Tb54JhOjIlTcOhEiaxpYos4pScd7sZ3w7x9moh0E6uOl7eJWK
         dKsFuMDFIsg4DkVdo71KTIV7ZQVS2XbU/lOwyMhyvuJZV8CbYH+zqW9h0y2roGOy7bx1
         5IMaHXyycFtst92v1FEt62zz8mzUjSnyGEt82v9+8JYWy0q2UWI2neEcrVM6/3L6BcZg
         wRUBUTs5wB4TtdCnf+q9V33vgqIcdh4A5ToMgPwukSNcZMy4wXPdvioN02dmhV17+eEB
         lU3I/xqcp1Nktc972ENqjWwViRKPCjNuTlXxCW9XeD/tDvwE2rDqVt0iXyQ5gA7/sxdB
         aB2Q==
X-Gm-Message-State: APjAAAXZJLWb4H/ny+fsQjnMbRPmAxololhsO/3WUpfC/tAoPQCfcTWq
        XaRmLIQhGLP3xC9shfk3SDoG1BD08kg=
X-Google-Smtp-Source: APXvYqy+dq68hBmMx0XE5ahREuQSLfAgA1EdpdReOCveU41dWkhKeOLGAMJ5OocXmjGI0KtDp7+iHA==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr3838653wmc.133.1575536565088;
        Thu, 05 Dec 2019 01:02:45 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a14sm12070050wrx.81.2019.12.05.01.02.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 01:02:44 -0800 (PST)
Message-ID: <5de8c7b4.1c69fb81.c722d.d37a@mx.google.com>
Date:   Thu, 05 Dec 2019 01:02:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191205
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 284 boots: 6 failed, 269 passed with 6 offline,
 2 untried/unknown, 1 conflict (next-20191205)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 284 boots: 6 failed, 269 passed with 6 offline, 2 untried=
/unknown, 1 conflict (next-20191205)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191205/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191205/

Tree: next
Branch: master
Git Describe: next-20191205
Git Commit: 282ffdf30a3edfb1ab6873cc7f4dc71e9c7afa31
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 25 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
