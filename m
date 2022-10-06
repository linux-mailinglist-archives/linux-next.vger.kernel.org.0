Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E035F5FD3
	for <lists+linux-next@lfdr.de>; Thu,  6 Oct 2022 06:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiJFEAG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Oct 2022 00:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiJFEAE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Oct 2022 00:00:04 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BCF3342A
        for <linux-next@vger.kernel.org>; Wed,  5 Oct 2022 21:00:01 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id q9so771428pgq.8
        for <linux-next@vger.kernel.org>; Wed, 05 Oct 2022 21:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=lsFzv8CdTur2kwE2+vWXQP6z0DmLOFDD/1QH7hhy/E0=;
        b=KoVTBFyqxLyN5081w17zYd0nlY99OeCy9fYTmfoXgfHGdXoDsjldXxFYVjXIKCqWPK
         YxDJJu64q+LMuWM7YtOZGDG8eNpYTDHKnS5ovTJKrJWexrTOanzzVd+alJLox0DsGFEz
         Cks8UbWy9Wf4LIuled+7Lt5s9MUcThjheph0FN/3f3Pdun4Fi6z+CdmKIQ18F2JDvE88
         vEMCYyzmKTi0Jy1OEs+sado980JbkXTAvsJEnnyiRLwW5lzRlUKYHpq600ZD1fg4XQqH
         Odd+G+FN5l1pl11FjjPSZHaSiUh8zxwo88APHYBekTbvymwBB8AAqYlpZ+rLAWbLENYz
         1nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=lsFzv8CdTur2kwE2+vWXQP6z0DmLOFDD/1QH7hhy/E0=;
        b=DHqfO+proExOUNVTpayHAl+Bb2DNKivCZ3cNpLgy2btgsrkCs+YsU7bMQui1V1v1cz
         3LDUS8vbEbrEPQmddcSo2SYBzhAhnjUM4vD9lPyyEwAxDQ4cDyaIhbLOD0BwdTj1vOQ3
         HGAX2cOPFD7csUGv3nN1qH4t/ngUUzhAzCPTi6M3DfXnUAJbeEhlN5emOiEKNtjp4waT
         Oqz1Y8RW0G+53B6vybkQyJmN/wSX/WUO3JSJb61IL+Lr+G2LAFsLc75icZs6haoTDVM/
         ko3ePZFwZSehToVdPomC5FbQwmJf9ZkMWLSkrjU/duVcBmyEe4mrig0ihlJ4QtN1L+Ip
         gqUQ==
X-Gm-Message-State: ACrzQf3L3dxHRGjJ71k+K8p7ppTj+ffdd40WZufR9AIYN+KuUcnvZQwP
        lS+y09qUg3ahEgVWQtn8eZL89C3LEETH/LA9gEw=
X-Google-Smtp-Source: AMsMyM6949V5sT9kdPpJ8C3s3Qm/bGlNHAnXWHqEf6+oOElHmpd2hzdonXXOi766mxCwDV6AkErPNw==
X-Received: by 2002:a63:4f4f:0:b0:434:b9db:b9f with SMTP id p15-20020a634f4f000000b00434b9db0b9fmr2788544pgl.438.1665028800897;
        Wed, 05 Oct 2022 21:00:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x188-20020a6263c5000000b005366696b735sm5523179pfb.77.2022.10.05.21.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 21:00:00 -0700 (PDT)
Message-ID: <633e52c0.620a0220.e562.a6d0@mx.google.com>
Date:   Wed, 05 Oct 2022 21:00:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.0-5324-g7871897dadfa9
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 517 runs,
 28 regressions (v6.0-5324-g7871897dadfa9)
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

next/pending-fixes baseline: 517 runs, 28 regressions (v6.0-5324-g7871897da=
dfa9)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

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

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-5324-g7871897dadfa9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-5324-g7871897dadfa9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7871897dadfa90816daf4963be075236587ada9d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1cd49ed6b7692ecab65f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1cd49ed6b7692ecab=
660
        new failure (last pass: v6.0-854-g37b3c1c31342c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/633e3db2ba8a949bb9cab5fe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/633e3db2ba8a949=
bb9cab606
        failing since 255 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-10-06T02:29:38.360001  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-10-06T02:29:38.360558  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-10-06T02:29:38.363166  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-10-06T02:29:38.404425  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1900be371803ebcab5ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed=
-a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed=
-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1900be371803ebcab=
5ee
        failing since 6 days (last pass: v6.0-rc7-155-g163b641d42e4, first =
fail: v6.0-rc7-220-gb1698cc5708bd) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1d35a05df6171dcab61c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-ud=
oo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-ud=
oo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1d35a05df6171dcab=
61d
        failing since 28 days (last pass: v5.19-rc5-383-g73ad9bd963c1, firs=
t fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1f8ca591bf4bc5cab65a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udo=
o.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udo=
o.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1f8ca591bf4bc5cab=
65b
        failing since 29 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1d4519ef2dae8acab5fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1d4519ef2dae8acab=
5fe
        failing since 29 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1ed27365802953cab61b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1ed27365802953cab=
61c
        failing since 63 days (last pass: v5.19-1483-gffa33bbcf63ea, first =
fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1bc75d9ec396c6cab611

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1bc75d9ec396c6cab=
612
        failing since 12 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1d6b30a46e716fcab600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nx=
p/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nx=
p/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1d6b30a46e716fcab=
601
        failing since 12 days (last pass: v6.0-rc6-280-g7faf69694280, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/633e22403a1c04a630cab5fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e22403a1c04a630cab=
5fb
        failing since 12 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/633e23a9d03411a852cab603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e23a9d03411a852cab=
604
        failing since 8 days (last pass: v6.0-rc6-280-g7faf69694280, first =
fail: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/633e2511406fefd189cab5f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline=
-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline=
-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e2511406fefd189cab=
5fa
        failing since 8 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1ba16c253d3569cab65f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-kontro=
n-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-kontro=
n-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1ba16c253d3569cab=
660
        failing since 0 day (last pass: v6.0-854-g37b3c1c31342c, first fail=
: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1eab7365802953cab5ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1eab7365802953cab=
5f0
        new failure (last pass: v6.0-854-g37b3c1c31342c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/633e262b596fe5e3a4cab5fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e262b596fe5e3a4cab=
5fc
        failing since 1 day (last pass: v6.0-854-g37b3c1c31342c, first fail=
: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/633e29245c42f517f6cab5ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-ks=
witch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-ks=
witch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e29245c42f517f6cab=
5ee
        failing since 1 day (last pass: v6.0-rc7-272-g94a8751e2e2c7, first =
fail: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/633e2a8c58f5483396cab5f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/base=
line-kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/base=
line-kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e2a8c58f5483396cab=
5f3
        failing since 1 day (last pass: v6.0-rc7-272-g94a8751e2e2c7, first =
fail: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1ac2112a968fd3cab653

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/=
baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/=
baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/633=
e1ac2112a968fd3cab666
        new failure (last pass: v6.0-1478-g66d0b903fa341)

    2022-10-06T00:00:46.029149  /lava-179974/1/../bin/lava-test-case
    2022-10-06T00:00:46.029547  <8>[   20.733839] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-10-06T00:00:46.029808  /lava-179974/1/../bin/lava-test-case
    2022-10-06T00:00:46.030036  <8>[   20.753796] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/633e43b718571d50a5cab5f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e43b718571d50a5cab=
5f1
        new failure (last pass: v6.0-854-g37b3c1c31342c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1f330724bd2f8ccab601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxm-=
khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxm-=
khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1f330724bd2f8ccab=
602
        new failure (last pass: v6.0-854-g37b3c1c31342c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1c28c8d751c51bcab5ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1c28c8d751c51bcab=
5ed
        failing since 61 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1be550b434962bcab5fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-sal=
vator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-sal=
vator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1be550b434962bcab=
5fb
        new failure (last pass: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/633e247ead23ac405dcab5f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e247ead23ac405dcab=
5f8
        new failure (last pass: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/633e1f88a591bf4bc5cab5fa

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/633e1f88a591bf4bc5cab61c
        failing since 219 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-10-06T00:21:18.032595  <8>[   37.505356] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-10-06T00:21:19.085700  /lava-7516946/1/../bin/lava-test-case
    2022-10-06T00:21:19.100495  <8>[   38.574481] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/633e1f88a591bf4bc5cab63f
        failing since 128 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-10-06T00:21:15.053216  <8>[   34.525491] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-10-06T00:21:16.110265  /lava-7516946/1/../bin/lava-test-case
    2022-10-06T00:21:16.125281  <8>[   35.598461] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/633e1f88a591bf4bc5cab640
        failing since 128 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-10-06T00:21:15.033831  /lava-7516946/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/633e1f88a591bf4bc5cab641
        failing since 128 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-10-06T00:21:12.906162  <8>[   32.377834] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-10-06T00:21:13.987071  /lava-7516946/1/../bin/lava-test-case
    2022-10-06T00:21:13.999183  <8>[   33.472870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/633e1b32a467172677cab60a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-5324-g=
7871897dadfa9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633e1b32a467172677cab=
60b
        failing since 20 days (last pass: v6.0-rc5-168-ga477b3dec64f2, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =20
