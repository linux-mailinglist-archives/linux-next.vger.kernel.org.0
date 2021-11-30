Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B05B462CC6
	for <lists+linux-next@lfdr.de>; Tue, 30 Nov 2021 07:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbhK3GdW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Nov 2021 01:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbhK3GdV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Nov 2021 01:33:21 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1513CC061574
        for <linux-next@vger.kernel.org>; Mon, 29 Nov 2021 22:30:03 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so16250550pjb.5
        for <linux-next@vger.kernel.org>; Mon, 29 Nov 2021 22:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xUJtUr9MrafTPEjpXbxpghMRprWwlkxRHXlHqh5FyEc=;
        b=6lIc61j8Y9qlJMknl3LiNezQB5bR4gXTwNl8YqLCwpsnc+ec9JitqQ3k8nFGg2eMr4
         AfeDo0aOyBfOnXENacqaUGcTkzT1RDevYJCD5itc8UJalz4lsad2K0lIZ3xV7LXSFhkh
         S5UeJJ3Je7cS99DabMSXyJR/rOxHlm97cY0GTj/5gK8qwwC3vPfS+kBarpLPZGiSASnK
         umGrkI0KZyV7ZLxThaIpbV8MB5sChpxKpVwcZgPP0kXHIs8IDnwZzxaDIEUYxU/mmogw
         GFSdPTTbXhNwsiky1gavKE1cdhfeAj3L7FTRSq1CGnTWyFg4uzmxZNpamUzMsj5Vf9C2
         2bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xUJtUr9MrafTPEjpXbxpghMRprWwlkxRHXlHqh5FyEc=;
        b=OurOrJcF2UeJM0XANK0VaEuGiGNQVX5nxHmWuSTFhAMlpwZVYVgr/QK0pgGggxf57b
         y5xh8tsJFrY/ebva+nrBNUaxAQDpWtwRiQUDreEwYf35EMnBImM1aB6Bz3wMbh15Wedm
         wwlbJpvxDt8bWCxxIFugC8C0b+tgnrHgfqPhDpdsl1vU4rNd4DyTwtkjByBU8RKEzcRA
         no0IPFy9zs1SGFL2mf9OdanyjNUEzc/48OQsJ8gMBGm4oTJ3mkxLRkvaj7N2ZwTkCVg4
         gz7QtpE6CVZhHRh9pUmWWEZhqavICT85s4NPGcdyQNhRq5pUGFetl0/nNlZfkQUDLzyU
         XTQw==
X-Gm-Message-State: AOAM532sr1nA2kLITfd/JIkc1zjIh/iSRM6K3gsMRYbLNaPqFgkM40i7
        ig+Pt1nOlFxnoMpkYjXOYUATK1vaR0Nfczd0
X-Google-Smtp-Source: ABdhPJw8XCXoVIbtXYgmpmkB+rKdn6u4oGcIh/AfbiyUBQ3GeAHngMuX2sH96efHCWVhKHCZRN6aaw==
X-Received: by 2002:a17:902:a510:b0:143:7fd1:b18a with SMTP id s16-20020a170902a51000b001437fd1b18amr66267891plq.2.1638253802235;
        Mon, 29 Nov 2021 22:30:02 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m18sm20594792pfk.68.2021.11.29.22.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 22:30:01 -0800 (PST)
Message-ID: <61a5c4e9.1c69fb81.0e6e.7341@mx.google.com>
Date:   Mon, 29 Nov 2021 22:30:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-rc3-229-gee9cfd4e60161
Subject: next/pending-fixes baseline: 324 runs,
 2 regressions (v5.16-rc3-229-gee9cfd4e60161)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 324 runs, 2 regressions (v5.16-rc3-229-gee9cfd=
4e60161)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc3-229-gee9cfd4e60161/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc3-229-gee9cfd4e60161
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ee9cfd4e60161429c5f52164873caede76aff90a =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a59adddca734f28518f734

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-2=
29-gee9cfd4e60161/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-2=
29-gee9cfd4e60161/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a59adddca734f28518f=
735
        failing since 20 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a58e592f3be4e65e18f6e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-2=
29-gee9cfd4e60161/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-2=
29-gee9cfd4e60161/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a58e592f3be4e65e18f=
6e7
        new failure (last pass: v5.16-rc2-613-g4f1db50ca947f) =

 =20
