Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 215F25EFFFC
	for <lists+linux-next@lfdr.de>; Fri, 30 Sep 2022 00:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiI2WTM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Sep 2022 18:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiI2WTL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2022 18:19:11 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AC6142E38
        for <linux-next@vger.kernel.org>; Thu, 29 Sep 2022 15:19:09 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id c198so2624742pfc.13
        for <linux-next@vger.kernel.org>; Thu, 29 Sep 2022 15:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=+2Y5adOgBDYvJw5hoCdF71xjBPc1g/kSTLi+7wXnIug=;
        b=gYwntOkkT5NJpOamJ7vf75kTP2w1Zg+Ze3B1Os0956p2f0Q9e0AKrHKKoSbY4Ypazh
         mKZLYJRTI9pdPzJeCLJ2uPWog/lFw1lTIgvEST4bBvHT9pLkZENZPtXAtZ3zBrfb0q1g
         DsoIG1pgnCSVMbfWdCRTuYZaXNGt0+nqP0Dpexg9IQvso8Gac8mnLBCktVOW066wqz8o
         +mhAgHhKHbPEGqy8cZpJw3s4FDqU3eNPaGOmOskEc2N/rA1I1XBVNMKo1m9b3X3ePfdL
         MSmtjOpjPMU1RRJRojB+XuZwT3bpcVZJqCi/54mrwokJM+fupdhSmp5zLlhdbs8yJRs3
         GWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=+2Y5adOgBDYvJw5hoCdF71xjBPc1g/kSTLi+7wXnIug=;
        b=BGR+UeV+zBYj9XqomZhf8qXJ70jEv29oCWonlgX8gd53yltuTcfuxuxI4OtXU7NWU9
         Q0i8YlbDhBqQDI9qYSENdivtyfvV1g6dn29kLezlzTUzjLPCvXo6/CSHs168WiEUztQh
         Bk2ys1uiG01E03qee4mkS4lKPw69vHfFniWTIE6RNkaGxt8+kUOHV8tYPXJU8U71m2Ns
         HwlPlkKlogbBLBwtzAwvDIYIe1deHsGWly5WvRm47KXEOGcvIMYhzZ/KjomhG9gbqSSe
         jFDI4AQ3lk0GhMb9fWoU689j6mdcgEL4h1lIDFm+KoAURITT02AXFvWe9fDRPPIRaSJO
         oHwQ==
X-Gm-Message-State: ACrzQf0XqCGAWEaqWj61GHoy8O7eMaqYiEh9LLmmpBIijuB/LHdqG5Ou
        SNM9VzLzRtgRQYxYold+0+F4p4ToG8Ccb3tBb8E=
X-Google-Smtp-Source: AMsMyM7qybhWuQ8aTdLsN68BGqgQ8XE8IQL4eXPiQFSDk9FlXDQaOXvwkyJ9yZtK0nY1jBrUwWuicA==
X-Received: by 2002:a05:6a00:1a8d:b0:541:15a0:2cf7 with SMTP id e13-20020a056a001a8d00b0054115a02cf7mr5497279pfv.70.1664489948848;
        Thu, 29 Sep 2022 15:19:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i16-20020aa796f0000000b0053ab9c18d3csm198331pfq.14.2022.09.29.15.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 15:19:08 -0700 (PDT)
Message-ID: <633619dc.a70a0220.c82df.089b@mx.google.com>
Date:   Thu, 29 Sep 2022 15:19:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc7-220-gb1698cc5708bd
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 509 runs,
 17 regressions (v6.0-rc7-220-gb1698cc5708bd)
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

next/pending-fixes baseline: 509 runs, 17 regressions (v6.0-rc7-220-gb1698c=
c5708bd)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-rc7-220-gb1698cc5708bd/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-rc7-220-gb1698cc5708bd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b1698cc5708bd27dd4c3b2891dbab83016dd7a96 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e37562f5d8677cec4ee2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6335e37562f5d86=
77cec4ee6
        failing since 248 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-09-29T18:26:40.603174  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-09-29T18:26:40.721128  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-09-29T18:26:40.721389  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-09-29T18:26:40.724291  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-09-29T18:26:40.768810  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e0c090b4e2583fec4eb4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleas=
hed-a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleas=
hed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e0c090b4e2583fec4=
eb5
        new failure (last pass: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e2aadd750646bbec4eb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e2aadd750646bbec4=
eb9
        failing since 22 days (last pass: v5.19-rc5-383-g73ad9bd963c1, firs=
t fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e1ceda8cedea01ec4ea9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e1ceda8cedea01ec4=
eaa
        failing since 23 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e170e74834de10ec4eb4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e170e74834de10ec4=
eb5
        failing since 23 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e18261c8de17b0ec4eb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e18261c8de17b0ec4=
eb8
        failing since 22 days (last pass: v6.0-rc3-304-gd62f6b276548, first=
 fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e2d934f1017da2ec4eae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e2d934f1017da2ec4=
eaf
        failing since 56 days (last pass: v5.19-1483-gffa33bbcf63ea, first =
fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e49001c337dcddec4efd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e49001c337dcddec4=
efe
        failing since 6 days (last pass: v6.0-rc6-280-g7faf69694280, first =
fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e634dcbed1a8c2ec4eb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e634dcbed1a8c2ec4=
eb3
        failing since 6 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6335ec2f9db887e46bec4ebf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335ec2f9db887e46bec4=
ec0
        new failure (last pass: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e3a74ca4963365ec4ed1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e3a74ca4963365ec4=
ed2
        failing since 55 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e251a0b6b5f699ec4ea6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mi=
ps-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mi=
ps-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e251a0b6b5f699ec4=
ea7
        new failure (last pass: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/6335e30d508e92a444ec4ef7

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/6335e30d508e92a444ec4f20
        failing since 121 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-09-29T18:24:58.990418  <8>[   33.160433] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-09-29T18:25:00.011353  /lava-7451995/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/6335e30d508e92a444ec4f21
        failing since 121 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-09-29T18:24:58.979445  /lava-7451995/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/6335e30d508e92a444ec4f22
        failing since 121 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-09-29T18:24:56.925869  <8>[   31.095767] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-09-29T18:24:57.451991  <4>[   31.621411] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-09-29T18:24:57.954296  /lava-7451995/1/../bin/lava-test-case
    2022-09-29T18:24:57.965576  <8>[   32.136421] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6335e30d508e92a444ec4f55
        failing since 213 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-09-29T18:25:02.183484  /lava-7451995/1/../bin/lava-test-case
    2022-09-29T18:25:02.192792  <8>[   36.364574] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6335e530b02935aea3ec4eaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc7-22=
0-gb1698cc5708bd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335e530b02935aea3ec4=
eab
        failing since 14 days (last pass: v6.0-rc5-168-ga477b3dec64f2, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =20
