Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C65447E0D
	for <lists+linux-next@lfdr.de>; Mon,  8 Nov 2021 11:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238181AbhKHKjE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Nov 2021 05:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238177AbhKHKjE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Nov 2021 05:39:04 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E980C061570
        for <linux-next@vger.kernel.org>; Mon,  8 Nov 2021 02:36:19 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id w9-20020a17090a1b8900b001a6b3b7ec17so8345653pjc.3
        for <linux-next@vger.kernel.org>; Mon, 08 Nov 2021 02:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=r3WBOq9tWlDfuiK4qCC1yZB7PbIbEHpJ//Xkyw3dmcE=;
        b=dTZrLnABndmehtbUatxbvKJhtDTj7ZtPhZHxI7RmBzVRlzA4BAafZnj2+LOUdWP4QU
         7W2Y8uc6K87BAAWV8qZhyduC5z0vW8zo5iEg/HykGDIkc99vhl6KK6K1jPyxGq2rs6uV
         J2rpyYWVAsRxWpuPkb5o0lU84DzkXPbC4CHn7xSp6xZB7QCnsn3igRihvHDuNkcmhizI
         q4QL1UGtr3dunnJlxSgBUIB/hjmkPwfF9WuJUzvYpl1P4QBcxMO+bMPojEZvbCv6VDMn
         /UyucBJnsR4Q+b8OrbA+Z/3VhaWIfJfUHaJDpzp+6T3YZNwGDVQNhTVLHgfgCLMQ2Zcv
         nQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=r3WBOq9tWlDfuiK4qCC1yZB7PbIbEHpJ//Xkyw3dmcE=;
        b=JDd9KTDRlGKXVsZFzCHUne1HRjdiTtRcyL95nR1i3RRqI/4I1iWeU3NE1XhSLVTea7
         PUlCg+apfYgvCIiHaGWhAJLB2iut/yVlNEwGSvUJgjYeXekrmdCSrvFZdlzIlU5e3AN4
         JtlOXcMi0wS+AzN9kPIZ8ImCNzmcGm3ozk7xlCZRtoP1vuJf9NLlkPTfwIIg56wd3t7Y
         YRGRCUCM/NF7vMGrNnGm9AdjW8B8gHd55BO085dwudW5+41hxTDpaIL7TR9suHK4se+9
         KIe/cP4RVImL6Svyrv/Q5A/GypPaCUu7kYaTUYK/ApwcPrYpnMTmkw/s/dXAV3Hos/JR
         oB9g==
X-Gm-Message-State: AOAM531tbhnNBzpgKhJ2KOk3/7HtcPrIEWvPtBHxDHZVYRHWeEV02y5d
        Li1dY3T6nfLEs76jSPMuKK8ZSZCHv0HpgIpU
X-Google-Smtp-Source: ABdhPJwz6ccr6GIu7ZrP1NLs2Y8LPSr/KVD0u1Hj679kgc5PGaYSDHN2V8JrNb0ITBiJuv2d9YazWg==
X-Received: by 2002:a17:902:c204:b0:142:2441:aa26 with SMTP id 4-20020a170902c20400b001422441aa26mr32864007pll.84.1636367778896;
        Mon, 08 Nov 2021 02:36:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o18sm9186583pgb.83.2021.11.08.02.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 02:36:18 -0800 (PST)
Message-ID: <6188fda2.1c69fb81.495c0.a697@mx.google.com>
Date:   Mon, 08 Nov 2021 02:36:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211108
X-Kernelci-Report-Type: test
Subject: next/master baseline: 731 runs, 3 regressions (next-20211108)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 731 runs, 3 regressions (next-20211108)

Regressions Summary
-------------------

platform           | arch  | lab          | compiler | defconfig          |=
 regressions
-------------------+-------+--------------+----------+--------------------+=
------------
beagle-xm          | arm   | lab-baylibre | clang-13 | multi_v7_defconfig |=
 1          =

kontron-pitx-imx8m | arm64 | lab-kontron  | gcc-10   | defconfig          |=
 1          =

kontron-pitx-imx8m | arm64 | lab-kontron  | gcc-10   | defconfig+ima      |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211108/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211108
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e844ee04dee0cf1b6d97183c12266c7726d73636 =



Test Regressions
---------------- =



platform           | arch  | lab          | compiler | defconfig          |=
 regressions
-------------------+-------+--------------+----------+--------------------+=
------------
beagle-xm          | arm   | lab-baylibre | clang-13 | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6188c309984e0bcfc4335916

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211029101439+08e3a=
5ccd952-1~exp1~20211029222017.20)
  Plain log:   https://storage.kernelci.org//next/master/next-20211108/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211108/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6188c309984e0bcfc4335=
917
        failing since 11 days (last pass: next-20211026, first fail: next-2=
0211027) =

 =



platform           | arch  | lab          | compiler | defconfig          |=
 regressions
-------------------+-------+--------------+----------+--------------------+=
------------
kontron-pitx-imx8m | arm64 | lab-kontron  | gcc-10   | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6188bd2afa776082d53358e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211108/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211108/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6188bd2afa776082d5335=
8e7
        new failure (last pass: next-20211106) =

 =



platform           | arch  | lab          | compiler | defconfig          |=
 regressions
-------------------+-------+--------------+----------+--------------------+=
------------
kontron-pitx-imx8m | arm64 | lab-kontron  | gcc-10   | defconfig+ima      |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6188c0c42bbbdebfbb3358dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211108/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211108/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6188c0c42bbbdebfbb335=
8de
        new failure (last pass: next-20211106) =

 =20
