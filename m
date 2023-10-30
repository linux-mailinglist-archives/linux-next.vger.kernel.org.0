Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6CD67DB939
	for <lists+linux-next@lfdr.de>; Mon, 30 Oct 2023 12:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbjJ3LtK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Oct 2023 07:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJ3LtJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2023 07:49:09 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9563CC4
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 04:49:07 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc3542e328so7163325ad.1
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698666547; x=1699271347; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X8GnBZuXi0ptvBBNproYdcaAQGS2W4yHN8dJIIIOKAc=;
        b=np8r4u+1LmSefcWJEISKB8IKIhPLEFjihHHPV/3c/fQ2FToIjlsGW7S+vMz7CyoUYv
         Ey7rPizQSgpg/7RaruSKAJW/9UHemz/hJ1jyFQDG31RBMk/cLu7BzTQiXYouFk4QnpYi
         T4EwIwv/pQP2UHQcB4poi9X8s9IyDtmECJrs3A8k4G3aOeSrHLzVTtJ16UZwSjR/HZEB
         Azlkd8jHVamyEMQ5+bvQ/hD0AH+z6VPKmE+PsuiaYpx282mVzug7FT+1i+tF7EzSyNwO
         Cjuz8urOh6ww7/7CZfeT6QKKtWbNq3UGDaXymKNUV3dnupdaSp368LOPgHWQVywez3oA
         hG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698666547; x=1699271347;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8GnBZuXi0ptvBBNproYdcaAQGS2W4yHN8dJIIIOKAc=;
        b=uYDQ92fervmte62hcQn4C+sQ1Q/P+rzd9GxRhUPO9BNlPdwiYDD4HC9Aq3e1MwvNoj
         LI1t0kgq5DdZwy5TAPy5KuKH6O4tXCgcG0s/km99soKE3eVtVEix3Bn/JcwDac3JS4nz
         HTVVBCtEXO7UoktwhvGRJiIFhjJwuSWCo4gmsYy/KysCZQu13S8UuUztCwUp+E3MDjN1
         PHYgg/pIj/CeLtNqp8dyWwmTOv6AN1kyVLpahGLCSLIMsxdjV6rZJ2fsRgW/oVzekGVb
         dAbLOpPdztuAFvXK6sjMX9VxGZZpTz3Ak+iBPEQ36tG73yjsfEJaPUakxoiPyinWMHlR
         qqKg==
X-Gm-Message-State: AOJu0Yz2GuA76wZ1AM49tbcGOTT3+28EjoljVXVNVxSw0so+Z/TGhD+W
        b5XrJHAEwCAo2YC5wqU7ZtshFzfy5FSWOdEwTv8=
X-Google-Smtp-Source: AGHT+IGZelnA94Uz9gyDz5BKiMlz7RLE3BBYd+ijj5ayPgAgsf504Y8sSrESoENKEfHZQKFIOziwJA==
X-Received: by 2002:a17:903:41c5:b0:1cc:4921:af1b with SMTP id u5-20020a17090341c500b001cc4921af1bmr1934933ple.7.1698666546625;
        Mon, 30 Oct 2023 04:49:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o13-20020a170902d4cd00b001c0ce518e98sm6111176plg.224.2023.10.30.04.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 04:49:06 -0700 (PDT)
Message-ID: <653f9832.170a0220.947f1.048b@mx.google.com>
Date:   Mon, 30 Oct 2023 04:49:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231030
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 181 runs, 6 regressions (next-20231030)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 181 runs, 6 regressions (next-20231030)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_arm64-virt-gicv2 | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =

qemu_arm64-virt-gicv2 | arm64 | lab-collabora | gcc-10   | defconfig+debug =
| 1          =

qemu_arm64-virt-gicv3 | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =

qemu_arm64-virt-gicv3 | arm64 | lab-collabora | gcc-10   | defconfig+debug =
| 1          =

qemu_mips-malta       | mips  | lab-collabora | gcc-10   | malta_defconfig =
| 1          =

rk3399-roc-pc         | arm64 | lab-clabbe    | clang-17 | defconfig       =
| 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231030/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231030
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c503e3eec382ac708ee7adf874add37b77c5d312 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_arm64-virt-gicv2 | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =


  Details:     https://kernelci.org/test/plan/id/653f5b5f255be6edcbefceff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653f5b5f255be6edcbefc=
f00
        new failure (last pass: next-20231026) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_arm64-virt-gicv2 | arm64 | lab-collabora | gcc-10   | defconfig+debug =
| 1          =


  Details:     https://kernelci.org/test/plan/id/653f5b498c5cbb0bd9efcef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653f5b498c5cbb0bd9efc=
ef8
        new failure (last pass: next-20231026) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_arm64-virt-gicv3 | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =


  Details:     https://kernelci.org/test/plan/id/653f5b5d8c5cbb0bd9efcf00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653f5b5d8c5cbb0bd9efc=
f01
        new failure (last pass: next-20231026) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_arm64-virt-gicv3 | arm64 | lab-collabora | gcc-10   | defconfig+debug =
| 1          =


  Details:     https://kernelci.org/test/plan/id/653f5b5db20d41f634efcefb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653f5b5db20d41f634efc=
efc
        new failure (last pass: next-20231026) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_mips-malta       | mips  | lab-collabora | gcc-10   | malta_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/653f56fc81f7926928efcf01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231030/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231030/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653f56fc81f7926928efc=
f02
        new failure (last pass: next-20231027) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
rk3399-roc-pc         | arm64 | lab-clabbe    | clang-17 | defconfig       =
| 1          =


  Details:     https://kernelci.org/test/plan/id/653f5a2337c5ebaad1efcef4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17
  Plain log:   https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231030/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653f5a2337c5ebaad1efcefd
        new failure (last pass: next-20231023)

    2023-10-30T07:23:55.709514  <8>[   21.916390] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 441279_1.5.2.4.1>
    2023-10-30T07:23:55.815180  / # #
    2023-10-30T07:23:55.916831  export SHELL=3D/bin/sh
    2023-10-30T07:23:55.917462  #
    2023-10-30T07:23:56.018457  / # export SHELL=3D/bin/sh. /lava-441279/en=
vironment
    2023-10-30T07:23:56.018989  =

    2023-10-30T07:23:56.119990  / # . /lava-441279/environment/lava-441279/=
bin/lava-test-runner /lava-441279/1
    2023-10-30T07:23:56.120829  =

    2023-10-30T07:23:56.126413  / # /lava-441279/bin/lava-test-runner /lava=
-441279/1
    2023-10-30T07:23:56.175568  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =20
