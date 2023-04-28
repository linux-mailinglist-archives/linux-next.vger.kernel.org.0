Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5446F1F68
	for <lists+linux-next@lfdr.de>; Fri, 28 Apr 2023 22:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346589AbjD1UcO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Apr 2023 16:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346578AbjD1UcO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2023 16:32:14 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A08449DA
        for <linux-next@vger.kernel.org>; Fri, 28 Apr 2023 13:31:41 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a6715ee82fso4175525ad.1
        for <linux-next@vger.kernel.org>; Fri, 28 Apr 2023 13:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682713899; x=1685305899;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QOHsFjgK3tnKqj38ZojSWkCsmnsd2lk+rbMl2sDNh0s=;
        b=di0wfrR6k9tayo/QqzSiXucrFFf/NZ3cm2Hn48O/HUup768Illzjo9aJZa2BLVSSXL
         FbiPqAoGCV9aXeC9ExLyqHHJfcwoj5RhmnKwv7Byqqj5FyzqDlE0kap8zlsrclm+tzPh
         kjqbz5GtceHPrIi3vbfbgkkDK7jzWIXSbPxkjKF0hCLq+RupIJtTKaD1SiA25f27OmSa
         l7MQNxHH9gFlByL6++EMcBP3Ei4hpy1l1Nk8RdcJ+NjU0SYtKDtgUOok0edM+bpOilH1
         I6uGXXE60jgE15+ePddEDfIy+3PEVYssqjpOseOtgpTbUTwzPZIeoqasfdynYMFL59Ey
         vMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682713899; x=1685305899;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOHsFjgK3tnKqj38ZojSWkCsmnsd2lk+rbMl2sDNh0s=;
        b=B1GbV7OyGeS+V7cbxmn4fWnQ4t8ONhVxeh7knc1Gq56Ck4w8elWcONbSl8kqk9VsRq
         hhtCkoRdC3Gj5XrQqFe5h4zhr9/cib5EiRDJtgVpwlxapPaU8A3GHdJPyL90t/BuGseZ
         PT3+hUwPB2wNuhMDQOkwDHalGDjIPoagW0gFnIA3eMv4+oDtsCD6pr9RcCzWVfEKSAGx
         PIAYzfKCqeEBc9dH17ZhI3UQHsxClrK/uo57KMwM3zXltD/UsI3KGG4flsUQUpnRl3lh
         KdoX5ZMZvC2EmCdCvJVLPo3lo3NuhBGxbCIIW3VT/Nw5bP6VhN/3rQF9ljC+e1n5QpZv
         zx+A==
X-Gm-Message-State: AC+VfDxPDP91+K6a2i4hRQ24eLw8Op+I0AefsuxgAGlbDxEiP63P5cc5
        bgbGbcdivysu6guF25cgHBaoDfRCZ6lN/fFTrTA=
X-Google-Smtp-Source: ACHHUZ5zoaxWxYQX/sUISlw4IUwLa8cS1UTNWxWbeKqYjhuqnZr4GfkNjzoACqBa0j4G9udqUR46Rg==
X-Received: by 2002:a17:902:eccc:b0:1a9:813f:7d6f with SMTP id a12-20020a170902eccc00b001a9813f7d6fmr8538484plh.42.1682713897256;
        Fri, 28 Apr 2023 13:31:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001a967558656sm9783594plq.42.2023.04.28.13.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 13:31:36 -0700 (PDT)
Message-ID: <644c2d28.170a0220.494d6.4684@mx.google.com>
Date:   Fri, 28 Apr 2023 13:31:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-10703-gb3f869e79cdf
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 390 runs,
 63 regressions (v6.3-10703-gb3f869e79cdf)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 390 runs, 63 regressions (v6.3-10703-gb3f869e7=
9cdf)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+ima       | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 2          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 2          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

imx6ul-14x14-evk             | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+ima                | 2          =

stm32mp157c-dk2              | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+ima       | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+ima                | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+ima                | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+ima                | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-10703-gb3f869e79cdf/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-10703-gb3f869e79cdf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b3f869e79cdf0e15e03b2e77ca14e825c18d933e =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf67d9a7279a0392e860b

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf67d9a7279a0392e861a
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:38:00.413057  /usr/bin/tpm2_getcap

    2023-04-28T16:38:00.439061  <3>[    8.648271] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:01.466789  <3>[    9.676269] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:02.493996  <3>[   10.703285] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:03.522800  <3>[   11.731271] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:04.550290  <3>[   12.759273] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:05.578327  <3>[   13.787276] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:06.230950  <3>[   14.439274] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:06.606464  <3>[   14.815268] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:07.635004  <3>[   15.843272] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf2ab457ee7faeb2e85f2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf2ab457ee7faeb2e85f7
        failing since 31 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:21:46.420397  + set +x

    2023-04-28T16:21:46.426887  <8>[   10.542829] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10152909_1.4.2.3.1>

    2023-04-28T16:21:46.531154  / # #

    2023-04-28T16:21:46.631696  export SHELL=3D/bin/sh

    2023-04-28T16:21:46.631860  #

    2023-04-28T16:21:46.732392  / # export SHELL=3D/bin/sh. /lava-10152909/=
environment

    2023-04-28T16:21:46.732700  =


    2023-04-28T16:21:46.833667  / # . /lava-10152909/environment/lava-10152=
909/bin/lava-test-runner /lava-10152909/1

    2023-04-28T16:21:46.834933  =


    2023-04-28T16:21:46.840887  / # /lava-10152909/bin/lava-test-runner /la=
va-10152909/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf68cd74010d4ed2e8614

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf68cd74010d4ed2e8619
        failing since 31 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:38:10.601857  <8>[   10.854046] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10153045_1.4.2.3.1>

    2023-04-28T16:38:10.604758  + set +x

    2023-04-28T16:38:10.709292  / # #

    2023-04-28T16:38:10.809973  export SHELL=3D/bin/sh

    2023-04-28T16:38:10.810148  #

    2023-04-28T16:38:10.910661  / # export SHELL=3D/bin/sh. /lava-10153045/=
environment

    2023-04-28T16:38:10.910847  =


    2023-04-28T16:38:11.011531  / # . /lava-10153045/environment/lava-10153=
045/bin/lava-test-runner /lava-10153045/1

    2023-04-28T16:38:11.011817  =


    2023-04-28T16:38:11.017550  / # /lava-10153045/bin/lava-test-runner /la=
va-10153045/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf29cff355f238c2e8614

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf29cff355f238c2e8617
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:21:19.520093  /usr/bin/tpm2_getcap

    2023-04-28T16:21:27.331426  <6>[   20.606989] platform MX98357A:00: def=
erred probe pending

    2023-04-28T16:21:27.339290  <6>[   20.606991] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-28T16:21:28.371137  <3>[   21.648688] tpm tpm0: Data still avai=
lable

    2023-04-28T16:21:28.378119  <3>[   21.654664] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-28T16:21:29.988557  /lava-10152927/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf66fb69205b70d2e860b

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf66fb69205b70d2e860e
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:37:43.162411  <8>[   12.294572] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-28T16:37:43.171794  /usr/bin/tpm2_getcap

    2023-04-28T16:37:43.296542  <3>[   12.432496] tpm tpm0: Data still avai=
lable

    2023-04-28T16:37:43.303577  <3>[   12.438775] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-28T16:37:50.961612  <6>[   20.095124] platform MX98357A:00: def=
erred probe pending

    2023-04-28T16:37:50.968865  <6>[   20.095201] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-28T16:37:53.537126  <3>[   22.672435] tpm tpm0: Data still avai=
lable

    2023-04-28T16:37:53.544370  <3>[   22.678459] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-28T16:37:53.566698  /lava-10153046/1/../bin/lava-test-case

    2023-04-28T16:37:53.577403  <8>[   22.709848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/644bf2aa457ee7faeb2e85e7

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf2aa457ee7faeb2e85ea
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:21:46.886941  /usr/bin/tpm2_getcap

    2023-04-28T16:21:46.910135  <3>[   13.319625] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:47.536576  <3>[   13.946195] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:47.934203  <3>[   14.343633] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:48.959032  <3>[   15.368645] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:49.983899  <3>[   16.392995] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:50.013732  <6>[   16.423090] udevd (136) used greatest=
 stack depth: 13256 bytes left

    2023-04-28T16:21:51.009704  <3>[   17.418987] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:52.033061  <3>[   18.442987] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:53.057718  <3>[   19.467184] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf2aa457ee7faeb2e85ec
        failing since 31 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:21:45.413209  + set<8>[   11.821642] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10152908_1.4.2.3.1>

    2023-04-28T16:21:45.413673   +x

    2023-04-28T16:21:45.521371  / # #

    2023-04-28T16:21:45.623474  export SHELL=3D/bin/sh

    2023-04-28T16:21:45.624182  #

    2023-04-28T16:21:45.725584  / # export SHELL=3D/bin/sh. /lava-10152908/=
environment

    2023-04-28T16:21:45.726278  =


    2023-04-28T16:21:45.827666  / # . /lava-10152908/environment/lava-10152=
908/bin/lava-test-runner /lava-10152908/1

    2023-04-28T16:21:45.829038  =


    2023-04-28T16:21:45.833716  / # /lava-10152908/bin/lava-test-runner /la=
va-10152908/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/644bf686aac27707192e85f5

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf686aac27707192e85f8
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:37:56.644443  /usr/bin/tpm2_getcap

    2023-04-28T16:37:56.668702  <3>[   12.834294] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:57.694039  <3>[   13.858300] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:57.783325  <3>[   13.949283] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:58.715835  <3>[   14.882277] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:59.739867  <3>[   15.906309] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:59.812220  <6>[   15.978377] udevd (137) used greatest=
 stack depth: 13256 bytes left

    2023-04-28T16:38:00.764250  <3>[   16.930628] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:01.787876  <3>[   17.954280] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:02.811892  <3>[   18.978300] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf686aac27707192e85fa
        failing since 31 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:37:55.171938  + set<8>[   11.336886] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10153074_1.4.2.3.1>

    2023-04-28T16:37:55.172371   +x

    2023-04-28T16:37:55.279325  / # #

    2023-04-28T16:37:55.381674  export SHELL=3D/bin/sh

    2023-04-28T16:37:55.382406  #

    2023-04-28T16:37:55.483949  / # export SHELL=3D/bin/sh. /lava-10153074/=
environment

    2023-04-28T16:37:55.484674  =


    2023-04-28T16:37:55.586187  / # . /lava-10153074/environment/lava-10153=
074/bin/lava-test-runner /lava-10153074/1

    2023-04-28T16:37:55.587307  =


    2023-04-28T16:37:55.592011  / # /lava-10153074/bin/lava-test-runner /la=
va-10153074/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf2a84c38de31882e8643

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf2a84c38de31882e8648
        failing since 31 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:21:44.352077  <8>[   10.339017] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10152899_1.4.2.3.1>

    2023-04-28T16:21:44.355389  + set +x

    2023-04-28T16:21:44.461597  =


    2023-04-28T16:21:44.563376  / # #export SHELL=3D/bin/sh

    2023-04-28T16:21:44.564167  =


    2023-04-28T16:21:44.665536  / # export SHELL=3D/bin/sh. /lava-10152899/=
environment

    2023-04-28T16:21:44.666280  =


    2023-04-28T16:21:44.767735  / # . /lava-10152899/environment/lava-10152=
899/bin/lava-test-runner /lava-10152899/1

    2023-04-28T16:21:44.768977  =


    2023-04-28T16:21:44.773504  / # /lava-10152899/bin/lava-test-runner /la=
va-10152899/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf672b69205b70d2e8627

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf672b69205b70d2e862c
        failing since 31 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:37:56.736450  <8>[   10.055083] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10153055_1.4.2.3.1>

    2023-04-28T16:37:56.739782  + set +x

    2023-04-28T16:37:56.845732  =


    2023-04-28T16:37:56.947748  / # #export SHELL=3D/bin/sh

    2023-04-28T16:37:56.948566  =


    2023-04-28T16:37:57.050302  / # export SHELL=3D/bin/sh. /lava-10153055/=
environment

    2023-04-28T16:37:57.051163  =


    2023-04-28T16:37:57.152909  / # . /lava-10153055/environment/lava-10153=
055/bin/lava-test-runner /lava-10153055/1

    2023-04-28T16:37:57.154245  =


    2023-04-28T16:37:57.159270  / # /lava-10153055/bin/lava-test-runner /la=
va-10153055/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf4ddcace48656c2e864d

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi=
-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi=
-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf4ddcace48656c2e8680
        failing since 3 days (last pass: v6.3-rc7-226-gf05a2341f2478, first=
 fail: v6.3-225-g0a6daccdbdd65)

    2023-04-28T16:31:00.331527  + set +x
    2023-04-28T16:31:00.336297  <8>[   17.838289] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 398808_1.5.2.4.1>
    2023-04-28T16:31:00.471062  / # #
    2023-04-28T16:31:00.574264  export SHELL=3D/bin/sh
    2023-04-28T16:31:00.574980  #
    2023-04-28T16:31:00.676961  / # export SHELL=3D/bin/sh. /lava-398808/en=
vironment
    2023-04-28T16:31:00.677688  =

    2023-04-28T16:31:00.779820  / # . /lava-398808/environment/lava-398808/=
bin/lava-test-runner /lava-398808/1
    2023-04-28T16:31:00.780884  =

    2023-04-28T16:31:00.787513  / # /lava-398808/bin/lava-test-runner /lava=
-398808/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf4d4d1a95cc7312e85ff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf4d4d1a95cc7312e8604
        failing since 107 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-04-28T16:31:00.312826  / # #

    2023-04-28T16:31:00.414950  export SHELL=3D/bin/sh

    2023-04-28T16:31:00.415659  #

    2023-04-28T16:31:00.517058  / # export SHELL=3D/bin/sh. /lava-10152977/=
environment

    2023-04-28T16:31:00.517796  =


    2023-04-28T16:31:00.619227  / # . /lava-10152977/environment/lava-10152=
977/bin/lava-test-runner /lava-10152977/1

    2023-04-28T16:31:00.620321  =


    2023-04-28T16:31:00.636935  / # /lava-10152977/bin/lava-test-runner /la=
va-10152977/1

    2023-04-28T16:31:00.746857  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-28T16:31:00.747373  + cd /lava-10152977/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf9713cb7caa0dd2e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf9713cb7caa0dd2e8=
5eb
        failing since 60 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf8e8643a2685762e8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf8e8643a2685762e8=
653
        failing since 96 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf742e7dc6d24ae2e865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-x=
m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-x=
m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf742e7dc6d24ae2e8=
65c
        new failure (last pass: v6.3-8745-gc94d3163e00b) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf58c34e178ccc32e861e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf58c34e178ccc32e8623
        failing since 101 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-28T16:33:56.251522  <8>[   16.846900] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541568_1.5.2.4.1>
    2023-04-28T16:33:56.360588  / # #
    2023-04-28T16:33:56.464123  export SHELL=3D/bin/sh
    2023-04-28T16:33:56.465100  #
    2023-04-28T16:33:56.567488  / # export SHELL=3D/bin/sh. /lava-3541568/e=
nvironment
    2023-04-28T16:33:56.568688  =

    2023-04-28T16:33:56.671479  / # . /lava-3541568/environment/lava-354156=
8/bin/lava-test-runner /lava-3541568/1
    2023-04-28T16:33:56.672928  =

    2023-04-28T16:33:56.677419  / # /lava-3541568/bin/lava-test-runner /lav=
a-3541568/1
    2023-04-28T16:33:56.757204  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf616c8b80bf1ab2e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf616c8b80bf1ab2e8607
        failing since 101 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-28T16:36:16.429962  + set +x<8>[   20.531416] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3541581_1.5.2.4.1>
    2023-04-28T16:36:16.430718  =

    2023-04-28T16:36:16.540015  / # #
    2023-04-28T16:36:16.643819  export SHELL=3D/bin/sh
    2023-04-28T16:36:16.645121  #
    2023-04-28T16:36:16.747642  / # export SHELL=3D/bin/sh. /lava-3541581/e=
nvironment
    2023-04-28T16:36:16.748887  =

    2023-04-28T16:36:16.851429  / # . /lava-3541581/environment/lava-354158=
1/bin/lava-test-runner /lava-3541581/1
    2023-04-28T16:36:16.852188  =

    2023-04-28T16:36:16.857254  / # /lava-3541581/bin/lava-test-runner /lav=
a-3541581/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf757e7dc6d24ae2e8692

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruc=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruc=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf757e7dc6d24ae2e8697
        failing since 101 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-28T16:41:34.062350  + set +x<8>[   13.828672] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3541607_1.5.2.4.1>
    2023-04-28T16:41:34.063041  =

    2023-04-28T16:41:34.172632  / # #
    2023-04-28T16:41:34.276509  export SHELL=3D/bin/sh
    2023-04-28T16:41:34.277862  #
    2023-04-28T16:41:34.380537  / # export SHELL=3D/bin/sh. /lava-3541607/e=
nvironment
    2023-04-28T16:41:34.381580  =

    2023-04-28T16:41:34.483769  / # . /lava-3541607/environment/lava-354160=
7/bin/lava-test-runner /lava-3541607/1
    2023-04-28T16:41:34.485447  =

    2023-04-28T16:41:34.485909  / # <3>[   14.206321] Bluetooth: hci0: comm=
and 0x0c03 tx timeout =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf936b69a0a655a2e85ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf936b69a0a655a2e85f1
        failing since 101 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-28T16:49:34.903909  <8>[   16.089085] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541639_1.5.2.4.1>
    2023-04-28T16:49:35.014040  / # #
    2023-04-28T16:49:35.117753  export SHELL=3D/bin/sh
    2023-04-28T16:49:35.118956  #
    2023-04-28T16:49:35.221460  / # export SHELL=3D/bin/sh. /lava-3541639/e=
nvironment
    2023-04-28T16:49:35.222777  =

    2023-04-28T16:49:35.325449  / # . /lava-3541639/environment/lava-354163=
9/bin/lava-test-runner /lava-3541639/1
    2023-04-28T16:49:35.327482  =

    2023-04-28T16:49:35.328028  / # <3>[   16.441613] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-04-28T16:49:35.332307  /lava-3541639/bin/lava-test-runner /lava-35=
41639/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/644bfada3579f3489d2e862b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubie=
truck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubie=
truck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bfada3579f3489d2e8630
        failing since 101 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-28T16:56:40.247062  <8>[   15.247242] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541644_1.5.2.4.1>
    2023-04-28T16:56:40.356593  / # #
    2023-04-28T16:56:40.459823  export SHELL=3D/bin/sh
    2023-04-28T16:56:40.460875  #
    2023-04-28T16:56:40.563312  / # export SHELL=3D/bin/sh. /lava-3541644/e=
nvironment
    2023-04-28T16:56:40.564423  =

    2023-04-28T16:56:40.666826  / # . /lava-3541644/environment/lava-354164=
4/bin/lava-test-runner /lava-3541644/1
    2023-04-28T16:56:40.668701  =

    2023-04-28T16:56:40.674111  / # /lava-3541644/bin/lava-test-runner /lav=
a-3541644/1
    2023-04-28T16:56:40.771885  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/644bf4eb5dd6bdd15f2e85e9

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644bf4eb5dd6bdd=
15f2e85f0
        failing since 56 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-04-28T16:31:15.299319  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4df3200 pointer offset 4 size 512
    2023-04-28T16:31:15.331477  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-28T16:31:15.332350  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-28T16:31:15.332934  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf21b000 allocated at load_module+0x6b0/0=
x1954
    2023-04-28T16:31:15.334883  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-28T16:31:15.438762  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-28T16:31:15.439699  kern  :emerg : Process udevd (pid: 65, stac=
k limit =3D 0x05c8bd8a)
    2023-04-28T16:31:15.440160  kern  :emerg : Stack: (0xc88fdcf8 to 0xc88f=
e000)
    2023-04-28T16:31:15.440858  kern  :emerg : dce0:                       =
                                c4df3200 c0777860
    2023-04-28T16:31:15.441245  kern  :emerg : dd00: 00000000 c03b0068 0000=
0000 c27822da 0000005d c27822da c0777860 bf21b220 =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644bf4eb5dd6bdd=
15f2e85f1
        failing since 459 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-04-28T16:31:15.250860  kern  :alert : 8<--- cut here ---
    2023-04-28T16:31:15.252309  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-04-28T16:31:15.252978  kern  :alert : [00000060] *pgd=3Dc49b7831, =
*pte=3D00000000, *ppte=3D00000000
    2023-04-28T16:31:15.253458  kern  :alert : Register r0 information: non=
-paged memory
    2023-04-28T16:31:15.253966  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88fc000 allocated at kernel_clone+0x98/0x=
3a0
    2023-04-28T16:31:15.254739  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-28T16:31:15.293735  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-28T16:31:15.294818  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4df3200 pointer offset 0 size 512
    2023-04-28T16:31:15.295270  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-28T16:31:15.295720  kern  :ale<8><LAVA_SIGNAL_TESTCASE TEST_CAS=
E_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf2ae85e6b62e482e85ed

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf2ae85e6b62e482e85f0
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:21:28.612709  /usr/bin/tpm2_getcap

    2023-04-28T16:21:28.647387  <3>[   12.433096] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:29.695232  <3>[   13.481104] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:30.743140  <3>[   14.529103] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:31.791283  <3>[   15.577103] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:32.839159  <3>[   16.625103] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:33.312293  <3>[   17.098106] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:33.864549  <3>[   17.650103] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:34.912345  <3>[   18.698104] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:35.960319  <3>[   19.746104] tpm tpm0: Operation Timed=
 out
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf6749a7279a0392e85fc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf6749a7279a0392e85ff
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:37:40.434897  + cd /opt/bootrr/libex<8>[    9.740258] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-28T16:37:40.435579  ec/bootrr

    2023-04-28T16:37:40.437743  + sh helpers/bootrr-auto

    2023-04-28T16:37:40.441869  /lava-10153082/1/../bin/lava-test-case

    2023-04-28T16:37:40.445972  /lava-10153082/1/../bin/lava-test-case

    2023-04-28T16:37:40.448335  /usr/bin/tpm2_getcap

    2023-04-28T16:37:40.473002  <3>[    9.784202] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:41.503111  <3>[   10.814202] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:42.532013  <3>[   11.843201] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:43.561961  <3>[   12.873205] tpm tpm0: Operation Timed=
 out
 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf2cb40a352ebdb2e8600

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf2cb40a352ebdb2e8603
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:22:06.510404  /usr/bin/tpm2_getcap

    2023-04-28T16:22:06.546970  <3>[    9.290868] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:22:07.594710  <3>[   10.338879] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:22:08.238806  <3>[   10.981869] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:22:08.617639  <3>[   11.361901] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:22:09.645025  <3>[   12.388905] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:22:10.673510  <3>[   13.416908] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:22:11.357644  <6>[   14.098867] udevd (138) used greatest=
 stack depth: 13240 bytes left

    2023-04-28T16:22:11.701773  <3>[   14.445869] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:22:12.733904  <3>[   15.476909] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf6b3149c0b0b982e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf6b3149c0b0b982e85e9
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:38:36.929529  <8>[    9.097714] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-28T16:38:36.935051  /usr/bin/tpm2_getcap

    2023-04-28T16:38:36.969773  <3>[    9.144547] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:38.000872  <3>[   10.175586] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:38.806674  <3>[   10.981551] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:39.024949  <3>[   11.199604] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:40.052803  <3>[   12.227601] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:41.083887  <3>[   13.258589] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:42.116743  <3>[   14.290583] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:38:43.145405  <3>[   15.319600] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf2954c38de31882e85e7

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf2954c38de31882e85f6
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:21:25.454656  <8>[   10.736988] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-28T16:21:25.458684  /usr/bin/tpm2_getcap

    2023-04-28T16:21:35.672268  /lava-10152916/1/../bin/lava-test-case

    2023-04-28T16:21:35.679527  <8>[   20.962322] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf664498bc7f9dc2e862d

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf664498bc7f9dc2e863c
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:37:40.631440  /usr/bin/tpm2_getcap

    2023-04-28T16:37:40.655943  <3>[   10.924077] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:41.684304  <3>[   11.952076] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:42.711942  <3>[   12.980077] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:43.739849  <3>[   14.008079] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:44.683219  <3>[   14.951074] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:44.767886  <3>[   15.036079] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:45.795824  <3>[   16.064073] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:46.823558  <3>[   17.092076] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:47.851858  <3>[   18.120080] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf286377bd151312e860c

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf287377bd151312e861b
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:21:11.655861  /usr/bin/tpm2_getcap

    2023-04-28T16:21:11.676264  <3>[   10.750022] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:12.703761  <3>[   11.777023] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:13.731798  <3>[   12.805023] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:14.341911  <3>[   13.415022] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:14.754327  <3>[   13.828022] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:15.782446  <3>[   14.856020] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:16.809740  <3>[   15.883026] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:17.837886  <3>[   16.911025] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:18.865763  <3>[   17.939024] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf672b7d5b1953f2e8621

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf672b7d5b1953f2e8630
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:37:38.039117  /usr/bin/tpm2_getcap

    2023-04-28T16:37:38.062327  <3>[   11.247013] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:39.088910  <3>[   12.274037] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:40.115998  <3>[   13.301033] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:41.144034  <3>[   14.329030] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:41.253047  <3>[   14.438032] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:42.166773  <3>[   15.352033] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:43.195327  <3>[   16.380029] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:44.223160  <3>[   17.408026] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:45.250967  <3>[   18.436029] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf28e5b2e19b6e32e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf28e5b2e19b6e32e85ec
        failing since 31 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:21:23.203071  + set +x

    2023-04-28T16:21:23.209389  <8>[    8.055118] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10152930_1.4.2.3.1>

    2023-04-28T16:21:23.313540  / # #

    2023-04-28T16:21:23.414214  export SHELL=3D/bin/sh

    2023-04-28T16:21:23.414421  #

    2023-04-28T16:21:23.514984  / # export SHELL=3D/bin/sh. /lava-10152930/=
environment

    2023-04-28T16:21:23.515189  =


    2023-04-28T16:21:23.615720  / # . /lava-10152930/environment/lava-10152=
930/bin/lava-test-runner /lava-10152930/1

    2023-04-28T16:21:23.616010  =


    2023-04-28T16:21:23.621051  / # /lava-10152930/bin/lava-test-runner /la=
va-10152930/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf65713df88f1d52e863c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf65713df88f1d52e8641
        failing since 31 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:37:29.930693  + set +x

    2023-04-28T16:37:29.937374  <8>[   12.439879] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10153059_1.4.2.3.1>

    2023-04-28T16:37:30.045060  / # #

    2023-04-28T16:37:30.147266  export SHELL=3D/bin/sh

    2023-04-28T16:37:30.147971  #

    2023-04-28T16:37:30.249283  / # export SHELL=3D/bin/sh. /lava-10153059/=
environment

    2023-04-28T16:37:30.249967  =


    2023-04-28T16:37:30.351319  / # . /lava-10153059/environment/lava-10153=
059/bin/lava-test-runner /lava-10153059/1

    2023-04-28T16:37:30.352519  =


    2023-04-28T16:37:30.356697  / # /lava-10153059/bin/lava-test-runner /la=
va-10153059/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf65b13df88f1d52e8647

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf65b13df88f1d52e864c
        failing since 31 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:37:35.375318  <8>[    7.919217] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10153048_1.4.2.3.1>

    2023-04-28T16:37:35.378347  + set +x

    2023-04-28T16:37:35.485116  / # #

    2023-04-28T16:37:35.587235  export SHELL=3D/bin/sh

    2023-04-28T16:37:35.588007  #

    2023-04-28T16:37:35.689620  / # export SHELL=3D/bin/sh. /lava-10153048/=
environment

    2023-04-28T16:37:35.690368  =


    2023-04-28T16:37:35.791785  / # . /lava-10153048/environment/lava-10153=
048/bin/lava-test-runner /lava-10153048/1

    2023-04-28T16:37:35.792949  =


    2023-04-28T16:37:35.798041  / # /lava-10153048/bin/lava-test-runner /la=
va-10153048/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/644bf29d4c38de31882e861c

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf29d4c38de31882e861f
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:21:34.111813  /usr/bin/tpm2_getcap

    2023-04-28T16:21:34.133695  <3>[   12.276079] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:35.159718  <3>[   13.302435] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:35.781887  <3>[   13.924456] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:36.184579  <3>[   14.327126] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:37.209887  <3>[   15.352434] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:37.234275  <6>[   15.376542] udevd (144) used greatest=
 stack depth: 13104 bytes left

    2023-04-28T16:21:38.235389  <3>[   16.377564] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:39.259752  <3>[   17.402514] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:40.284895  <3>[   18.427518] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf29d4c38de31882e8621
        failing since 31 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:21:32.637578  + set +x<8>[   10.778454] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10152935_1.4.2.3.1>

    2023-04-28T16:21:32.638158  =


    2023-04-28T16:21:32.746156  / # #

    2023-04-28T16:21:32.848687  export SHELL=3D/bin/sh

    2023-04-28T16:21:32.849513  #

    2023-04-28T16:21:32.951143  / # export SHELL=3D/bin/sh. /lava-10152935/=
environment

    2023-04-28T16:21:32.952009  =


    2023-04-28T16:21:33.053659  / # . /lava-10152935/environment/lava-10152=
935/bin/lava-test-runner /lava-10152935/1

    2023-04-28T16:21:33.054875  =


    2023-04-28T16:21:33.059743  / # /lava-10152935/bin/lava-test-runner /la=
va-10152935/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/644bf66e57cba17c3c2e860a

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf66e57cba17c3c2e860d
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:37:52.729388  /usr/bin/tpm2_getcap

    2023-04-28T16:37:52.752930  <3>[   12.241898] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:53.776749  <3>[   13.265924] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:54.430252  <3>[   13.919285] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:54.802435  <3>[   14.291923] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:55.826938  <3>[   15.315913] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:55.882322  <6>[   15.371739] udevd (142) used greatest=
 stack depth: 13144 bytes left

    2023-04-28T16:37:55.889618  <6>[   15.378317] udevd (138) used greatest=
 stack depth: 12672 bytes left

    2023-04-28T16:37:56.851156  <3>[   16.340237] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:57.875376  <3>[   17.363876] tpm tpm0: Operation Timed=
 out
 =

    ... (7 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf66e57cba17c3c2e860f
        failing since 31 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:37:51.265785  + set<8>[   10.754209] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10153023_1.4.2.3.1>

    2023-04-28T16:37:51.265869   +x

    2023-04-28T16:37:51.370189  / # #

    2023-04-28T16:37:51.470780  export SHELL=3D/bin/sh

    2023-04-28T16:37:51.470964  #

    2023-04-28T16:37:51.571555  / # export SHELL=3D/bin/sh. /lava-10153023/=
environment

    2023-04-28T16:37:51.571745  =


    2023-04-28T16:37:51.672234  / # . /lava-10153023/environment/lava-10153=
023/bin/lava-test-runner /lava-10153023/1

    2023-04-28T16:37:51.672578  =


    2023-04-28T16:37:51.677262  / # /lava-10153023/bin/lava-test-runner /la=
va-10153023/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf6d4149c0b0b982e8654

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf6d4149c0b0b982e8657
        failing since 113 days (last pass: v6.1-rc4-339-g185da88d03ed, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-28T16:38:36.996075  + set +x
    2023-04-28T16:38:36.997201  <8>[   49.308717] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1210880_1.5.2.4.1>
    2023-04-28T16:38:37.107086  =

    2023-04-28T16:38:38.267150  / # #export SHELL=3D/bin/sh
    2023-04-28T16:38:38.272842  =

    2023-04-28T16:38:39.820609  / # export SHELL=3D/bin/sh. /lava-1210880/e=
nvironment
    2023-04-28T16:38:39.826303  =

    2023-04-28T16:38:42.648828  / # . /lava-1210880/environment/lava-121088=
0/bin/lava-test-runner /lava-1210880/1
    2023-04-28T16:38:42.654859  =

    2023-04-28T16:38:42.655373  / # /lava-1210880/bin/lava-test-runner /lav=
a-1210880/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx7d-sdb                    | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf614c8b80bf1ab2e85f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf614c8b80bf1ab2e85fa
        failing since 113 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-28T16:34:37.288313  <8>[   31.498632] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1210881_1.5.2.4.1>
    2023-04-28T16:34:37.393831  / # #
    2023-04-28T16:34:38.554197  export SHELL=3D/bin/sh
    2023-04-28T16:34:38.559932  #
    2023-04-28T16:34:40.107812  / # export SHELL=3D/bin/sh. /lava-1210881/e=
nvironment
    2023-04-28T16:34:40.113511  =

    2023-04-28T16:34:42.936303  / # . /lava-1210881/environment/lava-121088=
1/bin/lava-test-runner /lava-1210881/1
    2023-04-28T16:34:42.942351  =

    2023-04-28T16:34:42.947127  / # /lava-1210881/bin/lava-test-runner /lav=
a-1210881/1
    2023-04-28T16:34:43.037220  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx7ulp-evk                  | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf6d12a1d8829742e8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf6d12a1d8829742e8633
        failing since 113 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-28T16:39:09.467815  + set +x<8>[   56.309915] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1210878_1.5.2.4.1>
    2023-04-28T16:39:09.468126  =

    2023-04-28T16:39:09.576689  / # #
    2023-04-28T16:39:10.736971  export SHELL=3D/bin/sh
    2023-04-28T16:39:10.742717  #
    2023-04-28T16:39:10.743046  / # export SHELL=3D/bin/sh
    2023-04-28T16:39:12.290831  / # . /lava-1210878/environment
    2023-04-28T16:39:15.118605  /lava-1210878/bin/lava-test-runner /lava-12=
10878/1
    2023-04-28T16:39:15.124770  . /lava-1210878/environment
    2023-04-28T16:39:15.125073  / # /lava-1210878/bin/lava-test-runner /lav=
a-1210878/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf2511394a429bb2e8625

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-sk.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-sk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf2511394a429bb2e862a
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd)

    2023-04-28T16:20:08.365874  + set +x
    2023-04-28T16:20:08.368984  <8>[    7.469725] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541456_1.5.2.4.1>
    2023-04-28T16:20:08.475375  / # #
    2023-04-28T16:20:08.577474  export SHELL=3D/bin/sh
    2023-04-28T16:20:08.577987  #
    2023-04-28T16:20:08.679302  / # export SHELL=3D/bin/sh. /lava-3541456/e=
nvironment
    2023-04-28T16:20:08.679694  =

    2023-04-28T16:20:08.780897  / # . /lava-3541456/environment/lava-354145=
6/bin/lava-test-runner /lava-3541456/1
    2023-04-28T16:20:08.781544  =

    2023-04-28T16:20:08.800913  / # /lava-3541456/bin/lava-test-runner /lav=
a-3541456/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/644bf29b5d3bd6b6672e8605

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf29b5d3bd6b6672e8608
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:21:16.017526  /usr/bin/tpm2_getcap

    2023-04-28T16:21:16.039611  <3>[   13.138944] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:17.063996  <3>[   14.163299] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:17.820012  <3>[   14.918978] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:18.087612  <3>[   15.186978] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:19.115400  <3>[   16.214289] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:20.140574  <3>[   17.239278] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:21.164372  <3>[   18.262945] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:22.188126  <3>[   19.287297] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:21:23.212633  <3>[   20.310962] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf29b5d3bd6b6672e860a
        failing since 31 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:21:14.545981  <8>[   11.644271] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10152895_1.4.2.3.1>

    2023-04-28T16:21:14.653872  / # #

    2023-04-28T16:21:14.756305  export SHELL=3D/bin/sh

    2023-04-28T16:21:14.757099  #

    2023-04-28T16:21:14.858570  / # export SHELL=3D/bin/sh. /lava-10152895/=
environment

    2023-04-28T16:21:14.859360  =


    2023-04-28T16:21:14.960923  / # . /lava-10152895/environment/lava-10152=
895/bin/lava-test-runner /lava-10152895/1

    2023-04-28T16:21:14.962221  =


    2023-04-28T16:21:14.966856  / # /lava-10152895/bin/lava-test-runner /la=
va-10152895/1

    2023-04-28T16:21:14.973762  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/644bf6719a7279a0392e85e9

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44bf6719a7279a0392e85ec
        failing since 3 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-28T16:37:40.208305  /usr/bin/tpm2_getcap

    2023-04-28T16:37:40.267222  <3>[   13.093338] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:41.254507  <3>[   14.117674] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:42.056344  <3>[   14.919358] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:42.280440  <3>[   15.143373] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:43.306765  <3>[   16.169360] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:43.381970  <6>[   16.244312] udevd (142) used greatest=
 stack depth: 13136 bytes left

    2023-04-28T16:37:44.332707  <3>[   17.195378] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:45.356785  <3>[   18.219362] tpm tpm0: Operation Timed=
 out

    2023-04-28T16:37:46.381879  <3>[   19.244362] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf6719a7279a0392e85ee
        failing since 31 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-28T16:37:38.746687  + <8>[   11.608707] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10153066_1.4.2.3.1>

    2023-04-28T16:37:38.746770  set +x

    2023-04-28T16:37:38.851252  / # #

    2023-04-28T16:37:38.952037  export SHELL=3D/bin/sh

    2023-04-28T16:37:38.952257  #

    2023-04-28T16:37:39.052805  / # export SHELL=3D/bin/sh. /lava-10153066/=
environment

    2023-04-28T16:37:39.053053  =


    2023-04-28T16:37:39.153643  / # . /lava-10153066/environment/lava-10153=
066/bin/lava-test-runner /lava-10153066/1

    2023-04-28T16:37:39.154014  =


    2023-04-28T16:37:39.158729  / # /lava-10153066/bin/lava-test-runner /la=
va-10153066/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf26c06847c51502e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u=
200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u=
200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf26c06847c51502e8=
5e7
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf574776dd0c3672e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf574776dd0c3672e8=
5f2
        new failure (last pass: v6.3-8745-gc94d3163e00b) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf921c29338304e2e862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf921c29338304e2e8=
630
        failing since 134 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf81df39df222232e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf81df39df222232e8=
605
        failing since 134 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf230303aa33b432e85e9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf230303aa33b432e85ee
        failing since 86 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.2-rc6-289-g1b7183933813)

    2023-04-28T16:19:39.454582  [   28.571475] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3541477_1.5.2.4.1>
    2023-04-28T16:19:39.559203  =

    2023-04-28T16:19:39.660891  / # #export SHELL=3D/bin/sh
    2023-04-28T16:19:39.661277  =

    2023-04-28T16:19:39.762838  / # export SHELL=3D/bin/sh. /lava-3541477/e=
nvironment
    2023-04-28T16:19:39.763244  =

    2023-04-28T16:19:39.864580  / # . /lava-3541477/environment/lava-354147=
7/bin/lava-test-runner /lava-3541477/1
    2023-04-28T16:19:39.865859  =

    2023-04-28T16:19:39.869325  / # /lava-3541477/bin/lava-test-runner /lav=
a-3541477/1
    2023-04-28T16:19:39.906008  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/644bf2166e9ec8cf7d2e8600

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644bf2166e9ec8c=
f7d2e8607
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f)
        2 lines

    2023-04-28T16:19:18.487747  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-28T16:19:18.489037  kern  :emerg : Code: 97ff3110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-28T16:19:18.503344  <8>[   21.659791] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-28T16:19:18.503727  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644bf2166e9ec8c=
f7d2e8608
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f)
        12 lines

    2023-04-28T16:19:18.460800  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-28T16:19:18.462342  kern  :alert : Mem abort info:
    2023-04-28T16:19:18.462717  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-28T16:19:18.463859  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-28T16:19:18.465382  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-28T16:19:18.465757  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-28T16:19:18.466914  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-28T16:19:18.468405  kern  :alert : Data abort info:
    2023-04-28T16:19:18.468781  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-28T16:19:18.469982  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/644bf23d303aa33b432e8610

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock=
-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock=
-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644bf23d303aa33=
b432e8617
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd)
        2 lines

    2023-04-28T16:19:49.273854  kern  :emerg : Code: 94093510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-28T16:19:49.274386  <8>[   21.322161] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-28T16:19:49.274735  + set +x

    2023-04-28T16:19:49.275060  <8>[   21.324114] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10152884_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644bf23d303aa33=
b432e8618
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd)
        12 lines

    2023-04-28T16:19:49.230243  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-28T16:19:49.230803  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-28T16:19:49.231150  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000791f5000

    2023-04-28T16:19:49.231474  kern  :alert : [0000000000000008] pgd=3D080=
00000791ff003, p4d=3D08000000791ff003, pud=3D0800000079350003, pmd=3D000000=
0000000000

    2023-04-28T16:19:49.231784  <8>[   21.300933] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-04-28T16:19:49.232087  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf5287539ba10b42e85fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf5287539ba10b42e85ff
        failing since 86 days (last pass: v6.0-11312-g1778d6da389c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-04-28T16:32:25.664647  <8>[   19.406196] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541559_1.5.2.4.1>
    2023-04-28T16:32:25.771552  / # #
    2023-04-28T16:32:25.873384  export SHELL=3D/bin/sh
    2023-04-28T16:32:25.874139  #
    2023-04-28T16:32:25.975541  / # export SHELL=3D/bin/sh. /lava-3541559/e=
nvironment
    2023-04-28T16:32:25.975926  =

    2023-04-28T16:32:26.077515  / # . /lava-3541559/environment/lava-354155=
9/bin/lava-test-runner /lava-3541559/1
    2023-04-28T16:32:26.078142  =

    2023-04-28T16:32:26.082797  / # /lava-3541559/bin/lava-test-runner /lav=
a-3541559/1
    2023-04-28T16:32:26.153791  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf6b82a1d8829742e85ed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp15=
7c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp15=
7c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf6b82a1d8829742e85f2
        failing since 86 days (last pass: v6.0-11312-g1778d6da389c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-04-28T16:39:15.340830  <8>[   15.889323] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541611_1.5.2.4.1>
    2023-04-28T16:39:15.445453  / # #
    2023-04-28T16:39:15.548196  export SHELL=3D/bin/sh
    2023-04-28T16:39:15.548968  #
    2023-04-28T16:39:15.650896  / # export SHELL=3D/bin/sh. /lava-3541611/e=
nvironment
    2023-04-28T16:39:15.651345  =

    2023-04-28T16:39:15.752833  / # . /lava-3541611/environment/lava-354161=
1/bin/lava-test-runner /lava-3541611/1
    2023-04-28T16:39:15.754258  =

    2023-04-28T16:39:15.757855  / # /lava-3541611/bin/lava-test-runner /lav=
a-3541611/1
    2023-04-28T16:39:15.832088  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf8c147895f2f712e85e8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bf8c147895f2f712e85eb
        failing since 86 days (last pass: v5.19-rc5-345-gd3298a6516a4, firs=
t fail: v6.2-rc6-289-g1b7183933813)

    2023-04-28T16:47:53.582228  <8>[   13.597083] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541638_1.5.2.4.1>
    2023-04-28T16:47:53.689370  / # #
    2023-04-28T16:47:53.791383  export SHELL=3D/bin/sh
    2023-04-28T16:47:53.791880  #
    2023-04-28T16:47:53.893346  / # export SHELL=3D/bin/sh. /lava-3541638/e=
nvironment
    2023-04-28T16:47:53.894010  =

    2023-04-28T16:47:53.995768  / # . /lava-3541638/environment/lava-354163=
8/bin/lava-test-runner /lava-3541638/1
    2023-04-28T16:47:53.996432  =

    2023-04-28T16:47:54.000295  / # /lava-3541638/bin/lava-test-runner /lav=
a-3541638/1
    2023-04-28T16:47:54.070338  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/644bfaa18e6295a4362e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-stm32=
mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-stm32=
mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644bfaa18e6295a4362e8607
        failing since 86 days (last pass: v5.19-3879-ge7dffa5317766, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-04-28T16:55:44.075588  <8>[   18.716129] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541642_1.5.2.4.1>
    2023-04-28T16:55:44.181662  / # #
    2023-04-28T16:55:44.284372  export SHELL=3D/bin/sh
    2023-04-28T16:55:44.284763  #
    2023-04-28T16:55:44.386576  / # export SHELL=3D/bin/sh. /lava-3541642/e=
nvironment
    2023-04-28T16:55:44.387068  =

    2023-04-28T16:55:44.488719  / # . /lava-3541642/environment/lava-354164=
2/bin/lava-test-runner /lava-3541642/1
    2023-04-28T16:55:44.489358  =

    2023-04-28T16:55:44.493735  / # /lava-3541642/bin/lava-test-runner /lav=
a-3541642/1
    2023-04-28T16:55:44.569845  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf3249e5c22f7432e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-lib=
retech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-lib=
retech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf3249e5c22f7432e8=
5fc
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf31a366163d6032e8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-oran=
gepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-oran=
gepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf31a366163d6032e8=
65a
        new failure (last pass: v6.2-rc5-219-g3c4f681a3d69) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf31ce3377f831d2e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-p=
ine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-p=
ine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf31ce3377f831d2e8=
5fd
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644bf4967e79dddfb12e8615

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bana=
napi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bana=
napi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644bf4967e79dddfb12e8=
616
        failing since 0 day (last pass: v6.3-5614-gbe56a31d3d65, first fail=
: v6.3-8745-gc94d3163e00b) =

 =20
