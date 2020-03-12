Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A83A1835FA
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 17:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgCLQSD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 12:18:03 -0400
Received: from mail-pj1-f54.google.com ([209.85.216.54]:34378 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgCLQSD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2020 12:18:03 -0400
Received: by mail-pj1-f54.google.com with SMTP id 39so2794444pjo.1
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2020 09:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uXuPtg+dQhTTtGcZ1+60TyDGbF5QtYwqVbiiCmQl+30=;
        b=btVg6iOU3rKbrq0U11EA5tFU+hAdiHIRrOQa3L+mM/c7gF06Il0nCkR9nV3jajoYz1
         olv4psLwi0MHzulbCTc8ryi4CIx+Iux8L2el+JgwCoo5EmjQ2a9BbyHJvRhwss9CRUI9
         nP/YegdlorFxvoAJ/EpUEEB3U8hcWWczfSqLdgvpKNyk5EFo/7D5bkmCVnTLkydNLGSk
         NJ0tcJKc8MPJ+cIXJd9XVS0FAllTNk//rUD+P2QI3HbAQUSkP27m+uyTgzm/10jwQxDS
         JopQ0+zQjgbVsxdgwVqbSAmaE2Mc6Naoc314PuHiVqxtUh5JO5SFhxZXYMdbVSYZrT54
         SKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uXuPtg+dQhTTtGcZ1+60TyDGbF5QtYwqVbiiCmQl+30=;
        b=Yy1np6jKXZJrCoB4A/5x3Jovx1wshxgpMh1DNcIsFo2t7xUOt4yKmBX0JZT601bVJD
         shbtds7ehvFsNQWB09L4pvroaC8EW09cCoQVbTHNjUys/BpFOMoUsaH7yT685UB4f3Pd
         qephMzYVwr0XtsnB4V7RLMopP81WtR89cNLIoU+dO5vzgAyWI3Qr/P59N5LHucqtUqQl
         AgO1CqS9oL/ycXaTgf4kG9+VnsS/ocmiWyzb5dyC9f8uKJabVS8JJXrideuZIKNQt6pF
         zyIfv7HTQpnsUEvKR7/c01fSgZq7TlYB3IDya60uG7ROWknb2MtblHceSwxR5sws7Iww
         93iA==
X-Gm-Message-State: ANhLgQ2ne1h2oxPWalkftsAap3zQtmoTeXJmX6tWdoCOOrhY7WCt23uF
        qqDgOYBAQVfiIZ+YnrUSLfrQAYU5afI=
X-Google-Smtp-Source: ADFU+vvVUKdNNhmnPdwRHe4uhPp1dPSRfcXArt2/PoOjGKyCk5Xwd4/eonRirsRD6gmEqeIKI53sMg==
X-Received: by 2002:a17:902:7043:: with SMTP id h3mr8554643plt.207.1584029881666;
        Thu, 12 Mar 2020 09:18:01 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z17sm7246048pff.12.2020.03.12.09.18.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 09:18:00 -0700 (PDT)
Message-ID: <5e6a60b8.1c69fb81.234e5.44af@mx.google.com>
Date:   Thu, 12 Mar 2020 09:18:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200312
X-Kernelci-Report-Type: boot
Subject: next/master boot: 97 boots: 4 failed, 90 passed with 2 offline,
 1 untried/unknown (next-20200312)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 97 boots: 4 failed, 90 passed with 2 offline, 1 untried/u=
nknown (next-20200312)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200312/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200312/

Tree: next
Branch: master
Git Describe: next-20200312
Git Commit: 407b0a62b422526e943e1261c7939b2e52ee17cb
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 59 unique boards, 19 SoC families, 24 builds out of 329

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200306)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 23 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200311)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
