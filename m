Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE3B6E6861
	for <lists+linux-next@lfdr.de>; Tue, 18 Apr 2023 17:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbjDRPgw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Apr 2023 11:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbjDRPgv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Apr 2023 11:36:51 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF311BF6
        for <linux-next@vger.kernel.org>; Tue, 18 Apr 2023 08:36:44 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id sj1-20020a17090b2d8100b00247bd1a66d4so10918pjb.5
        for <linux-next@vger.kernel.org>; Tue, 18 Apr 2023 08:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681832204; x=1684424204;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3U1uNDOAkywWj/bjC/LgpMlMlUA2PEakjfYRKV1Bojg=;
        b=FkvegUazfwhuEp+1YQrT8fWThe50iRlCn8q16KrQG/klC/HyFvA5YguVZLRKctf8eY
         Wx+vqEAazS4NShKYdjdCII8F1LVY2ZmPNiC1vd2m0Yc1tSBibvti1L57MSGMgVcNo5Ey
         Ra04LgAdyeDVRE/O8doQjKg+s1UXchNxwmgGIbhJ7+NlmBm21JHdXZRdRAN9r35bBn1P
         6h+0ZCp4RcHkq/DB0mqBvQ/X8LP0BnSjMKzpqFSyEHBNkeQGwrxA1vGnwNh9g1sBvufu
         n9i/S/an3exzp1eRnvFMzrPrBzdN0S3mzhBdCJqa+RAp5Z35Uua785pJDw4op0YuD+QQ
         L1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681832204; x=1684424204;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3U1uNDOAkywWj/bjC/LgpMlMlUA2PEakjfYRKV1Bojg=;
        b=MLTofOSQBVMXgDHIBnwXcUGYfXlhvV3OJ5GAEZTGf0mruaHQ4KeFuWd3mLqbRmfBSJ
         /f/s3hdI9sOGa+X6ywu4/x5EM7RG4dFF3hMOE4VL6ikPFRwg4U0/ipMenpWF9K7Mz3RS
         hF4APUJVwESGF1kQ8PdKzBne093+pYwbRDYUnayzyKUDXIEO+im6FQHu2Wi+r4SLMzB0
         HH/EytzWc4HZM+zvPLG6oaeu5HnkA8lnId+2JAHKq89BRDaebvnPe2BwYCI4f8ZuktNk
         n0OqydIQ7P4NqU04G5SrvFGLekwWb1Ehv9Yz9CsHFmJ5/9FXv2pgdHsSXXhQEruZB56F
         m6hQ==
X-Gm-Message-State: AAQBX9c88o7yGNsxn+Y18HNiv7ShQISixXKH7vFF53Mmwrh/HpltlwwA
        Mwr+YgGdANfEmefkRIrcmU535CSkQMSfAC+Cb9ekQf2D
X-Google-Smtp-Source: AKy350ZW2XPdBjaLozPhzxUPBBvr5p4mfeBiu7Dr9rVfbQgkVZi+CVJfmPCII+b5ZMtWZPsmGK1qWQ==
X-Received: by 2002:a05:6a20:3ca8:b0:ee:d266:32bb with SMTP id b40-20020a056a203ca800b000eed26632bbmr269936pzj.7.1681832201649;
        Tue, 18 Apr 2023 08:36:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w11-20020a6556cb000000b00502e20b4777sm8960545pgs.9.2023.04.18.08.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 08:36:41 -0700 (PDT)
Message-ID: <643eb909.650a0220.3b91.449f@mx.google.com>
Date:   Tue, 18 Apr 2023 08:36:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-rc7-140-g88d3973741d7
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 617 runs,
 63 regressions (v6.3-rc7-140-g88d3973741d7)
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

next/pending-fixes baseline: 617 runs, 63 regressions (v6.3-rc7-140-g88d397=
3741d7)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc7-140-g88d3973741d7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc7-140-g88d3973741d7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      88d3973741d77fefd8dec0ee678c9a09269c3006 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7fa60328d2cc9f2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7fa60328d2cc9f2e85eb
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:31:38.607877  + set +x

    2023-04-18T11:31:38.614526  <8>[    9.907085] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028426_1.4.2.3.1>

    2023-04-18T11:31:38.719598  / # #

    2023-04-18T11:31:38.822284  export SHELL=3D/bin/sh

    2023-04-18T11:31:38.823039  #

    2023-04-18T11:31:38.924870  / # export SHELL=3D/bin/sh. /lava-10028426/=
environment

    2023-04-18T11:31:38.925208  =


    2023-04-18T11:31:39.026604  / # . /lava-10028426/environment/lava-10028=
426/bin/lava-test-runner /lava-10028426/1

    2023-04-18T11:31:39.027971  =


    2023-04-18T11:31:39.033461  / # /lava-10028426/bin/lava-test-runner /la=
va-10028426/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e80433623be2fb62e866a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e80433623be2fb62e866f
        failing since 20 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:34:13.950905  + set +x

    2023-04-18T11:34:13.957886  <8>[   10.240103] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028588_1.4.2.3.1>

    2023-04-18T11:34:14.060515  =


    2023-04-18T11:34:14.161529  / # #export SHELL=3D/bin/sh

    2023-04-18T11:34:14.161742  =


    2023-04-18T11:34:14.262689  / # export SHELL=3D/bin/sh. /lava-10028588/=
environment

    2023-04-18T11:34:14.262906  =


    2023-04-18T11:34:14.363668  / # . /lava-10028588/environment/lava-10028=
588/bin/lava-test-runner /lava-10028588/1

    2023-04-18T11:34:14.363961  =


    2023-04-18T11:34:14.369247  / # /lava-10028588/bin/lava-test-runner /la=
va-10028588/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e863671092029032e85e9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e863671092029032e85ee
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T11:59:30.372193  + set +x

    2023-04-18T11:59:30.378704  <8>[   13.235078] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10029262_1.4.2.3.1>

    2023-04-18T11:59:30.483767  / # #

    2023-04-18T11:59:30.584978  export SHELL=3D/bin/sh

    2023-04-18T11:59:30.585177  #

    2023-04-18T11:59:30.686126  / # export SHELL=3D/bin/sh. /lava-10029262/=
environment

    2023-04-18T11:59:30.686317  =


    2023-04-18T11:59:30.787286  / # . /lava-10029262/environment/lava-10029=
262/bin/lava-test-runner /lava-10029262/1

    2023-04-18T11:59:30.787677  =


    2023-04-18T11:59:30.793781  / # /lava-10029262/bin/lava-test-runner /la=
va-10029262/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7fa60328d2cc9f2e85f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7fa60328d2cc9f2e85f6
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:31:31.790686  + <8>[   11.366908] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10028451_1.4.2.3.1>

    2023-04-18T11:31:31.791159  set +x

    2023-04-18T11:31:31.898778  / # #

    2023-04-18T11:31:32.001228  export SHELL=3D/bin/sh

    2023-04-18T11:31:32.001931  #

    2023-04-18T11:31:32.103601  / # export SHELL=3D/bin/sh. /lava-10028451/=
environment

    2023-04-18T11:31:32.103758  =


    2023-04-18T11:31:32.204807  / # . /lava-10028451/environment/lava-10028=
451/bin/lava-test-runner /lava-10028451/1

    2023-04-18T11:31:32.206041  =


    2023-04-18T11:31:32.210843  / # /lava-10028451/bin/lava-test-runner /la=
va-10028451/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8020822abb78f42e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8020822abb78f42e85eb
        failing since 20 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:33:33.549976  + <8>[   11.471875] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10028605_1.4.2.3.1>

    2023-04-18T11:33:33.550061  set +x

    2023-04-18T11:33:33.655176  / # #

    2023-04-18T11:33:33.756305  export SHELL=3D/bin/sh

    2023-04-18T11:33:33.756544  #

    2023-04-18T11:33:33.857463  / # export SHELL=3D/bin/sh. /lava-10028605/=
environment

    2023-04-18T11:33:33.857702  =


    2023-04-18T11:33:33.958669  / # . /lava-10028605/environment/lava-10028=
605/bin/lava-test-runner /lava-10028605/1

    2023-04-18T11:33:33.959033  =


    2023-04-18T11:33:33.963349  / # /lava-10028605/bin/lava-test-runner /la=
va-10028605/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e859637aaf83b702e8615

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e859637aaf83b702e861a
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T11:57:03.436494  + set +x

    2023-04-18T11:57:03.442561  <8>[   15.715293] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10029242_1.4.2.3.1>

    2023-04-18T11:57:03.548145  #

    2023-04-18T11:57:03.549267  =


    2023-04-18T11:57:03.651571  / # #export SHELL=3D/bin/sh

    2023-04-18T11:57:03.652372  =


    2023-04-18T11:57:03.754267  / # export SHELL=3D/bin/sh. /lava-10029242/=
environment

    2023-04-18T11:57:03.755011  =


    2023-04-18T11:57:03.857350  / # . /lava-10029242/environment/lava-10029=
242/bin/lava-test-runner /lava-10029242/1

    2023-04-18T11:57:03.858473  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7fa70a37ee07652e85ea

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7fa70a37ee07652e85ef
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:31:35.044490  <8>[   10.490303] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028428_1.4.2.3.1>

    2023-04-18T11:31:35.047834  + set +x

    2023-04-18T11:31:35.149685  =


    2023-04-18T11:31:35.250621  / # #export SHELL=3D/bin/sh

    2023-04-18T11:31:35.250802  =


    2023-04-18T11:31:35.351692  / # export SHELL=3D/bin/sh. /lava-10028428/=
environment

    2023-04-18T11:31:35.351876  =


    2023-04-18T11:31:35.452807  / # . /lava-10028428/environment/lava-10028=
428/bin/lava-test-runner /lava-10028428/1

    2023-04-18T11:31:35.453163  =


    2023-04-18T11:31:35.457781  / # /lava-10028428/bin/lava-test-runner /la=
va-10028428/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e801e0b97c98d5a2e8649

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e801e0b97c98d5a2e864d
        failing since 20 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:33:31.678512  <8>[   10.263793] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028566_1.4.2.3.1>

    2023-04-18T11:33:31.681871  + set +x

    2023-04-18T11:33:31.787613  =


    2023-04-18T11:33:31.889714  / # #export SHELL=3D/bin/sh

    2023-04-18T11:33:31.890415  =


    2023-04-18T11:33:31.992150  / # export SHELL=3D/bin/sh. /lava-10028566/=
environment

    2023-04-18T11:33:31.992876  =


    2023-04-18T11:33:32.094683  / # . /lava-10028566/environment/lava-10028=
566/bin/lava-test-runner /lava-10028566/1

    2023-04-18T11:33:32.096030  =


    2023-04-18T11:33:32.100991  / # /lava-10028566/bin/lava-test-runner /la=
va-10028566/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e85aa37aaf83b702e8649

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e85aa37aaf83b702e864e
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T11:57:06.154736  <8>[   12.025606] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10029255_1.4.2.3.1>

    2023-04-18T11:57:06.158621  + set +x

    2023-04-18T11:57:06.266460  / # #

    2023-04-18T11:57:06.369517  export SHELL=3D/bin/sh

    2023-04-18T11:57:06.370263  #

    2023-04-18T11:57:06.472101  / # export SHELL=3D/bin/sh. /lava-10029255/=
environment

    2023-04-18T11:57:06.472305  =


    2023-04-18T11:57:06.573357  / # . /lava-10029255/environment/lava-10029=
255/bin/lava-test-runner /lava-10029255/1

    2023-04-18T11:57:06.573767  =


    2023-04-18T11:57:06.578822  / # /lava-10029255/bin/lava-test-runner /la=
va-10029255/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/643e81386cb065015e2e86a0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e81386cb065015e2e86a5
        failing since 96 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-04-18T11:38:26.896762  / # #

    2023-04-18T11:38:26.999521  export SHELL=3D/bin/sh

    2023-04-18T11:38:27.000302  #

    2023-04-18T11:38:27.102135  / # export SHELL=3D/bin/sh. /lava-10028374/=
environment

    2023-04-18T11:38:27.102905  =


    2023-04-18T11:38:27.204769  / # . /lava-10028374/environment/lava-10028=
374/bin/lava-test-runner /lava-10028374/1

    2023-04-18T11:38:27.206018  =


    2023-04-18T11:38:27.220872  / # /lava-10028374/bin/lava-test-runner /la=
va-10028374/1

    2023-04-18T11:38:27.333767  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-18T11:38:27.334294  + cd /lava-10028374/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8a9b223d5ef9e12e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8a9b223d5ef9e12e8=
5e8
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e88141ec03cf69b2e876d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e88141ec03cf69b2e8=
76e
        failing since 86 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e84e2a3016decc72e8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e84e2a3016decc72e8=
652
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7f04092673bb012e8639

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7f04092673bb012e863e
        failing since 90 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T11:28:42.429232  <8>[   15.407941] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3506691_1.5.2.4.1>
    2023-04-18T11:28:42.536353  / # #
    2023-04-18T11:28:42.638048  export SHELL=3D/bin/sh
    2023-04-18T11:28:42.638438  #
    2023-04-18T11:28:42.739596  / # export SHELL=3D/bin/sh. /lava-3506691/e=
nvironment
    2023-04-18T11:28:42.739971  =

    2023-04-18T11:28:42.841098  / # . /lava-3506691/environment/lava-350669=
1/bin/lava-test-runner /lava-3506691/1
    2023-04-18T11:28:42.841636  =

    2023-04-18T11:28:42.841773  / # /lava-3506691/bin/lava-test-runner /lav=
a-3506691/1<3>[   15.806806] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-04-18T11:28:42.846333   =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e81207b8219867a2e85f5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e81207b8219867a2e85fa
        failing since 90 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T11:37:58.761739  <8>[   15.000165] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3506750_1.5.2.4.1>
    2023-04-18T11:37:58.872653  / # #
    2023-04-18T11:37:58.976546  export SHELL=3D/bin/sh
    2023-04-18T11:37:58.977715  #
    2023-04-18T11:37:59.080070  / # export SHELL=3D/bin/sh. /lava-3506750/e=
nvironment
    2023-04-18T11:37:59.081075  =

    2023-04-18T11:37:59.183374  / # . /lava-3506750/environment/lava-350675=
0/bin/lava-test-runner /lava-3506750/1
    2023-04-18T11:37:59.185097  =

    2023-04-18T11:37:59.189104  / # /lava-3506750/bin/lava-test-runner /lav=
a-3506750/1
    2023-04-18T11:37:59.276782  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e84055990fbb22a2e8616

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e84055990fbb22a2e861b
        failing since 90 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T11:50:21.256911  <8>[   16.687899] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3506824_1.5.2.4.1>
    2023-04-18T11:50:21.364017  / # #
    2023-04-18T11:50:21.465555  export SHELL=3D/bin/sh
    2023-04-18T11:50:21.465955  #
    2023-04-18T11:50:21.567129  / # export SHELL=3D/bin/sh. /lava-3506824/e=
nvironment
    2023-04-18T11:50:21.567510  =

    2023-04-18T11:50:21.668576  / # . /lava-3506824/environment/lava-350682=
4/bin/lava-test-runner /lava-3506824/1
    2023-04-18T11:50:21.669189  =

    2023-04-18T11:50:21.673497  / # /lava-3506824/bin/lava-test-runner /lav=
a-3506824/1
    2023-04-18T11:50:21.753265  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e84936423b25aa12e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e84936423b25aa12e85f8
        failing since 90 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T11:52:32.359031  <8>[   24.321063] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3506853_1.5.2.4.1>
    2023-04-18T11:52:32.467288  / # #
    2023-04-18T11:52:32.568590  export SHELL=3D/bin/sh
    2023-04-18T11:52:32.568930  #
    2023-04-18T11:52:32.670031  / # export SHELL=3D/bin/sh. /lava-3506853/e=
nvironment
    2023-04-18T11:52:32.670415  =

    2023-04-18T11:52:32.771552  / # . /lava-3506853/environment/lava-350685=
3/bin/lava-test-runner /lava-3506853/1
    2023-04-18T11:52:32.772218  =

    2023-04-18T11:52:32.776403  / # /lava-3506853/bin/lava-test-runner /lav=
a-3506853/1
    2023-04-18T11:52:32.866289  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e86eb64b01b67d52e85ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e86eb64b01b67d52e85ef
        failing since 90 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T12:02:37.954450  <8>[   13.962510] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3507095_1.5.2.4.1>
    2023-04-18T12:02:38.061560  / # #
    2023-04-18T12:02:38.163238  export SHELL=3D/bin/sh
    2023-04-18T12:02:38.163663  #
    2023-04-18T12:02:38.264891  / # export SHELL=3D/bin/sh. /lava-3507095/e=
nvironment
    2023-04-18T12:02:38.265311  =

    2023-04-18T12:02:38.366473  / # . /lava-3507095/environment/lava-350709=
5/bin/lava-test-runner /lava-3507095/1
    2023-04-18T12:02:38.367046  <3>[   14.281727] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-04-18T12:02:38.367187  =

    2023-04-18T12:02:38.371667  / # /lava-3507095/bin/lava-test-runner /lav=
a-3507095/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/643e8122b5c7bbd3b42e86a2

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8122b5c7bbd=
3b42e86a9
        failing since 46 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-04-18T11:37:54.109818  kern  :alert : Register r6 information: NUL=
L pointer
    2023-04-18T11:37:54.154697  kern  :alert : Register r7 information: non=
-paged memory
    2023-04-18T11:37:54.154970  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4bff200 pointer offset 4 size 512
    2023-04-18T11:37:54.155150  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-18T11:37:54.155326  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-18T11:37:54.155470  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e6000 allocated at load_module+0x898/0=
x1b10
    2023-04-18T11:37:54.157780  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-18T11:37:54.250401  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-18T11:37:54.250623  kern  :emerg : Process udevd (pid: 66, stac=
k limit =3D 0xdc0e6c24)
    2023-04-18T11:37:54.250756  kern  :emerg : Stack: (0xc8905cf8 to 0xc890=
6000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8122b5c7bbd=
3b42e86aa
        failing since 449 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-04-18T11:37:54.063207  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-04-18T11:37:54.063494  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-04-18T11:37:54.063691  kern  :alert : 8<--- cut here ---
    2023-04-18T11:37:54.064064  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-04-18T11:37:54.064209  kern  :alert : [00000060] *pgd=3Dc4a0c831, =
*pte=3D00000000, *ppte=3D00000000
    2023-04-18T11:37:54.064353  kern  :alert : Register r0 information: non=
-paged memory
    2023-04-18T11:37:54.106538  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8904000 allocated at kernel_clone+0x98/0x=
3a0
    2023-04-18T11:37:54.107088  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-18T11:37:54.107277  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-18T11:37:54.107438  kern  :alert : Register r4 infor<8><LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e84d4c2c951611d2e8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e84d4c2c951611d2e8=
633
        failing since 113 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7fa44dbdce8d142e8623

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7fa44dbdce8d142e8628
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:31:40.241562  + set +x

    2023-04-18T11:31:40.248245  <8>[   10.279742] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028436_1.4.2.3.1>

    2023-04-18T11:31:40.353159  / # #

    2023-04-18T11:31:40.454206  export SHELL=3D/bin/sh

    2023-04-18T11:31:40.454413  #

    2023-04-18T11:31:40.555338  / # export SHELL=3D/bin/sh. /lava-10028436/=
environment

    2023-04-18T11:31:40.555535  =


    2023-04-18T11:31:40.656475  / # . /lava-10028436/environment/lava-10028=
436/bin/lava-test-runner /lava-10028436/1

    2023-04-18T11:31:40.656759  =


    2023-04-18T11:31:40.660854  / # /lava-10028436/bin/lava-test-runner /la=
va-10028436/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8031dc1d13d1372e85ff

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8031dc1d13d1372e8604
        failing since 20 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:33:50.443632  + set +x

    2023-04-18T11:33:50.450206  <8>[   10.933047] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028639_1.4.2.3.1>

    2023-04-18T11:33:50.554936  / # #

    2023-04-18T11:33:50.656041  export SHELL=3D/bin/sh

    2023-04-18T11:33:50.656266  #

    2023-04-18T11:33:50.757212  / # export SHELL=3D/bin/sh. /lava-10028639/=
environment

    2023-04-18T11:33:50.757458  =


    2023-04-18T11:33:50.858400  / # . /lava-10028639/environment/lava-10028=
639/bin/lava-test-runner /lava-10028639/1

    2023-04-18T11:33:50.858734  =


    2023-04-18T11:33:50.863283  / # /lava-10028639/bin/lava-test-runner /la=
va-10028639/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e85ab0f8b9944042e8604

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e85ab0f8b9944042e8609
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T11:57:18.369154  + set +x

    2023-04-18T11:57:18.375823  <8>[   15.057583] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10029254_1.4.2.3.1>

    2023-04-18T11:57:18.485148  / # #

    2023-04-18T11:57:18.587849  export SHELL=3D/bin/sh

    2023-04-18T11:57:18.588634  #

    2023-04-18T11:57:18.690443  / # export SHELL=3D/bin/sh. /lava-10029254/=
environment

    2023-04-18T11:57:18.690711  =


    2023-04-18T11:57:18.791978  / # . /lava-10029254/environment/lava-10029=
254/bin/lava-test-runner /lava-10029254/1

    2023-04-18T11:57:18.793288  =


    2023-04-18T11:57:18.797779  / # /lava-10029254/bin/lava-test-runner /la=
va-10029254/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7f9279b3bdf9ac2e864b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7f9279b3bdf9ac2e8650
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:31:18.093124  <8>[   10.229611] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028429_1.4.2.3.1>

    2023-04-18T11:31:18.095978  + set +x

    2023-04-18T11:31:18.197539  #

    2023-04-18T11:31:18.197829  =


    2023-04-18T11:31:18.298783  / # #export SHELL=3D/bin/sh

    2023-04-18T11:31:18.298974  =


    2023-04-18T11:31:18.399829  / # export SHELL=3D/bin/sh. /lava-10028429/=
environment

    2023-04-18T11:31:18.400079  =


    2023-04-18T11:31:18.501048  / # . /lava-10028429/environment/lava-10028=
429/bin/lava-test-runner /lava-10028429/1

    2023-04-18T11:31:18.501411  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e801a095fe19d372e8612

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e801a095fe19d372e8617
        failing since 20 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:33:33.735627  <8>[   10.906606] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028617_1.4.2.3.1>

    2023-04-18T11:33:33.739130  + set +x

    2023-04-18T11:33:33.840836  #

    2023-04-18T11:33:33.841117  =


    2023-04-18T11:33:33.942123  / # #export SHELL=3D/bin/sh

    2023-04-18T11:33:33.942367  =


    2023-04-18T11:33:34.043283  / # export SHELL=3D/bin/sh. /lava-10028617/=
environment

    2023-04-18T11:33:34.043514  =


    2023-04-18T11:33:34.144412  / # . /lava-10028617/environment/lava-10028=
617/bin/lava-test-runner /lava-10028617/1

    2023-04-18T11:33:34.144698  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8585f38c78b5102e8605

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8585f38c78b5102e860a
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T11:56:38.401585  + set<8>[   10.501484] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10029272_1.4.2.3.1>

    2023-04-18T11:56:38.404988   +x

    2023-04-18T11:56:38.506689  / ##

    2023-04-18T11:56:38.607653  export SHELL=3D/bin/sh

    2023-04-18T11:56:38.607814   #

    2023-04-18T11:56:38.708856  / # export SHELL=3D/bin/sh. /lava-10029272/=
environment

    2023-04-18T11:56:38.709039  =


    2023-04-18T11:56:38.809910  / # . /lava-10029272/environment/lava-10029=
272/bin/lava-test-runner /lava-10029272/1

    2023-04-18T11:56:38.810149  =


    2023-04-18T11:56:38.815206  / # /lava-10029272/bin/lava-test-runner /la=
va-10029272/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7f998432675f972e85fb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7f998432675f972e8600
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:31:16.675525  + <8>[   11.352584] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10028461_1.4.2.3.1>

    2023-04-18T11:31:16.676088  set +x

    2023-04-18T11:31:16.784335  / # #

    2023-04-18T11:31:16.886999  export SHELL=3D/bin/sh

    2023-04-18T11:31:16.887839  #

    2023-04-18T11:31:16.989664  / # export SHELL=3D/bin/sh. /lava-10028461/=
environment

    2023-04-18T11:31:16.990412  =


    2023-04-18T11:31:17.092345  / # . /lava-10028461/environment/lava-10028=
461/bin/lava-test-runner /lava-10028461/1

    2023-04-18T11:31:17.093947  =


    2023-04-18T11:31:17.098668  / # /lava-10028461/bin/lava-test-runner /la=
va-10028461/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e802ecf521d299e2e8635

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e802ecf521d299e2e863a
        failing since 20 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:33:47.790676  + <8>[   11.453145] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10028598_1.4.2.3.1>

    2023-04-18T11:33:47.790761  set +x

    2023-04-18T11:33:47.895323  / # #

    2023-04-18T11:33:47.996321  export SHELL=3D/bin/sh

    2023-04-18T11:33:47.996633  #

    2023-04-18T11:33:48.097540  / # export SHELL=3D/bin/sh. /lava-10028598/=
environment

    2023-04-18T11:33:48.097734  =


    2023-04-18T11:33:48.198669  / # . /lava-10028598/environment/lava-10028=
598/bin/lava-test-runner /lava-10028598/1

    2023-04-18T11:33:48.198950  =


    2023-04-18T11:33:48.203614  / # /lava-10028598/bin/lava-test-runner /la=
va-10028598/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e85b079872acda42e85ea

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e85b079872acda42e85ef
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T11:57:19.804545  + set +x

    2023-04-18T11:57:19.810940  <8>[   14.114116] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10029260_1.4.2.3.1>

    2023-04-18T11:57:19.919505  / # #

    2023-04-18T11:57:20.022436  export SHELL=3D/bin/sh

    2023-04-18T11:57:20.023290  #

    2023-04-18T11:57:20.125426  / # export SHELL=3D/bin/sh. /lava-10029260/=
environment

    2023-04-18T11:57:20.126236  =


    2023-04-18T11:57:20.228297  / # . /lava-10029260/environment/lava-10029=
260/bin/lava-test-runner /lava-10029260/1

    2023-04-18T11:57:20.229570  =


    2023-04-18T11:57:20.235048  / # /lava-10029260/bin/lava-test-runner /la=
va-10029260/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7f80ef417464e02e85f9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7f80ef417464e02e85fe
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T11:30:48.870929  + set +x
    2023-04-18T11:30:48.871118  [   13.047704] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929119_1.5.2.3.1>
    2023-04-18T11:30:48.978160  / # #
    2023-04-18T11:30:49.079919  export SHELL=3D/bin/sh
    2023-04-18T11:30:49.080469  #
    2023-04-18T11:30:49.181874  / # export SHELL=3D/bin/sh. /lava-929119/en=
vironment
    2023-04-18T11:30:49.182299  =

    2023-04-18T11:30:49.283725  / # . /lava-929119/environment/lava-929119/=
bin/lava-test-runner /lava-929119/1
    2023-04-18T11:30:49.284267  =

    2023-04-18T11:30:49.287664  / # /lava-929119/bin/lava-test-runner /lava=
-929119/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e82143cedd1576f2e85e8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e82143cedd1576f2e85ed
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T11:41:47.791655  + set +x
    2023-04-18T11:41:47.791837  [   13.098884] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929162_1.5.2.3.1>
    2023-04-18T11:41:47.899656  / # #
    2023-04-18T11:41:48.001489  export SHELL=3D/bin/sh
    2023-04-18T11:41:48.001987  #
    2023-04-18T11:41:48.103181  / # export SHELL=3D/bin/sh. /lava-929162/en=
vironment
    2023-04-18T11:41:48.103742  =

    2023-04-18T11:41:48.205132  / # . /lava-929162/environment/lava-929162/=
bin/lava-test-runner /lava-929162/1
    2023-04-18T11:41:48.205947  =

    2023-04-18T11:41:48.209113  / # /lava-929162/bin/lava-test-runner /lava=
-929162/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e83cbf0932cf4b82e8615

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e83cbf0932cf4b82e861a
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T11:49:06.716970  + set +x
    2023-04-18T11:49:06.717159  [   12.134626] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929183_1.5.2.3.1>
    2023-04-18T11:49:06.824662  / # #
    2023-04-18T11:49:06.926292  export SHELL=3D/bin/sh
    2023-04-18T11:49:06.926776  #
    2023-04-18T11:49:07.028036  / # export SHELL=3D/bin/sh. /lava-929183/en=
vironment
    2023-04-18T11:49:07.028529  =

    2023-04-18T11:49:07.129777  / # . /lava-929183/environment/lava-929183/=
bin/lava-test-runner /lava-929183/1
    2023-04-18T11:49:07.130372  =

    2023-04-18T11:49:07.133667  / # /lava-929183/bin/lava-test-runner /lava=
-929183/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e841c7ba61046672e8660

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e841c7ba61046672e8665
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T11:50:32.472674  + set +x
    2023-04-18T11:50:32.472876  [   16.287493] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929189_1.5.2.3.1>
    2023-04-18T11:50:32.580081  / # #
    2023-04-18T11:50:32.681814  export SHELL=3D/bin/sh
    2023-04-18T11:50:32.682316  #
    2023-04-18T11:50:32.783603  / # export SHELL=3D/bin/sh. /lava-929189/en=
vironment
    2023-04-18T11:50:32.784097  =

    2023-04-18T11:50:32.885373  / # . /lava-929189/environment/lava-929189/=
bin/lava-test-runner /lava-929189/1
    2023-04-18T11:50:32.886281  =

    2023-04-18T11:50:32.889726  / # /lava-929189/bin/lava-test-runner /lava=
-929189/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e86c40714c80f772e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e86c40714c80f772e8607
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T12:01:53.441986  + set +x
    2023-04-18T12:01:53.442195  [   12.818302] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929232_1.5.2.3.1>
    2023-04-18T12:01:53.549773  / # #
    2023-04-18T12:01:53.651400  export SHELL=3D/bin/sh
    2023-04-18T12:01:53.651852  #
    2023-04-18T12:01:53.753084  / # export SHELL=3D/bin/sh. /lava-929232/en=
vironment
    2023-04-18T12:01:53.753581  =

    2023-04-18T12:01:53.855005  / # . /lava-929232/environment/lava-929232/=
bin/lava-test-runner /lava-929232/1
    2023-04-18T12:01:53.855718  =

    2023-04-18T12:01:53.859201  / # /lava-929232/bin/lava-test-runner /lava=
-929232/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e83999bbd4acbc72e85f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e83999bbd4acbc72e85f5
        failing since 103 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-18T11:48:15.078512  / # #
    2023-04-18T11:48:16.236392  export SHELL=3D/bin/sh
    2023-04-18T11:48:16.241821  #
    2023-04-18T11:48:17.786967  / # export SHELL=3D/bin/sh. /lava-1202278/e=
nvironment
    2023-04-18T11:48:17.792359  =

    2023-04-18T11:48:20.612022  / # . /lava-1202278/environment/lava-120227=
8/bin/lava-test-runner /lava-1202278/1
    2023-04-18T11:48:20.618129  =

    2023-04-18T11:48:20.619763  / # /lava-1202278/bin/lava-test-runner /lav=
a-1202278/1
    2023-04-18T11:48:20.711743  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T11:48:20.712129  + cd /lava-1202278/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8b61e2a37d7bdd2e8604

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8b61e2a37d7bdd2e8607
        failing since 103 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-18T12:21:19.352733  + set +x
    2023-04-18T12:21:19.353865  <8>[   67.067297] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1202279_1.5.2.4.1>
    2023-04-18T12:21:19.462520  / # #
    2023-04-18T12:21:20.622587  export SHELL=3D/bin/sh
    2023-04-18T12:21:20.628258  #
    2023-04-18T12:21:20.628562  / # export SHELL=3D/bin/sh
    2023-04-18T12:21:22.176050  / # . /lava-1202279/environment
    2023-04-18T12:21:25.003360  /lava-1202279/bin/lava-test-runner /lava-12=
02279/1
    2023-04-18T12:21:25.009039  . /lava-1202279/environment
    2023-04-18T12:21:25.009189  / # /lava-1202279/bin/lava-test-runner /lav=
a-1202279/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8d6f1f8e1f5ddc2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8d6f1f8e1f5ddc2e8=
5f9
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e829d7443ca9e7d2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e829d7443ca9e7d2e8=
5f8
        failing since 353 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7fa555cc4d3a442e863a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7fa555cc4d3a442e863e
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:31:33.399245  <8>[    9.090319] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028453_1.4.2.3.1>

    2023-04-18T11:31:33.506917  / # #

    2023-04-18T11:31:33.609640  export SHELL=3D/bin/sh

    2023-04-18T11:31:33.610313  #

    2023-04-18T11:31:33.712045  / # export SHELL=3D/bin/sh. /lava-10028453/=
environment

    2023-04-18T11:31:33.712685  =


    2023-04-18T11:31:33.814406  / # . /lava-10028453/environment/lava-10028=
453/bin/lava-test-runner /lava-10028453/1

    2023-04-18T11:31:33.814693  =


    2023-04-18T11:31:33.819040  / # /lava-10028453/bin/lava-test-runner /la=
va-10028453/1

    2023-04-18T11:31:33.825611  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8031dc1d13d1372e860a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8031dc1d13d1372e860f
        failing since 20 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T11:33:53.064745  <8>[   10.864425] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10028567_1.4.2.3.1>

    2023-04-18T11:33:53.169676  / # #

    2023-04-18T11:33:53.270737  export SHELL=3D/bin/sh

    2023-04-18T11:33:53.270948  #

    2023-04-18T11:33:53.371916  / # export SHELL=3D/bin/sh. /lava-10028567/=
environment

    2023-04-18T11:33:53.372111  =


    2023-04-18T11:33:53.473067  / # . /lava-10028567/environment/lava-10028=
567/bin/lava-test-runner /lava-10028567/1

    2023-04-18T11:33:53.473370  =


    2023-04-18T11:33:53.478250  / # /lava-10028567/bin/lava-test-runner /la=
va-10028567/1

    2023-04-18T11:33:53.484265  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e85ba79872acda42e85fa

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e85ba79872acda42e85ff
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T11:57:40.190366  + <8>[   14.295004] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10029279_1.4.2.3.1>

    2023-04-18T11:57:40.190448  set +x

    2023-04-18T11:57:40.295457  / # #

    2023-04-18T11:57:40.396377  export SHELL=3D/bin/sh

    2023-04-18T11:57:40.396566  #

    2023-04-18T11:57:40.497456  / # export SHELL=3D/bin/sh. /lava-10029279/=
environment

    2023-04-18T11:57:40.497641  =


    2023-04-18T11:57:40.598564  / # . /lava-10029279/environment/lava-10029=
279/bin/lava-test-runner /lava-10029279/1

    2023-04-18T11:57:40.598844  =


    2023-04-18T11:57:40.603985  / # /lava-10029279/bin/lava-test-runner /la=
va-10029279/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e871627ff1723752e865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e871627ff1723752e8=
65f
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8892d6b03d018b2e865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905=
d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905=
d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8892d6b03d018b2e8=
65e
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/643e84430a2ada82a22e860f

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/643=
e84430a2ada82a22e865f
        failing since 53 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-04-18T11:51:12.465284  /lava-10029035/1/../bin/lava-test-case

    2023-04-18T11:51:12.471507  <8>[   23.312071] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/643e84440a2ada82a22e86b0
        failing since 43 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13684-gf93c476d9769)

    2023-04-18T11:51:09.595188  /lava-10029035/1/../bin/lava-test-case

    2023-04-18T11:51:09.605308  <8>[   20.443090] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/643e84440a2ada82a22e86b1
        failing since 43 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13684-gf93c476d9769)

    2023-04-18T11:51:08.565366  /lava-10029035/1/../bin/lava-test-case

    2023-04-18T11:51:08.575251  <8>[   19.413766] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/643e87e1cf7276cf222e85fc

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/643=
e87e1cf7276cf222e864c
        failing since 55 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-04-18T12:06:29.748579  /lava-10029427/1/../bin/lava-test-case

    2023-04-18T12:06:29.755306  <8>[   23.403755] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/643e87e1cf7276cf222e869c
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-18T12:06:26.872770  /lava-10029427/1/../bin/lava-test-case

    2023-04-18T12:06:26.882973  <8>[   20.528993] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/643e87e1cf7276cf222e869d
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-18T12:06:25.843536  /lava-10029427/1/../bin/lava-test-case

    2023-04-18T12:06:25.853288  <8>[   19.499819] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/643e846d7fe1a75a062e867a

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/643e846d7fe1a75a062e8711
        failing since 46 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-04-18T11:51:40.791964  /lava-10029011/1/../bin/lava-test-case

    2023-04-18T11:51:40.798080  <8>[   19.951619] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/643e846d7fe1a75a062e8712
        failing since 46 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-04-18T11:51:39.772417  /lava-10029011/1/../bin/lava-test-case

    2023-04-18T11:51:39.778944  <8>[   18.931863] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/643e846d7fe1a75a062e8732
        failing since 46 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-04-18T11:51:41.811687  /lava-10029011/1/../bin/lava-test-case

    2023-04-18T11:51:41.818227  <8>[   20.971631] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/643e881f3a044c9c952e85f9

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/643e88203a044c9c952e86ab
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-18T12:07:30.103341  /lava-10029413/1/../bin/lava-test-case

    2023-04-18T12:07:30.110091  <8>[   20.843651] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/643e88203a044c9c952e86ac
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-18T12:07:29.083757  /lava-10029413/1/../bin/lava-test-case

    2023-04-18T12:07:29.090294  <8>[   19.824093] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/643e88203a044c9c952e86ad
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-18T12:07:28.064765  /lava-10029413/1/../bin/lava-test-case

    2023-04-18T12:07:28.070802  <8>[   18.804350] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7e998c4360e6c22e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e7e998c4360e6c22e8=
5ed
        failing since 188 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8263556c56a5752e860e

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8263556c56a=
5752e8616
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f)
        1 lines

    2023-04-18T11:43:24.115336  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 3f300f78, epc =3D=3D 801ff9d8, ra =3D=
=3D 8020239c
    2023-04-18T11:43:24.115461  =


    2023-04-18T11:43:24.136028  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-04-18T11:43:24.136155  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e80e333b81a559b2e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e80e333b81a559b2e8=
5ec
        failing since 4 days (last pass: v6.3-rc6-158-g254ff7648cb9, first =
fail: v6.3-rc6-249-g122e82851461) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8610b1953433ef2e8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8610b1953433ef2e8=
642
        failing since 124 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8229014b7345752e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8229014b7345752e8=
601
        failing since 124 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7ef8bf1c2848f32e85f5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7ef8bf1c2848f32e85fa
        failing since 75 days (last pass: v6.0-12387-ge54e01f1826aa, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-04-18T11:28:39.469174  <8>[    9.427699] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3506674_1.5.2.4.1>
    2023-04-18T11:28:39.590324  / # #
    2023-04-18T11:28:39.696297  export SHELL=3D/bin/sh
    2023-04-18T11:28:39.698021  #
    2023-04-18T11:28:39.801577  / # export SHELL=3D/bin/sh. /lava-3506674/e=
nvironment
    2023-04-18T11:28:39.803294  =

    2023-04-18T11:28:39.906969  / # . /lava-3506674/environment/lava-350667=
4/bin/lava-test-runner /lava-3506674/1
    2023-04-18T11:28:39.909973  =

    2023-04-18T11:28:39.913543  / # /lava-3506674/bin/lava-test-runner /lav=
a-3506674/1
    2023-04-18T11:28:40.063097  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e7f0c092673bb012e869c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
0-g88d3973741d7/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e7f0c092673bb012e86a1
        failing since 46 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-04-18T11:28:56.959666  <8>[    9.404706] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3506675_1.5.2.4.1>
    2023-04-18T11:28:57.079511  / # #
    2023-04-18T11:28:57.185285  export SHELL=3D/bin/sh
    2023-04-18T11:28:57.186903  #
    2023-04-18T11:28:57.290243  / # export SHELL=3D/bin/sh. /lava-3506675/e=
nvironment
    2023-04-18T11:28:57.291772  =

    2023-04-18T11:28:57.395290  / # . /lava-3506675/environment/lava-350667=
5/bin/lava-test-runner /lava-3506675/1
    2023-04-18T11:28:57.398041  =

    2023-04-18T11:28:57.403748  / # /lava-3506675/bin/lava-test-runner /lav=
a-3506675/1
    2023-04-18T11:28:57.499588  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
