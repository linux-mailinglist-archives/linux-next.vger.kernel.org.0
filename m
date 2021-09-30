Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3728A41DE6A
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 18:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348098AbhI3QJ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 12:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348015AbhI3QJ5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 12:09:57 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA899C06176A
        for <linux-next@vger.kernel.org>; Thu, 30 Sep 2021 09:08:14 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 66so6342990pgc.9
        for <linux-next@vger.kernel.org>; Thu, 30 Sep 2021 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cJtZx5BBqvwPfQakrfdYck2XaPVXG6rLen++sK/3b48=;
        b=xk78cQdCaP/+xDcRO4lIXZoEocuzfLVmP8pdiVQcsbTCQLhdPUyOcmhC095CFsvafd
         NJDShc2aWzJndoIpcfRwU0Fzmtt8+VAnNRYhszw5iCPZIgHt66X61EpSxDQcSObe0lCH
         4PBkirusJ3RaK6a25hnTqHA1BKQyKWMJH5rQLSHcYYnhH1D0U0+rtuyergHddMthGqd/
         H+Xs+GFbiPBnACXuwIC6ofPtBw7HvZFEg/K9fH9zbZoj1LhVbsT86N02m0rh/vbhuRxf
         Hdirf0/b4frx6og9WU2BP90rM1lerxF0Y7ffrB9LWMzzzbU2NHGPBdcUtKRm0I7V+VdM
         u9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cJtZx5BBqvwPfQakrfdYck2XaPVXG6rLen++sK/3b48=;
        b=adNBMmVPtQaFPvV9zMVYlzfR3MLUO5j/a+FeoJFsTaLBTlkLqWQuy2/alQIJqW1qgk
         keC8ZK474DNIJRhiEd8h/3GMNuuvpZz7A3ZoYiQW7l4blljcPLtlwho+4Pt/RFnq8qk3
         wWC72XMfK+6ug7RryG8eDdeMsPnVZq4HlGj4l3zHwpG3fGHh5EQtlC/AXj1QmUkJKWSX
         RLpyayLRez1BXUtyjgAs0TSK7fHXxMTJTSKfKTGSVAgTqcAjKvianq0HX5SKZwyXalNw
         w1ccucgW7ftz8sZt7rdWLYuMM2usjr4MtQsPtdOAzcTlm2zeoQ9W4eoo88ZrhOWoOlWP
         ievg==
X-Gm-Message-State: AOAM5335zE30mbbjAmhmm3ZRzZdeuILgylSf7JTXKQ8Zml87a8BTblZT
        DvgayzmOUMCdVV4W3ckF/aBCwjMyoR4O2UW1
X-Google-Smtp-Source: ABdhPJwRpTuUHV4+bFfhGPt4Yst7kRYbyCgQ9A2shHL+0IC82Y602wivyi2bggLwlfMwO72tOK+/Sw==
X-Received: by 2002:a05:6a00:98e:b0:44b:fa98:6c93 with SMTP id u14-20020a056a00098e00b0044bfa986c93mr2980503pfg.14.1633018093050;
        Thu, 30 Sep 2021 09:08:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u6sm3376914pgr.3.2021.09.30.09.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 09:08:12 -0700 (PDT)
Message-ID: <6155e0ec.1c69fb81.17e18.9d80@mx.google.com>
Date:   Thu, 30 Sep 2021 09:08:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210930
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 642 runs, 45 regressions (next-20210930)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 642 runs, 45 regressions (next-20210930)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre  | clang-12 | multi_v7_defco=
nfig           | 1          =

beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 1          =

beagle-xm               | arm   | lab-baylibre  | gcc-8    | omap2plus_defc=
onfig          | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx7d-sdb               | arm   | lab-nxp       | clang-12 | multi_v7_defco=
nfig           | 1          =

imx7d-sdb               | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx7d-sdb               | arm   | lab-nxp       | gcc-8    | multi_v7_defco=
nfig           | 1          =

imx7d-sdb               | arm   | lab-nxp       | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre  | clang-12 | defconfig     =
               | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre  | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | clang-12 | defconfig     =
               | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig+ima =
               | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig+cryp=
to             | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+ima =
               | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =

imx8mp-evk              | arm64 | lab-nxp       | clang-12 | defconfig     =
               | 1          =

imx8mp-evk              | arm64 | lab-nxp       | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =

rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =

rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+ima =
               | 1          =

rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+cryp=
to             | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+ima =
               | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210930/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210930
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c7b4d0e56a1daee5c10d339a07579ce670ba7d4e =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a9c19911ae407599a2f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a9c19911ae407599a=
2f9
        failing since 217 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beagle-xm               | arm   | lab-baylibre  | clang-12 | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a8b9c54658b44299a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a8b9c54658b44299a=
2e8
        failing since 17 days (last pass: next-20210908, first fail: next-2=
0210913) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a6614cc803e29899a2ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a6614cc803e29899a=
2f0
        new failure (last pass: next-20210929) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a854ac4a9b689d99a30a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a854ac4a9b689d99a=
30b
        failing since 0 day (last pass: next-20210928, first fail: next-202=
10929) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a55748e6b8fd7099a324

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a55748e6b8fd7099a=
325
        failing since 314 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a9e7697c1ed5b199a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a9e7697c1ed5b199a=
2ea
        failing since 314 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155ade0abe4f3c74c99a2e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155ade0abe4f3c74c99a=
2e2
        failing since 314 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155aac72f5916177899a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155aac72f5916177899a=
2e8
        failing since 91 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155b204a747a0ed6c99a3cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155b204a747a0ed6c99a=
3d0
        failing since 91 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a83cac4a9b689d99a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a83cac4a9b689d99a=
2dc
        failing since 339 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx7d-sdb               | arm   | lab-nxp       | clang-12 | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6155abd39483f8d8c199a340

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155abd39483f8d8c199a=
341
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx7d-sdb               | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a9f4c875c81ab399a361

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a9f4c875c81ab399a=
362
        failing since 9 days (last pass: next-20210914, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx7d-sdb               | arm   | lab-nxp       | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a6c3e172bacbd499a2ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a6c3e172bacbd499a=
2ef
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx7d-sdb               | arm   | lab-nxp       | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a850b18d02f0b199a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a850b18d02f0b199a=
2dc
        new failure (last pass: next-20210915) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre  | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155ad84f84e8a858a99a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155ad84f84e8a858a99a=
2e7
        failing since 8 days (last pass: next-20210915, first fail: next-20=
210921) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre  | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155b0910cb106232f99a32a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155b0910cb106232f99a=
32b
        new failure (last pass: next-20210914) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155abe8308be1290d99a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155abe8308be1290d99a=
2e9
        failing since 8 days (last pass: next-20210915, first fail: next-20=
210921) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155ade318033e579f99a309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155ade318033e579f99a=
30a
        new failure (last pass: next-20210914) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a4d6acf6b7047899a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a4d6acf6b7047899a=
2e9
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a652839c42242999a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a652839c42242999a=
2dc
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a90fa5e628c09499a38d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a90fa5e628c09499a=
38e
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155ac08798db46ee799a2e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155ac08798db46ee799a=
2e2
        failing since 8 days (last pass: next-20210914, first fail: next-20=
210922) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre  | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/6155af1486056d79bd99a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155af1486056d79bd99a=
2e7
        failing since 9 days (last pass: next-20210914, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a54420d56476f399a33b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a54420d56476f399a=
33c
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a683839c42242999a411

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a683839c42242999a=
412
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a9ccc2021235cf99a301

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a9ccc2021235cf99a=
302
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155abad81acc31b5599a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155abad81acc31b5599a=
2ea
        failing since 8 days (last pass: next-20210914, first fail: next-20=
210922) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/6155adcbabe4f3c74c99a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155adcbabe4f3c74c99a=
2dd
        failing since 9 days (last pass: next-20210914, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155af95f2f0d9b34999a2e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155af95f2f0d9b34999a=
2e5
        new failure (last pass: next-20210922) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155b22ca747a0ed6c99a3d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155b22ca747a0ed6c99a=
3d4
        new failure (last pass: next-20210915) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a9b79911ae407599a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a9b79911ae407599a=
2e7
        new failure (last pass: next-20210923) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155adf118033e579f99a319

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155adf118033e579f99a=
31a
        failing since 7 days (last pass: next-20210922, first fail: next-20=
210923) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a1460db5e39d0999a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a1460db5e39d0999a=
2e6
        failing since 316 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a1400db5e39d0999a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a1400db5e39d0999a=
2e0
        failing since 316 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a17a932d08bac299a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a17a932d08bac299a=
2e0
        failing since 316 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6155ceb7f4764053fc99a2f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155ceb7f4764053fc99a=
2f9
        failing since 316 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a4b0836c79a98f99a31c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a4b0836c79a98f99a=
31d
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a605cce64e97d299a33d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a605cce64e97d299a=
33e
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a8d6a7fed5984999a318

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a8d6a7fed5984999a=
319
        failing since 9 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155ab7f04ad4ba6fd99a346

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155ab7f04ad4ba6fd99a=
347
        failing since 107 days (last pass: next-20210611, first fail: next-=
20210615) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/6155ad23031c86479c99a2fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155ad23031c86479c99a=
2ff
        failing since 9 days (last pass: next-20210914, first fail: next-20=
210920) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a4ca9de160792899a3a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a4ca9de160792899a=
3a2
        failing since 0 day (last pass: next-20210928, first fail: next-202=
10929) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6155a633cce64e97d299a344

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155a633cce64e97d299a=
345
        failing since 0 day (last pass: next-20210928, first fail: next-202=
10929) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6155ab0b21fd5f211499a2e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155ab0b21fd5f211499a=
2e2
        failing since 231 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/6155acebf85f030dac99a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210930/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155acebf85f030dac99a=
2e3
        new failure (last pass: next-20210929) =

 =20
