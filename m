Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2725F474A
	for <lists+linux-next@lfdr.de>; Tue,  4 Oct 2022 18:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbiJDQP2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Oct 2022 12:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiJDQPS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Oct 2022 12:15:18 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EB228E35
        for <linux-next@vger.kernel.org>; Tue,  4 Oct 2022 09:15:17 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id x1so13081081plv.5
        for <linux-next@vger.kernel.org>; Tue, 04 Oct 2022 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=DAJipjyeO6eyl0SPNhUIrRtRRQN7vyyo0qQ1frmfeYc=;
        b=CDt2o7/fR7WKbJ1tsx1lwYGcy8RV9de7m1/VAL6dUrmNIQ296qNRammugzzEOYU0+N
         kc0YQEXZXNig7kDYKAvcqPGZR4Ni2LgBAHw21tBd6kI0waI1W43VwmethZD5q/ftxBWq
         ueBeFxVBTfl3j4oPdEs8HZsrl3U6hAWvoGAuaeh4dc9HuZK4pQ1C/0gFE1Eg+q/O5oIU
         0ydyZxzZ5ytREttZlHMMpFGR+u0571jyKQZrqiJ4cSprJ/Vho8N2LfGcPT3sbDra1RQB
         JGomqoGwxtSesAr4k6EpX9UnfxLw7B+uygG2neSDlR7ml6Dhrpb0MWRZkzGRJPzy1p+J
         pNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=DAJipjyeO6eyl0SPNhUIrRtRRQN7vyyo0qQ1frmfeYc=;
        b=QQNOYJUyQGIIk5TQGmbQK8KxYIRjsQatce6CzzYfBNiZLygrI6R8sTzoh4RhZvnKYJ
         /YsxH3jcEfxFhXthRZMKzo2hI28DRCETOkuA8NvKhUs4RE0GKr0TCYdowJ8iAng7jGts
         SpRUHETIEaRIGwrZUXBEIMvglUWYu7Mi6kgYjP33mtVPHr9Y5N87GN1v26QQubSoWcHl
         2fP109IogUWFQ9HqJdjM2erZIA+ajzYj3Mx/gJBUPld5Drz96dyh8exyjvar21C1ntot
         lBn2Ck6GsGQpEGyCAjbzB+8iDlqV3/bbBlND1DGVaiSpyU56RDBxqoMc9qMteociHfSE
         aMAw==
X-Gm-Message-State: ACrzQf13t6DrTLbV3ZwzE+J2kG6ote9rmhSKgAXeBk4OhcyuFg3R2w/k
        xVizbJBTmaxkLNEIgJ9i0lx/zHMo6vcB3cshh/g=
X-Google-Smtp-Source: AMsMyM5bMhjbCdUoIOdtmNgCBifiheZeDn0T5j2kO135tP8lWHyR4f//sz1WqGbTpKdZJLOXsq1WYw==
X-Received: by 2002:a17:902:d50b:b0:178:3ea4:2945 with SMTP id b11-20020a170902d50b00b001783ea42945mr27552142plg.67.1664900116427;
        Tue, 04 Oct 2022 09:15:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e80600b001783a917b9asm9145143plg.127.2022.10.04.09.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 09:15:15 -0700 (PDT)
Message-ID: <633c5c13.170a0220.d0f0e.fdae@mx.google.com>
Date:   Tue, 04 Oct 2022 09:15:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.0-854-g37b3c1c31342c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 245 runs,
 9 regressions (v6.0-854-g37b3c1c31342c)
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

next/pending-fixes baseline: 245 runs, 9 regressions (v6.0-854-g37b3c1c3134=
2c)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx6dl-udoo           | arm   | lab-broonie  | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx6q-udoo            | arm   | lab-broonie  | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx6sx-sdb            | arm   | lab-nxp      | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx7ulp-evk           | arm   | lab-nxp      | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx7ulp-evk           | arm   | lab-nxp      | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =

imx7ulp-evk           | arm   | lab-nxp      | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =

imx7ulp-evk           | arm   | lab-nxp      | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

meson-gxm-khadas-vim2 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x   | arm64 | lab-baylibre | gcc-10   | defconfig+ima    =
            | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-854-g37b3c1c31342c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-854-g37b3c1c31342c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      37b3c1c31342cdb8ee57f80a3a78cfe651a3f2ae =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx6dl-udoo           | arm   | lab-broonie  | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633c2ccbad0c29eac4cab64d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udo=
o.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udo=
o.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633c2ccbad0c29eac4cab=
64e
        failing since 26 days (last pass: v5.19-rc5-383-g73ad9bd963c1, firs=
t fail: v6.0-rc4-291-g83a56f559828) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx6q-udoo            | arm   | lab-broonie  | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633c2ccdad0c29eac4cab650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633c2ccdad0c29eac4cab=
651
        failing since 28 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx6sx-sdb            | arm   | lab-nxp      | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633c2ccf7b830ba33fcab5f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633c2ccf7b830ba33fcab=
5f8
        failing since 28 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx7ulp-evk           | arm   | lab-nxp      | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633c3e3b6bce276ffccab609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633c3e3b6bce276ffccab=
60a
        failing since 61 days (last pass: v5.19-1483-gffa33bbcf63ea, first =
fail: v5.19-3879-ge7dffa5317766) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx7ulp-evk           | arm   | lab-nxp      | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/633c39c8aafadb853ecab5fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633c39c8aafadb853ecab=
5fc
        failing since 11 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx7ulp-evk           | arm   | lab-nxp      | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/633c3fdeb0c1ab2c63cab5f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633c3fdeb0c1ab2c63cab=
5f7
        failing since 11 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx7ulp-evk           | arm   | lab-nxp      | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/633c42d7ce5c61b122cab73d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp=
/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp=
/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633c42d7ce5c61b122cab=
73e
        failing since 11 days (last pass: v6.0-rc6-280-g7faf69694280, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/633c268f511db194f9cab622

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/=
baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633c268f511db194f9cab=
623
        new failure (last pass: v6.0-rc7-272-g94a8751e2e2c7) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
r8a77950-salvator-x   | arm64 | lab-baylibre | gcc-10   | defconfig+ima    =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/633c3eb8bb5055457fcab605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-854-g3=
7b3c1c31342c/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633c3eb8bb5055457fcab=
606
        new failure (last pass: v6.0-rc7-272-g94a8751e2e2c7) =

 =20
