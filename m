Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819907293F4
	for <lists+linux-next@lfdr.de>; Fri,  9 Jun 2023 10:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbjFII5J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Jun 2023 04:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241093AbjFII4b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jun 2023 04:56:31 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B84E3596
        for <linux-next@vger.kernel.org>; Fri,  9 Jun 2023 01:55:30 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b1bf83095aso4262935ad.3
        for <linux-next@vger.kernel.org>; Fri, 09 Jun 2023 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686300929; x=1688892929;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wCjTJ6IOmyjblEAU9+F1ZeKuAuzXL8Ns5ROuHdIvD9s=;
        b=kRpfQU/U8vfRpkmvb4FpRLFkJS9Jw8bZLWNkEMc5g7nTZJhVPbCACD2FTxrvSBNuQ0
         Q5uSAtRw436wweka8X/th3jtrjVxMLXOZ4v57dyPTbqbSD2Z8YD2XIyjefFuQWas9qQF
         OyWwgML1vCjEWUu+EZALFPfzyB9ZKNzEz83VVvQX+EhFG4H3Cukv7COi41EMicFYEhIg
         Q8Z4p7qOMgqk0dTmzIfAJujMqWBzLzsDAfIztnz5wTe+e10IRiY1QcjPpbpI5R/cxQ5M
         /s29UKJs5g6/Hxv8UBVQgqbXkzCmfQWDfZYtjdBfelDYjfqet6S208157C/Uw340cqOI
         AA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686300929; x=1688892929;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCjTJ6IOmyjblEAU9+F1ZeKuAuzXL8Ns5ROuHdIvD9s=;
        b=WuOjDJDcu3Aq/Caqdhib157Qz3dfscLQSAoy51Q2Jb/cEKQIOaHgAmPYk2shtaoCJU
         NI3VCa6YfQ1khbmyd69wYFCThSVyt3zF2r0OxX7xyaIuN+4XPqgKMcMJL1AqzMXVZF0K
         VFY7aiNHLqBNEHs8tmveD91ScAJpCADcyDaK1Tb+7afmyfACX9+wUow28HbJxOWP0oU7
         kfgt/+1ihHBN5uv1+4G106PCPg2FJfZUajAzPhXWafDEyI4ibJXCth1OZuWVUTMwpof0
         65Rs2ZTkPqY2oeyfT2HlTIKphZJviQXUk4i+6JpRIocz6nrSW4iKtSlQnGBXDShCub9l
         eyTg==
X-Gm-Message-State: AC+VfDzKr6y6gkMdeDdlQFAK3p3Ih7KGd5EnR0A9bRPndG9hIaqhfFBr
        fbRCXjJJCjMAi+Co62woyN3meBuMq5zCBAoOsgneeg==
X-Google-Smtp-Source: ACHHUZ7jOEmzsz9UsdW0dYqCL7APbqsROutOJ68khquG2LTie60bEYmGNbJ3LUMTfX0be98ivk+jIA==
X-Received: by 2002:a17:902:c40a:b0:1b1:753a:49ce with SMTP id k10-20020a170902c40a00b001b1753a49cemr651931plk.53.1686300926794;
        Fri, 09 Jun 2023 01:55:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902854b00b001b04dfbe5d0sm2701245plo.309.2023.06.09.01.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:55:25 -0700 (PDT)
Message-ID: <6482e8fd.170a0220.6d6d2.5665@mx.google.com>
Date:   Fri, 09 Jun 2023 01:55:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230609
Subject: next/master baseline: 671 runs, 93 regressions (next-20230609)
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

next/master baseline: 671 runs, 93 regressions (next-20230609)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | multi_=
v5_defconfig           | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

beaglebone-black             | arm    | lab-broonie     | clang-17 | multi_=
v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | clang-17 | multi_=
v7_defconfig           | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 3          =

rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230609/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230609
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      53ab6975c12d1ad86c599a8927e8c698b144d669 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b852514d59a5a930612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b852514d59a5a9306=
12f
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b949c0a855036b30614c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b949c0a855036b306=
14d
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b3b6d9451757053061b1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b3b6d9451757053061b6
        failing since 72 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-09T05:07:52.227049  <8>[   11.681958] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10653669_1.4.2.3.1>

    2023-06-09T05:07:52.230039  + set +x

    2023-06-09T05:07:52.331220  #

    2023-06-09T05:07:52.431992  / # #export SHELL=3D/bin/sh

    2023-06-09T05:07:52.432162  =


    2023-06-09T05:07:52.532677  / # export SHELL=3D/bin/sh. /lava-10653669/=
environment

    2023-06-09T05:07:52.532856  =


    2023-06-09T05:07:52.633351  / # . /lava-10653669/environment/lava-10653=
669/bin/lava-test-runner /lava-10653669/1

    2023-06-09T05:07:52.633624  =


    2023-06-09T05:07:52.639610  / # /lava-10653669/bin/lava-test-runner /la=
va-10653669/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b41af78e4fbd01306131

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b41af78e4fbd01306136
        failing since 72 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-06-09T05:09:32.436024  + set +x

    2023-06-09T05:09:32.442632  <8>[   11.652694] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10653768_1.4.2.3.1>

    2023-06-09T05:09:32.544284  #

    2023-06-09T05:09:32.645092  / # #export SHELL=3D/bin/sh

    2023-06-09T05:09:32.645350  =


    2023-06-09T05:09:32.745961  / # export SHELL=3D/bin/sh. /lava-10653768/=
environment

    2023-06-09T05:09:32.746206  =


    2023-06-09T05:09:32.846714  / # . /lava-10653768/environment/lava-10653=
768/bin/lava-test-runner /lava-10653768/1

    2023-06-09T05:09:32.847012  =


    2023-06-09T05:09:32.852217  / # /lava-10653768/bin/lava-test-runner /la=
va-10653768/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b95787753920f13062b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b95787753920f1306=
2b9
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b84fc79cec9ad33061ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b84fc79cec9ad3306=
1ee
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b38fd18ce74455306166

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b38fd18ce7445530616b
        failing since 72 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-09T05:07:11.772231  <8>[   10.901547] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10653652_1.4.2.3.1>

    2023-06-09T05:07:11.775255  + set +x

    2023-06-09T05:07:11.876396  #

    2023-06-09T05:07:11.977329  / # #export SHELL=3D/bin/sh

    2023-06-09T05:07:11.977559  =


    2023-06-09T05:07:12.078146  / # export SHELL=3D/bin/sh. /lava-10653652/=
environment

    2023-06-09T05:07:12.078315  =


    2023-06-09T05:07:12.178835  / # . /lava-10653652/environment/lava-10653=
652/bin/lava-test-runner /lava-10653652/1

    2023-06-09T05:07:12.179082  =


    2023-06-09T05:07:12.183658  / # /lava-10653652/bin/lava-test-runner /la=
va-10653652/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b3cb40a23210b130617b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b3cb40a23210b1306180
        failing since 72 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-06-09T05:08:14.127483  <8>[   10.784053] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10653776_1.4.2.3.1>

    2023-06-09T05:08:14.130895  + set +x

    2023-06-09T05:08:14.235992  =


    2023-06-09T05:08:14.336900  / # #export SHELL=3D/bin/sh

    2023-06-09T05:08:14.337621  =


    2023-06-09T05:08:14.438742  / # export SHELL=3D/bin/sh. /lava-10653776/=
environment

    2023-06-09T05:08:14.438986  =


    2023-06-09T05:08:14.539530  / # . /lava-10653776/environment/lava-10653=
776/bin/lava-test-runner /lava-10653776/1

    2023-06-09T05:08:14.539912  =


    2023-06-09T05:08:14.545227  / # /lava-10653776/bin/lava-test-runner /la=
va-10653776/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b850c79cec9ad33061f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b850c79cec9ad3306=
1f1
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b2611de419bcee30613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b2611de419bcee306=
140
        failing since 128 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4a173e548721630613b

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6482b4a173e5487216306157
        failing since 4 days (last pass: next-20230601, first fail: next-20=
230605)

    2023-06-09T05:11:51.696324  /lava-584451/1/../bin/lava-test-case
    2023-06-09T05:11:51.740974  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | multi_=
v5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4144a92cd8728306191

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6482b4144a92cd87283061ab
        failing since 4 days (last pass: next-20230601, first fail: next-20=
230605)

    2023-06-09T05:09:12.641482  /lava-584336/1/../bin/lava-test-case
    2023-06-09T05:09:12.681974  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b3ce870fe6869b306150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b3ce870fe6869b306=
151
        failing since 3 days (last pass: next-20230601, first fail: next-20=
230605) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b470cc48251a37306152

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b470cc48251a37306=
153
        failing since 72 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b458f9f734e392306135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b458f9f734e392306=
136
        failing since 69 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b5b98b59d2bbd230616c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b5b98b59d2bbd2306=
16d
        new failure (last pass: next-20230608) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b55c251ccce42e30613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230529071827+755a=
73cd6f91-1~exp1~20230529071931.681))
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b55c251ccce42e306=
140
        failing since 1 day (last pass: next-20230605, first fail: next-202=
30607) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b305d84b392b74306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b305d84b392b74306=
131
        new failure (last pass: next-20230608) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b5461064a3c63d306141

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6482b5461064a3c=
63d306148
        failing since 115 days (last pass: next-20230208, first fail: next-=
20230213)
        30 lines

    2023-06-09T05:14:04.044553  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4c57a00 pointer offset 4 size 512
    2023-06-09T05:14:04.078965  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-09T05:14:04.079688  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-09T05:14:04.079935  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf13b000 allocated at load_module+0x6b0/0=
x1954
    2023-06-09T05:14:04.081891  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-09T05:14:04.186152  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-09T05:14:04.186465  kern  :emerg : Process udevd (pid: 65, stac=
k limit =3D 0x204a596e)
    2023-06-09T05:14:04.186686  kern  :emerg : Stack: (0xc890dcf8 to 0xc890=
e000)
    2023-06-09T05:14:04.186867  kern  :emerg : dce0:                       =
                                c4c57a00 c0773820
    2023-06-09T05:14:04.187042  kern  :emerg : dd00: 00000000 c03b2ab8 0000=
0000 62067199 0000005d 62067199 c0773820 bf13b220 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b943867f0fdba4306191

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b943867f0fdba4306=
192
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b944c0a855036b30613a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b944c0a855036b306=
13b
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b83ec79cec9ad330612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b83ec79cec9ad3306=
12f
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b83fc79cec9ad3306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b83fc79cec9ad3306=
132
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b3e21acb885cf9306182

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b3e21acb885cf9306187
        failing since 72 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-06-09T05:08:34.407412  + set +x

    2023-06-09T05:08:34.414009  <8>[   10.994330] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10653810_1.4.2.3.1>

    2023-06-09T05:08:34.518629  / # #

    2023-06-09T05:08:34.619279  export SHELL=3D/bin/sh

    2023-06-09T05:08:34.619520  #

    2023-06-09T05:08:34.720027  / # export SHELL=3D/bin/sh. /lava-10653810/=
environment

    2023-06-09T05:08:34.720245  =


    2023-06-09T05:08:34.820806  / # . /lava-10653810/environment/lava-10653=
810/bin/lava-test-runner /lava-10653810/1

    2023-06-09T05:08:34.821119  =


    2023-06-09T05:08:34.826207  / # /lava-10653810/bin/lava-test-runner /la=
va-10653810/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b3e37cbb13347730615e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b3e37cbb133477306163
        failing since 72 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-09T05:08:36.711669  + set +x

    2023-06-09T05:08:36.718178  <8>[   17.383968] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10653675_1.4.2.3.1>

    2023-06-09T05:08:36.827632  / # #

    2023-06-09T05:08:36.930064  export SHELL=3D/bin/sh

    2023-06-09T05:08:36.930813  #

    2023-06-09T05:08:37.032304  / # export SHELL=3D/bin/sh. /lava-10653675/=
environment

    2023-06-09T05:08:37.033051  =


    2023-06-09T05:08:37.134590  / # . /lava-10653675/environment/lava-10653=
675/bin/lava-test-runner /lava-10653675/1

    2023-06-09T05:08:37.135808  =


    2023-06-09T05:08:37.140470  / # /lava-10653675/bin/lava-test-runner /la=
va-10653675/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b37105d8090e8b30614b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b37105d8090e8b306150
        failing since 72 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-09T05:06:45.179189  + set<8>[   11.444894] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10653717_1.4.2.3.1>

    2023-06-09T05:06:45.179631   +x

    2023-06-09T05:06:45.286553  #

    2023-06-09T05:06:45.389204  / # #export SHELL=3D/bin/sh

    2023-06-09T05:06:45.389886  =


    2023-06-09T05:06:45.491320  / # export SHELL=3D/bin/sh. /lava-10653717/=
environment

    2023-06-09T05:06:45.492189  =


    2023-06-09T05:06:45.593680  / # . /lava-10653717/environment/lava-10653=
717/bin/lava-test-runner /lava-10653717/1

    2023-06-09T05:06:45.594864  =


    2023-06-09T05:06:45.599975  / # /lava-10653717/bin/lava-test-runner /la=
va-10653717/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b851607903f920306181

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b851607903f920306=
182
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b763a156cac942306150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b763a156cac942306=
151
        failing since 303 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b7151cb0544b8930616b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b7151cb0544b89306=
16c
        failing since 290 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b536a3817dcd6c306169

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b536a3817dcd6c306=
16a
        failing since 423 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b528f9b37ddc16306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b528f9b37ddc16306=
134
        new failure (last pass: next-20230608) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6482b3779ffb0b6437306197

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b3779ffb0b643730619a
        new failure (last pass: next-20230607)

    2023-06-09T05:06:54.302576  / # #
    2023-06-09T05:06:54.405499  export SHELL=3D/bin/sh
    2023-06-09T05:06:54.406308  #
    2023-06-09T05:06:54.508173  / # export SHELL=3D/bin/sh. /lava-353747/en=
vironment
    2023-06-09T05:06:54.508984  =

    2023-06-09T05:06:54.610963  / # . /lava-353747/environment/lava-353747/=
bin/lava-test-runner /lava-353747/1
    2023-06-09T05:06:54.612315  =

    2023-06-09T05:06:54.628310  / # /lava-353747/bin/lava-test-runner /lava=
-353747/1
    2023-06-09T05:06:54.683178  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-09T05:06:54.683680  + cd /lava-353747/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/648=
2b3779ffb0b64373061aa
        new failure (last pass: next-20230607)

    2023-06-09T05:06:57.073102  /lava-353747/1/../bin/lava-test-case
    2023-06-09T05:06:57.073621  <8>[   17.937668] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-06-09T05:06:57.073964  /lava-353747/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b83d607903f920306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b83d607903f920306=
13a
        failing since 23 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4eb3260683d2b306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b4eb3260683d2b306=
131
        failing since 121 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b5b68b59d2bbd2306169

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b5b68b59d2bbd2306=
16a
        failing since 29 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230511) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b66171bc506057306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b66171bc506057306=
144
        failing since 49 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b523233328d10f30619a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b523233328d10f306=
19b
        failing since 134 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b41f3dcb2d8b70306146

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b41f3dcb2d8b70306=
147
        failing since 134 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4361ea1c385e230612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b4361ea1c385e2306=
12f
        failing since 122 days (last pass: next-20230203, first fail: next-=
20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b47c6270bfc03e306145

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b47c6270bfc03e306=
146
        failing since 121 days (last pass: next-20230203, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4bd04bfe4b6813061be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b4bd04bfe4b681306=
1bf
        failing since 121 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b444d4d06075493061e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b444d4d0607549306=
1e4
        failing since 121 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b2144a31ddf349306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b2144a31ddf349306=
134
        new failure (last pass: next-20230608) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482c01297d8bcb6c330612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482c01297d8bcb6c3306=
12f
        failing since 121 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b81205c4f24ec9306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b81205c4f24ec9306=
131
        failing since 268 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b8c4bc17ec4707306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b8c4bc17ec4707306=
145
        failing since 268 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b8886135d045ef30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b8886135d045ef306=
12f
        failing since 268 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b74854c61a6a10306138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b74854c61a6a10306=
139
        failing since 266 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b7988d8a369888306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b7988d8a369888306=
132
        failing since 266 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b770423640544c306141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b770423640544c306=
142
        failing since 266 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b732da4d690936306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b732da4d690936306=
134
        failing since 268 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b7998d8a369888306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b7998d8a369888306=
135
        failing since 268 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b8128d7c3aec5e306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b8128d7c3aec5e306=
135
        failing since 268 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b7fed622f362ac30613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b7fed622f362ac306=
13d
        failing since 268 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b7c02f55e725263061bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b7c02f55e72526306=
1bd
        failing since 268 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b810934f6b5899306142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b810934f6b5899306=
143
        failing since 268 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b1baf5baaff5f0306153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b1baf5baaff5f0306=
154
        new failure (last pass: next-20230608) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b40ffbb8038ea4306155

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b40ffbb8038ea4306=
156
        new failure (last pass: next-20230608) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b69ff65cce1bf730616c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b69ff65cce1bf7306=
16d
        new failure (last pass: next-20230608) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b5d74aa5d5dccd306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b5d74aa5d5dccd306=
145
        failing since 198 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | clang-17 | multi_=
v7_defconfig           | 3          =


  Details:     https://kernelci.org/test/plan/id/6482b6134c68551ccd30614a

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230529071827+755a=
73cd6f91-1~exp1~20230529071931.681))
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/6482b6134c68551ccd306160
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:18:34.978215  /lava-10653839/1/../bin/lava-test-case<8>[ =
  21.644927] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-iodomain-driver-=
present RESULT=3Dpass>

    2023-06-09T05:18:34.978434  =


    2023-06-09T05:18:35.992523  /lava-10653839/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/6482b6134c68551ccd306176
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:18:33.514198  <8>[   20.180919] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmmc_rockchip-sdmmc-probed RESULT=3Dfail>

    2023-06-09T05:18:34.528400  /lava-10653839/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/6482b6134c68551ccd306177
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:18:32.489861  /lava-1<8>[   19.155601] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-06-09T05:18:32.492954  0653839/1/../bin/lava-test-case

    2023-06-09T05:18:32.498821  BusyBox v1.31.1 (2023-05-27 14:14:16 UTC) m=
ulti-call binary.

    2023-06-09T05:18:32.499064  =


    2023-06-09T05:18:32.503477  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-09T05:18:32.503696  =


    2023-06-09T05:18:32.508619  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-09T05:18:32.511362  FIRST, INC default to 1.

    2023-06-09T05:18:32.511419  =


    2023-06-09T05:18:32.514912  	-w	Pad to last with leading zeros
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 3          =


  Details:     https://kernelci.org/test/plan/id/6482b22a88c97e4804306144

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/6482b22a88c97e480430615a
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:01:54.093676  =


    2023-06-09T05:01:55.107328  /lava-10653593/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/6482b22a88c97e4804306170
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:01:53.638447  /lava-10653593/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/6482b22a88c97e4804306171
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:01:51.603506  0653593/1/../bin/lava-test-case

    2023-06-09T05:01:51.609482  BusyBox v1.31.1 (2023-05-27 14:14:16 UTC) m=
ulti-call binary.

    2023-06-09T05:01:51.609534  =


    2023-06-09T05:01:51.613821  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-09T05:01:51.614466  =


    2023-06-09T05:01:51.619222  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-09T05:01:51.621733  FIRST, INC default to 1.

    2023-06-09T05:01:51.621972  =


    2023-06-09T05:01:51.625485  	-w	Pad to last with leading zeros

    2023-06-09T05:01:51.627901  	-s SEP	String separator
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/6482b55f251ccce42e306144

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/6482b55f251ccce42e30615a
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:15:33.971751  <8>[   21.522681] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-driver-present RESULT=3Dpass>

    2023-06-09T05:15:34.985033  /lava-10653829/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/6482b55f251ccce42e306170
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:15:32.518102  <8>[   20.069403] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmmc_rockchip-sdmmc-probed RESULT=3Dfail>

    2023-06-09T05:15:33.531640  /lava-10653829/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/6482b55f251ccce42e306171
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:15:31.496629  	-w	P<8>[   19.046343] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-06-09T05:15:31.499406  ad to last with leading zeros

    2023-06-09T05:15:31.502277  	-s SEP	String separator

    2023-06-09T05:15:31.506052  /lava-10653829/1/../bin/lava-test-case

    2023-06-09T05:15:31.511983  BusyBox v1.31.1 (2023-05-27 14:14:16 UTC) m=
ulti-call binary.

    2023-06-09T05:15:31.512202  =


    2023-06-09T05:15:31.516505  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-09T05:15:31.516730  =


    2023-06-09T05:15:31.521750  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-09T05:15:31.524624  FIRST, INC default to 1.
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b5af8b59d2bbd230615b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b5af8b59d2bbd2306=
15c
        failing since 198 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 3          =


  Details:     https://kernelci.org/test/plan/id/6482b7dfdc27719cb3306148

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/6482b7dfdc27719cb330615e
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:26:15.322788  <8>[   21.592141] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-driver-present RESULT=3Dpass>

    2023-06-09T05:26:16.335780  /lava-10653911/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/6482b7dfdc27719cb3306174
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:26:14.878888  /lava-10653911/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/6482b7dfdc27719cb3306175
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:26:12.841885  /lava-1<8>[   19.109909] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-06-09T05:26:12.844653  0653911/1/../bin/lava-test-case

    2023-06-09T05:26:12.850740  BusyBox v1.31.1 (2023-05-27 14:14:16 UTC) m=
ulti-call binary.

    2023-06-09T05:26:12.850975  =


    2023-06-09T05:26:12.855147  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-09T05:26:12.855672  =


    2023-06-09T05:26:12.860580  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-09T05:26:12.862953  FIRST, INC default to 1.

    2023-06-09T05:26:12.863171  =


    2023-06-09T05:26:12.866710  	-w	Pad to last with leading zeros
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b617ccc5d532e1306134

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b617ccc5d532e1306139
        new failure (last pass: next-20221012)

    2023-06-09T05:17:59.720864  [    5.302454] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3651518_1.5.2.4.1>
    2023-06-09T05:17:59.825099  =

    2023-06-09T05:17:59.926664  / # #export SHELL=3D/bin/sh
    2023-06-09T05:17:59.927572  =

    2023-06-09T05:18:00.029069  / # export SHELL=3D/bin/sh. /lava-3651518/e=
nvironment
    2023-06-09T05:18:00.029547  =

    2023-06-09T05:18:00.130930  / # . /lava-3651518/environment/lava-365151=
8/bin/lava-test-runner /lava-3651518/1
    2023-06-09T05:18:00.131772  =

    2023-06-09T05:18:00.135218  / # /lava-3651518/bin/lava-test-runner /lav=
a-3651518/1
    2023-06-09T05:18:00.194100  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b437d4d0607549306134

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b437d4d0607549306139
        failing since 127 days (last pass: next-20221012, first fail: next-=
20230201)

    2023-06-09T05:10:08.042817  [   23.645966] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3651390_1.5.2.4.1>
    2023-06-09T05:10:08.150357  =

    2023-06-09T05:10:08.252396  / # #export SHELL=3D/bin/sh
    2023-06-09T05:10:08.252865  =

    2023-06-09T05:10:08.354324  / # export SHELL=3D/bin/sh. /lava-3651390/e=
nvironment
    2023-06-09T05:10:08.354653  =

    2023-06-09T05:10:08.455848  / # . /lava-3651390/environment/lava-365139=
0/bin/lava-test-runner /lava-3651390/1
    2023-06-09T05:10:08.456541  =

    2023-06-09T05:10:08.460189  / # /lava-3651390/bin/lava-test-runner /lav=
a-3651390/1
    2023-06-09T05:10:08.507235  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4869f4e8fab1e30612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b4869f4e8fab1e306133
        failing since 128 days (last pass: next-20221012, first fail: next-=
20230201)

    2023-06-09T05:11:28.825133  [   23.573515] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3651414_1.5.2.4.1>
    2023-06-09T05:11:28.930647  =

    2023-06-09T05:11:29.032286  / # #export SHELL=3D/bin/sh
    2023-06-09T05:11:29.032741  =

    2023-06-09T05:11:29.134072  / # export SHELL=3D/bin/sh. /lava-3651414/e=
nvironment
    2023-06-09T05:11:29.134493  =

    2023-06-09T05:11:29.235899  / # . /lava-3651414/environment/lava-365141=
4/bin/lava-test-runner /lava-3651414/1
    2023-06-09T05:11:29.236814  =

    2023-06-09T05:11:29.240252  / # /lava-3651414/bin/lava-test-runner /lav=
a-3651414/1
    2023-06-09T05:11:29.287644  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b8930c38e92043306131

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rk808-clkout-driver-present: https://kernelci.org/test/=
case/id/6482b8930c38e9204330615f
        failing since 23 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-09T05:28:37.222726  /lava-10654089/1/../bin/lava-test-case

    2023-06-09T05:28:37.234324  <8>[   32.449717] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drk808-clkout-driver-present RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b427732dc71b0f306154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b427732dc71b0f306=
155
        failing since 121 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b21a4a31ddf349306154

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-stm32mp157c-=
dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-stm32mp157c-=
dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b21a4a31ddf349306159
        failing since 127 days (last pass: next-20221012, first fail: next-=
20230201)

    2023-06-09T05:00:54.879550  <8>[   16.530745] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3651258_1.5.2.4.1>
    2023-06-09T05:00:54.985461  / # #
    2023-06-09T05:00:55.087238  export SHELL=3D/bin/sh
    2023-06-09T05:00:55.087710  #
    2023-06-09T05:00:55.189077  / # export SHELL=3D/bin/sh. /lava-3651258/e=
nvironment
    2023-06-09T05:00:55.189534  =

    2023-06-09T05:00:55.290871  / # . /lava-3651258/environment/lava-365125=
8/bin/lava-test-runner /lava-3651258/1
    2023-06-09T05:00:55.291663  =

    2023-06-09T05:00:55.295628  / # /lava-3651258/bin/lava-test-runner /lav=
a-3651258/1
    2023-06-09T05:00:55.365531  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b576f8e20f3e99306140

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-st=
m32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-st=
m32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b577f8e20f3e99306145
        failing since 126 days (last pass: next-20221012, first fail: next-=
20230203)

    2023-06-09T05:15:14.933826  <8>[   15.605859] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3651453_1.5.2.4.1>
    2023-06-09T05:15:15.039722  / # #
    2023-06-09T05:15:15.141454  export SHELL=3D/bin/sh
    2023-06-09T05:15:15.141837  #
    2023-06-09T05:15:15.243044  / # export SHELL=3D/bin/sh. /lava-3651453/e=
nvironment
    2023-06-09T05:15:15.243463  =

    2023-06-09T05:15:15.344772  / # . /lava-3651453/environment/lava-365145=
3/bin/lava-test-runner /lava-3651453/1
    2023-06-09T05:15:15.345411  =

    2023-06-09T05:15:15.349949  / # /lava-3651453/bin/lava-test-runner /lav=
a-3651453/1
    2023-06-09T05:15:15.417856  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b433d4d0607549306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b433d4d0607549306=
131
        failing since 121 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4311819d62bbe30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b4311819d62bbe306=
12f
        failing since 121 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4a804bfe4b68130613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b4a804bfe4b681306=
13e
        new failure (last pass: next-20230608) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4f061e3592c31306154

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230529071827+755a=
73cd6f91-1~exp1~20230529071931.681))
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b4f061e3592c31306159
        failing since 1 day (last pass: next-20230525, first fail: next-202=
30607)

    2023-06-09T05:12:42.072017  =

    2023-06-09T05:12:42.173441  / # #export SHELL=3D/bin/sh
    2023-06-09T05:12:42.173966  =

    2023-06-09T05:12:42.274910  / # export SHELL=3D/bin/sh. /lava-3651468/e=
nvironment
    2023-06-09T05:12:42.275525  =

    2023-06-09T05:12:42.376750  / # . /lava-3651468/environment/lava-365146=
8/bin/lava-test-runner /lava-3651468/1
    2023-06-09T05:12:42.377375  =

    2023-06-09T05:12:42.418978  / # /lava-3651468/bin/lava-test-runner /lav=
a-3651468/1
    2023-06-09T05:12:42.514729  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-09T05:12:42.515280  + cd /lava-3651468/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b292e0b19a01cd30615a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b292e0b19a01cd30615f
        failing since 2 days (last pass: next-20230525, first fail: next-20=
230607)

    2023-06-09T05:02:34.509598  / # #
    2023-06-09T05:02:34.612382  export SHELL=3D/bin/sh
    2023-06-09T05:02:34.613153  #
    2023-06-09T05:02:34.714709  / # export SHELL=3D/bin/sh. /lava-3651260/e=
nvironment
    2023-06-09T05:02:34.715799  =

    2023-06-09T05:02:34.818389  / # . /lava-3651260/environment/lava-365126=
0/bin/lava-test-runner /lava-3651260/1
    2023-06-09T05:02:34.819801  =

    2023-06-09T05:02:34.833191  / # /lava-3651260/bin/lava-test-runner /lav=
a-3651260/1
    2023-06-09T05:02:34.953206  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-09T05:02:34.954106  + cd /lava-3651260/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b45a34d32e648330616b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b45a34d32e6483306170
        failing since 1 day (last pass: next-20230517, first fail: next-202=
30607)

    2023-06-09T05:10:01.660774  <8>[   13.479304] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3651445_1.5.2.4.1>
    2023-06-09T05:10:01.766021  / # #
    2023-06-09T05:10:01.867958  export SHELL=3D/bin/sh
    2023-06-09T05:10:01.868333  #
    2023-06-09T05:10:01.969572  / # export SHELL=3D/bin/sh. /lava-3651445/e=
nvironment
    2023-06-09T05:10:01.969945  =

    2023-06-09T05:10:02.071141  / # . /lava-3651445/environment/lava-365144=
5/bin/lava-test-runner /lava-3651445/1
    2023-06-09T05:10:02.071646  =

    2023-06-09T05:10:02.077663  / # /lava-3651445/bin/lava-test-runner /lav=
a-3651445/1
    2023-06-09T05:10:02.157942  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b5bc8b59d2bbd2306198

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b5bc8b59d2bbd230619d
        failing since 2 days (last pass: next-20230525, first fail: next-20=
230607)

    2023-06-09T05:15:34.517069  / #
    2023-06-09T05:15:34.620410  # #export SHELL=3D/bin/sh
    2023-06-09T05:15:34.621314  =

    2023-06-09T05:15:34.723060  / # export SHELL=3D/bin/sh. /lava-3651505/e=
nvironment
    2023-06-09T05:15:34.723385  =

    2023-06-09T05:15:34.824968  / # . /lava-3651505/environment/lava-365150=
5/bin/lava-test-runner /lava-3651505/1
    2023-06-09T05:15:34.831912  =

    2023-06-09T05:15:34.842976  / # /lava-3651505/bin/lava-test-runner /lav=
a-3651505/1
    2023-06-09T05:15:34.970555  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-09T05:15:34.971874  + cd /lava-3651505/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b63dad3e57a78f3061d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230529071827+755a=
73cd6f91-1~exp1~20230529071931.681))
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b63dad3e57a78f3061d6
        failing since 7 days (last pass: next-20230516, first fail: next-20=
230601)

    2023-06-09T05:18:27.757335  <8>[   14.212330] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3651470_1.5.2.4.1>
    2023-06-09T05:18:27.876163  / # #
    2023-06-09T05:18:27.981643  export SHELL=3D/bin/sh
    2023-06-09T05:18:27.983152  #
    2023-06-09T05:18:28.086506  / # export SHELL=3D/bin/sh. /lava-3651470/e=
nvironment
    2023-06-09T05:18:28.088093  =

    2023-06-09T05:18:28.191415  / # . /lava-3651470/environment/lava-365147=
0/bin/lava-test-runner /lava-3651470/1
    2023-06-09T05:18:28.194061  =

    2023-06-09T05:18:28.202423  / # /lava-3651470/bin/lava-test-runner /lav=
a-3651470/1
    2023-06-09T05:18:28.298363  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b36ef42043935f30614e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b36ef42043935f306153
        failing since 7 days (last pass: next-20230516, first fail: next-20=
230601)

    2023-06-09T05:06:22.822450  / # #
    2023-06-09T05:06:22.928123  export SHELL=3D/bin/sh
    2023-06-09T05:06:22.929715  #
    2023-06-09T05:06:23.033136  / # export SHELL=3D/bin/sh. /lava-3651259/e=
nvironment
    2023-06-09T05:06:23.034786  =

    2023-06-09T05:06:23.138226  / # . /lava-3651259/environment/lava-365125=
9/bin/lava-test-runner /lava-3651259/1
    2023-06-09T05:06:23.140990  =

    2023-06-09T05:06:23.147873  / # /lava-3651259/bin/lava-test-runner /lav=
a-3651259/1
    2023-06-09T05:06:23.267650  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-09T05:06:23.268723  + cd /lava-3651259/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b5397b2355d9c130614e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b5397b2355d9c1306153
        failing since 7 days (last pass: next-20230516, first fail: next-20=
230601)

    2023-06-09T05:14:10.787121  <8>[   13.889915] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3651458_1.5.2.4.1>
    2023-06-09T05:14:10.906584  / # #
    2023-06-09T05:14:11.012047  export SHELL=3D/bin/sh
    2023-06-09T05:14:11.013546  #
    2023-06-09T05:14:11.116919  / # export SHELL=3D/bin/sh. /lava-3651458/e=
nvironment
    2023-06-09T05:14:11.118428  =

    2023-06-09T05:14:11.221811  / # . /lava-3651458/environment/lava-365145=
8/bin/lava-test-runner /lava-3651458/1
    2023-06-09T05:14:11.224511  =

    2023-06-09T05:14:11.232238  / # /lava-3651458/bin/lava-test-runner /lav=
a-3651458/1
    2023-06-09T05:14:11.353129  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b7191cb0544b8930616e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482b7191cb0544b89306173
        failing since 7 days (last pass: next-20230516, first fail: next-20=
230601)

    2023-06-09T05:22:13.735551  / # #
    2023-06-09T05:22:13.841035  export SHELL=3D/bin/sh
    2023-06-09T05:22:13.842518  #
    2023-06-09T05:22:13.945871  / # export SHELL=3D/bin/sh. /lava-3651511/e=
nvironment
    2023-06-09T05:22:13.947453  =

    2023-06-09T05:22:14.051065  / # . /lava-3651511/environment/lava-365151=
1/bin/lava-test-runner /lava-3651511/1
    2023-06-09T05:22:14.053752  =

    2023-06-09T05:22:14.059885  / # /lava-3651511/bin/lava-test-runner /lav=
a-3651511/1
    2023-06-09T05:22:14.183571  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-09T05:22:14.184624  + cd /lava-3651511/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6482b4222f253305573061a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230609/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482b4222f25330557306=
1a3
        failing since 0 day (last pass: next-20230605, first fail: next-202=
30608) =

 =20
