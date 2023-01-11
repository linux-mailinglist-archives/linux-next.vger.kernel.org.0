Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8486654C0
	for <lists+linux-next@lfdr.de>; Wed, 11 Jan 2023 07:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235635AbjAKGlp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Jan 2023 01:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbjAKGle (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Jan 2023 01:41:34 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78A46571
        for <linux-next@vger.kernel.org>; Tue, 10 Jan 2023 22:41:32 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id g23so198257plq.12
        for <linux-next@vger.kernel.org>; Tue, 10 Jan 2023 22:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mmhrnsov2R4nldct54dn6MtHT1+DcYDYfyzuFqeUnkM=;
        b=xoRo2uxtj4TYjpbsl5GaqIOEYgcfGPnorI7D6s7XRFwt0kH5SITahvJ/bx9Vrc5N1V
         RPXQziJZhXuumF7prfI8Ava8spotev2IeBXPPFUpH2EivuAAV7AI3owfkrA9V6E9itzv
         x3PmGf4k5+hL0YlCawjwXEbokmC88IQ056AeLNoaEVe+dfe82J2Xws5i3sUgbAZXTOEC
         PLnCKQ+z/wEsZeETCuxF2bLyZohJK84M7B/bFvoWmtw3+DbbnQcJc9g1uQP7IB4PiuJZ
         XioZztiJmpcElzsDWw3h8HxZ8p8gAHGzsuz1bx/DtkP3dCemLWgc92jOXT2x0U5rpxC5
         2uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mmhrnsov2R4nldct54dn6MtHT1+DcYDYfyzuFqeUnkM=;
        b=3yUSqZ117dXopMouCLtyFoD27qTxazJB4QIzw+ZV/yu3KdcVumVyBU0h5BLmjqgTA4
         V84jdmna4RD/MsuWZZo7CkWN+bHN5aerIvDFFmuLPt1XWyZ69bHWdru+UW/zDAlOg8Q2
         fUOwF1BcPrXYE8tUaSmb6s7LyN/BP7JlQf84pX8ye3g9bzGckD7yjjA7ND97plzmdUDl
         wJWN0nqI5Pfj+6rz4087HVgPaFcCgNgpeiw06FKoxwWR6nbgXYxNr0uEroakxbxvTkWI
         VJ2PmHZZ6g2YP41KqeKlex8OXI36ZzjwzmuZtAXT18Y55UzbMeo3A6Gk9elO63NbMPI9
         wlFg==
X-Gm-Message-State: AFqh2kpCF9ymbCnz5727ySJLq3nIiywjb/VjCoTPXTSuMJFBIHFv4gkt
        eZQGj2JhyH3c8rNp19tzhaJdwgaF5URWkayImAg8vA==
X-Google-Smtp-Source: AMrXdXvAjmEu8DDUh2Tyxqf+OIFdyC/JvRzvK58q0iVtWN/EmwBojUPpXN2/gPAnLQ5+WOoWLve1RA==
X-Received: by 2002:a17:902:e5c3:b0:194:4986:a3db with SMTP id u3-20020a170902e5c300b001944986a3dbmr2500462plf.36.1673419291626;
        Tue, 10 Jan 2023 22:41:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c11-20020a170903234b00b0019277df45a6sm9334771plh.53.2023.01.10.22.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:41:31 -0800 (PST)
Message-ID: <63be5a1b.170a0220.188cb.f63e@mx.google.com>
Date:   Tue, 10 Jan 2023 22:41:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc3-296-g79fa898551af
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 284 runs,
 18 regressions (v6.2-rc3-296-g79fa898551af)
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

next/pending-fixes baseline: 284 runs, 18 regressions (v6.2-rc3-296-g79fa89=
8551af)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc3-296-g79fa898551af/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc3-296-g79fa898551af
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      79fa898551af3fa16837f16294fdc8724b405762 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63be20c22b04776e781d39ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be20c22b04776e781d3=
9f0
        failing since 125 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63be2224f2142fe8e71d39d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be2224f2142fe8e71d3=
9d9
        failing since 127 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63be223125f14b21041d3a1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be223125f14b21041d3=
a1e
        failing since 127 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63be25a2627885b8c91d39ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63be25a2627885b8c91d39ed
        failing since 6 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T02:56:44.363025  / # #
    2023-01-11T02:56:45.523411  export SHELL=3D/bin/sh
    2023-01-11T02:56:45.529107  #
    2023-01-11T02:56:47.076844  / # export SHELL=3D/bin/sh. /lava-1135337/e=
nvironment
    2023-01-11T02:56:47.082525  =

    2023-01-11T02:56:47.082821  / # . /lava-1135337/environment
    2023-01-11T02:56:49.903467  / # /lava-1135337/bin/lava-test-runner /lav=
a-1135337/1
    2023-01-11T02:56:49.909336  /lava-1135337/bin/<4>[   32.598013] pwm-bac=
klight backlight-display: supply power not found, using dummy regulator
    2023-01-11T02:56:49.909600  l<4>[   32.617701] etnaviv-gpu 1800000.gpu:=
 deferred probe timeout, ignoring dependency
    2023-01-11T02:56:49.909822  <4>[   32.625465] etnaviv-gpu: probe of 180=
0000.gpu failed with error -110 =

    ... (32 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63be24f0e2bec44b9d1d39c2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63be24f0e2bec44b9d1d39c5
        failing since 6 days (last pass: v6.1-rc6-391-gf445421fe4c7, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T02:54:18.527664  + set<8>[   18.187910] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1135335_1.5.2.4.1>
    2023-01-11T02:54:18.527925   +x
    2023-01-11T02:54:18.633297  / # #
    2023-01-11T02:54:19.793399  export SHELL=3D/bin/sh
    2023-01-11T02:54:19.799110  #
    2023-01-11T02:54:21.346915  / # export SHELL=3D/bin/sh. /lava-1135335/e=
nvironment
    2023-01-11T02:54:21.352648  =

    2023-01-11T02:54:24.174664  / # . /lava-1135335/environment/lava-113533=
5/bin/lava-test-runner /lava-1135335/1
    2023-01-11T02:54:24.180681  =

    2023-01-11T02:54:24.180795  / # /lava-1135335/bin/lava-<4>[   22.326139=
] pwm-backlight backlight: supply power not found, using dummy regulator =

    ... (35 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63be21c79662f6345a1d3aac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be21c79662f6345a1d3=
aad
        failing since 160 days (last pass: v5.19-1483-gffa33bbcf63ea, first=
 fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63be25a761edd0753b1d3a68

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63be25a761edd0753b1d3a6b
        failing since 6 days (last pass: v6.1-rc6-391-gf445421fe4c7, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T02:57:10.386504  + set +x
    2023-01-11T02:57:10.387618  <8>[   33.628165] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1135338_1.5.2.4.1>
    2023-01-11T02:57:10.496563  / # #
    2023-01-11T02:57:11.656741  export SHELL=3D/bin/sh
    2023-01-11T02:57:11.662435  #
    2023-01-11T02:57:11.662731  / # export SHELL=3D/bin/sh
    2023-01-11T02:57:13.210392  / # . /lava-1135338/environment
    2023-01-11T02:57:16.038416  /lava-1135338/bin/lava-test-runner /lava-11=
35338/1
    2023-01-11T02:57:16.044461  . /lava-1135338/environment
    2023-01-11T02:57:16.044738  / # /lava-1135338/bin/lava-test-runner /lav=
a-1135338/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63be253cba314a21bb1d39e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be253cba314a21bb1d3=
9e9
        new failure (last pass: v6.2-rc3-243-g3145d9dfed32) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63be2282ce655a52021d3a06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be2282ce655a52021d3=
a07
        failing since 28 days (last pass: v6.1-2435-g5c02e5d167d0, first fa=
il: v6.1-6378-g44d433ee7540) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63be23e3e03edfbc191d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be23e3e03edfbc191d3=
9cc
        failing since 0 day (last pass: v6.2-rc2-415-g7dcb1029a6d41, first =
fail: v6.2-rc3-243-g3145d9dfed32) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63be241db120c50e341d39d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be241db120c50e341d3=
9d7
        new failure (last pass: v6.2-rc3-217-gcf5f49e41cd4e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63be240af866b7ea001d3a09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be240af866b7ea001d3=
a0a
        failing since 0 day (last pass: v6.2-rc2-415-g7dcb1029a6d41, first =
fail: v6.2-rc3-243-g3145d9dfed32) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63be26c7b192984cbf1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63be26c7b192984cbf1d3=
9c3
        new failure (last pass: v6.2-rc3-217-gcf5f49e41cd4e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63be1f137ddaf175ae1d39e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63be1f137ddaf175ae1d39ea
        failing since 6 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T02:29:18.598750  [   19.173686] <LAVA_SIGNAL_ENDRUN 0_dmesg =
377234_1.5.2.4.1>
    2023-01-11T02:29:18.599152  [   19.182312] usbcore: registered new inte=
rface driver uas
    2023-01-11T02:29:18.707104  / # #
    2023-01-11T02:29:18.810100  export SHELL=3D/bin/sh
    2023-01-11T02:29:18.810765  #
    2023-01-11T02:29:18.912404  / # export SHELL=3D/bin/sh. /lava-377234/en=
vironment
    2023-01-11T02:29:18.913153  =

    2023-01-11T02:29:19.014828  / # . /lava-377234/environment/lava-377234/=
bin/lava-test-runner /lava-377234/1
    2023-01-11T02:29:19.015975  =

    2023-01-11T02:29:19.028487  / # /lava-377234/bin/lava-test-runner /lava=
-377234/1 =

    ... (24 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63be2284241ecb5fb31d3a0b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63be2284241ecb5fb31d3a0e
        failing since 6 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T02:44:11.239022  [   18.199306] <LAVA_SIGNAL_ENDRUN 0_dmesg =
377248_1.5.2.4.1>
    2023-01-11T02:44:11.345717  / # #
    2023-01-11T02:44:11.448013  export SHELL=3D/bin/sh
    2023-01-11T02:44:11.448609  [   18.267140] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-11T02:44:11.449008  [   18.275761] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-11T02:44:11.449340  #[   18.288320] usbcore: registered new int=
erface driver uas
    2023-01-11T02:44:11.449631  =

    2023-01-11T02:44:11.551152  / # export SHELL=3D/bin/sh. /lava-377248/en=
vironment
    2023-01-11T02:44:11.551721  =

    2023-01-11T02:44:11.653386  / # . /lava-377248/environment/lava-377248/=
bin/lava-test-runner /lava-377248/1 =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63be22d4a1fd31ca521d39c3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63be22d4a1fd31ca521d39c6
        failing since 6 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T02:45:34.897474  [   20.715121] usbcore: registered new inte=
r#
    2023-01-11T02:45:34.999474  export SHELL=3D/bin/sh
    2023-01-11T02:45:35.000248  face driver uas
    2023-01-11T02:45:35.000520  #
    2023-01-11T02:45:35.102231  / # export SHELL=3D/bin/sh. /lava-377251/en=
vironment
    2023-01-11T02:45:35.102947  =

    2023-01-11T02:45:35.204434  / # . /lava-377251/environment/lava-377251/=
bin/lava-test-runner /lava-377251/1
    2023-01-11T02:45:35.205511  =

    2023-01-11T02:45:35.222321  / # /lava-377251/bin/lava-test-runner /lava=
-377251/1
    2023-01-11T02:45:35.337561  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (19 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63be24ca1e7d790da71d39d3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63be24ca1e7d790da71d39d6
        failing since 6 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T02:53:39.546065  / # #
    2023-01-11T02:53:39.650073  export SHELL=3D/bin/sh
    2023-01-11T02:53:39.650914  #
    2023-01-11T02:53:39.752705  / # export SHELL=3D/bin/sh. /lava-377260/en=
vironment
    2023-01-11T02:53:39.753411  =

    2023-01-11T02:53:39.856147  / # . /lava-377260/environment/lava-377260/=
bin/lava-test-runner /lava-377260/1
    2023-01-11T02:53:39.857513  =

    2023-01-11T02:53:39.863357  / # /lava-377260/bin/lava-test-runner /lava=
-377260/1
    2023-01-11T02:53:39.989787  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-11T02:53:39.990201  + cd /lava-377260/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/63be1f631edb73b11f1d39d2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-29=
6-g79fa898551af/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63be1f631edb73b11f1d39d5
        failing since 6 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T02:30:41.394116  / # #
    2023-01-11T02:30:41.496098  export SHELL=3D/bin/sh
    2023-01-11T02:30:41.496768  #
    2023-01-11T02:30:41.598093  / # export SHELL=3D/bin/sh. /lava-377241/en=
vironment
    2023-01-11T02:30:41.598723  =

    2023-01-11T02:30:41.700099  / # . /lava-377241/environment/lava-377241/=
bin/lava-test-runner /lava-377241/1
    2023-01-11T02:30:41.701136  =

    2023-01-11T02:30:41.703876  / # /lava-377241/bin/lava-test-runner /lava=
-377241/1
    2023-01-11T02:30:41.784051  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-11T02:30:41.821129  + cd /lava-377241/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
