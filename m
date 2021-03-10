Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA183338BB
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 10:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhCJJ33 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 04:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhCJJ25 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Mar 2021 04:28:57 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AAEC06174A
        for <linux-next@vger.kernel.org>; Wed, 10 Mar 2021 01:28:57 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id z5so8200914plg.3
        for <linux-next@vger.kernel.org>; Wed, 10 Mar 2021 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Cis6Tt2bxSdheNvT36vBXwR9zoEk8rm7sl5APj7qkwQ=;
        b=HZUbVwm2NUv/D1QE/6hx4LHS08teooagXXivfowIiqgHW5aIjexyBh+2ZjHI5Vgoet
         dVg6WUcPOpi/vJ0XOfINgJcXVjAYLvs0OLGs7suJOBpQ948lt0zgPYMLyVTby+XBVNhA
         o4z/ud1mNWwybvV4AJRBSkY6KhS31KZRDMflz1ew3tsSVIWMh+3vmN7PMwiSMJVYKiY6
         u2fXyUAQMqbxOPJlQ3o7t71ZH9uBn54kZlJMmMVEpuZa5ScGKbBtGU5m+8t3Of85Ls2t
         KLPyLOuO5nyRv93oIWSp0MAcCDmgojLJvPcO8d4jmiJnq2+bZY94CGSxVZX51rZfyIii
         Kzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Cis6Tt2bxSdheNvT36vBXwR9zoEk8rm7sl5APj7qkwQ=;
        b=bLC/CU/TYr463qdjwd99RaSUoysvZ3LqjpSef5jX0sTUTYh2jKdxtkWNXGCVMt+oqQ
         k0ssZdEf4zaSAG/gqyhOIQUQZFPcbFzxQBGhsh69UbO4eGttMS2PW/w0W3MrwqyNo12J
         qLj3E3Y/qWJGSszrj73vUO3e/bFO5k4689yIxubUKLsf8WW+0YUpUqDbie0Hp0pyu3+w
         l4U9ex/rI4ajmkAUh5qp9ShbM82oiBTJduBZQS6NITwZHp9swf1LIIgWrwCWy/ZbmDwl
         pNiDa1aVQVZXUlFTdbapSlvpEY9/BQb3K6qttZwd1u2X6yXsLWNANG/o/oQ78HPX1KTI
         9f4A==
X-Gm-Message-State: AOAM532TUWyay4dyRuTrmDLRpfYCs2LVE4hkFnHfye2JefN3p9ujzKc3
        Jl4hHK70RBgCykW4ZrzTGONC+s2+Hu1ceypk
X-Google-Smtp-Source: ABdhPJw8Jjm8AgAe+2sN6yeVzO2RzkxeQAdA/HztRv+mqzJMMIRi/UvYdIrHAuu70FvIc7XH/0+Qcg==
X-Received: by 2002:a17:90a:bb8d:: with SMTP id v13mr2733793pjr.12.1615368536671;
        Wed, 10 Mar 2021 01:28:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p190sm15694564pga.78.2021.03.10.01.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 01:28:56 -0800 (PST)
Message-ID: <60489158.1c69fb81.20573.7615@mx.google.com>
Date:   Wed, 10 Mar 2021 01:28:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210310
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 308 runs, 5 regressions (next-20210310)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 308 runs, 5 regressions (next-20210310)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig      =
     | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210310/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210310
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b01d57bfdc41c8f635b08b8a5af8a31217d46936 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig      =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/604856bf5bc61a0b06addcb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210310/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210310/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604856bf5bc61a0b06add=
cba
        new failure (last pass: next-20210309) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60484f8e3fc811e928addcd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210310/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210310/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60484f8e3fc811e928add=
cd5
        failing since 112 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60484f7dce4b351dcfaddcc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210310/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210310/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60484f7dce4b351dcfadd=
cc1
        failing since 112 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60484f2df89d634106addcca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210310/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210310/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60484f2df89d634106add=
ccb
        failing since 112 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60484fcffe424d6ed1addcce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210310/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210310/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60484fcffe424d6ed1add=
ccf
        failing since 112 days (last pass: next-20201113, first fail: next-=
20201117) =

 =20
