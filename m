Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAAEE165A81
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 10:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgBTJxL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 04:53:11 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37918 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgBTJxK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Feb 2020 04:53:10 -0500
Received: by mail-pl1-f194.google.com with SMTP id t6so1353725plj.5
        for <linux-next@vger.kernel.org>; Thu, 20 Feb 2020 01:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hroGjyAQny62EQRDFUNyX5RLrT5hnG5ippZ/Danv6Nk=;
        b=vBPv8lsD0S1mz2Ff6FDQb7ItwCcgMRrNc4xDdO5IzRwPr1Mp/D2QwwQn/oHKZS4M5P
         ak0Q+gF1kCQ7n37P5GhvVW73zPNewMGjgBfyvpaCcKntJ1fLSSfRxc9TFA7KB9kRa4dY
         e2iiJKJ/WNNRfHMpqThv2tOnuYhm1p/z9amgLMS4zs8B1Mn7/MDdKhK2Mz7tsFHEpOOZ
         8cGfXymeky5zent7oACIv0p7lmwQvYGgjEJZ4FwcHacj4Fs+R89bCJp2fwGmaW1cl2O6
         7IXWX/LSJEaLcaYQGaCxOxNE6EvaFpucdnDuQWLdadO5xnpgFmg2jzz3m0KNNhkleS3m
         pFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hroGjyAQny62EQRDFUNyX5RLrT5hnG5ippZ/Danv6Nk=;
        b=abF/KDaoKwsMj4Dhnx6X7U/kbB0SLYqrb2HYBBXy3iQoNkpehmcYGz89C1LUT8+SxM
         9Ltp9qLYIWTftD2hi9nemk2/vnT1PotwQaix5x1T7A8LvbPhknVll0o913qjViuliu2O
         PK0XT53+06vxiLG1OfBj0qKyt+5iC5im3oWPMC2H3gKTZDxF868Rlt8IoMHeMzNSqioR
         Ek/sI/aI0NDeWPC6hYcOIn53AH6pj3Sa4CT0iqeptTQs8R8D0MzsFRA4LMnrRLdrkWyX
         oM+ph0+VSnM6JKTN9NefiRMCp6n7TVgoSZp5bekZIo2KfleN7Eky4AaxN27BCWhgEVVt
         7bug==
X-Gm-Message-State: APjAAAXkBYpr9kddN7HXGcgrcd50RhDZT4G58kGFSb7FPzlId9QeIzrg
        IhQXkhCcLXScPLX1EyLLfngnwWZucvc=
X-Google-Smtp-Source: APXvYqyd8C8ERPOqrn+gGlOY4WWjZCrOKTpe2O2lFmesonFn+49si5WCBLpQSV148iuFIGGZMNfznA==
X-Received: by 2002:a17:902:8542:: with SMTP id d2mr31157750plo.200.1582192389806;
        Thu, 20 Feb 2020 01:53:09 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l8sm2639428pjy.24.2020.02.20.01.53.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 01:53:08 -0800 (PST)
Message-ID: <5e4e5704.1c69fb81.442fd.7469@mx.google.com>
Date:   Thu, 20 Feb 2020 01:53:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200220
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 104 boots: 17 failed,
 86 passed with 1 untried/unknown (next-20200220)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 104 boots: 17 failed, 86 passed with 1 untried/unknown (n=
ext-20200220)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200220/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200220/

Tree: next
Branch: master
Git Describe: next-20200220
Git Commit: f4aba10148cd290bbbf4d0efae0e9789a13c2778
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 49 unique boards, 11 SoC families, 8 builds out of 41

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 2 days (last pass: next-20200214 =
- first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 5 days (last pass: next-20200212 - =
first fail: next-20200214)
              lab-baylibre: failing since 5 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 5 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-a33-olinuxino:
              lab-clabbe: failing since 5 days (last pass: next-20200212 - =
first fail: next-20200214)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: failing since 5 days (last pass: next-20200211 - =
first fail: next-20200214)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 5 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 5 days (last pass: next-20200207 =
- first fail: next-20200214)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 5 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-h3-orangepi-pc:
              lab-clabbe: failing since 5 days (last pass: next-20200212 - =
first fail: next-20200214)

arm64:

    defconfig:
        gcc-8:
          rk3399-gru-kevin:
              lab-collabora: failing since 5 days (last pass: next-20200213=
 - first fail: next-20200214)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200219)
          rk3399-gru-kevin:
              lab-collabora: new failure (last pass: next-20200213)
          sun50i-h6-pine-h64-model-b:
              lab-baylibre: new failure (last pass: next-20200219)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
