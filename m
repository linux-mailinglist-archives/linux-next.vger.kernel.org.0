Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2B313CB93
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 19:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgAOSD3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 13:03:29 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:33298 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgAOSD3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 13:03:29 -0500
Received: by mail-wr1-f47.google.com with SMTP id b6so16708568wrq.0
        for <linux-next@vger.kernel.org>; Wed, 15 Jan 2020 10:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Jf0kVfUbRQl0tNlszSsiy3YnQfQg/4uxxC9YmAwX/L8=;
        b=KaW5qAKPUvqx8Ns3ICr9jyEDgzu5//QXA+HA3EL/0Qj0/g9jVojO7CisFzdN/0Ktjp
         lDUxnX15zxJdr+c/1mUvePITOTzaQH3xo0a/O4dcQAUl9C5L/afD3qK46STTWPR/icCj
         CP3pOm+aKJ9cJ9d7CYn14atZjrXBmbDcHgZ1+ITbNGZlJ/wBWC1wt9U9Tdogs/Rj3NJh
         8SlDCDH/Xzxto3pVw7jVrdwFj8NXXMdtMyKkdUkwS7fuSrL630BKGC2mCZTmabCgdEdj
         OiEIuCxRJkP7t7g2Shco7ZlJMD+m2kwVwiQUDqA0iZ4YDbWGPE/+17ZCPwjMd1Klacm2
         cgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Jf0kVfUbRQl0tNlszSsiy3YnQfQg/4uxxC9YmAwX/L8=;
        b=BdseXW0izvMlt+lO91aHlwjx2cTf6E6i5TibixOtDqMw7BIMTTLVPsicLdxGSrFiNd
         hG+GB5C5qHkkClctd7u/tq0HESto9ERi/Q9MwgXFg0AhEJo9hSkEG+Z1RQjHE4cganmG
         NSxZ4Yl09cQJBa8/glEj4kdVE86tuivnQW5ZOsCY5DjTRDD+UGayNAadplSOnKJ1QyNc
         cT8Es+6cZdKnKDE9v9WfiQYXZvZzaW7UzQalboN05mksx3Y9csRGeiEk7KGCoRkPc61p
         yLhMK8CxtG/sIkvKpu8uZ7vdUVDojDRg/F20ryi2hg42RygcySYFbctErwdvU5NAHYva
         WGAg==
X-Gm-Message-State: APjAAAV7ZE0ajiXfiiyjBC9wZdo4FPfQDeuvt/VGbF656s8xfYBSNSC3
        BLnVQkdsi18s9f6BGfXVqJNvbtwKWnzP1g==
X-Google-Smtp-Source: APXvYqyCPTtF+Qd92c38xL010h+d96i7SMsocpHmLRkhK5Mz3eQpHeEQhWALaqi08AzCzOhiD16zRA==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr25196wrm.284.1579111406649;
        Wed, 15 Jan 2020 10:03:26 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l7sm25894936wrq.61.2020.01.15.10.03.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 10:03:25 -0800 (PST)
Message-ID: <5e1f53ed.1c69fb81.5dd7d.c9ab@mx.google.com>
Date:   Wed, 15 Jan 2020 10:03:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200115
Subject: next/master boot: 130 boots: 13 failed, 117 passed (next-20200115)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 130 boots: 13 failed, 117 passed (next-20200115)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200115/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200115/

Tree: next
Branch: master
Git Describe: next-20200115
Git Commit: 5b483a1a0ea1ab19a5734051c9692c2cfabe1327
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 54 unique boards, 11 SoC families, 22 builds out of 215

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: next-20200114)

    multi_v5_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: next-20200114)

    multi_v7_defconfig:
        gcc-8:
          omap4-panda:
              lab-baylibre: failing since 9 days (last pass: next-20191220 =
- first fail: next-20200106)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          omap4-panda:
              lab-baylibre: failing since 9 days (last pass: next-20191220 =
- first fail: next-20200106)

    omap2plus_defconfig:
        gcc-8:
          omap4-panda:
              lab-baylibre: failing since 9 days (last pass: next-20191220 =
- first fail: next-20200106)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 9 days (last pass: next-20191220 - f=
irst fail: next-20200106)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: failing since 2 days (last pass: next-20200110 =
- first fail: next-20200113)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab
            omap4-panda: 1 failed lab

    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am335x-boneblack: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 1 failed lab

---
For more info write to <info@kernelci.org>
