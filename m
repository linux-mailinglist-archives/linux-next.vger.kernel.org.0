Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A597C4FA99A
	for <lists+linux-next@lfdr.de>; Sat,  9 Apr 2022 18:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbiDIQm4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 9 Apr 2022 12:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiDIQmk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 9 Apr 2022 12:42:40 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50D9388
        for <linux-next@vger.kernel.org>; Sat,  9 Apr 2022 09:40:26 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c23so10549149plo.0
        for <linux-next@vger.kernel.org>; Sat, 09 Apr 2022 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=saCT7wkWDhQYy5Q+2Cf9qh7YinVde03ER8m2V4RjjdQ=;
        b=zqwWMccngZegULNfmY/1lVng+8ENeYUuirfWSr3X6ku911tdf/bOAJxWqPmWJzvsak
         deWxV/8/0Jhh3EGyJ7jyncovtiL4w1bTm6odqQTQQ6PjCEk/aogHK9IbxXZCrhGv/HfJ
         fOXFB8mpRd+Yl7Z26r09LQibqiha8QoJr9zVINXAaAmwMG3jYTfqKLVMNhumogi9J4Jy
         uxGJqk0tvow2J+n2TsU+vrtnHIBUhBiwF2E6j4eawczZcaFvr5DcAsvzWpR7gfPoJjHW
         XpA/ogO9gPPWMBKN360xHyJ9w+9Cz7EHNdaocpBZny/nltX8kDycqqAAw2hX2vFwhP+y
         e3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=saCT7wkWDhQYy5Q+2Cf9qh7YinVde03ER8m2V4RjjdQ=;
        b=T1gYd13zy9mLG98IH6lPR5eysPeNfgn4CV6GE8IeXdfsd+IRnXy3j3MMOQhijaRcpB
         L0iU38AJVKVWMiTSwDyV1FYdXUPVudclcrDSsSmrr/Or77dDzdkYk6kw+vtSmblpDdmv
         8Ha8sP338ksMjpbRHOekpwnYich6uhk/MObo/uNDJ1ptIizqpKtIMTvUk3sS9vBwvnL2
         iuAmHxjD2vxI4xUIEs5Tip9eQRLg+ei5ExP0aBoIjcJDsQ2dL58hWNiM9te/D0NCH9na
         8sD3r2MCpSD0ogLNBkiS9dThJQa5UsaaQBfuDFI+/IZzEq4r4vy44WHI4e30OEqa4Wc9
         PCAA==
X-Gm-Message-State: AOAM533azb1fkAZ9OpQyIfQO7zyJgPJu0WLa0IfPuqp2tQuJWm5Kl8cR
        g3pdmHN4Cc36pQq3U/ZICskzAf3oP29oyzJM
X-Google-Smtp-Source: ABdhPJyTt3HkF7NH0g/3a72aXV9m5roz9s1R9iKP3b/Vc6YHSXBrOJxhUOtqYWuGMSC/dyVN5CYD9Q==
X-Received: by 2002:a17:90a:6402:b0:1c9:9377:dd0e with SMTP id g2-20020a17090a640200b001c99377dd0emr27144239pjj.211.1649522425640;
        Sat, 09 Apr 2022 09:40:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090a2a4700b001cb113d89c4sm8978370pjg.33.2022.04.09.09.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 09:40:25 -0700 (PDT)
Message-ID: <6251b6f9.1c69fb81.7f43f.7650@mx.google.com>
Date:   Sat, 09 Apr 2022 09:40:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc1-427-g02f3bd309a78c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 369 runs,
 5 regressions (v5.18-rc1-427-g02f3bd309a78c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 369 runs, 5 regressions (v5.18-rc1-427-g02f3bd=
309a78c)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc1-427-g02f3bd309a78c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc1-427-g02f3bd309a78c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      02f3bd309a78c84c8e12ff44a3fd4de16d1180c3 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6251924f3789045a82ae068c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6251924f3789045a82ae0=
68d
        failing since 54 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625182b21a45546e42ae0698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625182b21a45546e42ae0=
699
        failing since 54 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625192a07431a0cc14ae067f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625192a07431a0cc14ae0=
680
        failing since 54 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625183537995e8f34fae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625183537995e8f34fae0=
67d
        failing since 54 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62517424068e0ab7b1ae06af

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-4=
27-g02f3bd309a78c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62517425068e0ab7b1ae06d1
        failing since 40 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-09T11:55:02.856377  /lava-6056690/1/../bin/lava-test-case   =

 =20
