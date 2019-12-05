Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8FFD113A2C
	for <lists+linux-next@lfdr.de>; Thu,  5 Dec 2019 04:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbfLEDCw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Dec 2019 22:02:52 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54993 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbfLEDCv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Dec 2019 22:02:51 -0500
Received: by mail-wm1-f66.google.com with SMTP id b11so1940680wmj.4
        for <linux-next@vger.kernel.org>; Wed, 04 Dec 2019 19:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8/B/s6Gg3UpYI8dPQSyxY9PVtMBwlvKZhnvsDmZO4HE=;
        b=XVZyiJCPiQO46foCrYmw4zNLhHeteJmhAFF+1+XyEfDWMPzqFT+lsBBlmMCI08UgZH
         PTTfwn/mHdo8+5AqurcbmU0N7dhY+2v6Nnb+tHBbyaPGeXwLYKf86oF/blx9Bp6LDz3Z
         JQ/nblF8FysUsD0102ntpM85aUQW8Eq+N6MRLqI0OKC14/svLsgIrMRW4YXBDWwEjrKD
         ewKiU07V7AjEoKopKqsH5uBukty/Z/ti0Ww/ue1PXIO6+auBZZ2Q65i4MYPlm/35LH71
         HC6hYsL8mo9KhzAkIBneptZfP82mj6ayJ28pK4gUpuf1M9IPPTw+ZJcPeQjaJcKystT1
         4SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8/B/s6Gg3UpYI8dPQSyxY9PVtMBwlvKZhnvsDmZO4HE=;
        b=nRqyVr8aq2ucm0KVE0QykVWzg0UltxF5G+NcjvRlYluY0pkmreTkZDMor3vhwhLrRE
         pP/tHqBkMkwQ+NHDINV1goK4JQkDUGR3Oiu7MsvbYFDfSb7sJFY87PqUqlZfgQd3I+HY
         vTtSRBo0l6lhA94w9RaUq/kQzaNI1PPF32dH7nAKYdRDgerY7GY7M16fQyq6aOvFfD6m
         zG2HkkOKUiJc8UBKRmzP1FWYSWH12qExsLHCJlRS4fDW3zIvwT2JOCTTaKWpVfg8FIuJ
         vLFHi1eI8zRVeDpnqTQdtSrJOrUkMdMQ4NjVL8zdBdwTeYZXydyozBpe3a4YnfVzaryO
         3sqA==
X-Gm-Message-State: APjAAAV4N1cVT7upeufHu959RWNVyuijVgcq+i/zxSklCi+bZAvIbuS2
        AiTMqNYesXZkHF8m7QXwJcHm2ydAWNM=
X-Google-Smtp-Source: APXvYqzMYIDsP93l7VvK0ZgkkrWHhDeFlk/S+C31yHcG+9XU7ttk7A0NKIVMCLxkD329/o3cfW+w0w==
X-Received: by 2002:a7b:c004:: with SMTP id c4mr2616298wmb.45.1575514969319;
        Wed, 04 Dec 2019 19:02:49 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l4sm8471538wml.33.2019.12.04.19.02.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 19:02:48 -0800 (PST)
Message-ID: <5de87358.1c69fb81.8d750.a98d@mx.google.com>
Date:   Wed, 04 Dec 2019 19:02:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-11853-gdfc133a6fea9
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 281 boots: 5 failed,
 263 passed with 10 offline, 2 untried/unknown,
 1 conflict (v5.4-11853-gdfc133a6fea9)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 281 boots: 5 failed, 263 passed with 10 offline, 2=
 untried/unknown, 1 conflict (v5.4-11853-gdfc133a6fea9)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-11853-gdfc133a6fea9/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-11853-gdfc133a6fea9/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-11853-gdfc133a6fea9
Git Commit: dfc133a6fea9c3775b2c340f99672d6dcc6736f1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 25 SoC families, 30 builds out of 217

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab
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
            meson-axg-s400: 1 offline lab
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
