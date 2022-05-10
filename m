Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0431D521CA2
	for <lists+linux-next@lfdr.de>; Tue, 10 May 2022 16:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241252AbiEJOpT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 May 2022 10:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238594AbiEJOoh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 May 2022 10:44:37 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD004ECE7
        for <linux-next@vger.kernel.org>; Tue, 10 May 2022 07:03:12 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id q4so13941939plr.11
        for <linux-next@vger.kernel.org>; Tue, 10 May 2022 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Klvvq2EduaphjqUGgohODrISD82aAAmx7E8DZ8M9JwQ=;
        b=g3icATmm+s9TdzdpUdwqm3yoWJ4Fw8W+bHPhTUdSdrBd0GvRFVw4mipjTrn+C3MDtL
         1bAHhWPkuKl6/oIuPao2KE/nCcCfBoHcFHVUGWiCSVGEHPctT3SVGGJBhIdOfa2HwA2S
         bCPp2U9d8H2SIjO3KiK75PCNd4tk2eABJXHze9+OoWbDOOHaarzS26AETHY/tOY+zpXz
         SEEyXcA6Wp3v/s7ZPi/HyTZSxQKbXS3/wayzEd5kPUFUkjWcKsreXoOwJs5yLbfh/ZTT
         vpqxZO23Uw444mJ28wrRL9ziHHtuI/ebXIqZtFbQOlbn1aqqWgRPV9q107GkGef7ro7v
         WvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Klvvq2EduaphjqUGgohODrISD82aAAmx7E8DZ8M9JwQ=;
        b=wZb/Ls1QIWBnr1rjUdH6GvanUdTzau9f1Z6EE1uttPfEiKmlZfGwc/lPueCXSTTZqN
         6ZYUWAVKPkQQU/TtRjDRynhWkT1pFD5K3f0FTaNIojHxVaA+zaz2PMkwj59KPsLhcB7x
         SyfE3hWKgX1KAF6kURSYpHkWDabcGh2xogOghNhZemIIxg0wf2MVYgZXJdvEPENHyr7d
         cjFpbXNMamcDAA6vKtb8hBEnq/+NKIvFW1lK8zSNdCZECm0uuUbQW19AOliqthh1JYS0
         9pg/ABawQVVz4aRWbZLRKoGcw4Lh+xyVVBKtT1o4ClKD+CoJ7kzxGNwRErIZXyoafmYa
         QwtQ==
X-Gm-Message-State: AOAM530+nOeMr4qBG0Ywr8rptMZxz568h+8V7h+cpBTImkUFjf1PbvSj
        OS43GFhpLS7FYDR9MR6t/uo/pEhPr4fPvU/FXA8=
X-Google-Smtp-Source: ABdhPJzLLuymPQgHzHhS0IHVehbgASAIPvDJDA8+Cx9xj2Cnp67cPyAY1T5PhpLwSoJvsz8X9oJwTg==
X-Received: by 2002:a17:90a:ea18:b0:1da:4630:513d with SMTP id w24-20020a17090aea1800b001da4630513dmr135419pjy.237.1652191391713;
        Tue, 10 May 2022 07:03:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902778500b0015e8d4eb245sm2044443pll.143.2022.05.10.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:03:11 -0700 (PDT)
Message-ID: <627a709f.1c69fb81.14238.4c03@mx.google.com>
Date:   Tue, 10 May 2022 07:03:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc6-192-g62fc98424346
Subject: next/pending-fixes baseline: 484 runs,
 8 regressions (v5.18-rc6-192-g62fc98424346)
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

next/pending-fixes baseline: 484 runs, 8 regressions (v5.18-rc6-192-g62fc98=
424346)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe    | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc6-192-g62fc98424346/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc6-192-g62fc98424346
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      62fc984243465ac442be6ff9bef5cbac0ce9144f =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/627a366fa27dd7f4898f579c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/627a366fa27dd7f=
4898f57a4
        failing since 106 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-10T09:54:34.867630  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-10T09:54:34.867937  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-10T09:54:34.868140  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-05-10T09:54:34.910655  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/627a37b2f5ab5fe6218f5724

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627a37b2f5ab5fe6218f5=
725
        new failure (last pass: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/627a5510f89cffedb18f5725

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627a5510f89cffedb18f5=
726
        failing since 10 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/627a3d17d2fffdb24c8f5764

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627a3d17d2fffdb24c8f5=
765
        failing since 1 day (last pass: v5.18-rc5-278-ge8576d28ffc9, first =
fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/627a3b83fc3b14c4e08f573d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627a3b83fc3b14c4e08f5=
73e
        failing since 1 day (last pass: v5.18-rc5-278-ge8576d28ffc9, first =
fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/627a524501fc2dbce38f5747

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627a524501fc2dbce38f5=
748
        new failure (last pass: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/627a4595800e6be1cd8f5740

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/627a4595800e6be1cd8f5762
        failing since 71 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-05-10T10:59:14.328389  <8>[   34.289959] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-10T10:59:15.350969  /lava-6322496/1/../bin/lava-test-case
    2022-05-10T10:59:15.361417  <8>[   35.323769] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe    | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/627a3980e3c163857d8f5745

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
92-g62fc98424346/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627a3980e3c163857d8f5=
746
        new failure (last pass: v5.17-12935-gafa5b5041c02) =

 =20
