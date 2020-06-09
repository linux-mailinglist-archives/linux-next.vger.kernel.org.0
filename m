Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C201F4724
	for <lists+linux-next@lfdr.de>; Tue,  9 Jun 2020 21:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731296AbgFITfw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Jun 2020 15:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgFITfv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2020 15:35:51 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA22DC05BD1E
        for <linux-next@vger.kernel.org>; Tue,  9 Jun 2020 12:35:51 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id w20so10730249pga.6
        for <linux-next@vger.kernel.org>; Tue, 09 Jun 2020 12:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QFW/CnJ+QC2JM+ebJq5v5CCCMIgvr4lUlfowFWTVVSY=;
        b=MjtXBjIAlrjDsYXARZyrs1RrYbTwpxKtZW+5EWdCdWsBSO3eb+pk4p7Bnun+6HZXia
         dFy7/jV1rAtlK/d5R6qSo84zQ859Yva7e4MrtEyMOobTfbl+UkcEJH+XxtjkEtk7Q5Qj
         9TB8WnQbx5If/iVxTQ3WayTzUCEGi2lE1Ogziea/PXm1OWrurSQ3Ex7xG4UV9QqAObwa
         uZ7G3QAY8VWJkpLgwtSD0nJqQSUo7GDH7pVjY7fL6TeH2zfH7jH+7mIcB291VRNoXY8+
         tpLq4mOL4cikPrP4N4rbwjyGgH74jcioozeBpwWE09v+ofsWnuk7uj0yg4D9TgiLD26+
         xDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QFW/CnJ+QC2JM+ebJq5v5CCCMIgvr4lUlfowFWTVVSY=;
        b=Bsd8kws4vqt3DEqB09+1QOlelRhHxz8llYjVVAPVMy880v0/ZBqGy8Tp8DD33LOOef
         1OM4Jo00hrZjS8J5YS7LBVeoD1AXM4u4e0bSU0z363YcixWRaufz4QeiVqnFBE0lQ7Yh
         vdXcgoAT/J1nzGxW7w5IVG32s12g8Dq1OcUECGAVyG1elj+i+6kJLIF4/uDBuT274Tbc
         sVJojlHI4VjDE/A4FC8Y0yre0cLj1VwKBbdbE2es0dl7VRfMouvULi8r7Ef8R5qwI/Jg
         FFe7cc5d09uLM8kYOmAoZYGCA/aDzjR7Snq0udhfmHho9Aj4HjfLfRbcb8y8oCU1mprm
         XZSw==
X-Gm-Message-State: AOAM530Pg5cURF+zCArck80t0Rz3KIS10oMn/AOLgEzFM3XjtZldkLiF
        +iY8KSN/l1ub9vnPoo2HdFcCaLt7f0o=
X-Google-Smtp-Source: ABdhPJzhcn953OfaLs2e3tloDNaCwccxjkparYj/RlQc1OGkBY5Revl2ALK2IfH9qPbb6iV5+ajwuw==
X-Received: by 2002:a62:2d6:: with SMTP id 205mr17821345pfc.93.1591731350915;
        Tue, 09 Jun 2020 12:35:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b12sm4784542pgm.2.2020.06.09.12.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 12:35:50 -0700 (PDT)
Message-ID: <5edfe496.1c69fb81.8af16.dd10@mx.google.com>
Date:   Tue, 09 Jun 2020 12:35:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-13207-g0a095ef39b5b
Subject: next/pending-fixes baseline: 120 runs,
 4 regressions (v5.7-13207-g0a095ef39b5b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 120 runs, 4 regressions (v5.7-13207-g0a095ef39=
b5b)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.7-13207-g0a095ef39b5b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.7-13207-g0a095ef39b5b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0a095ef39b5b9bb1a5d57155b7820786e2287aa9 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5edfad5ed2d3e8702c97bf1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-13207-=
g0a095ef39b5b/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-13207-=
g0a095ef39b5b/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5edfad5ed2d3e8702c97b=
f1c
      failing since 35 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5edfb3e4b7ca9c505997bf0c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-13207-=
g0a095ef39b5b/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-13207-=
g0a095ef39b5b/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5edfb3e4b7ca9c50=
5997bf0f
      failing since 4 days (last pass: v5.7-4607-g4ce9138f1bd4, first fail:=
 v5.7-8671-g086779e58c68)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5edfb06392c9aaba6d97bf21

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-13207-=
g0a095ef39b5b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-13207-=
g0a095ef39b5b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5edfb06392c9aab=
a6d97bf26
      new failure (last pass: v5.7-12631-g7925a52a5e45)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5edfb4cc7bcf5d487097bf09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-13207-=
g0a095ef39b5b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-13207-=
g0a095ef39b5b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5edfb4cc7bcf5d487097b=
f0a
      new failure (last pass: v5.7-12631-g7925a52a5e45) =20
