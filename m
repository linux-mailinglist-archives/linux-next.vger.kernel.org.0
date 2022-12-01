Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24A4663F51A
	for <lists+linux-next@lfdr.de>; Thu,  1 Dec 2022 17:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbiLAQTT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Dec 2022 11:19:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbiLAQTS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2022 11:19:18 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051B6165A3
        for <linux-next@vger.kernel.org>; Thu,  1 Dec 2022 08:19:17 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id q1so2061788pgl.11
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2022 08:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PBS7OYkZ2IObHmBuZGdj246ktShGfboWi0yNRczh49g=;
        b=8BJGPB6GfIA2H1Y8YU72bSOm068b21pEie8GlPMqkkBMhdpf4JJteu/UTPDc6ZHLxj
         r/xaXaWO5rNV/CppYYRPDqLa9ctPBPGESL/B8Y/JDpkT0JJEjiwQ/K/8I6HmLDTslpbW
         /mQP5YT+V3yC9autGe2tW0//akNcWga1H9I7e7MQPBkALVgjKj4R+I7OkuaLuM2IVdRL
         TNoebv8fcxkl8uU8mU9vRLsVRq5YKDs1yZW3UoNBjsb9BFZ9U9Gkp4sNEXc/6I5nLhyN
         eIPDvIN2AiuD1MIHpuOEc5OmN69fcppX552kz1/Fk8USRglq8GP8HzPxIjmXoIHc/G9W
         NZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBS7OYkZ2IObHmBuZGdj246ktShGfboWi0yNRczh49g=;
        b=D6vi1nRM6Pz8B4/dt95XxsR75IyYTTJx4V+bFyUTE6gvs0gXmZre/Z12Aig05gU++B
         HYI5sg+r8v7f8vYe0atTlJJ1DYi6LeKk66mRCgUG4YTVrkQqWs3xv9cK2RptKg4WEDOF
         1Tf8nQePSMTiXWWYBWTR7L51HhshfGn0pdxFAHBduQSx+qierwy1uarE996yz19Y2YYT
         0nxQAuk+/xt9HVMFTqqCrBRP70LrhGO43BBNb3Y9x5pggofj3Gt2n0CMdTj+a/D2aoty
         D+wkBQpgtCefv0jHPienU+M38Pqm2Bm9F349WWymMPzVDwAOndrLw733j3CW49rv8auB
         cVxw==
X-Gm-Message-State: ANoB5pnOvN58oig5A5puwDR1Vm/47DNn/70n08PpuRVr5ZwHGfUoyZBi
        NkvpRkjReizYZXvm9bsIBSgBrNsUa/GBs+n9qKY=
X-Google-Smtp-Source: AA0mqf6DlX3be//KH8+PsELhUC2J8g8sMKh8B6Yy5bM8dHRDdQGzQWR1qZw5CBt1Wf79IofgOb2VNA==
X-Received: by 2002:a65:5781:0:b0:470:1b:f65c with SMTP id b1-20020a655781000000b00470001bf65cmr51802843pgr.199.1669911556098;
        Thu, 01 Dec 2022 08:19:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mm8-20020a17090b358800b00200461cfa99sm5101924pjb.11.2022.12.01.08.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:19:15 -0800 (PST)
Message-ID: <6388d403.170a0220.7df91.a421@mx.google.com>
Date:   Thu, 01 Dec 2022 08:19:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221201
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/master baseline: 376 runs, 6 regressions (next-20221201)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 376 runs, 6 regressions (next-20221201)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
221201/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20221201
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2934ceb4e967b9233d0f97732e47175574a11406 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63889ace4820de18b02abd00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63889ace4820de18b02ab=
d01
        failing since 75 days (last pass: next-20220915, first fail: next-2=
0220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6388a428a7ad8c39902abd02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0-++20221110071954+dd9f7=
963e434-1~exp1~20221110072047.450)
  Plain log:   https://storage.kernelci.org//next/master/next-20221201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6388a428a7ad8c39902ab=
d03
        failing since 30 days (last pass: next-20221028, first fail: next-2=
0221101) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6388980d9c7f7635d02abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221201/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221201/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6388980d9c7f7635d02ab=
cfb
        failing since 100 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6388a04a1b5cff59912abd7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221201/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221201/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6388a04a1b5cff59912ab=
d7f
        failing since 1 day (last pass: next-20221128, first fail: next-202=
21129) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6388b42b3f236dc7542abd05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6388b42b3f236dc7542ab=
d06
        failing since 9 days (last pass: next-20221121, first fail: next-20=
221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6388a1cd85b6c6f33d2abd53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0-++20221110071954+dd9f7=
963e434-1~exp1~20221110072047.450)
  Plain log:   https://storage.kernelci.org//next/master/next-20221201/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221201/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6388a1cd85b6c6f33d2ab=
d54
        new failure (last pass: next-20221130) =

 =20
