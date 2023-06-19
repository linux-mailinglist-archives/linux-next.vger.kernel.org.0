Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53AD734B09
	for <lists+linux-next@lfdr.de>; Mon, 19 Jun 2023 06:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjFSEQg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jun 2023 00:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjFSEQf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jun 2023 00:16:35 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7905139
        for <linux-next@vger.kernel.org>; Sun, 18 Jun 2023 21:16:30 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso2468886a12.3
        for <linux-next@vger.kernel.org>; Sun, 18 Jun 2023 21:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687148190; x=1689740190;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K98VMey9l48F/N+jowk5jd3lNiE+LQ98c7Rl8+dTv2M=;
        b=szvJA6UkOieOYkjlCq8NYC44VTHK3FJjMFgFwM7g61MP2ox0Hz81lLaXIIMuSgSDo3
         r0qK0u0c4N05ZzihVVtjWQkQdIwC7tN2UR+0L5z/XHTCJnWdZApTJt3zJ4Pb6XEJ4pZa
         iBpj1F/HtO1A7yey+YhIknBkOyAT7kPJ8MO5ixxVPNJvCEa6FB5cyKyY1WyFC1WyErEA
         okFgrrMPJosL64LCt+avSiDVAOP/CiT+X2BJvz7qKCydXeQUOXb2Evw2QGDRtKLtWslt
         rKD8+7YzERN5MSn/ImOsuEqnhfjcxA8dUiI91xZQGH/kkJ26iKPbLswWVY5CB/s/eUlk
         OF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687148190; x=1689740190;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K98VMey9l48F/N+jowk5jd3lNiE+LQ98c7Rl8+dTv2M=;
        b=HkYrTbYOynK/zbBGEMlLZf6v4nPnFQkObc4ET0JVMTftzhUYknR//UP3R1r0n322gI
         0+BbQuf3BuAb5NdSzENr4yvCgrwxn2ogy7texO2mjhOJTEpTNuTafDMZoVCD3IFJMkAv
         83/OVJTzssiTVg5sUQgcGdUIce21nWWq7qMvW/3P+ZnsH/gNgdfzgen+dG1+nSp4gp7K
         zPgGYjwBMVHcjx+Dd4Ea2nqcvTtNhBoeDlsgeyYwBh2YoQUwixykwCqmhXu8qzK4TsT/
         164PgcR+NNtdWcvQc/GfVHXtF2WMCg2Wzu5v8cES9MpDSkoKgtLA7XdAI8P9p6arhAyo
         gvUg==
X-Gm-Message-State: AC+VfDzzlKp8kmB0fruUJWbI4JSd3vUPL6xXyuKpakT5C9Ji4Y8+psXe
        1pQqa1bF6z3U0K8OayslGloWDrkMi3bi5nkGmiATAxk/
X-Google-Smtp-Source: ACHHUZ7yXWLUm3U78QbnEoQN3jVRLcFVYdPkJIw4IqTQGcoB1hXf0unCcwIErGczN3vlwphie8ju3w==
X-Received: by 2002:a05:6a20:4299:b0:121:9672:1c14 with SMTP id o25-20020a056a20429900b0012196721c14mr3105988pzj.55.1687148187485;
        Sun, 18 Jun 2023 21:16:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u16-20020a63f650000000b00502f4c62fd3sm17839509pgj.33.2023.06.18.21.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 21:16:26 -0700 (PDT)
Message-ID: <648fd69a.630a0220.d5680.3e12@mx.google.com>
Date:   Sun, 18 Jun 2023 21:16:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc7-110-gdab158ce7741
Subject: next/pending-fixes baseline: 612 runs,
 77 regressions (v6.4-rc7-110-gdab158ce7741)
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

next/pending-fixes baseline: 612 runs, 77 regressions (v6.4-rc7-110-gdab158=
ce7741)

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
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

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
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

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
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 2          =

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

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc7-110-gdab158ce7741/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc7-110-gdab158ce7741
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dab158ce7741dadc666c660810004988e8ca6ea6 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9d04cc9b6d30f7306141

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9d04cc9b6d30f7306146
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:10:28.524216  + set +x

    2023-06-19T00:10:28.531153  <8>[   11.116260] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801362_1.4.2.3.1>

    2023-06-19T00:10:28.632979  #

    2023-06-19T00:10:28.733829  / # #export SHELL=3D/bin/sh

    2023-06-19T00:10:28.734072  =


    2023-06-19T00:10:28.834706  / # export SHELL=3D/bin/sh. /lava-10801362/=
environment

    2023-06-19T00:10:28.834926  =


    2023-06-19T00:10:28.935439  / # . /lava-10801362/environment/lava-10801=
362/bin/lava-test-runner /lava-10801362/1

    2023-06-19T00:10:28.935729  =


    2023-06-19T00:10:28.941507  / # /lava-10801362/bin/lava-test-runner /la=
va-10801362/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9d2513ccdfee5830612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9d2513ccdfee58306134
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-19T00:10:57.831646  + set +x

    2023-06-19T00:10:57.837947  <8>[   14.819138] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801463_1.4.2.3.1>

    2023-06-19T00:10:57.946658  / # #

    2023-06-19T00:10:58.049127  export SHELL=3D/bin/sh

    2023-06-19T00:10:58.049885  #

    2023-06-19T00:10:58.151313  / # export SHELL=3D/bin/sh. /lava-10801463/=
environment

    2023-06-19T00:10:58.152183  =


    2023-06-19T00:10:58.253619  / # . /lava-10801463/environment/lava-10801=
463/bin/lava-test-runner /lava-10801463/1

    2023-06-19T00:10:58.254803  =


    2023-06-19T00:10:58.260500  / # /lava-10801463/bin/lava-test-runner /la=
va-10801463/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f9968139bf5913061e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9f9968139bf5913061ed
        failing since 82 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:21:29.047106  + set +x

    2023-06-19T00:21:29.052975  <8>[   11.183309] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801704_1.4.2.3.1>

    2023-06-19T00:21:29.161298  =


    2023-06-19T00:21:29.263121  / # #export SHELL=3D/bin/sh

    2023-06-19T00:21:29.263906  =


    2023-06-19T00:21:29.365452  / # export SHELL=3D/bin/sh. /lava-10801704/=
environment

    2023-06-19T00:21:29.366182  =


    2023-06-19T00:21:29.467689  / # . /lava-10801704/environment/lava-10801=
704/bin/lava-test-runner /lava-10801704/1

    2023-06-19T00:21:29.468824  =


    2023-06-19T00:21:29.474564  / # /lava-10801704/bin/lava-test-runner /la=
va-10801704/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9cb1b53817804130614f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9cb1b538178041306154
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:09:08.139584  + <8>[   11.986430] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10801392_1.4.2.3.1>

    2023-06-19T00:09:08.140145  set +x

    2023-06-19T00:09:08.247339  / # #

    2023-06-19T00:09:08.349754  export SHELL=3D/bin/sh

    2023-06-19T00:09:08.350491  #

    2023-06-19T00:09:08.452055  / # export SHELL=3D/bin/sh. /lava-10801392/=
environment

    2023-06-19T00:09:08.452883  =


    2023-06-19T00:09:08.554568  / # . /lava-10801392/environment/lava-10801=
392/bin/lava-test-runner /lava-10801392/1

    2023-06-19T00:09:08.555736  =


    2023-06-19T00:09:08.561246  / # /lava-10801392/bin/lava-test-runner /la=
va-10801392/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/648f9d0e025193d0db306194

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9d0e025193d0db306199
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-19T00:10:40.657487  + <8>[   15.522762] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10801503_1.4.2.3.1>

    2023-06-19T00:10:40.657979  set +x

    2023-06-19T00:10:40.765813  / # #

    2023-06-19T00:10:40.868205  export SHELL=3D/bin/sh

    2023-06-19T00:10:40.869061  #

    2023-06-19T00:10:40.970903  / # export SHELL=3D/bin/sh. /lava-10801503/=
environment

    2023-06-19T00:10:40.971705  =


    2023-06-19T00:10:41.073348  / # . /lava-10801503/environment/lava-10801=
503/bin/lava-test-runner /lava-10801503/1

    2023-06-19T00:10:41.074568  =


    2023-06-19T00:10:41.079364  / # /lava-10801503/bin/lava-test-runner /la=
va-10801503/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/648f9d0e025193d=
0db30619b
        failing since 2 days (last pass: v6.4-rc6-274-g2a7f6b5fd1ca, first =
fail: v6.4-rc6-301-ga3b6bb6457ef)
        3 lines

    2023-06-19T00:10:40.630653  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-19T00:10:40.637203  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-19T00:10:40.644300  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-19T00:10:40.650476  <8>[   15.505897] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f99ffe5b1a92330617d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9f99ffe5b1a923306182
        failing since 82 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:21:32.861874  + set<8>[   11.691904] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10801736_1.4.2.3.1>

    2023-06-19T00:21:32.862046   +x

    2023-06-19T00:21:32.966550  / # #

    2023-06-19T00:21:33.068708  export SHELL=3D/bin/sh

    2023-06-19T00:21:33.069400  #

    2023-06-19T00:21:33.170750  / # export SHELL=3D/bin/sh. /lava-10801736/=
environment

    2023-06-19T00:21:33.171586  =


    2023-06-19T00:21:33.273054  / # . /lava-10801736/environment/lava-10801=
736/bin/lava-test-runner /lava-10801736/1

    2023-06-19T00:21:33.274194  =


    2023-06-19T00:21:33.278683  / # /lava-10801736/bin/lava-test-runner /la=
va-10801736/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9c9f5631e4fe16306166

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9c9f5631e4fe1630616b
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:08:55.695532  <8>[    8.018083] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801391_1.4.2.3.1>

    2023-06-19T00:08:55.699050  + set +x

    2023-06-19T00:08:55.803725  #

    2023-06-19T00:08:55.804010  =


    2023-06-19T00:08:55.904643  / # #export SHELL=3D/bin/sh

    2023-06-19T00:08:55.904877  =


    2023-06-19T00:08:56.005474  / # export SHELL=3D/bin/sh. /lava-10801391/=
environment

    2023-06-19T00:08:56.005741  =


    2023-06-19T00:08:56.106444  / # . /lava-10801391/environment/lava-10801=
391/bin/lava-test-runner /lava-10801391/1

    2023-06-19T00:08:56.106902  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9d14fac2b7b535306133

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9d14fac2b7b535306138
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-19T00:10:47.915794  <8>[   13.501611] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801459_1.4.2.3.1>

    2023-06-19T00:10:47.919233  + set +x

    2023-06-19T00:10:48.024856  #

    2023-06-19T00:10:48.026148  =


    2023-06-19T00:10:48.128148  / # #export SHELL=3D/bin/sh

    2023-06-19T00:10:48.129174  =


    2023-06-19T00:10:48.230893  / # export SHELL=3D/bin/sh. /lava-10801459/=
environment

    2023-06-19T00:10:48.231829  =


    2023-06-19T00:10:48.333670  / # . /lava-10801459/environment/lava-10801=
459/bin/lava-test-runner /lava-10801459/1

    2023-06-19T00:10:48.334981  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9c67ad8869582e3061db

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9c67ad8869582e3061e0
        failing since 158 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-19T00:08:42.344701  / # #

    2023-06-19T00:08:42.446918  export SHELL=3D/bin/sh

    2023-06-19T00:08:42.447626  #

    2023-06-19T00:08:42.549065  / # export SHELL=3D/bin/sh. /lava-10801222/=
environment

    2023-06-19T00:08:42.549903  =


    2023-06-19T00:08:42.651360  / # . /lava-10801222/environment/lava-10801=
222/bin/lava-test-runner /lava-10801222/1

    2023-06-19T00:08:42.652399  =


    2023-06-19T00:08:42.668996  / # /lava-10801222/bin/lava-test-runner /la=
va-10801222/1

    2023-06-19T00:08:42.779860  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-19T00:08:42.780378  + cd /lava-10801222/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa0bb58f45b6c733061f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa0bb58f45b6c73306=
1f8
        failing since 112 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa2f565ed286f04306218

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa2f565ed286f04306=
219
        failing since 11 days (last pass: v6.4-rc5-244-g9d674be53332, first=
 fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9eb474fb3f6f66306193

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648f9eb474fb3f6f66306=
194
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f7fcc7ce55e2330615f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9f7fcc7ce55e23306164
        failing since 152 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-19T00:21:03.939894  <8>[   16.909702] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3675283_1.5.2.4.1>
    2023-06-19T00:21:04.048924  / # #
    2023-06-19T00:21:04.152486  export SHELL=3D/bin/sh
    2023-06-19T00:21:04.153639  #
    2023-06-19T00:21:04.255918  / # export SHELL=3D/bin/sh. /lava-3675283/e=
nvironment
    2023-06-19T00:21:04.257010  =

    2023-06-19T00:21:04.359120  / # . /lava-3675283/environment/lava-367528=
3/bin/lava-test-runner /lava-3675283/1
    2023-06-19T00:21:04.360535  =

    2023-06-19T00:21:04.366792  / # /lava-3675283/bin/lava-test-runner /lav=
a-3675283/1
    2023-06-19T00:21:04.458682  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa009d1653622fe306182

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fa009d1653622fe306187
        failing since 152 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-19T00:23:14.604838  <8>[   20.551813] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3675295_1.5.2.4.1>
    2023-06-19T00:23:14.719086  / # #
    2023-06-19T00:23:14.821720  export SHELL=3D/bin/sh
    2023-06-19T00:23:14.822152  #
    2023-06-19T00:23:14.924172  / # export SHELL=3D/bin/sh. /lava-3675295/e=
nvironment
    2023-06-19T00:23:14.924609  =

    2023-06-19T00:23:15.027331  / # . /lava-3675295/environment/lava-367529=
5/bin/lava-test-runner /lava-3675295/1
    2023-06-19T00:23:15.030881  =

    2023-06-19T00:23:15.036494  / # /lava-3675295/bin/lava-test-runner /lav=
a-3675295/1
    2023-06-19T00:23:15.119669  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa09ec45f51f51d306173

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fa09ec45f51f51d306178
        failing since 152 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-19T00:25:45.043334  <8>[   14.181538] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3675356_1.5.2.4.1>
    2023-06-19T00:25:45.152111  / # #
    2023-06-19T00:25:45.254625  export SHELL=3D/bin/sh
    2023-06-19T00:25:45.255391  #
    2023-06-19T00:25:45.357110  / # export SHELL=3D/bin/sh. /lava-3675356/e=
nvironment
    2023-06-19T00:25:45.358302  =

    2023-06-19T00:25:45.464958  / # . /lava-3675356/environment/lava-367535=
6/bin/lava-test-runner /lava-3675356/1
    2023-06-19T00:25:45.465703  =

    2023-06-19T00:25:45.465850  / # <3>[   14.528751] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-06-19T00:25:45.471772  /lava-3675356/bin/lava-test-runner /lava-36=
75356/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa186e2f644146f30613c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fa186e2f644146f30613f
        failing since 152 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-19T00:29:39.372532  <8>[   14.688886] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3675394_1.5.2.4.1>
    2023-06-19T00:29:39.479616  / # #
    2023-06-19T00:29:39.581594  export SHELL=3D/bin/sh
    2023-06-19T00:29:39.582203  #
    2023-06-19T00:29:39.683562  / # export SHELL=3D/bin/sh. /lava-3675394/e=
nvironment
    2023-06-19T00:29:39.684278  =

    2023-06-19T00:29:39.786178  / # . /lava-3675394/environment/lava-367539=
4/bin/lava-test-runner /lava-3675394/1
    2023-06-19T00:29:39.786762  =

    2023-06-19T00:29:39.786927  / # /lava-3675394/bin/lava-test-runner /lav=
a-3675394/1<3>[   15.101958] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-06-19T00:29:39.791181   =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa229d826406aff30621f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fa229d826406aff306224
        failing since 152 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-19T00:32:10.715694  <8>[   14.089282] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-06-19T00:32:10.716249  + set +x
    2023-06-19T00:32:10.720904  <8>[   14.100028] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3675557_1.5.2.4.1>
    2023-06-19T00:32:10.832520  / # #
    2023-06-19T00:32:10.935716  export SHELL=3D/bin/sh
    2023-06-19T00:32:10.936727  #
    2023-06-19T00:32:11.039057  / # export SHELL=3D/bin/sh. /lava-3675557/e=
nvironment
    2023-06-19T00:32:11.040748  =

    2023-06-19T00:32:11.143260  / # . /lava-3675557/environment/lava-367555=
7/bin/lava-test-runner /lava-3675557/1
    2023-06-19T00:32:11.144959   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/648f9e3847f764adb7306154

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/648f9e3847f764a=
db730615b
        failing since 108 days (last pass: v6.2-1218-g2d4a54ee969d, first f=
ail: v6.2-13370-g5872d227b73f)
        30 lines

    2023-06-19T00:15:29.237933  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-19T00:15:29.238681  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-19T00:15:29.239274  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2c1000 allocated at load_module+0x6b0/0=
x1954
    2023-06-19T00:15:29.241176  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-19T00:15:29.344718  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-19T00:15:29.345714  kern  :emerg : Process udevd (pid: 72, stac=
k limit =3D 0x80d5622f)
    2023-06-19T00:15:29.346151  kern  :emerg : Stack: (0xc8919cf8 to 0xc891=
a000)
    2023-06-19T00:15:29.346928  kern  :emerg : 9ce0:                       =
                                c4bd2200 c0777860
    2023-06-19T00:15:29.347409  kern  :emerg : 9d00: 00000000 c03afe60 0000=
0000 1abce53a 0000005d 1abce53a c0777860 bf2c1220
    2023-06-19T00:15:29.347838  kern  :emerg : 9d20: 00000000 00000000 0000=
0000 00000001 c077785c bf315590 bf2c1220 00000000 =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/648f9e3847f764a=
db730615c
        failing since 511 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-06-19T00:15:29.156366  kern  :alert : 8<--- cut here ---
    2023-06-19T00:15:29.157538  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-06-19T00:15:29.158096  kern  :alert : [00000060] *pgd=3Dc4a5d831, =
*pte=3D00000000, *ppte=3D00000000
    2023-06-19T00:15:29.158482  kern  :alert : Register r0 information: non=
-paged memory
    2023-06-19T00:15:29.158967  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8918000 allocated at kernel_clone+0x98/0x=
3a0
    2023-06-19T00:15:29.160516  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-06-19T00:15:29.199749  kern  :alert : Register r3 information: non=
-paged memory
    2023-06-19T00:15:29.200930  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4bd2200 pointer offset 0 size 512
    2023-06-19T00:15:29.201633  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-06-19T00:15:29.202209  kern  :ale<8><LAVA_SIGNAL_TESTCASE TEST_CAS=
E_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16> =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9cf510f3aa6c2930615c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9cf510f3aa6c29306161
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:10:15.115833  + set +x

    2023-06-19T00:10:15.122511  <8>[    9.992755] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801378_1.4.2.3.1>

    2023-06-19T00:10:15.226806  / # #

    2023-06-19T00:10:15.327477  export SHELL=3D/bin/sh

    2023-06-19T00:10:15.327714  #

    2023-06-19T00:10:15.428254  / # export SHELL=3D/bin/sh. /lava-10801378/=
environment

    2023-06-19T00:10:15.428457  =


    2023-06-19T00:10:15.528978  / # . /lava-10801378/environment/lava-10801=
378/bin/lava-test-runner /lava-10801378/1

    2023-06-19T00:10:15.529389  =


    2023-06-19T00:10:15.534109  / # /lava-10801378/bin/lava-test-runner /la=
va-10801378/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9d058e6834b9f6306178

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9d058e6834b9f630617d
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-19T00:10:33.774966  + set +x

    2023-06-19T00:10:33.781665  <8>[   13.478786] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801479_1.4.2.3.1>

    2023-06-19T00:10:33.888443  / # #

    2023-06-19T00:10:33.989145  export SHELL=3D/bin/sh

    2023-06-19T00:10:33.989392  #

    2023-06-19T00:10:34.089970  / # export SHELL=3D/bin/sh. /lava-10801479/=
environment

    2023-06-19T00:10:34.090219  =


    2023-06-19T00:10:34.190806  / # . /lava-10801479/environment/lava-10801=
479/bin/lava-test-runner /lava-10801479/1

    2023-06-19T00:10:34.191147  =


    2023-06-19T00:10:34.195643  / # /lava-10801479/bin/lava-test-runner /la=
va-10801479/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f818b5fe76887306154

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9f818b5fe76887306159
        failing since 82 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:21:20.929641  + set +x

    2023-06-19T00:21:20.936187  <8>[   10.656542] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801706_1.4.2.3.1>

    2023-06-19T00:21:21.040964  / # #

    2023-06-19T00:21:21.141627  export SHELL=3D/bin/sh

    2023-06-19T00:21:21.141809  #

    2023-06-19T00:21:21.242287  / # export SHELL=3D/bin/sh. /lava-10801706/=
environment

    2023-06-19T00:21:21.242545  =


    2023-06-19T00:21:21.343178  / # . /lava-10801706/environment/lava-10801=
706/bin/lava-test-runner /lava-10801706/1

    2023-06-19T00:21:21.343476  =


    2023-06-19T00:21:21.348457  / # /lava-10801706/bin/lava-test-runner /la=
va-10801706/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9c985631e4fe16306130

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9c985631e4fe16306135
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:08:46.201066  <8>[    9.930181] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801396_1.4.2.3.1>

    2023-06-19T00:08:46.204542  + set +x

    2023-06-19T00:08:46.309074  #

    2023-06-19T00:08:46.411520  / # #export SHELL=3D/bin/sh

    2023-06-19T00:08:46.412260  =


    2023-06-19T00:08:46.513709  / # export SHELL=3D/bin/sh. /lava-10801396/=
environment

    2023-06-19T00:08:46.514446  =


    2023-06-19T00:08:46.615751  / # . /lava-10801396/environment/lava-10801=
396/bin/lava-test-runner /lava-10801396/1

    2023-06-19T00:08:46.616858  =


    2023-06-19T00:08:46.621790  / # /lava-10801396/bin/lava-test-runner /la=
va-10801396/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9cee10f3aa6c2930612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9cee10f3aa6c29306134
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-19T00:10:09.744699  + set<8>[   14.475327] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10801467_1.4.2.3.1>

    2023-06-19T00:10:09.745328   +x

    2023-06-19T00:10:09.853795  / # #

    2023-06-19T00:10:09.956364  export SHELL=3D/bin/sh

    2023-06-19T00:10:09.957182  #

    2023-06-19T00:10:10.058565  / # export SHELL=3D/bin/sh. /lava-10801467/=
environment

    2023-06-19T00:10:10.059328  =


    2023-06-19T00:10:10.160833  / # . /lava-10801467/environment/lava-10801=
467/bin/lava-test-runner /lava-10801467/1

    2023-06-19T00:10:10.162114  =


    2023-06-19T00:10:10.167693  / # /lava-10801467/bin/lava-test-runner /la=
va-10801467/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f838b5fe7688730615f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9f838b5fe76887306164
        failing since 82 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:21:01.841125  <8>[   10.774854] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801740_1.4.2.3.1>

    2023-06-19T00:21:01.844285  + set +x

    2023-06-19T00:21:01.949136  #

    2023-06-19T00:21:01.950368  =


    2023-06-19T00:21:02.052148  / # #export SHELL=3D/bin/sh

    2023-06-19T00:21:02.052909  =


    2023-06-19T00:21:02.154677  / # export SHELL=3D/bin/sh. /lava-10801740/=
environment

    2023-06-19T00:21:02.155494  =


    2023-06-19T00:21:02.257021  / # . /lava-10801740/environment/lava-10801=
740/bin/lava-test-runner /lava-10801740/1

    2023-06-19T00:21:02.258118  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9ca7b373210e89306156

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9ca7b373210e8930615b
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:08:51.451037  + set +x<8>[   11.179891] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10801364_1.4.2.3.1>

    2023-06-19T00:08:51.451166  =


    2023-06-19T00:08:51.555566  / # #

    2023-06-19T00:08:51.656155  export SHELL=3D/bin/sh

    2023-06-19T00:08:51.656333  #

    2023-06-19T00:08:51.757027  / # export SHELL=3D/bin/sh. /lava-10801364/=
environment

    2023-06-19T00:08:51.757187  =


    2023-06-19T00:08:51.857709  / # . /lava-10801364/environment/lava-10801=
364/bin/lava-test-runner /lava-10801364/1

    2023-06-19T00:08:51.857943  =


    2023-06-19T00:08:51.863040  / # /lava-10801364/bin/lava-test-runner /la=
va-10801364/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9d15fac2b7b53530613e

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9d15fac2b7b535306143
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-19T00:10:48.427480  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector<8>[   14.866518] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>

    2023-06-19T00:10:48.428080  =


    2023-06-19T00:10:48.430503  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-19T00:10:48.437082  <8>[   14.876471] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801480_1.4.2.3.1>

    2023-06-19T00:10:48.437611  + set +x

    2023-06-19T00:10:48.545775  / # #

    2023-06-19T00:10:48.648299  export SHELL=3D/bin/sh

    2023-06-19T00:10:48.649258  #

    2023-06-19T00:10:48.750835  / # export SHELL=3D/bin/sh. /lava-10801480/=
environment

    2023-06-19T00:10:48.751719  =

 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f9068139bf5913061ac

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9f9068139bf5913061b1
        failing since 82 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:21:25.021080  + set +x<8>[   11.166702] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10801733_1.4.2.3.1>

    2023-06-19T00:21:25.021165  =


    2023-06-19T00:21:25.125524  / # #

    2023-06-19T00:21:25.226109  export SHELL=3D/bin/sh

    2023-06-19T00:21:25.226307  #

    2023-06-19T00:21:25.326816  / # export SHELL=3D/bin/sh. /lava-10801733/=
environment

    2023-06-19T00:21:25.327031  =


    2023-06-19T00:21:25.427624  / # . /lava-10801733/environment/lava-10801=
733/bin/lava-test-runner /lava-10801733/1

    2023-06-19T00:21:25.427967  =


    2023-06-19T00:21:25.432806  / # /lava-10801733/bin/lava-test-runner /la=
va-10801733/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9e5d1069ba962430614e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9e5d1069ba9624306153
        failing since 140 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-19T00:16:05.855098  + set +x
    2023-06-19T00:16:05.855466  [   12.137226] <LAVA_SIGNAL_ENDRUN 0_dmesg =
980763_1.5.2.3.1>
    2023-06-19T00:16:05.962092  / # #
    2023-06-19T00:16:06.063841  export SHELL=3D/bin/sh
    2023-06-19T00:16:06.064295  #
    2023-06-19T00:16:06.165667  / # export SHELL=3D/bin/sh. /lava-980763/en=
vironment
    2023-06-19T00:16:06.166132  =

    2023-06-19T00:16:06.267437  / # . /lava-980763/environment/lava-980763/=
bin/lava-test-runner /lava-980763/1
    2023-06-19T00:16:06.268018  =

    2023-06-19T00:16:06.271399  / # /lava-980763/bin/lava-test-runner /lava=
-980763/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9eac78c525589a3061d0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9eac78c525589a3061d3
        failing since 139 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-19T00:17:27.551436  + set +x
    2023-06-19T00:17:27.551608  [   14.341332] <LAVA_SIGNAL_ENDRUN 0_dmesg =
980768_1.5.2.3.1>
    2023-06-19T00:17:27.659441  / # #
    2023-06-19T00:17:27.761003  export SHELL=3D/bin/sh
    2023-06-19T00:17:27.761450  #
    2023-06-19T00:17:27.862624  / # export SHELL=3D/bin/sh. /lava-980768/en=
vironment
    2023-06-19T00:17:27.863014  =

    2023-06-19T00:17:27.964171  / # . /lava-980768/environment/lava-980768/=
bin/lava-test-runner /lava-980768/1
    2023-06-19T00:17:27.964757  =

    2023-06-19T00:17:27.968491  / # /lava-980768/bin/lava-test-runner /lava=
-980768/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f61996c252ab7306149

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9f61996c252ab730614e
        failing since 140 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-19T00:20:24.255301  + set +x
    2023-06-19T00:20:24.255547  [   13.131296] <LAVA_SIGNAL_ENDRUN 0_dmesg =
980777_1.5.2.3.1>
    2023-06-19T00:20:24.362926  / # #
    2023-06-19T00:20:24.464565  export SHELL=3D/bin/sh
    2023-06-19T00:20:24.465063  #
    2023-06-19T00:20:24.566421  / # export SHELL=3D/bin/sh. /lava-980777/en=
vironment
    2023-06-19T00:20:24.566995  =

    2023-06-19T00:20:24.668492  / # . /lava-980777/environment/lava-980777/=
bin/lava-test-runner /lava-980777/1
    2023-06-19T00:20:24.669260  =

    2023-06-19T00:20:24.672521  / # /lava-980777/bin/lava-test-runner /lava=
-980777/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9fb112fcd6e8ed306196

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9fb112fcd6e8ed30619b
        failing since 139 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-19T00:21:42.871713  + set +x
    2023-06-19T00:21:42.871891  [   12.913809] <LAVA_SIGNAL_ENDRUN 0_dmesg =
980788_1.5.2.3.1>
    2023-06-19T00:21:42.979640  / # #
    2023-06-19T00:21:43.081400  export SHELL=3D/bin/sh
    2023-06-19T00:21:43.081858  #
    2023-06-19T00:21:43.183113  / # export SHELL=3D/bin/sh. /lava-980788/en=
vironment
    2023-06-19T00:21:43.183573  =

    2023-06-19T00:21:43.284857  / # . /lava-980788/environment/lava-980788/=
bin/lava-test-runner /lava-980788/1
    2023-06-19T00:21:43.285566  =

    2023-06-19T00:21:43.289038  / # /lava-980788/bin/lava-test-runner /lava=
-980788/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa1ba7d3ea08666306179

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fa1ba7d3ea0866630617e
        failing since 139 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-19T00:30:25.024757  + set +x
    2023-06-19T00:30:25.025220  [   13.112971] <LAVA_SIGNAL_ENDRUN 0_dmesg =
980799_1.5.2.3.1>
    2023-06-19T00:30:25.133839  / # #
    2023-06-19T00:30:25.235950  export SHELL=3D/bin/sh
    2023-06-19T00:30:25.236568  #
    2023-06-19T00:30:25.338035  / # export SHELL=3D/bin/sh. /lava-980799/en=
vironment
    2023-06-19T00:30:25.338483  =

    2023-06-19T00:30:25.439757  / # . /lava-980799/environment/lava-980799/=
bin/lava-test-runner /lava-980799/1
    2023-06-19T00:30:25.440282  =

    2023-06-19T00:30:25.443622  / # /lava-980799/bin/lava-test-runner /lava=
-980799/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f74996c252ab730616e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9f74996c252ab7306173
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef)

    2023-06-19T00:20:45.619145  + set[   15.134263] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 980776_1.5.2.3.1>
    2023-06-19T00:20:45.619370   +x
    2023-06-19T00:20:45.725490  / # #
    2023-06-19T00:20:45.827490  export SHELL=3D/bin/sh
    2023-06-19T00:20:45.827937  #
    2023-06-19T00:20:45.929374  / # export SHELL=3D/bin/sh. /lava-980776/en=
vironment
    2023-06-19T00:20:45.929850  =

    2023-06-19T00:20:46.031327  / # . /lava-980776/environment/lava-980776/=
bin/lava-test-runner /lava-980776/1
    2023-06-19T00:20:46.031907  =

    2023-06-19T00:20:46.035203  / # /lava-980776/bin/lava-test-runner /lava=
-980776/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/648f9e72e214397b1c30612e

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/648f9e72e=
214397b1c306137
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef)

    2023-06-19T00:16:28.384791  /lava-628677/1/../bin/lava-test-case
    2023-06-19T00:16:28.409572  <8>[   27.991721] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
8f9e72e214397b1c306138
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef)

    2023-06-19T00:16:27.325332  /lava-628677/1/../bin/lava-test-case
    2023-06-19T00:16:27.351020  <8>[   26.932315] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f17de3f3832a0306184

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648f9f17de3f3832a0306=
185
        failing since 415 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/648fa1117ee5cd300930620f

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fa1117ee5cd3009306212
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef)

    2023-06-19T00:27:49.556152  / # #
    2023-06-19T00:27:49.658455  export SHELL=3D/bin/sh
    2023-06-19T00:27:49.659119  #
    2023-06-19T00:27:49.761148  / # export SHELL=3D/bin/sh. /lava-359800/en=
vironment
    2023-06-19T00:27:49.761967  =

    2023-06-19T00:27:49.863690  / # . /lava-359800/environment/lava-359800/=
bin/lava-test-runner /lava-359800/1
    2023-06-19T00:27:49.864877  =

    2023-06-19T00:27:49.883287  / # /lava-359800/bin/lava-test-runner /lava=
-359800/1
    2023-06-19T00:27:49.937870  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-19T00:27:49.938408  + cd /lava-359800/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/648=
fa1117ee5cd3009306222
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef)

    2023-06-19T00:27:52.327117  /lava-359800/1/../bin/lava-test-case
    2023-06-19T00:27:52.327599  <8>[   17.877804] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-06-19T00:27:52.328004  /lava-359800/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9ca0196226e62f306170

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9ca0196226e62f306175
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:08:57.949716  <8>[   11.407753] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801369_1.4.2.3.1>

    2023-06-19T00:08:58.057092  / # #

    2023-06-19T00:08:58.159232  export SHELL=3D/bin/sh

    2023-06-19T00:08:58.159954  #

    2023-06-19T00:08:58.261309  / # export SHELL=3D/bin/sh. /lava-10801369/=
environment

    2023-06-19T00:08:58.261944  =


    2023-06-19T00:08:58.363416  / # . /lava-10801369/environment/lava-10801=
369/bin/lava-test-runner /lava-10801369/1

    2023-06-19T00:08:58.364485  =


    2023-06-19T00:08:58.369542  / # /lava-10801369/bin/lava-test-runner /la=
va-10801369/1

    2023-06-19T00:08:58.376275  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9cedbb7f8874f23061be

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9cedbb7f8874f23061c3
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-19T00:10:12.137853  + set +x

    2023-06-19T00:10:12.141131  <8>[   14.357445] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801466_1.4.2.3.1>

    2023-06-19T00:10:12.250487  / # #

    2023-06-19T00:10:12.352864  export SHELL=3D/bin/sh

    2023-06-19T00:10:12.353657  #

    2023-06-19T00:10:12.455046  / # export SHELL=3D/bin/sh. /lava-10801466/=
environment

    2023-06-19T00:10:12.455834  =


    2023-06-19T00:10:12.557264  / # . /lava-10801466/environment/lava-10801=
466/bin/lava-test-runner /lava-10801466/1

    2023-06-19T00:10:12.558529  =


    2023-06-19T00:10:12.563406  / # /lava-10801466/bin/lava-test-runner /la=
va-10801466/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f7b748faa90ac306182

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9f7b748faa90ac306187
        failing since 82 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-19T00:20:58.956272  <8>[   11.525271] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10801700_1.4.2.3.1>

    2023-06-19T00:20:59.064561  / # #

    2023-06-19T00:20:59.166919  export SHELL=3D/bin/sh

    2023-06-19T00:20:59.167617  #

    2023-06-19T00:20:59.269074  / # export SHELL=3D/bin/sh. /lava-10801700/=
environment

    2023-06-19T00:20:59.269797  =


    2023-06-19T00:20:59.371203  / # . /lava-10801700/environment/lava-10801=
700/bin/lava-test-runner /lava-10801700/1

    2023-06-19T00:20:59.372429  =


    2023-06-19T00:20:59.377435  / # /lava-10801700/bin/lava-test-runner /la=
va-10801700/1

    2023-06-19T00:20:59.383783  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9d6fffc1c5e45730615b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648f9d6fffc1c5e457306=
15c
        failing since 39 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa1ae5aae58d33b306175

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa1ae5aae58d33b306=
176
        failing since 11 days (last pass: v6.4-rc5-210-gef2d89b88456f, firs=
t fail: v6.4-rc5-244-g9d674be53332) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa23cf7c29f5c24306177

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa23cf7c29f5c24306=
178
        failing since 39 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa3ed4d8143d3c430612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa3ed4d8143d3c4306=
12f
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa696126aee1453306161

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa696126aee1453306=
162
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa4a1bc3322f3ff306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa4a1bc3322f3ff306=
141
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa22353a2fbb12b306168

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa22353a2fbb12b306=
169
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa272a9728efbc0306185

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa272a9728efbc0306=
186
        failing since 119 days (last pass: v6.2-rc8-150-g30cd52e17d48, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9dbcd9945d103d30613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648f9dbcd9945d103d306=
140
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa4ecd3e3edadfb306168

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa4ecd3e3edadfb306=
169
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa4cfcad031ceab3061c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa4cfcad031ceab306=
1c3
        failing since 131 days (last pass: v6.2-rc6-351-gf42837eac380f, fir=
st fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa76c449fd469c4306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa76c449fd469c4306=
141
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa29775d1d0b7ed30616a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa29775d1d0b7ed306=
16b
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa328f5d860a91430612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa328f5d860a914306=
130
        failing since 41 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa3165c329682f33061a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa3165c329682f3306=
1a9
        failing since 41 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa702baad8c8e0c30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa702baad8c8e0c306=
12f
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa413878a2fc17030614c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa413878a2fc170306=
14d
        failing since 3 days (last pass: v6.4-rc6-274-g2a7f6b5fd1ca, first =
fail: v6.4-rc6-301-ga3b6bb6457ef) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa38503bf282b90306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa38503bf282b90306=
134
        failing since 3 days (last pass: v6.4-rc6-274-g2a7f6b5fd1ca, first =
fail: v6.4-rc6-301-ga3b6bb6457ef) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa3d8c97ee4c8fa306223

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa3d8c97ee4c8fa306=
224
        failing since 4 days (last pass: v6.4-rc6-257-gbc9b3eb6d292, first =
fail: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa38403bf282b9030612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa38403bf282b90306=
12f
        failing since 4 days (last pass: v6.4-rc6-257-gbc9b3eb6d292, first =
fail: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9a9138ccb3d548306172

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648f9a9138ccb3d548306=
173
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9f4c5c9cc0bb7c3061eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648f9f4c5c9cc0bb7c306=
1ec
        failing since 185 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9e484ced4f1ae230612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648f9e484ced4f1ae2306=
12f
        failing since 185 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648f9cf93ea7f5cc3f30613b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648f9cf93ea7f5cc3f306140
        failing since 137 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-19T00:10:14.058225  [   32.113913] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3675217_1.5.2.4.1>
    2023-06-19T00:10:14.162584  =

    2023-06-19T00:10:14.264156  / # #export SHELL=3D/bin/sh
    2023-06-19T00:10:14.264957  =

    2023-06-19T00:10:14.366889  / # export SHELL=3D/bin/sh. /lava-3675217/e=
nvironment
    2023-06-19T00:10:14.367718  =

    2023-06-19T00:10:14.469089  / # . /lava-3675217/environment/lava-367521=
7/bin/lava-test-runner /lava-3675217/1
    2023-06-19T00:10:14.470217  =

    2023-06-19T00:10:14.473486  / # /lava-3675217/bin/lava-test-runner /lav=
a-3675217/1
    2023-06-19T00:10:14.509374  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa0f6dcb8f7d2fd306187

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fa0f6dcb8f7d2fd30618c
        failing since 137 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-19T00:27:14.453511  [   29.233114] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3675450_1.5.2.4.1>
    2023-06-19T00:27:14.558521  =

    2023-06-19T00:27:14.660517  / # #export SHELL=3D/bin/sh
    2023-06-19T00:27:14.661006  =

    2023-06-19T00:27:14.762478  / # export SHELL=3D/bin/sh. /lava-3675450/e=
nvironment
    2023-06-19T00:27:14.763390  =

    2023-06-19T00:27:14.865324  / # . /lava-3675450/environment/lava-367545=
0/bin/lava-test-runner /lava-3675450/1
    2023-06-19T00:27:14.865919  =

    2023-06-19T00:27:14.869592  / # /lava-3675450/bin/lava-test-runner /lav=
a-3675450/1
    2023-06-19T00:27:14.905566  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa15a0877d2587e306145

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fa15a0877d2587e30614a
        failing since 137 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-19T00:28:52.737705  [   28.916449] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3675487_1.5.2.4.1>
    2023-06-19T00:28:52.842822  =

    2023-06-19T00:28:52.944455  / # #export SHELL=3D/bin/sh
    2023-06-19T00:28:52.945021  =

    2023-06-19T00:28:53.046571  / # export SHELL=3D/bin/sh. /lava-3675487/e=
nvironment
    2023-06-19T00:28:53.047190  =

    2023-06-19T00:28:53.148661  / # . /lava-3675487/environment/lava-367548=
7/bin/lava-test-runner /lava-3675487/1
    2023-06-19T00:28:53.149407  =

    2023-06-19T00:28:53.153912  / # /lava-3675487/bin/lava-test-runner /lav=
a-3675487/1
    2023-06-19T00:28:53.190514  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa35171402e839030616c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fa35171402e8390306171
        failing since 137 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-19T00:37:12.727181  [   29.073185] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3675629_1.5.2.4.1>
    2023-06-19T00:37:12.831814  =

    2023-06-19T00:37:12.933404  / # #export SHELL=3D/bin/sh
    2023-06-19T00:37:12.933903  =

    2023-06-19T00:37:13.035044  / # export SHELL=3D/bin/sh. /lava-3675629/e=
nvironment
    2023-06-19T00:37:13.035571  =

    2023-06-19T00:37:13.136949  / # . /lava-3675629/environment/lava-367562=
9/bin/lava-test-runner /lava-3675629/1
    2023-06-19T00:37:13.137749  =

    2023-06-19T00:37:13.141130  / # /lava-3675629/bin/lava-test-runner /lav=
a-3675629/1
    2023-06-19T00:37:13.176899  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa28475d1d0b7ed306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa28475d1d0b7ed306=
13a
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa34bf5d860a914306152

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-brooni=
e/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-brooni=
e/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa34bf5d860a914306=
153
        new failure (last pass: v6.4-rc6-301-ga3b6bb6457ef) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa53f61d2080c3d3061f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa53f61d2080c3d306=
1fa
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa246f7c29f5c243061a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa246f7c29f5c24306=
1a3
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648fa2fba80d4f3dc4306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648fa2fba80d4f3dc4306=
13a
        failing since 131 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648fc13bba07eb2eb830616a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fc13bba07eb2eb830616f
        failing since 137 days (last pass: v6.0-12387-ge54e01f1826aa, first=
 fail: v6.2-rc6-289-g1b7183933813)

    2023-06-19T02:45:01.878692  <8>[    9.769602] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3675093_1.5.2.4.1>
    2023-06-19T02:45:02.014752  / # #
    2023-06-19T02:45:02.121273  export SHELL=3D/bin/sh
    2023-06-19T02:45:02.122922  #
    2023-06-19T02:45:02.226567  / # export SHELL=3D/bin/sh. /lava-3675093/e=
nvironment
    2023-06-19T02:45:02.228395  =

    2023-06-19T02:45:02.332068  / # . /lava-3675093/environment/lava-367509=
3/bin/lava-test-runner /lava-3675093/1
    2023-06-19T02:45:02.334945  =

    2023-06-19T02:45:02.347556  / # /lava-3675093/bin/lava-test-runner /lav=
a-3675093/1
    2023-06-19T02:45:02.478179  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648fce7124edbf59ef306131

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-11=
0-gdab158ce7741/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648fce7124edbf59ef306136
        failing since 108 days (last pass: v6.2-12625-g13efc3a9f23b, first =
fail: v6.2-13370-g5872d227b73f)

    2023-06-19T03:41:21.886535  <8>[    9.753146] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3675097_1.5.2.4.1>
    2023-06-19T03:41:22.006554  / # #
    2023-06-19T03:41:22.112156  export SHELL=3D/bin/sh
    2023-06-19T03:41:22.113664  #
    2023-06-19T03:41:22.217083  / # export SHELL=3D/bin/sh. /lava-3675097/e=
nvironment
    2023-06-19T03:41:22.218593  =

    2023-06-19T03:41:22.322038  / # . /lava-3675097/environment/lava-367509=
7/bin/lava-test-runner /lava-3675097/1
    2023-06-19T03:41:22.324756  =

    2023-06-19T03:41:22.330846  / # /lava-3675097/bin/lava-test-runner /lav=
a-3675097/1
    2023-06-19T03:41:22.441579  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
