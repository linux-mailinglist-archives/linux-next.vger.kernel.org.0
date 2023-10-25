Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC5DB7D72AD
	for <lists+linux-next@lfdr.de>; Wed, 25 Oct 2023 19:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjJYRzV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Oct 2023 13:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjJYRzU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Oct 2023 13:55:20 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767E1123
        for <linux-next@vger.kernel.org>; Wed, 25 Oct 2023 10:55:18 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c9b7c234a7so51708255ad.3
        for <linux-next@vger.kernel.org>; Wed, 25 Oct 2023 10:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698256517; x=1698861317; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xiiZ/vtfZBzzdwmr3ZKk88mL2BxwKHtJsr92Cd0Ip/Y=;
        b=WyLmwczX/SB5zJkKTyzuMFJ96KOnLGagRFk4qDS8nLQEZ/m4DlAtewtNLmX9m5sMSn
         kXSQUqtIfBGoq/tr85An9PvPd4iHCPXHnPHv2mb1PGj6MaRveWB6xQvx+jpZr9qZiwEG
         Z6uCsx6y9tPyQYe7toIkUw1o2dX/hKgW2Q6Rr/NVzErMV4nH+yGhEmfgHseSpnVotiyK
         LQkX1WtYMgrf8RlC6UyouqOYfKZ6tVheC2A3DCtVaET6kPfpiJwLnMCPTqqx1G8/xk++
         /y1fjl614SojdcciO606xoQw8m4UY3M3uPBlIY5RciqQ2PM/h1urz45JmC0UiA/qAoCw
         GIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698256517; x=1698861317;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiiZ/vtfZBzzdwmr3ZKk88mL2BxwKHtJsr92Cd0Ip/Y=;
        b=ZvBjss78B3jiD6vaw5TveJnwldp/P+N0joA5ClKgiWlGeTLu58hpOwK5z7g9vNU+/n
         78ypqKyo9p6KHrkPaOiX7Tq2gD1DdWAuu0AlRsPBmtZ3B/JqB6LnNURcsLRPbBlzCGew
         Kch591y+BP751DUK+JZ2bC3+Kl+PYpi4dtc8jCU8aTR3EJum8kGqmR6iFETLKcTNL7O0
         9Mmud6jDMbCzCcs1exb+aZU8G+W+zrBtPE6hPxlSiPuyU8LLbz6+5N19XERnKpfD7nzg
         VwYCiEo3VdVF2GiLhdJsMxr1+RvfIRL+nwBJbA2ry8enwo+gpuipSa7KwCgwllMBmN8o
         Jydg==
X-Gm-Message-State: AOJu0Yxiq5Y2Fsu8MTF5XwOfVcLYgKhY0D76+1bzCj4fzmT/Op/e5JL3
        I3Chn7RJpZJxMPG0bzI+d5xSTlBD1xJLss3aryg=
X-Google-Smtp-Source: AGHT+IHeKxJW4Z3pnoqnBNyf84uQOLo9RWuLHG3/6wm8mW3/+aDaJHBxHHV+BuSamB+mvLN/XbeIsw==
X-Received: by 2002:a17:902:c943:b0:1c6:28f6:954a with SMTP id i3-20020a170902c94300b001c628f6954amr16029190pla.64.1698256517538;
        Wed, 25 Oct 2023 10:55:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id iy10-20020a170903130a00b001c9b35287aesm9564090plb.88.2023.10.25.10.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 10:55:16 -0700 (PDT)
Message-ID: <65395684.170a0220.cbcaf.07c2@mx.google.com>
Date:   Wed, 25 Oct 2023 10:55:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231025
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 323 runs, 7 regressions (next-20231025)
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

next/master baseline: 323 runs, 7 regressions (next-20231025)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
meson-gxl-s905d-p230  | arm64 | lab-baylibre  | gcc-10   | defconfig       =
| 1          =

meson-gxl-s905d-p230  | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =

qemu_arm64-virt-gicv2 | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =

qemu_arm64-virt-gicv2 | arm64 | lab-broonie   | gcc-10   | defconfig+debug =
| 1          =

qemu_arm64-virt-gicv3 | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =

qemu_arm64-virt-gicv3 | arm64 | lab-collabora | gcc-10   | defconfig+debug =
| 1          =

qemu_mips-malta       | mips  | lab-collabora | gcc-10   | malta_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231025/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231025
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fe1998aa935b44ef873193c0772c43bce74f17dc =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
meson-gxl-s905d-p230  | arm64 | lab-baylibre  | gcc-10   | defconfig       =
| 1          =


  Details:     https://kernelci.org/test/plan/id/653914f46c8731c94defcef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653914f46c8731c94defc=
ef5
        new failure (last pass: next-20231023) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
meson-gxl-s905d-p230  | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =


  Details:     https://kernelci.org/test/plan/id/65391d2173603dc34cefcf83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65391d2173603dc34cefc=
f84
        new failure (last pass: next-20230816) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_arm64-virt-gicv2 | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =


  Details:     https://kernelci.org/test/plan/id/65391c096e4b6c2915efcf10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65391c096e4b6c2915efc=
f11
        new failure (last pass: next-20231020) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_arm64-virt-gicv2 | arm64 | lab-broonie   | gcc-10   | defconfig+debug =
| 1          =


  Details:     https://kernelci.org/test/plan/id/65391bf8d5938f6546efcf9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65391bf8d5938f6546efc=
f9f
        new failure (last pass: next-20231020) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_arm64-virt-gicv3 | arm64 | lab-baylibre  | gcc-10   | defconfig+debug =
| 1          =


  Details:     https://kernelci.org/test/plan/id/65391c0a46c2d95f7defcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65391c0a46c2d95f7defc=
ef4
        new failure (last pass: next-20231020) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_arm64-virt-gicv3 | arm64 | lab-collabora | gcc-10   | defconfig+debug =
| 1          =


  Details:     https://kernelci.org/test/plan/id/65391bba6e4b6c2915efcef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231025/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65391bba6e4b6c2915efc=
ef5
        new failure (last pass: next-20231020) =

 =



platform              | arch  | lab           | compiler | defconfig       =
| regressions
----------------------+-------+---------------+----------+-----------------=
+------------
qemu_mips-malta       | mips  | lab-collabora | gcc-10   | malta_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/6539159f3a46b1d5e0efcef8

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231025/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231025/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6539159f3a46b1d=
5e0efcefc
        new failure (last pass: next-20231023)
        1 lines

    2023-10-25T13:18:03.967660  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address ee4bc6ec, epc =3D=3D 80204c9c, ra =3D=
=3D 802074ec
    2023-10-25T13:18:03.967958  =


    2023-10-25T13:18:03.998332  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-10-25T13:18:03.998554  =

   =

 =20
