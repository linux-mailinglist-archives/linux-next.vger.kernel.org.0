Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1286EE5D4
	for <lists+linux-next@lfdr.de>; Tue, 25 Apr 2023 18:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234624AbjDYQdp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Apr 2023 12:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234377AbjDYQdo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Apr 2023 12:33:44 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0856FD314
        for <linux-next@vger.kernel.org>; Tue, 25 Apr 2023 09:33:39 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1a66911f5faso48973035ad.0
        for <linux-next@vger.kernel.org>; Tue, 25 Apr 2023 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682440418; x=1685032418;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5D218k7h8cC2hLgVC7BDWWIf7HWGMhfxqfiI0ELc8tQ=;
        b=Yiw6E2DZi5z834LlyWwB6ghTx3LiFUiAOXaYNex8ivoz6HCp6GIOqebyMzEKG8JQtQ
         fZa/UtPFyZPuxVGnlfVG9hVaWQZipUyUqJ3723G1gvgh+y25yosoJkn0fNai6Lt4Anz0
         mIRu/XA+uswSD/FCBKzVh4zSEwzhDd8Qxp9gpkAckX4J2gD6Ku5f6kKvcGwLDnL4Fc2c
         VYMYLBIa1cWLl9bJVHBAaU09y/tzDWJdSbxpfS9QwH8iYu4R7a+D5+15vZXO5Fzdrfs/
         3Fw6jnwZglXnfWHjWtSCJa524r8bYHjMS2cdvc+vBWZDn6HGWCALJzUk9Vms6VMiGHIb
         7+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682440418; x=1685032418;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5D218k7h8cC2hLgVC7BDWWIf7HWGMhfxqfiI0ELc8tQ=;
        b=fABBHR2CvO7d294r+Ku3f95wB6nkcVo30ptzc8xxUhOs6ngbQlKThOmqjfDVZTqrxT
         gHizB2hO9dfc8DUHS1NDSm9uxs58Z0Soc9pLLHmbcAKBmhF/IGWZ2N2AEZmpgjFv9Qhx
         dxMbBOvjZL3yQcoVQZpaLUP2k52J4GUB7U4aHTNkdVji1RkEXjKKf7a+OTM9QWt99u6x
         XzcZpThisoN7utB0eEsLq0/eE+19IDKxbhrwtxgjcfW1MsWFjN4rhVo/zz4ywwMjqICF
         E/RPS+NU/DgbJp6NZhnOB+YjaEICox8LnB0HfTAznd0ISTrUccce2qfsU6HE4MzJDTzW
         K1DA==
X-Gm-Message-State: AAQBX9c3odSWy7wIv9Vi4DJ3TRW6AipWhY6gmGljyItTeVD3LHfc1HJH
        kZm4n6MnvLLJS31UtitR8FRrU5WIJOe49SKtgNOG8zw3
X-Google-Smtp-Source: AKy350a0XM47VG0l3Q+uE8vtsZvY47Zpq4fMY15oqwNKUrdH9U+1xlCALSdeBTSLG1WhsVCj+w5HuQ==
X-Received: by 2002:a17:902:868b:b0:1a6:3af1:9c3a with SMTP id g11-20020a170902868b00b001a63af19c3amr17449179plo.22.1682440416475;
        Tue, 25 Apr 2023 09:33:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902708200b001a19196af48sm8498659plk.64.2023.04.25.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 09:33:35 -0700 (PDT)
Message-ID: <644800df.170a0220.d45d6.0ece@mx.google.com>
Date:   Tue, 25 Apr 2023 09:33:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-1432-g527c4dda86b8
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 365 runs,
 54 regressions (v6.3-1432-g527c4dda86b8)
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

next/pending-fixes baseline: 365 runs, 54 regressions (v6.3-1432-g527c4dda8=
6b8)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-1432-g527c4dda86b8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-1432-g527c4dda86b8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      527c4dda86b89603a482009eeec3611f0306dc6e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c9d24d6cb88a902e85ed

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c9d24d6cb88a902e85fc
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:38:18.355470  /usr/bin/tpm2_getcap

    2023-04-25T12:38:18.376281  <3>[   10.999939] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:38:19.404454  <3>[   12.027947] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:38:20.431979  <3>[   13.055957] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:38:21.460534  <3>[   14.083953] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:38:21.816184  <3>[   14.439954] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:38:22.488201  <3>[   15.111953] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:38:23.515068  <3>[   16.138951] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:38:24.543535  <3>[   17.166939] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:38:25.570997  <3>[   18.194957] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6447cbea33906bde222e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447cbea33906bde222e8=
605
        failing since 197 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c6757fd118119b2e8617

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c6757fd118119b2e861c
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:23:56.538934  + set +x

    2023-04-25T12:23:56.545098  <8>[   11.866700] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10116854_1.4.2.3.1>

    2023-04-25T12:23:56.655272  / # #

    2023-04-25T12:23:56.758037  export SHELL=3D/bin/sh

    2023-04-25T12:23:56.758918  #

    2023-04-25T12:23:56.860532  / # export SHELL=3D/bin/sh. /lava-10116854/=
environment

    2023-04-25T12:23:56.861265  =


    2023-04-25T12:23:56.962718  / # . /lava-10116854/environment/lava-10116=
854/bin/lava-test-runner /lava-10116854/1

    2023-04-25T12:23:56.964186  =


    2023-04-25T12:23:57.005839  / # /lava-10116854/bin/lava-test-runner /la=
va-10116854/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c80f6edf15ed7c2e8635

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c80f6edf15ed7c2e863a
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:30:42.912823  <8>[    7.838465] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10116954_1.4.2.3.1>

    2023-04-25T12:30:42.916356  + set +x

    2023-04-25T12:30:43.021158  / # #

    2023-04-25T12:30:43.121770  export SHELL=3D/bin/sh

    2023-04-25T12:30:43.121965  #

    2023-04-25T12:30:43.222482  / # export SHELL=3D/bin/sh. /lava-10116954/=
environment

    2023-04-25T12:30:43.222665  =


    2023-04-25T12:30:43.323142  / # . /lava-10116954/environment/lava-10116=
954/bin/lava-test-runner /lava-10116954/1

    2023-04-25T12:30:43.323437  =


    2023-04-25T12:30:43.329404  / # /lava-10116954/bin/lava-test-runner /la=
va-10116954/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c666c42ecb2e892e8628

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c666c42ecb2e892e862b
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:23:38.455975  /usr/bin/tpm2_getcap

    2023-04-25T12:23:38.661258  <3>[   12.434689] tpm tpm0: Data still avai=
lable

    2023-04-25T12:23:38.668202  <3>[   12.440724] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-25T12:23:46.325279  <6>[   20.097788] platform MX98357A:00: def=
erred probe pending

    2023-04-25T12:23:46.333739  <6>[   20.097801] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-25T12:23:48.884013  /lava-10116830/1/../bin/lava-test-case

    2023-04-25T12:23:48.895062  <8>[   22.665366] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c82eb363e4ffe72e8602

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c82eb363e4ffe72e8605
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:31:27.196079  /usr/bin/tpm2_getcap

    2023-04-25T12:31:27.227806  <3>[   12.630869] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:31:28.267693  <3>[   13.670864] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:31:29.308094  <3>[   14.710863] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:31:30.149581  <6>[   15.549486] udevd (128) used greatest=
 stack depth: 12776 bytes left

    2023-04-25T12:31:30.346975  <3>[   15.749920] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:31:31.387016  <3>[   16.789866] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:31:32.426845  <3>[   17.829869] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:31:33.466996  <3>[   18.869868] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:31:34.505983  <3>[   19.908869] tpm tpm0: Operation Timed=
 out
 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/6447c89d0ac1a783ba2e85e7

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c89d0ac1a783ba2e85ea
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:33:16.790557  /usr/bin/tpm2_getcap

    2023-04-25T12:33:16.814466  <3>[   12.778272] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:17.839325  <3>[   13.803198] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:18.862218  <3>[   14.826198] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:19.015721  <3>[   14.979558] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:19.886454  <3>[   15.850199] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:20.020267  <6>[   15.984149] udevd (135) used greatest=
 stack depth: 12656 bytes left

    2023-04-25T12:33:20.910748  <3>[   16.874570] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:21.934284  <3>[   17.898197] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:22.957998  <3>[   18.922245] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c89d0ac1a783ba2e85ec
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:33:15.327690  + set<8>[   11.290780] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10116982_1.4.2.3.1>

    2023-04-25T12:33:15.327814   +x

    2023-04-25T12:33:15.432243  / # #

    2023-04-25T12:33:15.532855  export SHELL=3D/bin/sh

    2023-04-25T12:33:15.533042  #

    2023-04-25T12:33:15.633609  / # export SHELL=3D/bin/sh. /lava-10116982/=
environment

    2023-04-25T12:33:15.633796  =


    2023-04-25T12:33:15.734361  / # . /lava-10116982/environment/lava-10116=
982/bin/lava-test-runner /lava-10116982/1

    2023-04-25T12:33:15.734648  =


    2023-04-25T12:33:15.739126  / # /lava-10116982/bin/lava-test-runner /la=
va-10116982/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6447c8bf66bac9af522e85f6

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c8bf66bac9af522e85f9
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:33:35.986565  /usr/bin/tpm2_getcap

    2023-04-25T12:33:36.007878  <3>[   13.266787] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:36.693994  <3>[   13.953191] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:37.032756  <3>[   14.291135] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:38.055920  <3>[   15.314826] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:39.079458  <3>[   16.338789] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:39.170168  <6>[   16.429133] udevd (145) used greatest=
 stack depth: 12656 bytes left

    2023-04-25T12:33:40.104136  <3>[   17.362789] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:41.128656  <3>[   18.387322] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:42.152328  <3>[   19.411217] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c8bf66bac9af522e85fb
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:33:34.523100  + set +x<8>[   11.781312] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10116836_1.4.2.3.1>

    2023-04-25T12:33:34.523194  =


    2023-04-25T12:33:34.627407  / # #

    2023-04-25T12:33:34.728157  export SHELL=3D/bin/sh

    2023-04-25T12:33:34.728389  #

    2023-04-25T12:33:34.828939  / # export SHELL=3D/bin/sh. /lava-10116836/=
environment

    2023-04-25T12:33:34.829150  =


    2023-04-25T12:33:34.929733  / # . /lava-10116836/environment/lava-10116=
836/bin/lava-test-runner /lava-10116836/1

    2023-04-25T12:33:34.930087  =


    2023-04-25T12:33:34.934203  / # /lava-10116836/bin/lava-test-runner /la=
va-10116836/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c6bcb6debac3d62e865e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c6bcb6debac3d62e8663
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:25:13.043353  <8>[   10.676387] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10116838_1.4.2.3.1>

    2023-04-25T12:25:13.046904  + set +x

    2023-04-25T12:25:13.153210  =


    2023-04-25T12:25:13.255095  / # #export SHELL=3D/bin/sh

    2023-04-25T12:25:13.255350  =


    2023-04-25T12:25:13.355884  / # export SHELL=3D/bin/sh. /lava-10116838/=
environment

    2023-04-25T12:25:13.356116  =


    2023-04-25T12:25:13.456617  / # . /lava-10116838/environment/lava-10116=
838/bin/lava-test-runner /lava-10116838/1

    2023-04-25T12:25:13.456915  =


    2023-04-25T12:25:13.461923  / # /lava-10116838/bin/lava-test-runner /la=
va-10116838/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c817d316ccb9002e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c817d316ccb9002e860b
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:30:50.365068  <8>[   13.223804] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10116994_1.4.2.3.1>

    2023-04-25T12:30:50.368647  + set +x

    2023-04-25T12:30:50.476004  / # #

    2023-04-25T12:30:50.578090  export SHELL=3D/bin/sh

    2023-04-25T12:30:50.578779  #

    2023-04-25T12:30:50.680059  / # export SHELL=3D/bin/sh. /lava-10116994/=
environment

    2023-04-25T12:30:50.680754  =


    2023-04-25T12:30:50.782100  / # . /lava-10116994/environment/lava-10116=
994/bin/lava-test-runner /lava-10116994/1

    2023-04-25T12:30:50.783187  =


    2023-04-25T12:30:50.788640  / # /lava-10116994/bin/lava-test-runner /la=
va-10116994/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c7cad2bc8a1ef92e85e9

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-=
b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-=
b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c7cad2bc8a1ef92e8617
        failing since 0 day (last pass: v6.3-rc7-226-gf05a2341f2478, first =
fail: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:29:45.619693  + set +x
    2023-04-25T12:29:45.623521  <8>[   19.050693] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 384442_1.5.2.4.1>
    2023-04-25T12:29:45.755780  / # #
    2023-04-25T12:29:45.857452  export SHELL=3D/bin/sh
    2023-04-25T12:29:45.857939  #
    2023-04-25T12:29:45.959265  / # export SHELL=3D/bin/sh. /lava-384442/en=
vironment
    2023-04-25T12:29:45.959581  =

    2023-04-25T12:29:46.060599  / # . /lava-384442/environment/lava-384442/=
bin/lava-test-runner /lava-384442/1
    2023-04-25T12:29:46.062210  =

    2023-04-25T12:29:46.067835  / # /lava-384442/bin/lava-test-runner /lava=
-384442/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c7ba18d7332fef2e860c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c7ba18d7332fef2e8611
        failing since 103 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-04-25T12:29:29.072945  / # #

    2023-04-25T12:29:29.173440  export SHELL=3D/bin/sh

    2023-04-25T12:29:29.173570  #

    2023-04-25T12:29:29.274062  / # export SHELL=3D/bin/sh. /lava-10116912/=
environment

    2023-04-25T12:29:29.274190  =


    2023-04-25T12:29:29.374691  / # . /lava-10116912/environment/lava-10116=
912/bin/lava-test-runner /lava-10116912/1

    2023-04-25T12:29:29.374879  =


    2023-04-25T12:29:29.386764  / # /lava-10116912/bin/lava-test-runner /la=
va-10116912/1

    2023-04-25T12:29:29.501697  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-25T12:29:29.501812  + cd /lava-10116912/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6447cac67b4e9c61162e8620

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447cac67b4e9c61162e8=
621
        failing since 57 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c6777fd118119b2e8628

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c6777fd118119b2e862b
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:23:59.545765  /usr/bin/tpm2_getcap

    2023-04-25T12:23:59.581611  <3>[   13.932109] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:24:00.611400  <3>[   14.962120] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:24:01.211945  <3>[   15.562103] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:24:01.641460  <3>[   15.992111] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:24:02.671571  <3>[   17.022097] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:24:03.701302  <3>[   18.052109] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:24:04.731752  <3>[   19.082103] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:24:05.779783  <3>[   20.130109] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:24:06.827616  <3>[   21.178109] tpm tpm0: Operation Timed=
 out
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c813d316ccb9002e85f0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c813d316ccb9002e85f3
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:30:40.986299  /usr/bin/tpm2_getcap

    2023-04-25T12:30:41.021302  <3>[   11.706373] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:42.048785  <3>[   12.733355] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:43.077081  <3>[   13.762361] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:44.107852  <3>[   14.792361] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:44.366503  <3>[   15.051360] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:45.132453  <3>[   15.817359] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:46.653962  <3>[   16.846361] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:47.190786  <3>[   17.875360] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:48.218937  <3>[   18.904357] tpm tpm0: Operation Timed=
 out
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ca4ff185eaeb922e8620

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ca4ff185eaeb922e8625
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:40:22.284982  /usr/bin/tpm2_getcap

    2023-04-25T12:40:22.322461  <3>[    9.743231] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:40:23.351827  <3>[   10.772180] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:40:24.380683  <3>[   11.801235] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:40:25.409819  <3>[   12.831243] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:40:26.442007  <3>[   13.863225] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:40:26.635303  <3>[   14.056231] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:40:27.065497  <6>[   14.483140] udevd (156) used greatest=
 stack depth: 13352 bytes left

    2023-04-25T12:40:27.468453  <3>[   14.889238] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:40:28.498114  <3>[   15.919231] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ca9dc55aff2bd22e8681

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ca9dc55aff2bd22e8684
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:41:36.585155  /usr/bin/tpm2_getcap

    2023-04-25T12:41:36.624894  <3>[    9.338330] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:41:37.654437  <3>[   10.367335] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:41:38.704843  <3>[   11.418331] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:41:39.733671  <3>[   12.447346] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:41:40.761645  <3>[   13.475336] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:41:41.342060  <3>[   14.055330] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:41:41.452232  <6>[   14.162763] udevd (142) used greatest=
 stack depth: 13240 bytes left

    2023-04-25T12:41:41.786144  <3>[   14.499337] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:41:42.815256  <3>[   15.528337] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c651dc16af28892e860f

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c651dc16af28892e861e
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:23:31.706676  /usr/bin/tpm2_getcap

    2023-04-25T12:23:31.729254  <3>[   11.174025] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:32.757381  <3>[   12.202021] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:33.785195  <3>[   13.230021] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:34.812081  <3>[   14.257020] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:34.994042  <3>[   14.439015] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:35.834394  <3>[   15.279024] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:36.861105  <3>[   16.306024] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:37.888083  <3>[   17.333026] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:38.914594  <3>[   18.360030] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c80a6edf15ed7c2e861e

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c80a6edf15ed7c2e862d
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:30:39.659069  <8>[   10.352276] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-25T12:30:39.662832  /usr/bin/tpm2_getcap

    2023-04-25T12:30:49.870337  /lava-10116981/1/../bin/lava-test-case

    2023-04-25T12:30:49.877286  <8>[   20.570923] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c876cf7d7e71b92e8643

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c876cf7d7e71b92e8652
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:32:33.257203  /usr/bin/tpm2_getcap

    2023-04-25T12:32:33.281087  <3>[   11.394855] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:32:34.307879  <3>[   12.421857] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:32:35.334425  <3>[   13.448852] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:32:36.362596  <3>[   14.476856] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:32:36.836949  <3>[   14.950851] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:32:37.384735  <3>[   15.498852] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:32:38.411766  <3>[   16.525855] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:32:39.438168  <3>[   17.551846] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:32:40.465767  <3>[   18.579847] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c8c754144f424b2e8641

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c8c754144f424b2e8650
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:33:52.924733  /usr/bin/tpm2_getcap

    2023-04-25T12:33:52.948662  <3>[   11.118898] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:53.975391  <3>[   12.145897] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:55.003328  <3>[   13.173900] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:56.030348  <3>[   14.200896] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:56.268117  <3>[   14.438898] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:57.052279  <3>[   15.222894] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:58.078243  <3>[   16.248900] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:33:59.106170  <3>[   17.276905] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:34:00.133130  <3>[   18.303899] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c88b2ecd9327592e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c88b2ecd9327592e85fb
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:33:01.612355  + set +x

    2023-04-25T12:33:01.618977  <8>[   10.721239] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10116865_1.4.2.3.1>

    2023-04-25T12:33:01.723120  / # #

    2023-04-25T12:33:01.823718  export SHELL=3D/bin/sh

    2023-04-25T12:33:01.823928  #

    2023-04-25T12:33:01.924445  / # export SHELL=3D/bin/sh. /lava-10116865/=
environment

    2023-04-25T12:33:01.924650  =


    2023-04-25T12:33:02.025149  / # . /lava-10116865/environment/lava-10116=
865/bin/lava-test-runner /lava-10116865/1

    2023-04-25T12:33:02.025446  =


    2023-04-25T12:33:02.030571  / # /lava-10116865/bin/lava-test-runner /la=
va-10116865/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c8ab5d256fd8382e8613

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c8ab5d256fd8382e8618
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:33:32.092161  + set +x

    2023-04-25T12:33:32.098510  <8>[   10.928881] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10116961_1.4.2.3.1>

    2023-04-25T12:33:32.202845  / # #

    2023-04-25T12:33:32.303566  export SHELL=3D/bin/sh

    2023-04-25T12:33:32.303767  #

    2023-04-25T12:33:32.404322  / # export SHELL=3D/bin/sh. /lava-10116961/=
environment

    2023-04-25T12:33:32.404621  =


    2023-04-25T12:33:32.505241  / # . /lava-10116961/environment/lava-10116=
961/bin/lava-test-runner /lava-10116961/1

    2023-04-25T12:33:32.505653  =


    2023-04-25T12:33:32.510448  / # /lava-10116961/bin/lava-test-runner /la=
va-10116961/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c7febac8c3b7472e8605

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c7febac8c3b7472e860a
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:30:34.047615  <8>[   10.566180] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10116855_1.4.2.3.1>

    2023-04-25T12:30:34.050990  + set +x

    2023-04-25T12:30:34.155494  / # #

    2023-04-25T12:30:34.256182  export SHELL=3D/bin/sh

    2023-04-25T12:30:34.256415  #

    2023-04-25T12:30:34.356964  / # export SHELL=3D/bin/sh. /lava-10116855/=
environment

    2023-04-25T12:30:34.357202  =


    2023-04-25T12:30:34.457741  / # . /lava-10116855/environment/lava-10116=
855/bin/lava-test-runner /lava-10116855/1

    2023-04-25T12:30:34.458054  =


    2023-04-25T12:30:34.462907  / # /lava-10116855/bin/lava-test-runner /la=
va-10116855/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c81fedda4fe45f2e8604

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c81fedda4fe45f2e8609
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:31:15.182934  + set +x

    2023-04-25T12:31:15.189208  <8>[    9.919484] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10116966_1.4.2.3.1>

    2023-04-25T12:31:15.293604  / # #

    2023-04-25T12:31:15.394416  export SHELL=3D/bin/sh

    2023-04-25T12:31:15.394670  #

    2023-04-25T12:31:15.495266  / # export SHELL=3D/bin/sh. /lava-10116966/=
environment

    2023-04-25T12:31:15.495483  =


    2023-04-25T12:31:15.596064  / # . /lava-10116966/environment/lava-10116=
966/bin/lava-test-runner /lava-10116966/1

    2023-04-25T12:31:15.596431  =


    2023-04-25T12:31:15.601201  / # /lava-10116966/bin/lava-test-runner /la=
va-10116966/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6447c657c42ecb2e892e85f4

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c657c42ecb2e892e85f7
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:23:35.002280  /usr/bin/tpm2_getcap

    2023-04-25T12:23:35.025784  <3>[   12.560470] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:36.049575  <3>[   13.584532] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:37.075227  <3>[   14.609836] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:37.412653  <3>[   14.947520] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:38.099227  <3>[   15.633490] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:23:38.161474  <6>[   15.696238] udevd (146) used greatest=
 stack depth: 13432 bytes left

    2023-04-25T12:23:38.168422  <6>[   15.702783] udevd (147) used greatest=
 stack depth: 13104 bytes left

    2023-04-25T12:23:38.174987  <6>[   15.709309] udevd (149) used greatest=
 stack depth: 12656 bytes left

    2023-04-25T12:23:39.122829  <3>[   16.657471] tpm tpm0: Operation Timed=
 out
 =

    ... (8 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c657c42ecb2e892e85f9
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:23:33.538901  + <8>[   11.072203] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10116824_1.4.2.3.1>

    2023-04-25T12:23:33.539013  set +x

    2023-04-25T12:23:33.643302  / # #

    2023-04-25T12:23:33.744004  export SHELL=3D/bin/sh

    2023-04-25T12:23:33.744207  #

    2023-04-25T12:23:33.844724  / # export SHELL=3D/bin/sh. /lava-10116824/=
environment

    2023-04-25T12:23:33.844913  =


    2023-04-25T12:23:33.945454  / # . /lava-10116824/environment/lava-10116=
824/bin/lava-test-runner /lava-10116824/1

    2023-04-25T12:23:33.945816  =


    2023-04-25T12:23:33.950170  / # /lava-10116824/bin/lava-test-runner /la=
va-10116824/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/6447c818d316ccb9002e8611

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c818d316ccb9002e8614
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:30:52.533890  /usr/bin/tpm2_getcap

    2023-04-25T12:30:52.555678  <3>[   12.851428] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:53.580409  <3>[   13.876452] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:53.626743  <3>[   13.922790] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:54.604315  <3>[   14.900464] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:55.629281  <3>[   15.925452] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:55.655040  <6>[   15.950942] udevd (136) used greatest=
 stack depth: 13448 bytes left

    2023-04-25T12:30:55.661520  <6>[   15.957490] udevd (151) used greatest=
 stack depth: 13144 bytes left

    2023-04-25T12:30:55.668219  <6>[   15.964016] udevd (147) used greatest=
 stack depth: 12656 bytes left

    2023-04-25T12:30:56.653801  <3>[   16.949790] tpm tpm0: Operation Timed=
 out
 =

    ... (8 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c818d316ccb9002e8616
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:30:51.070044  + set +x<8>[   11.364842] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10116984_1.4.2.3.1>

    2023-04-25T12:30:51.070155  =


    2023-04-25T12:30:51.174527  / # #

    2023-04-25T12:30:51.275219  export SHELL=3D/bin/sh

    2023-04-25T12:30:51.275418  #

    2023-04-25T12:30:51.375932  / # export SHELL=3D/bin/sh. /lava-10116984/=
environment

    2023-04-25T12:30:51.376167  =


    2023-04-25T12:30:51.476730  / # . /lava-10116984/environment/lava-10116=
984/bin/lava-test-runner /lava-10116984/1

    2023-04-25T12:30:51.477068  =


    2023-04-25T12:30:51.481854  / # /lava-10116984/bin/lava-test-runner /la=
va-10116984/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c6c1f619dd474f2e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c6c1f619dd474f2e8607
        failing since 85 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-25T12:25:13.920292  + set +x
    2023-04-25T12:25:13.920463  [   13.098376] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936873_1.5.2.3.1>
    2023-04-25T12:25:14.028708  / # #
    2023-04-25T12:25:14.130234  export SHELL=3D/bin/sh
    2023-04-25T12:25:14.130687  #
    2023-04-25T12:25:14.231902  / # export SHELL=3D/bin/sh. /lava-936873/en=
vironment
    2023-04-25T12:25:14.232373  =

    2023-04-25T12:25:14.333473  / # . /lava-936873/environment/lava-936873/=
bin/lava-test-runner /lava-936873/1
    2023-04-25T12:25:14.334045  =

    2023-04-25T12:25:14.337205  / # /lava-936873/bin/lava-test-runner /lava=
-936873/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c8dccbca8ba4272e8619

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c8dccbca8ba4272e861e
        failing since 85 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-25T12:34:12.394240  + set +x
    2023-04-25T12:34:12.394412  [   13.069349] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936881_1.5.2.3.1>
    2023-04-25T12:34:12.501968  / # #
    2023-04-25T12:34:12.603619  export SHELL=3D/bin/sh
    2023-04-25T12:34:12.604003  #
    2023-04-25T12:34:12.705283  / # export SHELL=3D/bin/sh. /lava-936881/en=
vironment
    2023-04-25T12:34:12.705721  =

    2023-04-25T12:34:12.807115  / # . /lava-936881/environment/lava-936881/=
bin/lava-test-runner /lava-936881/1
    2023-04-25T12:34:12.807719  =

    2023-04-25T12:34:12.810868  / # /lava-936881/bin/lava-test-runner /lava=
-936881/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c92b730f49b1ee2e85ef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c92b730f49b1ee2e85f4
        failing since 85 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-25T12:35:34.806343  + set +x
    2023-04-25T12:35:34.806517  [   12.840383] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936888_1.5.2.3.1>
    2023-04-25T12:35:34.914891  / # #
    2023-04-25T12:35:35.016646  export SHELL=3D/bin/sh
    2023-04-25T12:35:35.017177  #
    2023-04-25T12:35:35.118540  / # export SHELL=3D/bin/sh. /lava-936888/en=
vironment
    2023-04-25T12:35:35.119033  =

    2023-04-25T12:35:35.220333  / # . /lava-936888/environment/lava-936888/=
bin/lava-test-runner /lava-936888/1
    2023-04-25T12:35:35.221099  =

    2023-04-25T12:35:35.224329  / # /lava-936888/bin/lava-test-runner /lava=
-936888/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6447cb6ff394371eca2e8614

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447cb6ff394371eca2e8619
        failing since 85 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-25T12:45:13.042873  + set +x
    2023-04-25T12:45:13.043114  [   14.350829] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936916_1.5.2.3.1>
    2023-04-25T12:45:13.150903  / # #
    2023-04-25T12:45:13.252461  export SHELL=3D/bin/sh
    2023-04-25T12:45:13.252922  #
    2023-04-25T12:45:13.354242  / # export SHELL=3D/bin/sh. /lava-936916/en=
vironment
    2023-04-25T12:45:13.354797  =

    2023-04-25T12:45:13.456322  / # . /lava-936916/environment/lava-936916/=
bin/lava-test-runner /lava-936916/1
    2023-04-25T12:45:13.457179  =

    2023-04-25T12:45:13.460539  / # /lava-936916/bin/lava-test-runner /lava=
-936916/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6447cc37601c4624e82e8622

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447cc37601c4624e82e8627
        failing since 85 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-25T12:48:30.433721  + set +x
    2023-04-25T12:48:30.433883  [   12.147445] <LAVA_SIGNAL_ENDRUN 0_dmesg =
936920_1.5.2.3.1>
    2023-04-25T12:48:30.540376  / # #
    2023-04-25T12:48:30.642016  export SHELL=3D/bin/sh
    2023-04-25T12:48:30.642469  #
    2023-04-25T12:48:30.743689  / # export SHELL=3D/bin/sh. /lava-936920/en=
vironment
    2023-04-25T12:48:30.744154  =

    2023-04-25T12:48:30.845462  / # . /lava-936920/environment/lava-936920/=
bin/lava-test-runner /lava-936920/1
    2023-04-25T12:48:30.846437  =

    2023-04-25T12:48:30.849365  / # /lava-936920/bin/lava-test-runner /lava=
-936920/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ccb3dc9c1169252e8605

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-1=
4x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-1=
4x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ccb3dc9c1169252e8608
        failing since 110 days (last pass: v6.1-rc4-339-g185da88d03ed, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-25T12:50:37.155015  + set +x
    2023-04-25T12:50:37.156143  <8>[   49.442951] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1208035_1.5.2.4.1>
    2023-04-25T12:50:37.266387  / # #
    2023-04-25T12:50:38.426680  export SHELL=3D/bin/sh
    2023-04-25T12:50:38.432398  #
    2023-04-25T12:50:39.980046  / # export SHELL=3D/bin/sh. /lava-1208035/e=
nvironment
    2023-04-25T12:50:39.985778  =

    2023-04-25T12:50:42.807025  / # . /lava-1208035/environment/lava-120803=
5/bin/lava-test-runner /lava-1208035/1
    2023-04-25T12:50:42.812782  =

    2023-04-25T12:50:42.813172  / # /lava-1208035/bin/lava-test-runner /lav=
a-1208035/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6447cb955d740d71d02e85e9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-sd=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-sd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447cb955d740d71d02e85ec
        failing since 110 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-25T12:45:26.410279  + set<8>[   31.191342] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1208037_1.5.2.4.1>
    2023-04-25T12:45:26.410527   +x
    2023-04-25T12:45:26.516004  / # #
    2023-04-25T12:45:27.676202  export SHELL=3D/bin/sh
    2023-04-25T12:45:27.681884  #
    2023-04-25T12:45:29.229775  / # export SHELL=3D/bin/sh. /lava-1208037/e=
nvironment
    2023-04-25T12:45:29.235456  =

    2023-04-25T12:45:32.058107  / # . /lava-1208037/environment/lava-120803=
7/bin/lava-test-runner /lava-1208037/1
    2023-04-25T12:45:32.064163  =

    2023-04-25T12:45:32.069353  / # /lava-1208037/bin/lava-test-runner /lav=
a-1208037/1 =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ccefde625b5dea2e85ed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ccefde625b5dea2e85f0
        failing since 110 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-25T12:51:42.727813  + set +x
    2023-04-25T12:51:42.728822  <8>[   56.332142] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1208034_1.5.2.4.1>
    2023-04-25T12:51:42.836835  / # #
    2023-04-25T12:51:43.995333  export SHELL=3D/bin/sh
    2023-04-25T12:51:44.000736  #
    2023-04-25T12:51:44.000892  / # export SHELL=3D/bin/sh
    2023-04-25T12:51:45.546212  / # . /lava-1208034/environment
    2023-04-25T12:51:48.370971  /lava-1208034/bin/lava-test-runner /lava-12=
08034/1
    2023-04-25T12:51:48.377035  . /lava-1208034/environment
    2023-04-25T12:51:48.377325  / # /lava-1208034/bin/lava-test-runner /lav=
a-1208034/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6447cd3a310c28abbc2e85f1

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447cd3a310c28abbc2e85f4
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:52:53.271468  / # #
    2023-04-25T12:52:53.374265  export SHELL=3D/bin/sh
    2023-04-25T12:52:53.375011  #
    2023-04-25T12:52:53.476945  / # export SHELL=3D/bin/sh. /lava-326167/en=
vironment
    2023-04-25T12:52:53.477801  =

    2023-04-25T12:52:53.579752  / # . /lava-326167/environment/lava-326167/=
bin/lava-test-runner /lava-326167/1
    2023-04-25T12:52:53.581019  =

    2023-04-25T12:52:53.597907  / # /lava-326167/bin/lava-test-runner /lava=
-326167/1
    2023-04-25T12:52:53.652930  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-25T12:52:53.653450  + cd /l<8>[   15.443962] <LAVA_SIGNAL_START=
RUN 1_bootrr 326167_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/644=
7cd3a310c28abbc2e8604
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:52:56.034985  /lava-326167/1/../bin/lava-test-case
    2023-04-25T12:52:56.035453  <8>[   17.922780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-04-25T12:52:56.035793  /lava-326167/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6447c71768cb016a622e85e6

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c71768cb016a622e85e9
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:26:43.739880  /usr/bin/tpm2_getcap

    2023-04-25T12:26:43.764212  <3>[   12.893811] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:26:44.766516  <3>[   13.896858] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:26:44.787064  <3>[   13.917154] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:26:45.812115  <3>[   14.941838] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:26:46.836458  <3>[   15.965815] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:26:47.859893  <3>[   16.989845] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:26:48.884417  <3>[   18.014174] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:26:49.909253  <3>[   19.039154] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:26:50.932978  <3>[   20.062809] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c71768cb016a622e85eb
        failing since 27 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:26:42.277520  + <8>[   11.406724] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10116820_1.4.2.3.1>

    2023-04-25T12:26:42.277626  set +x

    2023-04-25T12:26:42.382037  / # #

    2023-04-25T12:26:42.482726  export SHELL=3D/bin/sh

    2023-04-25T12:26:42.482924  #

    2023-04-25T12:26:42.583473  / # export SHELL=3D/bin/sh. /lava-10116820/=
environment

    2023-04-25T12:26:42.583700  =


    2023-04-25T12:26:42.684204  / # . /lava-10116820/environment/lava-10116=
820/bin/lava-test-runner /lava-10116820/1

    2023-04-25T12:26:42.684474  =


    2023-04-25T12:26:42.689044  / # /lava-10116820/bin/lava-test-runner /la=
va-10116820/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/6447c7ff08eff70eff2e8607

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447c7ff08eff70eff2e860b
        failing since 27 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-25T12:30:24.776801  <8>[   11.693771] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10116992_1.4.2.3.1>

    2023-04-25T12:30:24.881222  / # #

    2023-04-25T12:30:24.981932  export SHELL=3D/bin/sh

    2023-04-25T12:30:24.982181  #

    2023-04-25T12:30:25.082792  / # export SHELL=3D/bin/sh. /lava-10116992/=
environment

    2023-04-25T12:30:25.083041  =


    2023-04-25T12:30:25.183621  / # . /lava-10116992/environment/lava-10116=
992/bin/lava-test-runner /lava-10116992/1

    2023-04-25T12:30:25.184026  =


    2023-04-25T12:30:25.188717  / # /lava-10116992/bin/lava-test-runner /la=
va-10116992/1

    2023-04-25T12:30:25.194883  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =


  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447c7ff08eff70eff2e860c
        new failure (last pass: v6.3-225-g0a6daccdbdd65)

    2023-04-25T12:30:26.238020  /usr/bin/tpm2_getcap

    2023-04-25T12:30:26.259732  <3>[   13.178349] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:26.977356  <3>[   13.895690] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:27.283042  <3>[   14.201349] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:28.306820  <3>[   15.225396] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:29.331506  <3>[   16.249391] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:29.454272  <6>[   16.372024] udevd (143) used greatest=
 stack depth: 13144 bytes left

    2023-04-25T12:30:30.355062  <3>[   17.273385] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:31.379018  <3>[   18.297393] tpm tpm0: Operation Timed=
 out

    2023-04-25T12:30:32.404643  <3>[   19.322726] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6447c9420adbfb8af12e8608

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/644=
7c9420adbfb8af12e8658
        failing since 60 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-04-25T12:36:09.460175  /lava-10117052/1/../bin/lava-test-case

    2023-04-25T12:36:09.466632  <8>[   23.368196] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/6447c9420adbfb8af12e86aa
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13684-gf93c476d9769)

    2023-04-25T12:36:06.574038  /lava-10117052/1/../bin/lava-test-case

    2023-04-25T12:36:06.584039  <8>[   20.483819] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/6447c9420adbfb8af12e86b1
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13684-gf93c476d9769)

    2023-04-25T12:36:05.545081  /lava-10117052/1/../bin/lava-test-case

    2023-04-25T12:36:05.555155  <8>[   19.454875] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6447c984fd88b236722e861e

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/6447c984fd88b236722e86d0
        failing since 53 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-04-25T12:36:52.182695  /lava-10117062/1/../bin/lava-test-case

    2023-04-25T12:36:52.189440  <8>[   20.906216] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/6447c984fd88b236722e86d1
        failing since 53 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-04-25T12:36:51.163800  /lava-10117062/1/../bin/lava-test-case

    2023-04-25T12:36:51.170383  <8>[   19.886939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/6447c984fd88b236722e86d2
        failing since 53 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-04-25T12:36:50.144204  /lava-10117062/1/../bin/lava-test-case

    2023-04-25T12:36:50.150615  <8>[   18.867748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6447c7f8bac8c3b7472e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447c7f8bac8c3b7472e8=
602
        failing since 11 days (last pass: v6.3-rc6-158-g254ff7648cb9, first=
 fail: v6.3-rc6-249-g122e82851461) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ce382aba1983bb2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447ce382aba1983bb2e8=
5e7
        failing since 131 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6447cd33cd602ed0742e8624

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-1432-g=
527c4dda86b8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447cd33cd602ed0742e8=
625
        failing since 131 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =20
