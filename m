Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9E8E95B4
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2019 05:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbfJ3EVN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 00:21:13 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38413 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbfJ3EVN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Oct 2019 00:21:13 -0400
Received: by mail-wm1-f65.google.com with SMTP id 22so585509wms.3
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=R4EGzxg5qGTmvkyXwWa35Vt1TELU0sxREjc3WF7rj2Y=;
        b=GVmq5Y3l/TqjeAYrmLGM2KJvxbK8qW4Ew+LPzg8oc4vWBPax9HDMwykKur0mycQT9h
         mwnGrkQ7BmMxva4e+uF7yGtJSmMu3kI95/PfAVutDZNrffOd7nWq+xqmL+fkaDd7rXbP
         QPfiAtSzFIHbUEYSDMdKDYoIoeS4KUd3uYXIBHK8UmQyjXwCScsjxrIXC1lwoVm2432O
         Bi9QzgfVtKKxz+qrcDGUWGJFVAc59SrQEnj4YJYiobLrVOegqKVa/zQEiWEoVMVUfM/4
         NMURejj+c23gWii69XlIEPf6IjcXBZ0Z0YFZoI8cVFiIG5EwNX26WyVnvXSXj48qOBNo
         8sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=R4EGzxg5qGTmvkyXwWa35Vt1TELU0sxREjc3WF7rj2Y=;
        b=lfYbhI8VfJPRz5mMgtbmXO1Wsx6wJNB/GRLdcnFOyMOtO49xJ/9savGI8uRfb8MwyJ
         /34OCqPxTTydK+g8f3031K9gHT/jJMYnRQHv+DtPM2YZmAYb/HLyDBt+KoAtIqedRpn+
         bQ5+t8ykRys5UV753c0cMqKBcVcUEkpA7qEtDMVPEaNXTn2GGMyyisqeJeIq22gPyBJc
         ooKHpModmbeMmezgsTmWNkWd0nCoFNdOVh+6pNqmdwGYaqGjRTXZWwIOIMDIBRKCfcGq
         S8E8Dc4czEKH4zDRA5Q1VBcBjNicQS3AudEn6fIYpHV0Ntny+yhQO9qyqGJlMN01US/Y
         068A==
X-Gm-Message-State: APjAAAUXT4eCFXuk1rLeoYImsP523nnkg+Ztg1UsmQX87Uy7mLlyrF5P
        8tL4wuy+P8KUap6afNW7sgsK290Rja+vXA==
X-Google-Smtp-Source: APXvYqxt+3mjPsVK6QvEyQEsasY0rSOoQ80Anlb3E8QfgpBytaJh0r8LGDF7f29SwnLR8sxxSJGX0Q==
X-Received: by 2002:a1c:7913:: with SMTP id l19mr7420471wme.26.1572409269436;
        Tue, 29 Oct 2019 21:21:09 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d2sm5002178wmd.2.2019.10.29.21.21.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 21:21:09 -0700 (PDT)
Message-ID: <5db90fb5.1c69fb81.bbea8.9b75@mx.google.com>
Date:   Tue, 29 Oct 2019 21:21:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.4-rc5-311-g2e788f1fd131
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 259 boots: 2 failed,
 246 passed with 8 offline, 2 untried/unknown,
 1 conflict (v5.4-rc5-311-g2e788f1fd131)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 259 boots: 2 failed, 246 passed with 8 offline, 2 =
untried/unknown, 1 conflict (v5.4-rc5-311-g2e788f1fd131)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc5-311-g2e788f1fd131/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc5-311-g2e788f1fd131/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc5-311-g2e788f1fd131
Git Commit: 2e788f1fd13187860120cd3bb215628e5a086f02
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 26 SoC families, 27 builds out of 215

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        omap3-beagle-xm:
            lab-baylibre-seattle: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
