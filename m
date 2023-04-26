Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E036EFCA1
	for <lists+linux-next@lfdr.de>; Wed, 26 Apr 2023 23:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbjDZVti (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Apr 2023 17:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjDZVtg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Apr 2023 17:49:36 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1110DAC
        for <linux-next@vger.kernel.org>; Wed, 26 Apr 2023 14:49:32 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-63b4dfead1bso6395504b3a.3
        for <linux-next@vger.kernel.org>; Wed, 26 Apr 2023 14:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682545771; x=1685137771;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fmoQoWmM5db/AiXXxO2BN5rBFh/6dlFcWVTlBgu2iQ8=;
        b=MtMwLDoSj0e/EXAvzeBVEn5Wjwk37/hdMqEpLxlD8vVFQxPQCRfDcSsR2EzxZDAq0w
         jWpih/qUvVz5Sh+AwgcKkhfowIeHVg1OQIg+qrNoXmm3lFWNPmL/M+9Og6sepNJIQFgi
         F2bZkc3Vn7A/CLf8vDaCr2AAxhHY+xRPlFpzWjmrNJkQaJ31Ki2j0CYO4D7J2d1EjxGq
         T6dXVnM70Mo7eDiX0iqCuGLATFwKCuGPrda1h8J0611lhO8oslqFekyIql8B//TImm/6
         QJm20CzX7OWvodt7/Y0kCJoVaQFTqPdYC5kZAHYrKhEaImjJixHLU7oCl0OGN8uM7HJo
         WQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682545771; x=1685137771;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmoQoWmM5db/AiXXxO2BN5rBFh/6dlFcWVTlBgu2iQ8=;
        b=ByU32B9xuJLMGLcWCswdRbjLHzQc37taSKqL6KiQx88Z8zfF85TY5z6IwA1waOSy7l
         +tXwEX30DagOSY56k35+E9UOIlBzTM1JlNDFddzfjUfTrDPrDqChPBNsqlSK0kin1OlM
         LLXFtLzqqGI2yUwDFeEfdbZc/A71HTCgACFT9LRXC8YxHO04qwMPdDtpcdXwhDIXtdg/
         sjFcmHi/TKdYNj8xNXyASvDSOCEI+8Ay4BgTcByxMC8l8ZP0MBym2hB/iLu7BmmTocpQ
         pi2SPhEw84R3X/NoqcYfGsFZe25s8VPdJQVmthleoH0g8NhQX9Mkr6tqn+0YG5bjYyhr
         UJbQ==
X-Gm-Message-State: AAQBX9clme9mMZyfavbiHVf2ENJNLQRrYOYr1NunBMR0tBCJuKbgO8tP
        YuU1ZwA3e7PbB3nFPtyDRD+1OFSRce+zcYFCBXFH7w==
X-Google-Smtp-Source: AKy350atSEV+H7QvVJ76jHK5Z87Sqo9BDg6yyAkSyCS0eZ7B6E0UIqn0ZqGJci7HX0MYHJhH3QgaIA==
X-Received: by 2002:a05:6a00:1914:b0:63b:8425:bf5d with SMTP id y20-20020a056a00191400b0063b8425bf5dmr29979395pfi.24.1682545769619;
        Wed, 26 Apr 2023 14:49:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s1-20020a056a00178100b00625d84a0194sm11842355pfg.107.2023.04.26.14.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 14:49:29 -0700 (PDT)
Message-ID: <64499c69.050a0220.fc475.8a70@mx.google.com>
Date:   Wed, 26 Apr 2023 14:49:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230426
X-Kernelci-Report-Type: test
Subject: next/master baseline: 414 runs, 68 regressions (next-20230426)
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

next/master baseline: 414 runs, 68 regressions (next-20230426)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 3          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230426/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230426
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b7455b10da762f2d447678c88e37cc1eb6cb45ee =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6449731c3c6cdf2f1a2e8617

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449731c3c6cdf2f1a2e8626
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:52:52.057351  /usr/bin/tpm2_getcap

    2023-04-26T18:52:52.100606  <3>[   12.751698] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:52:53.143410  <3>[   13.794698] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:52:53.788437  <3>[   14.439703] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:52:54.189241  <3>[   14.840698] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:52:55.235600  <3>[   15.886697] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:52:56.281488  <3>[   16.932699] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:52:57.327651  <3>[   17.978702] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:52:58.373683  <3>[   19.024698] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:52:59.419664  <3>[   20.070698] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64497340c2a875e77a2e8624

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4497340c2a875e77a2e8633
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:53:32.816277  /usr/bin/tpm2_getcap

    2023-04-26T18:53:32.837731  <3>[   11.375050] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:53:33.865766  <3>[   12.403030] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:53:34.893393  <3>[   13.431032] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:53:35.902906  <3>[   14.439859] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:53:35.924297  <3>[   14.462032] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:53:36.952791  <3>[   15.490031] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:53:37.980696  <3>[   16.518034] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:53:39.008590  <3>[   17.546028] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:53:40.036501  <3>[   18.574030] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6449735dd789a8c8722e8602

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449735dd789a8c8722e8611
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:53:59.470602  /usr/bin/tpm2_getcap

    2023-04-26T18:53:59.496661  <3>[    8.865026] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:54:00.524668  <3>[    9.893034] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:54:01.552977  <3>[   10.921032] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:54:02.580548  <3>[   11.949027] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:54:03.609867  <3>[   12.977030] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:54:04.636462  <3>[   14.005031] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:54:05.071980  <3>[   14.440029] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:54:05.664464  <3>[   15.033035] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:54:06.692299  <3>[   16.061031] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64497f8367c86208dc2e8619

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64497f8367c86208dc2e8=
61a
        failing since 221 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64496966c20fb93d702e85fc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496966c20fb93d702e8601
        failing since 29 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-26T18:11:45.066133  + set +x

    2023-04-26T18:11:45.073011  <8>[   11.197144] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10135214_1.4.2.3.1>

    2023-04-26T18:11:45.177094  / # #

    2023-04-26T18:11:45.277804  export SHELL=3D/bin/sh

    2023-04-26T18:11:45.278010  #

    2023-04-26T18:11:45.378498  / # export SHELL=3D/bin/sh. /lava-10135214/=
environment

    2023-04-26T18:11:45.378708  =


    2023-04-26T18:11:45.479198  / # . /lava-10135214/environment/lava-10135=
214/bin/lava-test-runner /lava-10135214/1

    2023-04-26T18:11:45.479496  =


    2023-04-26T18:11:45.485135  / # /lava-10135214/bin/lava-test-runner /la=
va-10135214/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496b33fb933e2bf12e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496b33fb933e2bf12e85f9
        failing since 29 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-26T18:19:14.344189  <8>[   11.113089] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10135269_1.4.2.3.1>

    2023-04-26T18:19:14.347506  + set +x

    2023-04-26T18:19:14.452114  / # #

    2023-04-26T18:19:14.552831  export SHELL=3D/bin/sh

    2023-04-26T18:19:14.553058  #

    2023-04-26T18:19:14.653585  / # export SHELL=3D/bin/sh. /lava-10135269/=
environment

    2023-04-26T18:19:14.653817  =


    2023-04-26T18:19:14.754426  / # . /lava-10135269/environment/lava-10135=
269/bin/lava-test-runner /lava-10135269/1

    2023-04-26T18:19:14.754819  =


    2023-04-26T18:19:14.760330  / # /lava-10135269/bin/lava-test-runner /la=
va-10135269/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644966446fc02d77012e8649

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44966446fc02d77012e864c
        failing since 1 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-26T17:58:13.071125  /usr/bin/tpm2_getcap

    2023-04-26T17:58:20.859701  <6>[   21.118650] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-26T17:58:21.898149  <3>[   22.160354] tpm tpm0: Data still avai=
lable

    2023-04-26T17:58:21.904851  <3>[   22.166336] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-26T17:58:23.534696  /lava-10134756/1/../bin/lava-test-case

    2023-04-26T17:58:23.546505  <8>[   23.804780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6449697bb768c348ad2e8613

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449697bb768c348ad2e8616
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:11:56.751302  /usr/bin/tpm2_getcap

    2023-04-26T18:11:59.770783  <6>[   15.166510] udevd (129) used greatest=
 stack depth: 13392 bytes left

    2023-04-26T18:12:04.701161  <6>[   20.096077] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-26T18:12:04.708164  <6>[   20.105051] platform MX98357A:00: def=
erred probe pending

    2023-04-26T18:12:06.248231  <3>[   21.646701] tpm tpm0: Data still avai=
lable

    2023-04-26T18:12:06.254706  <3>[   21.652243] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-26T18:12:07.135163  /lava-10135213/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496b08e3fca8afce2e8607

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4496b08e3fca8afce2e860a
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:18:20.416397  /usr/bin/tpm2_getcap

    2023-04-26T18:18:23.381060  <6>[   15.548804] udevd (122) used greatest=
 stack depth: 13240 bytes left

    2023-04-26T18:18:23.386884  <6>[   15.556145] udevd (130) used greatest=
 stack depth: 13152 bytes left

    2023-04-26T18:18:28.440183  <6>[   20.608126] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-26T18:18:28.446734  <6>[   20.617182] platform MX98357A:00: def=
erred probe pending

    2023-04-26T18:18:29.478358  <3>[   21.649997] tpm tpm0: Data still avai=
lable

    2023-04-26T18:18:29.485026  <3>[   21.655747] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-26T18:18:30.847608  /lava-10135298/1/../bin/lava-test-case

    2023-04-26T18:18:30.859432  <8>[   23.027845] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644965d213853834ac2e861c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-CM1=
400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-CM1=
400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44965d213853834ac2e861f
        failing since 1 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-26T17:56:13.370409  /usr/bin/tpm2_getcap

    2023-04-26T17:56:13.398649  <3>[   11.294152] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:14.425542  <3>[   12.321430] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:15.453263  <3>[   13.349437] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:16.051305  <3>[   13.947431] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:16.481740  <3>[   14.377435] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:17.508489  <3>[   15.404424] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:18.537757  <3>[   16.433194] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:19.565600  <3>[   17.460197] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:20.591605  <3>[   18.487180] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64496c68872c4a60232e862c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496c68872c4a60232e8631
        failing since 29 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-26T18:24:34.175457  <8>[    8.024259] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10135220_1.4.2.3.1>

    2023-04-26T18:24:34.178091  + set +x

    2023-04-26T18:24:34.281235  =


    2023-04-26T18:24:34.383238  / # #export SHELL=3D/bin/sh

    2023-04-26T18:24:34.383457  =


    2023-04-26T18:24:34.484098  / # export SHELL=3D/bin/sh. /lava-10135220/=
environment

    2023-04-26T18:24:34.484784  =


    2023-04-26T18:24:34.586128  / # . /lava-10135220/environment/lava-10135=
220/bin/lava-test-runner /lava-10135220/1

    2023-04-26T18:24:34.587644  =


    2023-04-26T18:24:34.592333  / # /lava-10135220/bin/lava-test-runner /la=
va-10135220/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496cad1abb8683ab2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496cad1abb8683ab2e85eb
        failing since 29 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-26T18:25:27.482172  <8>[   10.133542] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10135291_1.4.2.3.1>

    2023-04-26T18:25:27.485003  + set +x

    2023-04-26T18:25:27.586660  =


    2023-04-26T18:25:27.687283  / # #export SHELL=3D/bin/sh

    2023-04-26T18:25:27.687500  =


    2023-04-26T18:25:27.788088  / # export SHELL=3D/bin/sh. /lava-10135291/=
environment

    2023-04-26T18:25:27.788323  =


    2023-04-26T18:25:27.888853  / # . /lava-10135291/environment/lava-10135=
291/bin/lava-test-runner /lava-10135291/1

    2023-04-26T18:25:27.889229  =


    2023-04-26T18:25:27.893875  / # /lava-10135291/bin/lava-test-runner /la=
va-10135291/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644988804f2ff39c5c2e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644988804f2ff39c5c2e8=
5f1
        failing since 84 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64496e193a6861acd62e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496e193a6861acd62e8=
5ed
        failing since 29 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64497350d789a8c8722e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64497350d789a8c8722e8=
600
        failing since 26 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/64496a6d6da882cffe2e85e9

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64496a6d6da882c=
ffe2e85f0
        failing since 72 days (last pass: next-20230208, first fail: next-2=
0230213)
        30 lines

    2023-04-26T18:15:46.476862  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4cf8200 pointer offset 4 size 512
    2023-04-26T18:15:46.510974  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-26T18:15:46.511251  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-26T18:15:46.511405  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2fb000 allocated at load_module+0x6b0/0=
x1954
    2023-04-26T18:15:46.514071  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-26T18:15:46.618723  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-26T18:15:46.619009  kern  :emerg : Process udevd (pid: 66, stac=
k limit =3D 0x0df82f8f)
    2023-04-26T18:15:46.619207  kern  :emerg : Stack: (0xc8905cf8 to 0xc890=
6000)
    2023-04-26T18:15:46.619355  kern  :emerg : 5ce0:                       =
                                c4cf8200 c0777860
    2023-04-26T18:15:46.619608  kern  :emerg : 5d00: 00000000 c03b0750 0000=
0000 303c943d 0000005d 303c943d c0777860 bf2fb220 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644965a7a654033d312e85ee

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44965a7a654033d312e85f1
        failing since 1 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-26T17:55:30.781297  =


    2023-04-26T17:55:30.784192  + cd /opt/bootrr/libexec/bootrr

    2023-04-26T17:55:30.787114  + sh helpers/bootrr-auto

    2023-04-26T17:55:30.790695  /lava-10134722/1/../bin/lava-test-case

    2023-04-26T17:55:30.794148  /lava-10134722/1/../bin/lava-test-case

    2023-04-26T17:55:30.796383  /usr/bin/tpm2_getcap

    2023-04-26T17:55:30.814967  <3>[    9.660364] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:31.861977  <3>[   10.707351] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:32.909271  <3>[   11.755345] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:33.957728  <3>[   12.803345] tpm tpm0: Operation Timed=
 out
 =

    ... (8 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64496a584d8ce070942e861b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4496a584d8ce070942e861e
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:15:28.202746  /usr/bin/tpm2_getcap

    2023-04-26T18:15:28.237470  <3>[   13.133498] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:15:29.284771  <3>[   14.180481] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:15:30.333427  <3>[   15.229481] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:15:30.666520  <3>[   15.562483] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:15:31.358741  <3>[   16.255475] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:15:32.406374  <3>[   17.302487] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:15:33.454295  <3>[   18.350482] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:15:34.485184  <3>[   19.381472] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:15:35.514992  <3>[   20.411487] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496b0bc6a7147aeb2e8631

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4496b0bc6a7147aeb2e8634
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:18:18.601417  <8>[   13.934403] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-26T18:18:18.605226  /usr/bin/tpm2_getcap

    2023-04-26T18:18:18.639494  <3>[   13.978546] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:19.686672  <3>[   15.025538] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:20.734984  <3>[   16.073540] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:21.781917  <3>[   17.120544] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:21.802681  <3>[   17.141535] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:22.850977  <3>[   18.190537] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:23.899588  <3>[   19.238537] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:24.947091  <3>[   20.286536] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496cfd0b95e9ddbc2e8613

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4496cfd0b95e9ddbc2e8616
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:26:34.588513  /lava-<8>[    9.674684] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-26T18:26:34.591705  10134774/1/../bin/lava-test-case

    2023-04-26T18:26:34.595630  /lava-10134774/1/../bin/lava-test-case

    2023-04-26T18:26:34.597841  /usr/bin/tpm2_getcap

    2023-04-26T18:26:34.625222  <3>[    9.718374] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:26:35.654400  <3>[   10.747409] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:26:35.887538  <3>[   10.980362] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:26:36.679621  <3>[   11.772369] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:26:37.731681  <3>[   12.824361] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:26:38.760324  <3>[   13.853374] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64496d750dce5f1fdc2e8605

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4496d750dce5f1fdc2e8608
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:28:39.958905  + export 'PATH=3D/opt/bootrr/libexec/bootrr=
<8>[    9.158769] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall-cpus-are-online =
RESULT=3Dpass>

    2023-04-26T18:28:39.965482  /helpers:/lava-10135206/1/../bin:/sbin:/usr=
/sbin:/bin:/usr/bin'

    2023-04-26T18:28:39.968169  + cd /opt/bootrr/libexec/bootrr

    2023-04-26T18:28:39.970543  + sh helpers/bootrr-auto

    2023-04-26T18:28:39.974677  /lava-10135206/1/../bin/lava-test-case

    2023-04-26T18:28:39.979250  /lava-10135206/1/../bin/lava-test-case

    2023-04-26T18:28:39.980667  /usr/bin/tpm2_getcap

    2023-04-26T18:28:39.991888  <3>[    9.197576] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:28:41.021342  <3>[   10.227584] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:28:42.050257  <3>[   11.256573] tpm tpm0: Operation Timed=
 out
 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496ded8959c362d02e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4496ded8959c362d02e8609
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:30:36.891239  /usr/bin/tpm2_getcap

    2023-04-26T18:30:36.931619  <3>[    9.245521] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:30:37.958564  <3>[   10.272468] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:30:38.669526  <3>[   10.983477] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:30:38.983104  <3>[   11.296477] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:30:40.009664  <3>[   12.323510] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:30:41.037275  <3>[   13.351484] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:30:42.066216  <3>[   14.380476] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:30:43.094357  <3>[   15.408483] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:30:44.122320  <3>[   16.436481] tpm tpm0: Operation Timed=
 out
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644965cc223f092dbd2e85ee

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44965cc223f092dbd2e85fd
        failing since 1 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-26T17:56:06.181967  /usr/bin/tpm2_getcap

    2023-04-26T17:56:06.224608  <3>[   12.147955] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:07.488967  <3>[   13.412961] tpm tpm0: Data still avai=
lable

    2023-04-26T17:56:07.494908  <3>[   13.418045] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-26T17:56:16.592608  /lava-10134752/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644969e9112e54c7e52e863b

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44969ea112e54c7e52e864a
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:13:40.174652  /usr/bin/tpm2_getcap

    2023-04-26T18:13:40.194706  <3>[   11.632279] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:13:41.220316  <3>[   12.658279] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:13:42.248464  <3>[   13.686281] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:13:43.275259  <3>[   14.713284] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:13:43.514335  <3>[   14.952282] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:13:44.298520  <3>[   15.736286] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:13:45.326589  <3>[   16.764287] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:13:46.354315  <3>[   17.792286] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:13:47.382714  <3>[   18.820289] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496b0ce3fca8afce2e8618

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4496b0ce3fca8afce2e8627
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:18:27.609321  /usr/bin/tpm2_getcap

    2023-04-26T18:18:27.633822  <3>[    8.850280] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:28.661897  <3>[    9.878300] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:29.688824  <3>[   10.905283] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:30.716342  <3>[   11.933284] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:31.744756  <3>[   12.961284] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:32.772452  <3>[   13.989285] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:33.736282  <3>[   14.952282] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:33.795565  <3>[   15.012286] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:34.822778  <3>[   16.039281] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644965bda654033d312e8604

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44965bea654033d312e8613
        failing since 1 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-26T17:55:57.442470  /usr/bin/tpm2_getcap

    2023-04-26T17:55:57.485237  <3>[   11.463036] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:58.531084  <3>[   12.509035] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:59.577604  <3>[   13.555036] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:00.459897  <3>[   14.438037] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:00.622124  <3>[   14.600031] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:01.668147  <3>[   15.646034] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:02.713404  <3>[   16.691031] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:03.759593  <3>[   17.737036] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:56:04.805798  <3>[   18.783033] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6449697fb768c348ad2e861e

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449697fb768c348ad2e862f
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:11:57.356898  /usr/bin/tpm2_getcap

    2023-04-26T18:11:57.375676  <3>[   13.334282] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:11:58.404198  <3>[   14.362286] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:11:58.481207  <3>[   14.439283] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:11:59.427225  <3>[   15.385290] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:12:00.455753  <3>[   16.413298] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:12:01.483386  <3>[   17.441294] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:12:02.511554  <3>[   18.469291] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:12:03.539305  <3>[   19.497291] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:12:04.566767  <3>[   20.525291] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496b01c6a7147aeb2e8611

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4496b01c6a7147aeb2e8620
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:18:08.319684  /usr/bin/tpm2_getcap

    2023-04-26T18:18:08.342306  <3>[   11.056278] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:09.371108  <3>[   12.084315] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:10.397623  <3>[   13.111272] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:11.424451  <3>[   14.139277] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:11.726087  <3>[   14.440289] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:13.468376  <3>[   16.182286] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:14.494594  <3>[   17.209279] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:15.523882  <3>[   18.237288] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:18:16.550533  <3>[   19.264279] tpm tpm0: Operation Timed=
 out
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64496ba9e37ed20c132e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496ba9e37ed20c132e85ec
        failing since 29 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-26T18:21:15.481317  + <8>[   10.245744] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10135188_1.4.2.3.1>

    2023-04-26T18:21:15.481397  set +x

    2023-04-26T18:21:15.582588  #

    2023-04-26T18:21:15.582896  =


    2023-04-26T18:21:15.683529  / # #export SHELL=3D/bin/sh

    2023-04-26T18:21:15.683747  =


    2023-04-26T18:21:15.784217  / # export SHELL=3D/bin/sh. /lava-10135188/=
environment

    2023-04-26T18:21:15.784428  =


    2023-04-26T18:21:15.884921  / # . /lava-10135188/environment/lava-10135=
188/bin/lava-test-runner /lava-10135188/1

    2023-04-26T18:21:15.885245  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496bf944ec7cb9ab2e8639

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496bf944ec7cb9ab2e863e
        failing since 29 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-26T18:22:38.660611  + set +x

    2023-04-26T18:22:38.666929  <8>[   33.549351] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10135281_1.4.2.3.1>

    2023-04-26T18:22:38.771675  / # #

    2023-04-26T18:22:38.872372  export SHELL=3D/bin/sh

    2023-04-26T18:22:38.872590  #

    2023-04-26T18:22:38.973110  / # export SHELL=3D/bin/sh. /lava-10135281/=
environment

    2023-04-26T18:22:38.973376  =


    2023-04-26T18:22:39.074018  / # . /lava-10135281/environment/lava-10135=
281/bin/lava-test-runner /lava-10135281/1

    2023-04-26T18:22:39.074406  =


    2023-04-26T18:22:39.079122  / # /lava-10135281/bin/lava-test-runner /la=
va-10135281/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64496dd270e852f6c82e85fa

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496dd270e852f6c82e85ff
        failing since 29 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-26T18:30:22.546142  <8>[   10.353863] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10135181_1.4.2.3.1>

    2023-04-26T18:30:22.549540  + set +x

    2023-04-26T18:30:22.650710  #

    2023-04-26T18:30:22.650959  =


    2023-04-26T18:30:22.751505  / # #export SHELL=3D/bin/sh

    2023-04-26T18:30:22.751689  =


    2023-04-26T18:30:22.852206  / # export SHELL=3D/bin/sh. /lava-10135181/=
environment

    2023-04-26T18:30:22.852389  =


    2023-04-26T18:30:22.952917  / # . /lava-10135181/environment/lava-10135=
181/bin/lava-test-runner /lava-10135181/1

    2023-04-26T18:30:22.953172  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496e070cc62f207f2e85f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496e070cc62f207f2e85f6
        failing since 29 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-26T18:31:21.418643  <8>[   10.225380] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10135263_1.4.2.3.1>

    2023-04-26T18:31:21.421965  + set +x

    2023-04-26T18:31:21.530412  / # #

    2023-04-26T18:31:21.632825  export SHELL=3D/bin/sh

    2023-04-26T18:31:21.633059  #

    2023-04-26T18:31:21.733830  / # export SHELL=3D/bin/sh. /lava-10135263/=
environment

    2023-04-26T18:31:21.734563  =


    2023-04-26T18:31:21.836255  / # . /lava-10135263/environment/lava-10135=
263/bin/lava-test-runner /lava-10135263/1

    2023-04-26T18:31:21.837479  =


    2023-04-26T18:31:21.842946  / # /lava-10135263/bin/lava-test-runner /la=
va-10135263/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644965ac13853834ac2e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44965ac13853834ac2e85f7
        failing since 1 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-26T17:55:33.447036  /usr/bin/tpm2_getcap

    2023-04-26T17:55:33.472285  <3>[   12.806222] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:34.074134  <3>[   13.407485] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:34.499813  <3>[   13.833584] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:35.527750  <3>[   14.861223] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:36.554606  <3>[   15.888485] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:37.581944  <3>[   16.915222] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:38.608871  <3>[   17.942492] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:39.635862  <3>[   18.969485] tpm tpm0: Operation Timed=
 out

    2023-04-26T17:55:40.662733  <3>[   19.996509] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64496a9ff673c08f062e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496a9ff673c08f062e8=
5e8
        new failure (last pass: next-20230425) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64497081ec9b2ba8af2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64497081ec9b2ba8af2e8=
5f8
        failing since 379 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64496e9bffdd98eb362e868c

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496e9bffdd98eb362e868f
        new failure (last pass: next-20230418)

    2023-04-26T18:33:36.557242  / # #
    2023-04-26T18:33:36.659913  export SHELL=3D/bin/sh
    2023-04-26T18:33:36.660702  #
    2023-04-26T18:33:36.762632  / # export SHELL=3D/bin/sh. /lava-327110/en=
vironment
    2023-04-26T18:33:36.763282  =

    2023-04-26T18:33:36.864766  / # . /lava-327110/environment/lava-327110/=
bin/lava-test-runner /lava-327110/1
    2023-04-26T18:33:36.865309  =

    2023-04-26T18:33:36.883259  / # /lava-327110/bin/lava-test-runner /lava=
-327110/1
    2023-04-26T18:33:36.938118  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-26T18:33:36.938273  + cd /lava-327110/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/644=
96e9bffdd98eb362e869f
        new failure (last pass: next-20230418)

    2023-04-26T18:33:39.338763  /lava-327110/1/../bin/lava-test-case
    2023-04-26T18:33:39.339246  <8>[   18.295753] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64496a768e219a48732e8660

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496a768e219a48732e8663
        new failure (last pass: next-20230425)

    2023-04-26T18:15:58.382681  / # #
    2023-04-26T18:15:58.486042  export SHELL=3D/bin/sh
    2023-04-26T18:15:58.486777  #
    2023-04-26T18:15:58.588617  / # export SHELL=3D/bin/sh. /lava-327095/en=
vironment
    2023-04-26T18:15:58.589424  =

    2023-04-26T18:15:58.691285  / # . /lava-327095/environment/lava-327095/=
bin/lava-test-runner /lava-327095/1
    2023-04-26T18:15:58.692134  =

    2023-04-26T18:15:58.707964  / # /lava-327095/bin/lava-test-runner /lava=
-327095/1
    2023-04-26T18:15:58.762833  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-26T18:15:58.763068  + cd /lava-327095/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/644=
96a768e219a48732e8673
        new failure (last pass: next-20230425)

    2023-04-26T18:16:01.159891  /lava-327095/1/../bin/lava-test-case
    2023-04-26T18:16:01.160085  <8>[   18.396737] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-04-26T18:16:01.160239  /lava-327095/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496ee41c1cf33e262e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4496ee41c1cf33e262e85f9
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-26T18:34:56.695089  /usr/bin/tpm2_getcap

    2023-04-26T18:34:56.722028  <3>[   10.744363] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:34:57.747526  <3>[   11.770390] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:34:58.775317  <3>[   12.797642] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:34:59.805009  <3>[   13.827363] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:35:00.830588  <3>[   14.853364] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:35:00.899060  <3>[   14.921645] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:35:01.856777  <3>[   15.879366] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:35:02.883016  <3>[   16.905378] tpm tpm0: Operation Timed=
 out

    2023-04-26T18:35:03.909970  <3>[   17.931392] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64496d5cb5d02dfbd52e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496d5cb5d02dfbd52e8=
5fc
        failing since 92 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64496a4481071cff622e87c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496a4481071cff622e8=
7c5
        failing since 8 days (last pass: next-20230404, first fail: next-20=
230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64496d2a8c709c6e572e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496d2a8c709c6e572e8=
5f6
        failing since 77 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64496ea5749f9428c92e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496ea5749f9428c92e8=
5e7
        failing since 26 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64496a63e03ed86e342e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496a63e03ed86e342e8=
609
        failing since 8 days (last pass: next-20230404, first fail: next-20=
230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64496d5bb5d02dfbd52e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496d5bb5d02dfbd52e8=
5f9
        failing since 77 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64496eb90073fe08732e861b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496eb90073fe08732e8=
61c
        failing since 12 days (last pass: next-20230411, first fail: v6.3-r=
c6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64497540a1210c73f32e861a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64497540a1210c73f32e8=
61b
        failing since 77 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644969b210c63cd2c42e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644969b210c63cd2c42e8=
609
        new failure (last pass: next-20230425) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64496f8f9f144e52572e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496f8f9f144e52572e8=
5ef
        failing since 1 day (last pass: next-20230424, first fail: next-202=
30425) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/644967384e36d59f422e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644967384e36d59f422e8=
5ef
        failing since 15 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/644965e5223f092dbd2e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644965e5223f092dbd2e8=
609
        failing since 15 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644971618a7f9b07d92e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644971618a7f9b07d92e8=
60e
        failing since 155 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6449705d7ae2e1449d2e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6449705d7ae2e1449d2e8=
60b
        failing since 155 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64496bd291d50adf082e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496bd291d50adf082e8=
5ee
        failing since 15 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/64496b1c27b56360932e8638

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64496b1d27b5636=
0932e868f
        failing since 8 days (last pass: next-20230404, first fail: next-20=
230417)
        2 lines

    2023-04-26T18:18:34.678773  kern  :alert : Mem abort in<8>[   19.238070=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-04-26T18:18:34.679561  fo:

    2023-04-26T18:18:34.683218  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-26T18:18:34.689310  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-26T18:18:34.692552  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-26T18:18:34.696765  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-26T18:18:34.701690  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-26T18:18:34.705294  kern  :alert : Data abort info:

    2023-04-26T18:18:34.709159  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-26T18:18:34.712578  kern  :alert :   CM =3D 0, WnR =3D 0
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64496b1d27b5636=
0932e8690
        failing since 8 days (last pass: next-20230404, first fail: next-20=
230417)
        12 lines

    2023-04-26T18:18:34.666583  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64496cc28acab4dc742e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496cc28acab4dc742e8=
604
        failing since 77 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/64496d61b5d02dfbd52e8605

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64496d61b5d02df=
bd52e865c
        failing since 15 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-26T18:28:16.446835  fo:

    2023-04-26T18:28:16.450751  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-26T18:28:16.456832  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-26T18:28:16.460762  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-26T18:28:16.464415  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-26T18:28:16.469447  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-26T18:28:16.473143  kern  :alert : Data abort info:

    2023-04-26T18:28:16.477278  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-26T18:28:16.480339  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-26T18:28:16.493372  kern  :alert : user pgtable: 4k pages<8>[  =
 19.262550] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64496d61b5d02df=
bd52e865d
        failing since 15 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-26T18:28:16.434111  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-26T18:28:16.446345  kern  :alert : Mem abort in<8>[   19.214897=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64496ead749f9428c92e8601

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64496ead749f942=
8c92e8608
        failing since 15 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-26T18:34:16.592875  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-26T18:34:16.593383  kern  :emerg : Code: 97f612df f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-04-26T18:34:16.593697  <8>[   20.558878] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-26T18:34:16.593987  + set +x

    2023-04-26T18:34:16.594265  <8>[   20.560939] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10135528_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64496ead749f942=
8c92e8609
        failing since 15 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-26T18:34:16.568058  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-26T18:34:16.568580  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-26T18:34:16.568914  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000000615a000

    2023-04-26T18:34:16.569227  kern  :alert : [0000000000000008] pgd=3D080=
000000a052003, p4d=3D080000000a052003, pud=3D080000000a053003, pmd=3D000000=
0000000000

    2023-04-26T18:34:16.569600  <8>[   20.535478] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64496aa26c1d6eef9a2e85e8

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64496aa26c1d6ee=
f9a2e85ef
        failing since 15 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-04-26T18:16:47.102094  <8>[   23.803349] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-26T18:16:47.102653  + set +x

    2023-04-26T18:16:47.103012  <8>[   23.805739] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10135244_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64496aa26c1d6ee=
f9a2e85f0
        failing since 15 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-04-26T18:16:47.032244  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-26T18:16:47.032771  kern  :alert : Mem abort info:

    2023-04-26T18:16:47.033112  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-26T18:16:47.033459  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-26T18:16:47.033770  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-26T18:16:47.034069  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-26T18:16:47.034358  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-26T18:16:47.034645  kern  :alert : Data abort info:

    2023-04-26T18:16:47.034926  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-26T18:16:47.035209  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64496c9ef04cfbc9db2e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496c9ef04cfbc9db2e8=
609
        failing since 77 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/64496a9dfbc40b22a12e85e9

  Results:     39 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mmc2-probed: https://kernelci.org/test/case/id/64496a9d=
fbc40b22a12e860b
        new failure (last pass: next-20230425)

    2023-04-26T18:16:53.939825  /lava-391120/1/../bin/lava-test-case
    2023-04-26T18:16:53.951760  <8>[   22.887307] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmmc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mmc0-probed: https://kernelci.org/test/case/id/64496a9d=
fbc40b22a12e860c
        new failure (last pass: next-20230425)

    2023-04-26T18:16:52.888447  /lava-391120/1/../bin/lava-test-case
    2023-04-26T18:16:52.899830  <8>[   21.836079] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmmc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64496a9dfbc40b22a12e8612
        new failure (last pass: next-20230425)

    2023-04-26T18:16:50.083244  <8>[   19.020358] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 391120_1.5.2.4.1>
    2023-04-26T18:16:50.202856  / # #
    2023-04-26T18:16:50.306417  export SHELL=3D/bin/sh
    2023-04-26T18:16:50.307396  #
    2023-04-26T18:16:50.409363  / # export SHELL=3D/bin/sh. /lava-391120/en=
vironment
    2023-04-26T18:16:50.410780  =

    2023-04-26T18:16:50.513224  / # . /lava-391120/environment/lava-391120/=
bin/lava-test-runner /lava-391120/1
    2023-04-26T18:16:50.515360  =

    2023-04-26T18:16:50.517929  / # /lava-391120/bin/lava-test-runner /lava=
-391120/1
    2023-04-26T18:16:50.578168  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =20
