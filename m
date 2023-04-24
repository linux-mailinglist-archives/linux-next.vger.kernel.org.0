Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE366ED7A4
	for <lists+linux-next@lfdr.de>; Tue, 25 Apr 2023 00:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbjDXWOf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Apr 2023 18:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbjDXWOb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Apr 2023 18:14:31 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07887DBF
        for <linux-next@vger.kernel.org>; Mon, 24 Apr 2023 15:14:25 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1a68d61579bso39566155ad.1
        for <linux-next@vger.kernel.org>; Mon, 24 Apr 2023 15:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682374465; x=1684966465;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jmSfI3rmt/H+G3LeP7BsedXLhTKqINHkyN32DVTWQRo=;
        b=qBkS/pINaaZAb55Bj6qMQTc4YoSw5GFPFETTBwPm4q2tYRHZXNxPibYmCNlD5yU09S
         igjoSZzD1dX6GQjBmDL3NQnmGUmpYba5wR3UKN7Wm2bWYbe+rSvtGzEEomlOlHx9wLVD
         E8bhJu2dY/vogsTA10qLKKW3UFxd2FRbwN00tItHfc2QiTV6VFCNSE3D6u4Ex7s9hH40
         V7eB0TzR88eSxaT4j02PGY1jPgXqJd76QdQFsPauXKLhMOa8zWd17r1Dxhn9RClpF//R
         BEWO2Se1VRbwCQoyKuTTW19ZomWdM+gvqPpF/zbNOwHeQPZYBRue6C3DRRmrNV0UvY3f
         UvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682374465; x=1684966465;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmSfI3rmt/H+G3LeP7BsedXLhTKqINHkyN32DVTWQRo=;
        b=lF/BJ5Kn4W7I0wX6eVCJh1pjjW/shvS90RRssyqcfCLnLAhtG5LWw3MIoB9rqpWJWO
         /dVyE7Rb/BR4A1LtD2/gKzdfCwKjj/S+MHzKuzpUOPC29DBFyQ/AzoGE4ELnpWk94BMY
         16iDsYJAPm7IA6dThPXKWllYUHWqoy5bTtB29MwUvyafDhUGHigjgX63yvhkNG66wz7d
         nPtkNaTU89MENbmE76psDmhdYcBBqLz40FQJRgStBRTAFt3DuSwJhetbMDuXICuEszTQ
         E7wBHtf/iqLGAESOBjTHraXFksw0C4WITsyYnsq6tKebevx/hRnA4+6zRZ7AK8YQms9R
         t/gg==
X-Gm-Message-State: AAQBX9fvfCZKKcU/WNKYvwQpk4lio3K2VHpAiQOL1xh6lrIVdT+1LLea
        HZOQOMqjK2t57zVGcj3EEASBWmWEuxvGaJmwsphBwQ==
X-Google-Smtp-Source: AKy350bK4w68z6N6QFHgaVh2qLMGFDeT30DaC9MwWd6OM5mqO+yZm2UEXPRkBmkjgwBSYFBCv62JgA==
X-Received: by 2002:a17:902:c408:b0:1a8:ac3:47b4 with SMTP id k8-20020a170902c40800b001a80ac347b4mr21502916plk.20.1682374463875;
        Mon, 24 Apr 2023 15:14:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jf15-20020a170903268f00b001a076568da9sm6959848plb.216.2023.04.24.15.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 15:14:23 -0700 (PDT)
Message-ID: <6446ff3f.170a0220.ac6b1.e347@mx.google.com>
Date:   Mon, 24 Apr 2023 15:14:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-225-g0a6daccdbdd65
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 330 runs,
 47 regressions (v6.3-225-g0a6daccdbdd65)
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

next/pending-fixes baseline: 330 runs, 47 regressions (v6.3-225-g0a6daccdbd=
d65)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+videodec           | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-225-g0a6daccdbdd65/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-225-g0a6daccdbdd65
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0a6daccdbdd65cc86e2c4479211cd7f5915c9cd8 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c575d4ae7a6f4a2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c575d4ae7a6f4a2e85eb
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:07:37.010885  <8>[   10.734337] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107687_1.4.2.3.1>

    2023-04-24T18:07:37.013892  + set +x

    2023-04-24T18:07:37.118578  /#

    2023-04-24T18:07:37.220932   # #export SHELL=3D/bin/sh

    2023-04-24T18:07:37.221658  =


    2023-04-24T18:07:37.323013  / # export SHELL=3D/bin/sh. /lava-10107687/=
environment

    2023-04-24T18:07:37.323655  =


    2023-04-24T18:07:37.425027  / # . /lava-10107687/environment/lava-10107=
687/bin/lava-test-runner /lava-10107687/1

    2023-04-24T18:07:37.426109  =


    2023-04-24T18:07:37.431046  / # /lava-10107687/bin/lava-test-runner /la=
va-10107687/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c6dd64ff1fda382e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c6dd64ff1fda382e85eb
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:13:35.301912  + set +x

    2023-04-24T18:13:35.308439  <8>[   10.087976] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107886_1.4.2.3.1>

    2023-04-24T18:13:35.410060  #

    2023-04-24T18:13:35.410288  =


    2023-04-24T18:13:35.510881  / # #export SHELL=3D/bin/sh

    2023-04-24T18:13:35.511094  =


    2023-04-24T18:13:35.611661  / # export SHELL=3D/bin/sh. /lava-10107886/=
environment

    2023-04-24T18:13:35.611891  =


    2023-04-24T18:13:35.712457  / # . /lava-10107886/environment/lava-10107=
886/bin/lava-test-runner /lava-10107886/1

    2023-04-24T18:13:35.712754  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c574c8f8f715072e867f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c574c8f8f715072e8684
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:07:39.969784  + set<8>[   11.607210] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10107659_1.4.2.3.1>

    2023-04-24T18:07:39.970397   +x

    2023-04-24T18:07:40.078173  / # #

    2023-04-24T18:07:40.180801  export SHELL=3D/bin/sh

    2023-04-24T18:07:40.181583  #

    2023-04-24T18:07:40.283299  / # export SHELL=3D/bin/sh. /lava-10107659/=
environment

    2023-04-24T18:07:40.284080  =


    2023-04-24T18:07:40.385916  / # . /lava-10107659/environment/lava-10107=
659/bin/lava-test-runner /lava-10107659/1

    2023-04-24T18:07:40.387358  =


    2023-04-24T18:07:40.392045  / # /lava-10107659/bin/lava-test-runner /la=
va-10107659/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7c9ad253a06bc2e8619

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c7c9ad253a06bc2e861e
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:17:23.410378  + set<8>[   12.239050] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10107885_1.4.2.3.1>

    2023-04-24T18:17:23.410839   +x

    2023-04-24T18:17:23.518343  / # #

    2023-04-24T18:17:23.620758  export SHELL=3D/bin/sh

    2023-04-24T18:17:23.621012  #

    2023-04-24T18:17:23.721559  / # export SHELL=3D/bin/sh. /lava-10107885/=
environment

    2023-04-24T18:17:23.721820  =


    2023-04-24T18:17:23.822572  / # . /lava-10107885/environment/lava-10107=
885/bin/lava-test-runner /lava-10107885/1

    2023-04-24T18:17:23.823671  =


    2023-04-24T18:17:23.828923  / # /lava-10107885/bin/lava-test-runner /la=
va-10107885/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c57d6d498ed8802e8688

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c57d6d498ed8802e868d
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:07:36.261971  <8>[   10.579644] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107665_1.4.2.3.1>

    2023-04-24T18:07:36.265057  + set +x

    2023-04-24T18:07:36.366246  #

    2023-04-24T18:07:36.366473  =


    2023-04-24T18:07:36.467143  / # #export SHELL=3D/bin/sh

    2023-04-24T18:07:36.467354  =


    2023-04-24T18:07:36.568127  / # export SHELL=3D/bin/sh. /lava-10107665/=
environment

    2023-04-24T18:07:36.568834  =


    2023-04-24T18:07:36.670236  / # . /lava-10107665/environment/lava-10107=
665/bin/lava-test-runner /lava-10107665/1

    2023-04-24T18:07:36.671272  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c63f1984ad3f592e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c63f1984ad3f592e8606
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:10:48.031501  <8>[   10.074910] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107891_1.4.2.3.1>

    2023-04-24T18:10:48.034730  + set +x

    2023-04-24T18:10:48.136508  #

    2023-04-24T18:10:48.136825  =


    2023-04-24T18:10:48.237389  / # #export SHELL=3D/bin/sh

    2023-04-24T18:10:48.237590  =


    2023-04-24T18:10:48.338074  / # export SHELL=3D/bin/sh. /lava-10107891/=
environment

    2023-04-24T18:10:48.338344  =


    2023-04-24T18:10:48.438941  / # . /lava-10107891/environment/lava-10107=
891/bin/lava-test-runner /lava-10107891/1

    2023-04-24T18:10:48.439307  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c311bc654d9d782e860a

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-=
b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-=
b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c311bc654d9d782e863d
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-24T17:57:14.739246  + set +x
    2023-04-24T17:57:14.742835  <8>[   18.802793] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 381224_1.5.2.4.1>
    2023-04-24T17:57:14.876419  / # #
    2023-04-24T17:57:14.978649  export SHELL=3D/bin/sh
    2023-04-24T17:57:14.979037  #
    2023-04-24T17:57:15.080274  / # export SHELL=3D/bin/sh. /lava-381224/en=
vironment
    2023-04-24T17:57:15.081051  =

    2023-04-24T17:57:15.182743  / # . /lava-381224/environment/lava-381224/=
bin/lava-test-runner /lava-381224/1
    2023-04-24T17:57:15.183265  =

    2023-04-24T17:57:15.189599  / # /lava-381224/bin/lava-test-runner /lava=
-381224/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c3a4b8a4c5d51c2e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c3a4b8a4c5d51c2e85ec
        failing since 103 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-04-24T17:59:45.388755  / # #

    2023-04-24T17:59:45.489733  export SHELL=3D/bin/sh

    2023-04-24T17:59:45.490433  #

    2023-04-24T17:59:45.591498  / # export SHELL=3D/bin/sh. /lava-10107528/=
environment

    2023-04-24T17:59:45.591635  =


    2023-04-24T17:59:45.692469  / # . /lava-10107528/environment/lava-10107=
528/bin/lava-test-runner /lava-10107528/1

    2023-04-24T17:59:45.693461  =


    2023-04-24T17:59:45.702331  / # /lava-10107528/bin/lava-test-runner /la=
va-10107528/1

    2023-04-24T17:59:45.820798  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-24T17:59:45.821315  + cd /lava-10107528/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446cafd13c6f6793c2e8693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446cafd13c6f6793c2e8=
694
        failing since 56 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c568c8f8f715072e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c568c8f8f715072e85fb
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:07:28.261658  + set +x

    2023-04-24T18:07:28.267731  <8>[   10.513192] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107673_1.4.2.3.1>

    2023-04-24T18:07:28.372039  / # #

    2023-04-24T18:07:28.472614  export SHELL=3D/bin/sh

    2023-04-24T18:07:28.472816  #

    2023-04-24T18:07:28.573286  / # export SHELL=3D/bin/sh. /lava-10107673/=
environment

    2023-04-24T18:07:28.573464  =


    2023-04-24T18:07:28.673973  / # . /lava-10107673/environment/lava-10107=
673/bin/lava-test-runner /lava-10107673/1

    2023-04-24T18:07:28.674257  =


    2023-04-24T18:07:28.679065  / # /lava-10107673/bin/lava-test-runner /la=
va-10107673/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7dcdf90b178942e8623

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c7dcdf90b178942e8628
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:17:50.104481  + <8>[   10.330363] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10107856_1.4.2.3.1>

    2023-04-24T18:17:50.104564  set +x

    2023-04-24T18:17:50.205994  =


    2023-04-24T18:17:50.306566  / # #export SHELL=3D/bin/sh

    2023-04-24T18:17:50.306776  =


    2023-04-24T18:17:50.407311  / # export SHELL=3D/bin/sh. /lava-10107856/=
environment

    2023-04-24T18:17:50.407562  =


    2023-04-24T18:17:50.508139  / # . /lava-10107856/environment/lava-10107=
856/bin/lava-test-runner /lava-10107856/1

    2023-04-24T18:17:50.508481  =


    2023-04-24T18:17:50.512966  / # /lava-10107856/bin/lava-test-runner /la=
va-10107856/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c56d0a3820c2fb2e85e9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c56d0a3820c2fb2e85ee
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:07:25.747469  + set +x

    2023-04-24T18:07:25.753791  <8>[   10.462311] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107697_1.4.2.3.1>

    2023-04-24T18:07:25.858125  / # #

    2023-04-24T18:07:25.958743  export SHELL=3D/bin/sh

    2023-04-24T18:07:25.958885  #

    2023-04-24T18:07:26.059552  / # export SHELL=3D/bin/sh. /lava-10107697/=
environment

    2023-04-24T18:07:26.059736  =


    2023-04-24T18:07:26.160328  / # . /lava-10107697/environment/lava-10107=
697/bin/lava-test-runner /lava-10107697/1

    2023-04-24T18:07:26.160544  =


    2023-04-24T18:07:26.165708  / # /lava-10107697/bin/lava-test-runner /la=
va-10107697/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c73cf17a5056152e85ed

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c73cf17a5056152e85f2
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:15:04.935414  <8>[   10.233624] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107838_1.4.2.3.1>

    2023-04-24T18:15:04.938906  + set +x

    2023-04-24T18:15:05.044517  #

    2023-04-24T18:15:05.147072  / # #export SHELL=3D/bin/sh

    2023-04-24T18:15:05.147935  =


    2023-04-24T18:15:05.249350  / # export SHELL=3D/bin/sh. /lava-10107838/=
environment

    2023-04-24T18:15:05.250131  =


    2023-04-24T18:15:05.351473  / # . /lava-10107838/environment/lava-10107=
838/bin/lava-test-runner /lava-10107838/1

    2023-04-24T18:15:05.352848  =


    2023-04-24T18:15:05.358073  / # /lava-10107838/bin/lava-test-runner /la=
va-10107838/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c5786d498ed8802e864d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c5786d498ed8802e8652
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:07:34.884150  + set +x<8>[   10.698056] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10107662_1.4.2.3.1>

    2023-04-24T18:07:34.884237  =


    2023-04-24T18:07:34.987810  / # #

    2023-04-24T18:07:35.088445  export SHELL=3D/bin/sh

    2023-04-24T18:07:35.088634  #

    2023-04-24T18:07:35.189152  / # export SHELL=3D/bin/sh. /lava-10107662/=
environment

    2023-04-24T18:07:35.189352  =


    2023-04-24T18:07:35.289829  / # . /lava-10107662/environment/lava-10107=
662/bin/lava-test-runner /lava-10107662/1

    2023-04-24T18:07:35.290105  =


    2023-04-24T18:07:35.294887  / # /lava-10107662/bin/lava-test-runner /la=
va-10107662/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c62c459b0de3b32e8610

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c62c459b0de3b32e8615
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:10:35.218542  + set +x<8>[   10.905752] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10107839_1.4.2.3.1>

    2023-04-24T18:10:35.218628  =


    2023-04-24T18:10:35.323432  / # #

    2023-04-24T18:10:35.424085  export SHELL=3D/bin/sh

    2023-04-24T18:10:35.424292  #

    2023-04-24T18:10:35.524802  / # export SHELL=3D/bin/sh. /lava-10107839/=
environment

    2023-04-24T18:10:35.525003  =


    2023-04-24T18:10:35.625545  / # . /lava-10107839/environment/lava-10107=
839/bin/lava-test-runner /lava-10107839/1

    2023-04-24T18:10:35.625848  =


    2023-04-24T18:10:35.630902  / # /lava-10107839/bin/lava-test-runner /la=
va-10107839/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c6a2b587a9e1662e8623

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c6a2b587a9e1662e8628
        failing since 84 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-24T18:12:28.837420  + set +x
    2023-04-24T18:12:28.837599  [   14.349314] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936189_1.5.2.3.1>
    2023-04-24T18:12:28.944832  / # #
    2023-04-24T18:12:29.046815  export SHELL=3D/bin/sh
    2023-04-24T18:12:29.047390  #
    2023-04-24T18:12:29.148658  / # export SHELL=3D/bin/sh. /lava-936189/en=
vironment
    2023-04-24T18:12:29.149155  =

    2023-04-24T18:12:29.250499  / # . /lava-936189/environment/lava-936189/=
bin/lava-test-runner /lava-936189/1
    2023-04-24T18:12:29.251300  =

    2023-04-24T18:12:29.254180  / # /lava-936189/bin/lava-test-runner /lava=
-936189/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c8966d880167e82e8629

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c8966d880167e82e862e
        failing since 84 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-24T18:20:47.531016  + set +x
    2023-04-24T18:20:47.531217  [   13.019827] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936220_1.5.2.3.1>
    2023-04-24T18:20:47.638929  / # #
    2023-04-24T18:20:47.740694  export SHELL=3D/bin/sh
    2023-04-24T18:20:47.741185  #
    2023-04-24T18:20:47.842413  / # export SHELL=3D/bin/sh. /lava-936220/en=
vironment
    2023-04-24T18:20:47.842866  =

    2023-04-24T18:20:47.944188  / # . /lava-936220/environment/lava-936220/=
bin/lava-test-runner /lava-936220/1
    2023-04-24T18:20:47.944804  =

    2023-04-24T18:20:47.948203  / # /lava-936220/bin/lava-test-runner /lava=
-936220/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c8e723c62951802e8611

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c8e723c62951802e8616
        failing since 84 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-24T18:22:05.865653  + set +x
    2023-04-24T18:22:05.865816  [   12.126279] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936222_1.5.2.3.1>
    2023-04-24T18:22:05.973128  / # #
    2023-04-24T18:22:06.074841  export SHELL=3D/bin/sh
    2023-04-24T18:22:06.075402  #
    2023-04-24T18:22:06.176637  / # export SHELL=3D/bin/sh. /lava-936222/en=
vironment
    2023-04-24T18:22:06.177027  =

    2023-04-24T18:22:06.278260  / # . /lava-936222/environment/lava-936222/=
bin/lava-test-runner /lava-936222/1
    2023-04-24T18:22:06.278901  =

    2023-04-24T18:22:06.282140  / # /lava-936222/bin/lava-test-runner /lava=
-936222/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c93628e8fa1f352e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c93628e8fa1f352e85eb
        failing since 84 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-24T18:23:26.624769  + set +x
    2023-04-24T18:23:26.624942  [   13.330570] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936231_1.5.2.3.1>
    2023-04-24T18:23:26.732466  / # #
    2023-04-24T18:23:26.834253  export SHELL=3D/bin/sh
    2023-04-24T18:23:26.834731  #
    2023-04-24T18:23:26.936014  / # export SHELL=3D/bin/sh. /lava-936231/en=
vironment
    2023-04-24T18:23:26.936414  =

    2023-04-24T18:23:27.037520  / # . /lava-936231/environment/lava-936231/=
bin/lava-test-runner /lava-936231/1
    2023-04-24T18:23:27.038169  =

    2023-04-24T18:23:27.041532  / # /lava-936231/bin/lava-test-runner /lava=
-936231/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c9d7f5031f8f1a2e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c9d7f5031f8f1a2e85eb
        failing since 84 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-24T18:26:06.364673  + set +x
    2023-04-24T18:26:06.364850  [   13.099534] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936242_1.5.2.3.1>
    2023-04-24T18:26:06.472225  / # #
    2023-04-24T18:26:06.573934  export SHELL=3D/bin/sh
    2023-04-24T18:26:06.574509  #
    2023-04-24T18:26:06.675830  / # export SHELL=3D/bin/sh. /lava-936242/en=
vironment
    2023-04-24T18:26:06.676353  =

    2023-04-24T18:26:06.777634  / # . /lava-936242/environment/lava-936242/=
bin/lava-test-runner /lava-936242/1
    2023-04-24T18:26:06.778507  =

    2023-04-24T18:26:06.782202  / # /lava-936242/bin/lava-test-runner /lava=
-936242/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7f6618e2983552e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c7f6618e2983552e8=
617
        failing since 168 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c9233f9722db7a2e8618

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c9233f9722db7a2e861d
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-24T18:23:07.625088  + set[   15.088369] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 936228_1.5.2.3.1>
    2023-04-24T18:23:07.625304   +x
    2023-04-24T18:23:07.731374  / # #
    2023-04-24T18:23:07.833274  export SHELL=3D/bin/sh
    2023-04-24T18:23:07.833797  #
    2023-04-24T18:23:07.935060  / # export SHELL=3D/bin/sh. /lava-936228/en=
vironment
    2023-04-24T18:23:07.935559  =

    2023-04-24T18:23:08.036730  / # . /lava-936228/environment/lava-936228/=
bin/lava-test-runner /lava-936228/1
    2023-04-24T18:23:08.037289  =

    2023-04-24T18:23:08.040172  / # /lava-936228/bin/lava-test-runner /lava=
-936228/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7cead253a06bc2e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c7cead253a06bc2e8=
628
        failing since 221 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c71934fc4224812e860b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-1=
4x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-1=
4x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c71934fc4224812e860e
        failing since 109 days (last pass: v6.1-rc4-339-g185da88d03ed, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-24T18:14:25.925558  + set +x
    2023-04-24T18:14:25.926571  <8>[   49.684174] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1207482_1.5.2.4.1>
    2023-04-24T18:14:26.034353  / # #
    2023-04-24T18:14:27.192182  export SHELL=3D/bin/sh
    2023-04-24T18:14:27.197646  #
    2023-04-24T18:14:28.743396  / # export SHELL=3D/bin/sh. /lava-1207482/e=
nvironment
    2023-04-24T18:14:28.749089  =

    2023-04-24T18:14:31.570273  / # . /lava-1207482/environment/lava-120748=
2/bin/lava-test-runner /lava-1207482/1
    2023-04-24T18:14:31.576363  =

    2023-04-24T18:14:31.576917  / # /lava-1207482/bin/lava-test-runner /lav=
a-1207482/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c5de68010a14aa2e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-sd=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-sd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c5de68010a14aa2e85ea
        failing since 109 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-24T18:09:05.871330  + set<8>[   29.860604] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1207483_1.5.2.4.1>
    2023-04-24T18:09:05.871590   +x
    2023-04-24T18:09:05.977865  / # #
    2023-04-24T18:09:07.138452  export SHELL=3D/bin/sh
    2023-04-24T18:09:07.144141  #
    2023-04-24T18:09:08.692126  / # export SHELL=3D/bin/sh. /lava-1207483/e=
nvironment
    2023-04-24T18:09:08.697820  =

    2023-04-24T18:09:11.518669  / # . /lava-1207483/environment/lava-120748=
3/bin/lava-test-runner /lava-1207483/1
    2023-04-24T18:09:11.524584  =

    2023-04-24T18:09:11.530842  / # /lava-1207483/bin/lava-test-runner /lav=
a-1207483/1 =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c79f65f6019ff42e85f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c79f65f6019ff42e85f5
        failing since 109 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-24T18:16:41.106907  + set +x<8>[   56.197503] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1207481_1.5.2.4.1>
    2023-04-24T18:16:41.107206  =

    2023-04-24T18:16:41.216655  / # #
    2023-04-24T18:16:42.375817  export SHELL=3D/bin/sh
    2023-04-24T18:16:42.381537  #
    2023-04-24T18:16:42.381832  / # export SHELL=3D/bin/sh
    2023-04-24T18:16:43.928696  / # . /lava-1207481/environment
    2023-04-24T18:16:46.756235  /lava-1207481/bin/lava-test-runner /lava-12=
07481/1
    2023-04-24T18:16:46.762289  . /lava-1207481/environment
    2023-04-24T18:16:46.762547  / # /lava-1207481/bin/lava-test-runner /lav=
a-1207481/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6446cb7b292ce02ad02e86fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446cb7b292ce02ad02e8=
6ff
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c5659cf1d063c92e85f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c5659cf1d063c92e85fa
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:07:21.857672  <8>[   11.144796] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107692_1.4.2.3.1>

    2023-04-24T18:07:21.962321  / # #

    2023-04-24T18:07:22.063046  export SHELL=3D/bin/sh

    2023-04-24T18:07:22.063286  #

    2023-04-24T18:07:22.163888  / # export SHELL=3D/bin/sh. /lava-10107692/=
environment

    2023-04-24T18:07:22.164121  =


    2023-04-24T18:07:22.264718  / # . /lava-10107692/environment/lava-10107=
692/bin/lava-test-runner /lava-10107692/1

    2023-04-24T18:07:22.265074  =


    2023-04-24T18:07:22.269192  / # /lava-10107692/bin/lava-test-runner /la=
va-10107692/1

    2023-04-24T18:07:22.275636  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c69ba94b5097322e85ee

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c69ba94b5097322e85f3
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-24T18:12:19.266304  + set<8>[   11.399502] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10107908_1.4.2.3.1>

    2023-04-24T18:12:19.266708   +x

    2023-04-24T18:12:19.374550  / # #

    2023-04-24T18:12:19.475310  export SHELL=3D/bin/sh

    2023-04-24T18:12:19.476155  #

    2023-04-24T18:12:19.577875  / # export SHELL=3D/bin/sh. /lava-10107908/=
environment

    2023-04-24T18:12:19.578413  =


    2023-04-24T18:12:19.679600  / # . /lava-10107908/environment/lava-10107=
908/bin/lava-test-runner /lava-10107908/1

    2023-04-24T18:12:19.680539  =


    2023-04-24T18:12:19.684769  / # /lava-10107908/bin/lava-test-runner /la=
va-10107908/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7dd54b5b9e9002e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c7dd54b5b9e9002e8=
60b
        failing since 76 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c77260bd4186fb2e8624

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c77260bd4186fb2e8=
625
        failing since 76 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6446d98e56ee41995f2e8684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446d98e56ee41995f2e8=
685
        failing since 76 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446f99ce1ff5164d92e863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446f99ce1ff5164d92e8=
640
        failing since 194 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c6b503b9c425392e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c6b503b9c425392e8=
5ff
        failing since 194 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446f9b07c88d0ba192e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446f9b07c88d0ba192e8=
5eb
        failing since 194 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c6c8802a970f282e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c6c8802a970f282e8=
618
        failing since 194 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446f834157f81fa7a2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446f834157f81fa7a2e8=
5f5
        failing since 194 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c69f03b9c425392e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c69f03b9c425392e8=
5e9
        failing since 194 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446f848157f81fa7a2e8614

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446f848157f81fa7a2e8=
615
        failing since 194 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c6b4b587a9e1662e863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c6b4b587a9e1662e8=
63d
        failing since 194 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c61a3abcf3919d2e861b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-m=
alta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-m=
alta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c61a3abcf3919d2e8=
61c
        new failure (last pass: v6.3-rc7-210-g884374c58391a) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c637c29d9b34702e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c637c29d9b34702e8=
60a
        failing since 10 days (last pass: v6.3-rc6-158-g254ff7648cb9, first=
 fail: v6.3-rc6-249-g122e82851461) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c9083f9722db7a2e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c9083f9722db7a2e8=
604
        failing since 130 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c77860bd4186fb2e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c77860bd4186fb2e8=
628
        failing since 130 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c757f2b3dd54832e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c757f2b3dd54832e8=
5f0
        failing since 76 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7d67546b1b65a2e8629

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c7d67546b1b65a2e8=
62a
        failing since 76 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7998b24c1483e2e8680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-225-g0=
a6daccdbdd65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c7998b24c1483e2e8=
681
        failing since 75 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =20
