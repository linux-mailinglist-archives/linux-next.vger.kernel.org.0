Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED5810FB34
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 10:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfLCJ5D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Dec 2019 04:57:03 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33710 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfLCJ5D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Dec 2019 04:57:03 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so2915939wrq.0
        for <linux-next@vger.kernel.org>; Tue, 03 Dec 2019 01:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ar0neZUDXTVIre4n4Rrgbu98uWfxclnk5rsqUKgilJk=;
        b=qSUw6LoqtT6gx2mZ8fhoY2e2iEoDCQchbplmVYyNwrAfgFF35YA80JSX2q1NGOa+go
         bIEUpdQ9McoqnyVckVr2ilLHW9dksb6T1/YbfTvLyG/7FGbhw7hKNp49yXcI5pQuOVrg
         bKfNCb7r2/WKIePF+Umzz2st6sDHXMRcIIEPWZ6nWkxKjcSAqW953uFw7sZn8SHaUZmw
         tBmq8e+mRQB0hVj0AqI28XUc+C2rCOcGfSuQ1QZMT3CroXvAIn9cFuxNPoBBH+k4x15b
         xXck/hfRfpddb/NRfYMJPLIDwaPb48R84n2ELwtcEdMz5eCJHYuAvsKV+FHvCKJPIUWl
         3Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ar0neZUDXTVIre4n4Rrgbu98uWfxclnk5rsqUKgilJk=;
        b=m+p5lAinZTE/Jyrl2JOVXhLhAJS9SHfWMxx/Roq6uVaz2SDcW3MhBqJZUpoC4ZhU8H
         7UVYrkh1TmwYw75V9FrwF7LI85PQTy6xVoycMh/N1pNYR8cdjOjpa8ZzZXtHrr2EhOwK
         K5lPJ5iFYfZLUGRkIt1fzrnfoOLJoGQfqeBB5xVfSluPNWV+RK9WIb8G3pGTKiX1seEw
         YfR5+w8ei8lFUcXsFubbJHvuC2DPEsbV9iRx6UNh4vXxH/AszFEBuODbLa/6dhV9Ughm
         JkBSx8BA5UeHfE2wpN/rlP1/w1TIfVdxq/SeIqOsiyXBLdPCZmrq4kFc9/9oDNXEbQho
         O09A==
X-Gm-Message-State: APjAAAVzC1wC7krteXIKlNH2iwZCIdBScV1rjsyb5inUYv0OZCLBTVc4
        G/k0mdoIPCr5d+a8CXqLzI5S2X0FGXnCiQ==
X-Google-Smtp-Source: APXvYqzjgrMcQ3c/zLvcFSP+3HBAOxKFDPyCRDntvK+xCKfVyGz79dgKRsPMKw9Gbk4QI9ruBi/kNg==
X-Received: by 2002:adf:f70b:: with SMTP id r11mr4403251wrp.388.1575367021440;
        Tue, 03 Dec 2019 01:57:01 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i16sm2345008wmb.36.2019.12.03.01.56.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 01:57:00 -0800 (PST)
Message-ID: <5de6316c.1c69fb81.915d4.b99a@mx.google.com>
Date:   Tue, 03 Dec 2019 01:57:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191203
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 275 boots: 5 failed, 260 passed with 7 offline,
 2 untried/unknown, 1 conflict (next-20191203)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 275 boots: 5 failed, 260 passed with 7 offline, 2 untried=
/unknown, 1 conflict (next-20191203)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191203/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191203/

Tree: next
Branch: master
Git Describe: next-20191203
Git Commit: 1ab75b2e415a29dba9aec94f203c6f88dbfc0ba0
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 24 SoC families, 28 builds out of 209

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
            msm8998-mtp: 1 failed lab
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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
