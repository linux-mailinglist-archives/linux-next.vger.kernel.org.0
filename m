Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C50A6E9DFE
	for <lists+linux-next@lfdr.de>; Thu, 20 Apr 2023 23:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbjDTVjc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Apr 2023 17:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbjDTVja (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Apr 2023 17:39:30 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05315BB3
        for <linux-next@vger.kernel.org>; Thu, 20 Apr 2023 14:39:24 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b7588005fso1429881b3a.0
        for <linux-next@vger.kernel.org>; Thu, 20 Apr 2023 14:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682026764; x=1684618764;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LwT8rX/NdIMhYxTYuIwYKJ9Lwd9GG7EBZH9LtWJQJZE=;
        b=qxCwoM7U3RGK8sGPNFSMxdjU8oIu91bTfa27ot4ogJoG5wy9XT4auiMbbRVutKv1xS
         WOgOCdSYKhz2xQw4u0IaAcyQ2wXJKae+iHi6sLW/M42IgF1KOU73sogngWN0leYptW09
         WOaceJt1INsXlNTinrccUkkrs1fJEx8q5/NXnDK1nsclBqfa1rRxbNmikuQV6rTCcQMQ
         VjLOqsArYBy23RvnHPjkcIlyNQfIJv/jin9U9dOUfaYovKcafxNSGkDNEJTb4FdkoGQl
         GAH25QHXdJLXn7bp3F/0yrvxejJa4IF4uO/eO9Kn7vhLM3E6ftP7uHBfWXj87L7CtjOK
         TLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682026764; x=1684618764;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwT8rX/NdIMhYxTYuIwYKJ9Lwd9GG7EBZH9LtWJQJZE=;
        b=YYpo/lUL7vb5pMLoCIl549Hmk4XLvUaS/aXvHU5GB9qSxwbmBSw1mpcSjpjt8qIXC+
         pSsN3KMlRhOPu4roIRX0fR9s7jzem8wQ970of4W5a8/QEMMYfkzQ77DCdijvnH+SWWT5
         4TYD2lXZakGE0Yo+rTf+ldZoMWIZkDyN5WMpEkiyuSlTejlGAzg5u6hSjzdv4oT2hHVA
         wK3KrfEQZgRyLJ3SFHbp2sfgNGft9cuwLtCv848HSvO5rM0axf7eBocsgGgWbomWctYI
         9+8s6tuauRnEBDuwaQ+XUwlGBW3bNoX+pbR5awBgSyY6qoZN3LW1JdUkMLzhQqPGwOYl
         1gfQ==
X-Gm-Message-State: AAQBX9fL2u6hZ8GhW766c9kloFIJdF7pGRuyiG5MRCXTrI3RMk4bAzsf
        BOa/bzkmfZZB5PiCkTcMnb3umcGKuvu5+v0ul9dUKxoj
X-Google-Smtp-Source: AKy350b40S/hETadjPRQAky8DUbTnIG8L0oyK/rEv5UQTMjhUKzcJ/bxpwLdyJcsz7C1wXc1x8yUew==
X-Received: by 2002:a05:6a00:843:b0:63d:6744:8caf with SMTP id q3-20020a056a00084300b0063d67448cafmr3372758pfk.26.1682026762335;
        Thu, 20 Apr 2023 14:39:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p4-20020aa78604000000b0063b867a1959sm1685008pfn.133.2023.04.20.14.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 14:39:21 -0700 (PDT)
Message-ID: <6441b109.a70a0220.822e7.3e66@mx.google.com>
Date:   Thu, 20 Apr 2023 14:39:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-rc7-210-g884374c58391a
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 397 runs,
 59 regressions (v6.3-rc7-210-g884374c58391a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 397 runs, 59 regressions (v6.3-rc7-210-g884374=
c58391a)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc7-210-g884374c58391a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc7-210-g884374c58391a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      884374c58391a3e1a508201f98e94ee14ed38548 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644176ebbe59f91dfd2e85ea

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644176ebbe59f91dfd2e85ef
        failing since 23 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:31:06.615986  <8>[   10.612910] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066176_1.4.2.3.1>

    2023-04-20T17:31:06.618887  + set +x

    2023-04-20T17:31:06.720920  /#

    2023-04-20T17:31:06.822456   # #export SHELL=3D/bin/sh

    2023-04-20T17:31:06.823228  =


    2023-04-20T17:31:06.925050  / # export SHELL=3D/bin/sh. /lava-10066176/=
environment

    2023-04-20T17:31:06.925933  =


    2023-04-20T17:31:07.027949  / # . /lava-10066176/environment/lava-10066=
176/bin/lava-test-runner /lava-10066176/1

    2023-04-20T17:31:07.029040  =


    2023-04-20T17:31:07.034860  / # /lava-10066176/bin/lava-test-runner /la=
va-10066176/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644179c8a0ba50ff332e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644179c8a0ba50ff332e85ed
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-20T17:43:16.834025  + set +x

    2023-04-20T17:43:16.840582  <8>[   13.205947] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066285_1.4.2.3.1>

    2023-04-20T17:43:16.945927  / # #

    2023-04-20T17:43:17.047043  export SHELL=3D/bin/sh

    2023-04-20T17:43:17.047236  #

    2023-04-20T17:43:17.148151  / # export SHELL=3D/bin/sh. /lava-10066285/=
environment

    2023-04-20T17:43:17.148345  =


    2023-04-20T17:43:17.249231  / # . /lava-10066285/environment/lava-10066=
285/bin/lava-test-runner /lava-10066285/1

    2023-04-20T17:43:17.249561  =


    2023-04-20T17:43:17.255300  / # /lava-10066285/bin/lava-test-runner /la=
va-10066285/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64417a3f7ad20f4e722e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417a3f7ad20f4e722e85f9
        failing since 23 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:45:18.829564  + set +x

    2023-04-20T17:45:18.835944  <8>[   10.201889] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066383_1.4.2.3.1>

    2023-04-20T17:45:18.940314  / # #

    2023-04-20T17:45:19.041276  export SHELL=3D/bin/sh

    2023-04-20T17:45:19.041466  #

    2023-04-20T17:45:19.142342  / # export SHELL=3D/bin/sh. /lava-10066383/=
environment

    2023-04-20T17:45:19.142522  =


    2023-04-20T17:45:19.243473  / # . /lava-10066383/environment/lava-10066=
383/bin/lava-test-runner /lava-10066383/1

    2023-04-20T17:45:19.243720  =


    2023-04-20T17:45:19.249644  / # /lava-10066383/bin/lava-test-runner /la=
va-10066383/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644176f45f24f1aa102e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644176f45f24f1aa102e8606
        failing since 23 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:31:18.704083  + set<8>[   11.689249] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10066139_1.4.2.3.1>

    2023-04-20T17:31:18.704565   +x

    2023-04-20T17:31:18.812738  / # #

    2023-04-20T17:31:18.915518  export SHELL=3D/bin/sh

    2023-04-20T17:31:18.916455  #

    2023-04-20T17:31:19.018341  / # export SHELL=3D/bin/sh. /lava-10066139/=
environment

    2023-04-20T17:31:19.019089  =


    2023-04-20T17:31:19.121118  / # . /lava-10066139/environment/lava-10066=
139/bin/lava-test-runner /lava-10066139/1

    2023-04-20T17:31:19.122629  =


    2023-04-20T17:31:19.127217  / # /lava-10066139/bin/lava-test-runner /la=
va-10066139/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64417a0942aa261e792e85f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417a0942aa261e792e85fa
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-20T17:44:25.971600  + set +x

    2023-04-20T17:44:25.975310  <8>[   93.049959] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066297_1.4.2.3.1>

    2023-04-20T17:44:26.083414  / # #

    2023-04-20T17:44:26.186011  export SHELL=3D/bin/sh

    2023-04-20T17:44:26.186693  #

    2023-04-20T17:44:26.288381  / # export SHELL=3D/bin/sh. /lava-10066297/=
environment

    2023-04-20T17:44:26.289091  =


    2023-04-20T17:44:26.390899  / # . /lava-10066297/environment/lava-10066=
297/bin/lava-test-runner /lava-10066297/1

    2023-04-20T17:44:26.391990  =


    2023-04-20T17:44:26.396747  / # /lava-10066297/bin/lava-test-runner /la=
va-10066297/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64417a467ad20f4e722e8614

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417a467ad20f4e722e8619
        failing since 23 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:45:16.357944  + <8>[   11.305415] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10066410_1.4.2.3.1>

    2023-04-20T17:45:16.358525  set +x

    2023-04-20T17:45:16.467199  / # #

    2023-04-20T17:45:16.570108  export SHELL=3D/bin/sh

    2023-04-20T17:45:16.570886  #

    2023-04-20T17:45:16.672913  / # export SHELL=3D/bin/sh. /lava-10066410/=
environment

    2023-04-20T17:45:16.673781  =


    2023-04-20T17:45:16.775859  / # . /lava-10066410/environment/lava-10066=
410/bin/lava-test-runner /lava-10066410/1

    2023-04-20T17:45:16.777356  =


    2023-04-20T17:45:16.782559  / # /lava-10066410/bin/lava-test-runner /la=
va-10066410/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644176eb4ac6f666ca2e8631

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644176eb4ac6f666ca2e8636
        failing since 23 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:31:01.224875  <8>[   11.114425] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066178_1.4.2.3.1>

    2023-04-20T17:31:01.228334  + set +x

    2023-04-20T17:31:01.333576  #

    2023-04-20T17:31:01.334678  =


    2023-04-20T17:31:01.436937  / # #export SHELL=3D/bin/sh

    2023-04-20T17:31:01.437634  =


    2023-04-20T17:31:01.539230  / # export SHELL=3D/bin/sh. /lava-10066178/=
environment

    2023-04-20T17:31:01.539891  =


    2023-04-20T17:31:01.641613  / # . /lava-10066178/environment/lava-10066=
178/bin/lava-test-runner /lava-10066178/1

    2023-04-20T17:31:01.642669  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644179a5fc7f99804f2e85f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644179a5fc7f99804f2e85fd
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-20T17:42:44.401818  <8>[   12.074224] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066292_1.4.2.3.1>

    2023-04-20T17:42:44.405291  + set +x

    2023-04-20T17:42:44.511082  #

    2023-04-20T17:42:44.512312  =


    2023-04-20T17:42:44.614624  / # #export SHELL=3D/bin/sh

    2023-04-20T17:42:44.615649  =


    2023-04-20T17:42:44.717593  / # export SHELL=3D/bin/sh. /lava-10066292/=
environment

    2023-04-20T17:42:44.718259  =


    2023-04-20T17:42:44.820008  / # . /lava-10066292/environment/lava-10066=
292/bin/lava-test-runner /lava-10066292/1

    2023-04-20T17:42:44.821065  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64417a3c4a5a0fb48e2e8604

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417a3c4a5a0fb48e2e8609
        failing since 23 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:45:14.713461  <8>[   10.253461] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066425_1.4.2.3.1>

    2023-04-20T17:45:14.716867  + set +x

    2023-04-20T17:45:14.823613  =


    2023-04-20T17:45:14.925737  / # #export SHELL=3D/bin/sh

    2023-04-20T17:45:14.926536  =


    2023-04-20T17:45:15.028510  / # export SHELL=3D/bin/sh. /lava-10066425/=
environment

    2023-04-20T17:45:15.029362  =


    2023-04-20T17:45:15.131522  / # . /lava-10066425/environment/lava-10066=
425/bin/lava-test-runner /lava-10066425/1

    2023-04-20T17:45:15.132818  =


    2023-04-20T17:45:15.138049  / # /lava-10066425/bin/lava-test-runner /la=
va-10066425/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/644178bad54e949e702e85f8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644178bad54e949e702e85fd
        failing since 99 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-04-20T17:38:43.832685  / # #

    2023-04-20T17:38:43.935245  export SHELL=3D/bin/sh

    2023-04-20T17:38:43.935950  #

    2023-04-20T17:38:44.037722  / # export SHELL=3D/bin/sh. /lava-10066198/=
environment

    2023-04-20T17:38:44.038430  =


    2023-04-20T17:38:44.140257  / # . /lava-10066198/environment/lava-10066=
198/bin/lava-test-runner /lava-10066198/1

    2023-04-20T17:38:44.141337  =


    2023-04-20T17:38:44.156474  / # /lava-10066198/bin/lava-test-runner /la=
va-10066198/1

    2023-04-20T17:38:44.266405  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-20T17:38:44.266923  + cd /lava-10066198/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644179fa34b78fa7d72e86a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644179fa34b78fa7d72e8=
6a7
        failing since 52 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64417acf7d229544eb2e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417acf7d229544eb2e8=
5f6
        failing since 88 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64417da29cfdaa603d2e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagl=
e-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagl=
e-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417da29cfdaa603d2e8=
602
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644178acd5dbca6d792e866f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644178acd5dbca6d792e8674
        failing since 93 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-20T17:38:13.993667  + set +x<8>[   24.481508] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3516847_1.5.2.4.1>
    2023-04-20T17:38:13.994424  =

    2023-04-20T17:38:14.114497  / # #
    2023-04-20T17:38:14.217966  export SHELL=3D/bin/sh
    2023-04-20T17:38:14.219046  #
    2023-04-20T17:38:14.323561  / # export SHELL=3D/bin/sh. /lava-3516847/e=
nvironment
    2023-04-20T17:38:14.324630  =

    2023-04-20T17:38:14.426691  / # . /lava-3516847/environment/lava-351684=
7/bin/lava-test-runner /lava-3516847/1
    2023-04-20T17:38:14.428336  =

    2023-04-20T17:38:14.438304  / # /lava-3516847/bin/lava-test-runner /lav=
a-3516847/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64417943ae52d25d712e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417943ae52d25d712e85ec
        failing since 93 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-20T17:41:04.542605  <8>[   14.420188] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3516899_1.5.2.4.1>
    2023-04-20T17:41:04.684145  / # #
    2023-04-20T17:41:04.790280  export SHELL=3D/bin/sh
    2023-04-20T17:41:04.791358  #
    2023-04-20T17:41:04.895810  / # export SHELL=3D/bin/sh. /lava-3516899/e=
nvironment
    2023-04-20T17:41:04.896757  <3>[   14.686700] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-04-20T17:41:04.897217  =

    2023-04-20T17:41:04.999235  / # . /lava-3516899/environment/lava-351689=
9/bin/lava-test-runner /lava-3516899/1
    2023-04-20T17:41:05.001508  =

    2023-04-20T17:41:05.005548  / # /lava-3516899/bin/lava-test-runner /lav=
a-3516899/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64417aa0bfcc52132d2e863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417aa0bfcc52132d2e8643
        failing since 93 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-20T17:46:54.381411  <8>[   15.121911] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3516935_1.5.2.4.1>
    2023-04-20T17:46:54.493796  / # #
    2023-04-20T17:46:54.597515  export SHELL=3D/bin/sh
    2023-04-20T17:46:54.598522  #
    2023-04-20T17:46:54.598979  / # export SHELL=3D/bin/sh<3>[   15.321899]=
 Bluetooth: hci0: command 0x0c03 tx timeout
    2023-04-20T17:46:54.701053  . /lava-3516935/environment
    2023-04-20T17:46:54.702002  =

    2023-04-20T17:46:54.804161  / # . /lava-3516935/environment/lava-351693=
5/bin/lava-test-runner /lava-3516935/1
    2023-04-20T17:46:54.805723  =

    2023-04-20T17:46:54.810099  / # /lava-3516935/bin/lava-test-runner /lav=
a-3516935/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64417cb8610ac0835a2e86af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417cb8610ac0835a2e86b4
        failing since 93 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-20T17:55:43.856821  <8>[   16.614277] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3517004_1.5.2.4.1>
    2023-04-20T17:55:43.963354  / # #
    2023-04-20T17:55:44.064990  export SHELL=3D/bin/sh
    2023-04-20T17:55:44.065423  #
    2023-04-20T17:55:44.166658  / # export SHELL=3D/bin/sh. /lava-3517004/e=
nvironment
    2023-04-20T17:55:44.167022  =

    2023-04-20T17:55:44.268234  / # . /lava-3517004/environment/lava-351700=
4/bin/lava-test-runner /lava-3517004/1
    2023-04-20T17:55:44.268758  =

    2023-04-20T17:55:44.273337  / # /lava-3517004/bin/lava-test-runner /lav=
a-3517004/1
    2023-04-20T17:55:44.356096  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64417d3821417a62052e8681

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417d3821417a62052e8686
        failing since 93 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-20T17:58:00.047502  <8>[   15.025617] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3517046_1.5.2.4.1>
    2023-04-20T17:58:00.159822  / # #
    2023-04-20T17:58:00.262920  export SHELL=3D/bin/sh
    2023-04-20T17:58:00.263860  #
    2023-04-20T17:58:00.365754  / # export SHELL=3D/bin/sh. /lava-3517046/e=
nvironment
    2023-04-20T17:58:00.366816  <3>[   15.246549] Bluetooth: hci0: command =
0xfc18 tx timeout
    2023-04-20T17:58:00.367265  =

    2023-04-20T17:58:00.469147  / # . /lava-3517046/environment/lava-351704=
6/bin/lava-test-runner /lava-3517046/1
    2023-04-20T17:58:00.470533  =

    2023-04-20T17:58:00.475270  / # /lava-3517046/bin/lava-test-runner /lav=
a-3517046/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/644176cb6f12a540d72e8675

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644176cb6f12a54=
0d72e867c
        failing since 48 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-04-20T17:30:13.683543  kern  :alert : Register r6 information: NUL=
L pointer
    2023-04-20T17:30:13.728623  kern  :alert : Register r7 information: non=
-paged memory
    2023-04-20T17:30:13.728932  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4d04200 pointer offset 4 size 512
    2023-04-20T17:30:13.729348  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-20T17:30:13.729544  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-20T17:30:13.730212  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e2000 allocated at load_module+0x898/0=
x1b10
    2023-04-20T17:30:13.731434  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-20T17:30:13.821942  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-20T17:30:13.822254  kern  :emerg : Process udevd (pid: 66, stac=
k limit =3D 0x3e9d5319)
    2023-04-20T17:30:13.822457  kern  :emerg : Stack: (0xc8905cf8 to 0xc890=
6000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644176cb6f12a54=
0d72e867d
        failing since 451 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-04-20T17:30:13.637244  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-04-20T17:30:13.637552  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-04-20T17:30:13.637752  kern  :alert : 8<--- cut here ---
    2023-04-20T17:30:13.637954  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-04-20T17:30:13.638133  kern  :alert : [00000060] *pgd=3Dc4a14831, =
*pte=3D00000000, *ppte=3D00000000
    2023-04-20T17:30:13.638301  kern  :alert : Register r0 information: non=
-paged memory
    2023-04-20T17:30:13.680229  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8904000 allocated at kernel_clone+0x98/0x=
3a0
    2023-04-20T17:30:13.680540  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-20T17:30:13.680735  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-20T17:30:13.680913  kern  :alert : R<8><LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6441775ead1d82db852e85ea

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6441775ead1d82db852e85ef
        failing since 23 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:33:03.200690  + <8>[   10.692126] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10066153_1.4.2.3.1>

    2023-04-20T17:33:03.200777  set +x

    2023-04-20T17:33:03.302602  #

    2023-04-20T17:33:03.302926  =


    2023-04-20T17:33:03.403987  / # #export SHELL=3D/bin/sh

    2023-04-20T17:33:03.404197  =


    2023-04-20T17:33:03.505135  / # export SHELL=3D/bin/sh. /lava-10066153/=
environment

    2023-04-20T17:33:03.505344  =


    2023-04-20T17:33:03.606286  / # . /lava-10066153/environment/lava-10066=
153/bin/lava-test-runner /lava-10066153/1

    2023-04-20T17:33:03.606590  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644179c8ed9d250c102e85f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644179c8ed9d250c102e85fd
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-20T17:43:11.533423  + set +x<8>[   15.115777] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10066311_1.4.2.3.1>

    2023-04-20T17:43:11.533508  =


    2023-04-20T17:43:11.639558  / # #

    2023-04-20T17:43:11.740366  export SHELL=3D/bin/sh

    2023-04-20T17:43:11.740542  #

    2023-04-20T17:43:11.841406  / # export SHELL=3D/bin/sh. /lava-10066311/=
environment

    2023-04-20T17:43:11.841574  =


    2023-04-20T17:43:11.942451  / # . /lava-10066311/environment/lava-10066=
311/bin/lava-test-runner /lava-10066311/1

    2023-04-20T17:43:11.942726  =


    2023-04-20T17:43:11.948040  / # /lava-10066311/bin/lava-test-runner /la=
va-10066311/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64417a2a8c03228ecd2e860c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417a2a8c03228ecd2e8611
        failing since 23 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:45:05.971204  + set +x

    2023-04-20T17:45:05.977543  <8>[   10.879927] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066353_1.4.2.3.1>

    2023-04-20T17:45:06.082575  / # #

    2023-04-20T17:45:06.183449  export SHELL=3D/bin/sh

    2023-04-20T17:45:06.183658  #

    2023-04-20T17:45:06.284411  / # export SHELL=3D/bin/sh. /lava-10066353/=
environment

    2023-04-20T17:45:06.284622  =


    2023-04-20T17:45:06.385607  / # . /lava-10066353/environment/lava-10066=
353/bin/lava-test-runner /lava-10066353/1

    2023-04-20T17:45:06.385874  =


    2023-04-20T17:45:06.390472  / # /lava-10066353/bin/lava-test-runner /la=
va-10066353/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644176e0c30e1883e72e8762

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644176e0c30e1883e72e8767
        failing since 23 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:30:57.154472  <8>[    7.907399] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066181_1.4.2.3.1>

    2023-04-20T17:30:57.157268  + set +x

    2023-04-20T17:30:57.259899  =


    2023-04-20T17:30:57.362025  / # #export SHELL=3D/bin/sh

    2023-04-20T17:30:57.362747  =


    2023-04-20T17:30:57.464549  / # export SHELL=3D/bin/sh. /lava-10066181/=
environment

    2023-04-20T17:30:57.465269  =


    2023-04-20T17:30:57.567131  / # . /lava-10066181/environment/lava-10066=
181/bin/lava-test-runner /lava-10066181/1

    2023-04-20T17:30:57.568280  =


    2023-04-20T17:30:57.573194  / # /lava-10066181/bin/lava-test-runner /la=
va-10066181/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6441799e4a15a57a292e85f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6441799e4a15a57a292e85f6
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-20T17:42:45.160134  + <8>[   13.555854] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10066282_1.4.2.3.1>

    2023-04-20T17:42:45.160519  set +x

    2023-04-20T17:42:45.266889  =


    2023-04-20T17:42:45.369147  / # #export SHELL=3D/bin/sh

    2023-04-20T17:42:45.369323  =


    2023-04-20T17:42:45.470454  / # export SHELL=3D/bin/sh. /lava-10066282/=
environment

    2023-04-20T17:42:45.471289  =


    2023-04-20T17:42:45.573121  / # . /lava-10066282/environment/lava-10066=
282/bin/lava-test-runner /lava-10066282/1

    2023-04-20T17:42:45.574201  =


    2023-04-20T17:42:45.579214  / # /lava-10066282/bin/lava-test-runner /la=
va-10066282/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64417a2a962a381e662e86c6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417a2a962a381e662e86cb
        failing since 23 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:44:57.693505  + set<8>[    9.951498] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10066424_1.4.2.3.1>

    2023-04-20T17:44:57.693589   +x

    2023-04-20T17:44:57.795619  #

    2023-04-20T17:44:57.896895  / # #export SHELL=3D/bin/sh

    2023-04-20T17:44:57.897059  =


    2023-04-20T17:44:57.998035  / # export SHELL=3D/bin/sh. /lava-10066424/=
environment

    2023-04-20T17:44:57.998197  =


    2023-04-20T17:44:58.099127  / # . /lava-10066424/environment/lava-10066=
424/bin/lava-test-runner /lava-10066424/1

    2023-04-20T17:44:58.099372  =


    2023-04-20T17:44:58.104281  / # /lava-10066424/bin/lava-test-runner /la=
va-10066424/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644176edbe59f91dfd2e8604

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644176edbe59f91dfd2e8609
        failing since 23 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:31:10.579684  + <8>[   11.333860] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10066156_1.4.2.3.1>

    2023-04-20T17:31:10.580120  set +x

    2023-04-20T17:31:10.688030  / # #

    2023-04-20T17:31:10.790676  export SHELL=3D/bin/sh

    2023-04-20T17:31:10.791563  #

    2023-04-20T17:31:10.893709  / # export SHELL=3D/bin/sh. /lava-10066156/=
environment

    2023-04-20T17:31:10.894676  =


    2023-04-20T17:31:10.996656  / # . /lava-10066156/environment/lava-10066=
156/bin/lava-test-runner /lava-10066156/1

    2023-04-20T17:31:10.998146  =


    2023-04-20T17:31:11.003348  / # /lava-10066156/bin/lava-test-runner /la=
va-10066156/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644179b2b15b907c152e85e6

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644179b2b15b907c152e85eb
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-20T17:42:54.606267  + set +x

    2023-04-20T17:42:54.612618  <8>[   14.183517] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066290_1.4.2.3.1>

    2023-04-20T17:42:54.717632  #

    2023-04-20T17:42:54.718798  =


    2023-04-20T17:42:54.820994  / # #export SHELL=3D/bin/sh

    2023-04-20T17:42:54.821742  =


    2023-04-20T17:42:54.923633  / # export SHELL=3D/bin/sh. /lava-10066290/=
environment

    2023-04-20T17:42:54.924337  =


    2023-04-20T17:42:55.026200  / # . /lava-10066290/environment/lava-10066=
290/bin/lava-test-runner /lava-10066290/1

    2023-04-20T17:42:55.027417  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64417a364a5a0fb48e2e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417a364a5a0fb48e2e85fc
        failing since 23 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:45:10.500909  + <8>[   10.767564] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10066427_1.4.2.3.1>

    2023-04-20T17:45:10.501347  set +x

    2023-04-20T17:45:10.608857  / # #

    2023-04-20T17:45:10.711395  export SHELL=3D/bin/sh

    2023-04-20T17:45:10.712152  #

    2023-04-20T17:45:10.813826  / # export SHELL=3D/bin/sh. /lava-10066427/=
environment

    2023-04-20T17:45:10.814546  =


    2023-04-20T17:45:10.916386  / # . /lava-10066427/environment/lava-10066=
427/bin/lava-test-runner /lava-10066427/1

    2023-04-20T17:45:10.917507  =


    2023-04-20T17:45:10.922274  / # /lava-10066427/bin/lava-test-runner /la=
va-10066427/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64417701e2aa7f9ac22e8618

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417701e2aa7f9ac22e861d
        failing since 80 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-20T17:31:27.006002  + set +x
    2023-04-20T17:31:27.006235  [   16.359761] <LAVA_SIGNAL_ENDRUN 0_dmesg =
932553_1.5.2.3.1>
    2023-04-20T17:31:27.113373  / # #
    2023-04-20T17:31:27.214933  export SHELL=3D/bin/sh
    2023-04-20T17:31:27.215409  #
    2023-04-20T17:31:27.316556  / # export SHELL=3D/bin/sh. /lava-932553/en=
vironment
    2023-04-20T17:31:27.316977  =

    2023-04-20T17:31:27.418157  / # . /lava-932553/environment/lava-932553/=
bin/lava-test-runner /lava-932553/1
    2023-04-20T17:31:27.418731  =

    2023-04-20T17:31:27.421870  / # /lava-932553/bin/lava-test-runner /lava=
-932553/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64417765baddf5b8b42e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417765baddf5b8b42e8607
        failing since 80 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-20T17:33:01.653604  + set +x
    2023-04-20T17:33:01.653839  [   12.997964] <LAVA_SIGNAL_ENDRUN 0_dmesg =
932565_1.5.2.3.1>
    2023-04-20T17:33:01.760981  / # #
    2023-04-20T17:33:01.862583  export SHELL=3D/bin/sh
    2023-04-20T17:33:01.863052  #
    2023-04-20T17:33:01.964258  / # export SHELL=3D/bin/sh. /lava-932565/en=
vironment
    2023-04-20T17:33:01.964716  =

    2023-04-20T17:33:02.066016  / # . /lava-932565/environment/lava-932565/=
bin/lava-test-runner /lava-932565/1
    2023-04-20T17:33:02.066710  =

    2023-04-20T17:33:02.069929  / # /lava-932565/bin/lava-test-runner /lava=
-932565/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6441781ae76b0d4c362e85f6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6441781ae76b0d4c362e85fb
        failing since 80 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-20T17:36:01.993429  + set +x
    2023-04-20T17:36:01.993679  [   12.884659] <LAVA_SIGNAL_ENDRUN 0_dmesg =
932578_1.5.2.3.1>
    2023-04-20T17:36:02.100627  / # #
    2023-04-20T17:36:02.202337  export SHELL=3D/bin/sh
    2023-04-20T17:36:02.202709  #
    2023-04-20T17:36:02.303933  / # export SHELL=3D/bin/sh. /lava-932578/en=
vironment
    2023-04-20T17:36:02.304461  =

    2023-04-20T17:36:02.405770  / # . /lava-932578/environment/lava-932578/=
bin/lava-test-runner /lava-932578/1
    2023-04-20T17:36:02.406406  =

    2023-04-20T17:36:02.409529  / # /lava-932578/bin/lava-test-runner /lava=
-932578/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64417a5d7ad20f4e722e8647

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417a5d7ad20f4e722e864c
        failing since 80 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-20T17:45:41.225599  + set +x
    2023-04-20T17:45:41.225757  [   12.211256] <LAVA_SIGNAL_ENDRUN 0_dmesg =
932598_1.5.2.3.1>
    2023-04-20T17:45:41.332806  / # #
    2023-04-20T17:45:41.434337  export SHELL=3D/bin/sh
    2023-04-20T17:45:41.434688  #
    2023-04-20T17:45:41.535861  / # export SHELL=3D/bin/sh. /lava-932598/en=
vironment
    2023-04-20T17:45:41.536196  =

    2023-04-20T17:45:41.637348  / # . /lava-932598/environment/lava-932598/=
bin/lava-test-runner /lava-932598/1
    2023-04-20T17:45:41.637837  =

    2023-04-20T17:45:41.640897  / # /lava-932598/bin/lava-test-runner /lava=
-932598/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64417aadecb827c86b2e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417aadecb827c86b2e8607
        failing since 80 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-20T17:47:02.803995  + set +x
    2023-04-20T17:47:02.804156  [   13.047693] <LAVA_SIGNAL_ENDRUN 0_dmesg =
932604_1.5.2.3.1>
    2023-04-20T17:47:02.911316  / # #
    2023-04-20T17:47:03.012726  export SHELL=3D/bin/sh
    2023-04-20T17:47:03.013191  #
    2023-04-20T17:47:03.114410  / # export SHELL=3D/bin/sh. /lava-932604/en=
vironment
    2023-04-20T17:47:03.114845  =

    2023-04-20T17:47:03.216043  / # . /lava-932604/environment/lava-932604/=
bin/lava-test-runner /lava-932604/1
    2023-04-20T17:47:03.216646  =

    2023-04-20T17:47:03.219678  / # /lava-932604/bin/lava-test-runner /lava=
-932604/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644177f35842ec4c1b2e861e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644177f35842ec4c1b2e8623
        failing since 105 days (last pass: v6.1-rc4-339-g185da88d03ed, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-20T17:35:26.234137  + set +x
    2023-04-20T17:35:26.235218  <8>[   57.215415] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1204857_1.5.2.4.1>
    2023-04-20T17:35:26.343289  =

    2023-04-20T17:35:27.502578  / # #export SHELL=3D/bin/sh
    2023-04-20T17:35:27.508046  =

    2023-04-20T17:35:29.053171  / # export SHELL=3D/bin/sh. /lava-1204857/e=
nvironment
    2023-04-20T17:35:29.058623  =

    2023-04-20T17:35:31.877499  / # . /lava-1204857/environment/lava-120485=
7/bin/lava-test-runner /lava-1204857/1
    2023-04-20T17:35:31.883119  =

    2023-04-20T17:35:31.883248  / # /lava-1204857/bin/lava-test-runner /lav=
a-1204857/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644176e3a988a9f3292e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644176e3a988a9f3292e85f8
        failing since 105 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-20T17:30:52.724751  + set<8>[   38.377200] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1204859_1.5.2.4.1>
    2023-04-20T17:30:52.724866   +x
    2023-04-20T17:30:52.827975  / # #
    2023-04-20T17:30:53.986174  export SHELL=3D/bin/sh
    2023-04-20T17:30:53.991593  #
    2023-04-20T17:30:55.536973  / # export SHELL=3D/bin/sh. /lava-1204859/e=
nvironment
    2023-04-20T17:30:55.542367  =

    2023-04-20T17:30:58.360873  / # . /lava-1204859/environment/lava-120485=
9/bin/lava-test-runner /lava-1204859/1
    2023-04-20T17:30:58.366672  =

    2023-04-20T17:30:58.368068  / # /lava-1204859/bin/lava-test-runner /lav=
a-1204859/1 =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64417834154c297e942e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417834154c297e942e85eb
        failing since 105 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-20T17:36:26.846021  + set +x<8>[   66.960816] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1204856_1.5.2.4.1>
    2023-04-20T17:36:26.846160  =

    2023-04-20T17:36:26.953221  / # #
    2023-04-20T17:36:28.111276  export SHELL=3D/bin/sh
    2023-04-20T17:36:28.116674  #
    2023-04-20T17:36:28.116832  / # export SHELL=3D/bin/sh
    2023-04-20T17:36:29.661930  / # . /lava-1204856/environment
    2023-04-20T17:36:32.485341  /lava-1204856/bin/lava-test-runner /lava-12=
04856/1
    2023-04-20T17:36:32.491033  . /lava-1204856/environment
    2023-04-20T17:36:32.491209  / # /lava-1204856/bin/lava-test-runner /lav=
a-1204856/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6441785a98ff6e2d7d2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6441785a98ff6e2d7d2e8=
5e7
        failing since 355 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64417b4d006b210ef12e8615

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417b4d006b210ef12e8618
        new failure (last pass: v6.3-rc7-140-g88d3973741d7)

    2023-04-20T17:49:55.206259  / # #
    2023-04-20T17:49:55.307423  export SHELL=3D/bin/sh
    2023-04-20T17:49:55.307795  #
    2023-04-20T17:49:55.408877  / # export SHELL=3D/bin/sh. /lava-323143/en=
vironment
    2023-04-20T17:49:55.409288  =

    2023-04-20T17:49:55.511230  / # . /lava-323143/environment/lava-323143/=
bin/lava-test-runner /lava-323143/1
    2023-04-20T17:49:55.511687  =

    2023-04-20T17:49:55.519669  / # /lava-323143/bin/lava-test-runner /lava=
-323143/1
    2023-04-20T17:49:55.581649  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-20T17:49:55.581860  + cd /l<8>[   15.383289] <LAVA_SIGNAL_START=
RUN 1_bootrr 323143_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/644=
17b4e006b210ef12e8628
        new failure (last pass: v6.3-rc7-140-g88d3973741d7)

    2023-04-20T17:49:57.964701  /lava-323143/1/../bin/lava-test-case
    2023-04-20T17:49:57.964910  <8>[   17.860989] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-04-20T17:49:57.965020  /lava-323143/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644176dec30e1883e72e8757

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644176dec30e1883e72e875c
        failing since 23 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:30:59.112678  + set +x<8>[   12.075271] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10066175_1.4.2.3.1>

    2023-04-20T17:30:59.112770  =


    2023-04-20T17:30:59.217406  / # #

    2023-04-20T17:30:59.318461  export SHELL=3D/bin/sh

    2023-04-20T17:30:59.318656  #

    2023-04-20T17:30:59.419525  / # export SHELL=3D/bin/sh. /lava-10066175/=
environment

    2023-04-20T17:30:59.419747  =


    2023-04-20T17:30:59.520822  / # . /lava-10066175/environment/lava-10066=
175/bin/lava-test-runner /lava-10066175/1

    2023-04-20T17:30:59.521166  =


    2023-04-20T17:30:59.525641  / # /lava-10066175/bin/lava-test-runner /la=
va-10066175/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644179affc7f99804f2e867d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644179affc7f99804f2e8682
        failing since 20 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-20T17:42:54.047979  + <8>[   13.869212] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10066307_1.4.2.3.1>

    2023-04-20T17:42:54.048094  set +x

    2023-04-20T17:42:54.152910  / # #

    2023-04-20T17:42:54.253957  export SHELL=3D/bin/sh

    2023-04-20T17:42:54.254157  #

    2023-04-20T17:42:54.355064  / # export SHELL=3D/bin/sh. /lava-10066307/=
environment

    2023-04-20T17:42:54.355260  =


    2023-04-20T17:42:54.456184  / # . /lava-10066307/environment/lava-10066=
307/bin/lava-test-runner /lava-10066307/1

    2023-04-20T17:42:54.456475  =


    2023-04-20T17:42:54.461153  / # /lava-10066307/bin/lava-test-runner /la=
va-10066307/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64417a29962a381e662e86b8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64417a29962a381e662e86bd
        failing since 23 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-20T17:45:00.691657  <8>[   12.098366] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10066371_1.4.2.3.1>

    2023-04-20T17:45:00.800116  / # #

    2023-04-20T17:45:00.903257  export SHELL=3D/bin/sh

    2023-04-20T17:45:00.904048  #

    2023-04-20T17:45:01.006054  / # export SHELL=3D/bin/sh. /lava-10066371/=
environment

    2023-04-20T17:45:01.006769  =


    2023-04-20T17:45:01.108523  / # . /lava-10066371/environment/lava-10066=
371/bin/lava-test-runner /lava-10066371/1

    2023-04-20T17:45:01.109661  =


    2023-04-20T17:45:01.114675  / # /lava-10066371/bin/lava-test-runner /la=
va-10066371/1

    2023-04-20T17:45:01.121150  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64417ca5610ac0835a2e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417ca5610ac0835a2e8=
5fd
        failing since 72 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64417ce7f76eaa66c12e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417ce7f76eaa66c12e8=
605
        failing since 72 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64417b623b7d8a0bda2e8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417b623b7d8a0bda2e8=
65a
        failing since 72 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64417d7e8bb27b619d2e863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417d7e8bb27b619d2e8=
63e
        failing since 59 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64418a1986f44601872e8613

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64418a1986f44601872e8=
614
        failing since 72 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64417b98f1560344312e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417b98f1560344312e8=
5f8
        failing since 72 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644180a5b2ab8c64612e8786

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644180a5b2ab8c64612e8=
787
        failing since 72 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64417e12ac5d6517252e8607

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/644=
17e12ac5d6517252e863a
        failing since 57 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-04-20T18:01:41.320519  /lava-10066581/1/../bin/lava-test-case

    2023-04-20T18:01:41.327305  <8>[   23.372266] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64417e12ac5d6517252e868c
        failing since 52 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-20T18:01:38.463630  /lava-10066581/1/../bin/lava-test-case

    2023-04-20T18:01:38.473602  <8>[   20.515951] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64417e12ac5d6517252e868d
        failing since 52 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-20T18:01:37.433925  /lava-10066581/1/../bin/lava-test-case

    2023-04-20T18:01:37.443775  <8>[   19.487211] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6441760c2cffb356972e86a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6441760c2cffb356972e8=
6a8
        failing since 6 days (last pass: v6.3-rc6-158-g254ff7648cb9, first =
fail: v6.3-rc6-249-g122e82851461) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64417946ae52d25d712e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417946ae52d25d712e8=
5f4
        failing since 126 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6441782e722f59bbce2e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6441782e722f59bbce2e8=
60b
        failing since 126 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64417ad47d229544eb2e861e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417ad47d229544eb2e8=
61f
        failing since 72 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64417d033e872edffc2e86a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417d033e872edffc2e8=
6a7
        failing since 72 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64417bda90e57a09ae2e870a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-21=
0-g884374c58391a/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64417bda90e57a09ae2e8=
70b
        failing since 71 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =20
