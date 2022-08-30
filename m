Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666B15A5A84
	for <lists+linux-next@lfdr.de>; Tue, 30 Aug 2022 06:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiH3ECh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Aug 2022 00:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiH3ECf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Aug 2022 00:02:35 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2107B1DE
        for <linux-next@vger.kernel.org>; Mon, 29 Aug 2022 21:02:33 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 69so7901376pgb.13
        for <linux-next@vger.kernel.org>; Mon, 29 Aug 2022 21:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=d/n8DmNUVoDiGxaFJspPUwa1kYHkcMBx8GIgvIYT6BE=;
        b=SMWDIb6s6VrlguTFgrAlk6qZg4Cuz9fLtt4YMSiMyl8lgsfl4tDZOyyubyKADHg5FQ
         YH1t645c4BWknjrS9R+DSfDOT9p44kZWwHE8EzpL+7BG4pC8nkdiCgR1LN/xajRTTs1p
         qNEUAG+fXAPNeyvtY+LNJT2uGsiO0WC0wrYpoWCMAGcCGvLEPkrlAxgKOw0nDlpO4L+B
         F6TkC4OvKJXhi4y8GDtgxQnapNLPNtPTFOpsLACG7BO6q5ygmEUSgxeuM2NQ1L8z61ri
         sN90/2Yju0gws5GBvike2jsZWgM0b14FD4xwsqq5sAUFnymPPlSypO3ADSeeY7IkYVbv
         PJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=d/n8DmNUVoDiGxaFJspPUwa1kYHkcMBx8GIgvIYT6BE=;
        b=DnWdBaJc8QfhxshXWTfFv9LPK/+UbcEC9IobIyI8gxAf4pMXHUoPFyn5q01FOTO3bj
         qZ+73FKDF91/f1rfTe3T8/5mVxrenP8Q9J2BVkNZikEil+FKdpYhW5H6khUwvLnmgcPk
         kKt9T6I8h7v/W5fGpJ9cRWi7wPMHgaTlxia/yECRq4sDx5fqFWeyjnnLcOeWTJt/fY6u
         OaFgiTyYwXsTHj8ThBU6j8u2s94XSEt/AQ6uAiKdLpenpqHwe/9HVoqgLzSZufStRwuT
         1n4wjMja6z20nfmgRXpuERJpURmFwHjhj4TlzdlLcgq1RT77LL0fnfjN3dJ+u0/nCRNN
         1A5Q==
X-Gm-Message-State: ACgBeo3vw02LQ7Tni5RGOPmug4n7nkl/Bdf8mdFOpKvlX+fGzS/htnFp
        7Vzr2O3Fd2URhLvQqmPD5tZ0l3OoFHqwMz9zjxk=
X-Google-Smtp-Source: AA6agR5+jtRpAahNKh2rUw+uxHrsVOS6O6Lc4P0EkpJpvwWyUIGJ/18/0s/PcDo1cq6HdAl09cY/5A==
X-Received: by 2002:a05:6a00:301c:b0:52d:bff9:5004 with SMTP id ay28-20020a056a00301c00b0052dbff95004mr19637315pfb.84.1661832152843;
        Mon, 29 Aug 2022 21:02:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b005383a0d9699sm3301937pfb.144.2022.08.29.21.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 21:02:32 -0700 (PDT)
Message-ID: <630d8bd8.620a0220.6c98b.62a2@mx.google.com>
Date:   Mon, 29 Aug 2022 21:02:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc3-304-gd62f6b276548
Subject: next/pending-fixes baseline: 541 runs,
 20 regressions (v6.0-rc3-304-gd62f6b276548)
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

next/pending-fixes baseline: 541 runs, 20 regressions (v6.0-rc3-304-gd62f6b=
276548)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm-vexpress-a15        | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-rc3-304-gd62f6b276548/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-rc3-304-gd62f6b276548
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d62f6b276548792688dc5a0606e8f4b7539b6da8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/630d54d2a0f8826c85355664

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/630d54d2a0f8826=
c8535566c
        failing since 218 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-08-30T00:07:21.376506  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-08-30T00:07:21.376846  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-08-30T00:07:21.379629  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-08-30T00:07:21.424241  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630d56304d991a70d6355655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d56304d991a70d6355=
656
        failing since 24 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630d678b94ead759ac355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d678b94ead759ac355=
643
        failing since 26 days (last pass: v5.19-1483-gffa33bbcf63ea, first =
fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630d6c2fa689f0a59535564c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d6c2fa689f0a595355=
64d
        new failure (last pass: v6.0-rc2-232-gffc62c393637) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630d5ad137a587428d355665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/ba=
seline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/ba=
seline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d5ad137a587428d355=
666
        new failure (last pass: v6.0-rc2-232-gffc62c393637) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630d7d8f48fc353ae4355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d7d8f48fc353ae4355=
643
        failing since 122 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/630d692bde11da39a03556a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d692bde11da39a0355=
6a3
        new failure (last pass: v5.19-14056-g3b7c069e0e1e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/630d573ed19a6d7466355657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d573ed19a6d7466355=
658
        new failure (last pass: v6.0-rc2-232-gffc62c393637) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/630d551fef40ea987f355663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d551fef40ea987f355=
664
        failing since 24 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630d53a6378f1b739e355653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d53a6378f1b739e355=
654
        failing since 24 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630d55f2d920c809b635565f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d55f2d920c809b6355=
660
        failing since 24 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630d53cfcb960794d4355675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d53cfcb960794d4355=
676
        failing since 24 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630d5606ca4c4279a4355697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d5606ca4c4279a4355=
698
        failing since 24 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630d6e23bc6834d32b355643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d6e23bc6834d32b355=
644
        new failure (last pass: v6.0-rc2-232-gffc62c393637) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/630d54de322fe275f1355657

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/630d54de322fe275f1355679
        failing since 182 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-08-30T00:07:41.242627  /lava-7132070/1/../bin/lava-test-case
    2022-08-30T00:07:41.252315  <8>[   36.719481] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/630d54de322fe275f135569c
        failing since 90 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-30T00:07:39.057675  /lava-7132070/1/../bin/lava-test-case
    2022-08-30T00:07:39.069270  <8>[   34.535139] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/630d54de322fe275f135569d
        failing since 90 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-30T00:07:38.028542  /lava-7132070/1/../bin/lava-test-case
    2022-08-30T00:07:38.038575  <8>[   33.504372] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/630d54de322fe275f135569e
        failing since 90 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-30T00:07:36.163110  <4>[   31.627824] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-08-30T00:07:36.998052  /lava-7132070/1/../bin/lava-test-case
    2022-08-30T00:07:37.010731  <8>[   32.476327] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/630d54408cf19e209c35565c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d54408cf19e209c355=
65d
        failing since 6 days (last pass: v6.0-rc1-607-g72d0e40cc07e, first =
fail: v6.0-rc2-232-gffc62c393637) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/630d576e0b373b7947355647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc3-30=
4-gd62f6b276548/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630d576e0b373b7947355=
648
        new failure (last pass: v6.0-rc2-232-gffc62c393637) =

 =20
