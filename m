Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D577F6FEC09
	for <lists+linux-next@lfdr.de>; Thu, 11 May 2023 08:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237072AbjEKG5b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 May 2023 02:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237126AbjEKG5V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 May 2023 02:57:21 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA891E2
        for <linux-next@vger.kernel.org>; Wed, 10 May 2023 23:57:15 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64388cf3263so5847443b3a.3
        for <linux-next@vger.kernel.org>; Wed, 10 May 2023 23:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683788235; x=1686380235;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uYIJsW3up+M/VTkDhjOT1i2n9psuGncmiruUTPlZcXQ=;
        b=2aWHqZXPQjvotCirmXaDqYii2Iki3npFfMPKTDG86CKap6Q6Q8LLGLaNA2EbMxSvRP
         00Rf83ppvXuDUBNDOzwIqrjM363BJJMPaBaR0wHGVNfjIXsdGQi1IlQepfs9O068TuNJ
         5JaUkzOFZ1DsjRzYocCOHV4QJ7rlI/SD/A/MvKoB7QBbLKvcqLPEKUjN4XOziwew3Nqe
         kVgEGjDWrlwpPCwwmc+zaQHxjJd7rjCWgo51w02cixXRMaEAOBTidRe6zC3wpcPU3zt8
         oHkvUPl2f9N+ozoZTeH043fWfIliOPxoXKk9NKIwCm3v/Ij6gjmVW8Uk7hXHxvxDTRk1
         QIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683788235; x=1686380235;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYIJsW3up+M/VTkDhjOT1i2n9psuGncmiruUTPlZcXQ=;
        b=TREbkcKlBxhYu0xD6aSid80nCUi5mcKueDAnnHBmBqhtPicUBCpB40QKuvZe6+DTXy
         0KsaAb8yYQJB7c+SWbd63n93pBBnhr415jjF1kkhhjwJJo9bkdvI5qDwzp11H2u/VMCD
         mvY9klvbwT/ip+1s+tEBS8y2mZIdgFD/eRq7gx8EpWwLZtzEcNE5ctge/zgj7jufoXfO
         9AEq9dit+qpv8znCk4L/trsDf21oSVFxPSeitPpVBDrIb5fapn3J4iXmscIIAXemHl1x
         QwyT1MApi3u+bH8ZKwH1fDmIh3ix/2auBca9Dd4qVhIQGK17/W2E8Jtt/miSgGcFHZzK
         PwPQ==
X-Gm-Message-State: AC+VfDxLGlT6HShrQ/21MvW9sPUxnIlOaec/Q7q6RDRft4ID4Pb4g2b6
        V0cRNnFVoScdRAgsVMl3XhnzQURwI0ZvPyH3USv4MA==
X-Google-Smtp-Source: ACHHUZ4JQqshLe9qR5e0QakJi5XOCsSzgUGzXbD0Q5MM1t+7t+0DNiAiQJ2dXNR2rCu26obb1XTHVg==
X-Received: by 2002:a17:902:7b82:b0:1a9:5c41:3f8e with SMTP id w2-20020a1709027b8200b001a95c413f8emr19406660pll.42.1683788233166;
        Wed, 10 May 2023 23:57:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m5-20020a170902db0500b001ac7f583f72sm5008378plx.209.2023.05.10.23.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 23:57:12 -0700 (PDT)
Message-ID: <645c91c8.170a0220.56037.a277@mx.google.com>
Date:   Wed, 10 May 2023 23:57:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.4-rc1-206-g1360b04fa3df
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 482 runs,
 74 regressions (v6.4-rc1-206-g1360b04fa3df)
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

next/pending-fixes baseline: 482 runs, 74 regressions (v6.4-rc1-206-g1360b0=
4fa3df)

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

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

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
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc1-206-g1360b04fa3df/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc1-206-g1360b04fa3df
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1360b04fa3df4a5b060c941a04e05cafe2efa297 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c59b8ae0e7813d82e8600

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c59b8ae0e7813d82e8605
        failing since 43 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T02:57:40.356522  <8>[   11.193016] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275448_1.4.2.3.1>

    2023-05-11T02:57:40.359973  + set +x

    2023-05-11T02:57:40.461476  =


    2023-05-11T02:57:40.562184  / # #export SHELL=3D/bin/sh

    2023-05-11T02:57:40.562427  =


    2023-05-11T02:57:40.662939  / # export SHELL=3D/bin/sh. /lava-10275448/=
environment

    2023-05-11T02:57:40.663191  =


    2023-05-11T02:57:40.763726  / # . /lava-10275448/environment/lava-10275=
448/bin/lava-test-runner /lava-10275448/1

    2023-05-11T02:57:40.764021  =


    2023-05-11T02:57:40.769513  / # /lava-10275448/bin/lava-test-runner /la=
va-10275448/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5b343f3f1585cd2e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5b343f3f1585cd2e85ec
        failing since 41 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-11T03:04:06.482861  + set +x

    2023-05-11T03:04:06.489129  <8>[   13.488388] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275784_1.4.2.3.1>

    2023-05-11T03:04:06.593505  / # #

    2023-05-11T03:04:06.694077  export SHELL=3D/bin/sh

    2023-05-11T03:04:06.694285  #

    2023-05-11T03:04:06.794779  / # export SHELL=3D/bin/sh. /lava-10275784/=
environment

    2023-05-11T03:04:06.795073  =


    2023-05-11T03:04:06.895585  / # . /lava-10275784/environment/lava-10275=
784/bin/lava-test-runner /lava-10275784/1

    2023-05-11T03:04:06.895891  =


    2023-05-11T03:04:06.901278  / # /lava-10275784/bin/lava-test-runner /la=
va-10275784/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c38b6fd229e912e86ad

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c38b6fd229e912e86b2
        failing since 43 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T03:08:22.648084  <8>[    9.227047] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275856_1.4.2.3.1>

    2023-05-11T03:08:22.651524  + set +x

    2023-05-11T03:08:22.756034  / # #

    2023-05-11T03:08:22.856718  export SHELL=3D/bin/sh

    2023-05-11T03:08:22.856930  #

    2023-05-11T03:08:22.957412  / # export SHELL=3D/bin/sh. /lava-10275856/=
environment

    2023-05-11T03:08:22.957677  =


    2023-05-11T03:08:23.058267  / # . /lava-10275856/environment/lava-10275=
856/bin/lava-test-runner /lava-10275856/1

    2023-05-11T03:08:23.058624  =


    2023-05-11T03:08:23.064395  / # /lava-10275856/bin/lava-test-runner /la=
va-10275856/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c598598f6ba805e2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c598598f6ba805e2e85eb
        failing since 43 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T02:56:54.422131  + set +x<8>[   11.233065] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10275417_1.4.2.3.1>

    2023-05-11T02:56:54.422263  =


    2023-05-11T02:56:54.526341  / # #

    2023-05-11T02:56:54.626927  export SHELL=3D/bin/sh

    2023-05-11T02:56:54.627105  #

    2023-05-11T02:56:54.727623  / # export SHELL=3D/bin/sh. /lava-10275417/=
environment

    2023-05-11T02:56:54.727798  =


    2023-05-11T02:56:54.828316  / # . /lava-10275417/environment/lava-10275=
417/bin/lava-test-runner /lava-10275417/1

    2023-05-11T02:56:54.828620  =


    2023-05-11T02:56:54.833455  / # /lava-10275417/bin/lava-test-runner /la=
va-10275417/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/645c5b358d83a2e7622e8630

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5b358d83a2e7622e8635
        failing since 41 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-11T03:04:14.829529  + set +x

    2023-05-11T03:04:14.836188  <8>[   15.544439] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275761_1.4.2.3.1>

    2023-05-11T03:04:14.941063  / # #

    2023-05-11T03:04:15.041706  export SHELL=3D/bin/sh

    2023-05-11T03:04:15.041945  #

    2023-05-11T03:04:15.142494  / # export SHELL=3D/bin/sh. /lava-10275761/=
environment

    2023-05-11T03:04:15.142697  =


    2023-05-11T03:04:15.243247  / # . /lava-10275761/environment/lava-10275=
761/bin/lava-test-runner /lava-10275761/1

    2023-05-11T03:04:15.243526  =


    2023-05-11T03:04:15.247797  / # /lava-10275761/bin/lava-test-runner /la=
va-10275761/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c5b358d83a2e=
7622e8637
        failing since 0 day (last pass: v6.4-rc1-141-gb95366eba58e, first f=
ail: v6.4-rc1-166-g16fe96af4971)
        3 lines

    2023-05-11T03:04:14.805598  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-05-11T03:04:14.812281  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-05-11T03:04:14.819069  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-05-11T03:04:14.825875  <8>[   15.527830] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c11a7540051c32e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c11a7540051c32e85f9
        failing since 43 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T03:07:43.520528  + <8>[   11.870645] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10275857_1.4.2.3.1>

    2023-05-11T03:07:43.520631  set +x

    2023-05-11T03:07:43.625069  / # #

    2023-05-11T03:07:43.725780  export SHELL=3D/bin/sh

    2023-05-11T03:07:43.725981  #

    2023-05-11T03:07:43.826514  / # export SHELL=3D/bin/sh. /lava-10275857/=
environment

    2023-05-11T03:07:43.826715  =


    2023-05-11T03:07:43.927247  / # . /lava-10275857/environment/lava-10275=
857/bin/lava-test-runner /lava-10275857/1

    2023-05-11T03:07:43.927664  =


    2023-05-11T03:07:43.932594  / # /lava-10275857/bin/lava-test-runner /la=
va-10275857/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c597c04e270e0082e8619

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c597c04e270e0082e861e
        failing since 43 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T02:56:42.311112  <8>[   10.242071] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275439_1.4.2.3.1>

    2023-05-11T02:56:42.314619  + set +x

    2023-05-11T02:56:42.416041  =


    2023-05-11T02:56:42.516667  / # #export SHELL=3D/bin/sh

    2023-05-11T02:56:42.516865  =


    2023-05-11T02:56:42.617374  / # export SHELL=3D/bin/sh. /lava-10275439/=
environment

    2023-05-11T02:56:42.617653  =


    2023-05-11T02:56:42.718202  / # . /lava-10275439/environment/lava-10275=
439/bin/lava-test-runner /lava-10275439/1

    2023-05-11T02:56:42.718494  =


    2023-05-11T02:56:42.723110  / # /lava-10275439/bin/lava-test-runner /la=
va-10275439/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5b408d83a2e7622e8659

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5b408d83a2e7622e865e
        failing since 41 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-11T03:04:15.507720  <8>[   12.071972] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275786_1.4.2.3.1>

    2023-05-11T03:04:15.511405  + set +x

    2023-05-11T03:04:15.612981  =


    2023-05-11T03:04:15.713531  / # #export SHELL=3D/bin/sh

    2023-05-11T03:04:15.713773  =


    2023-05-11T03:04:15.814287  / # export SHELL=3D/bin/sh. /lava-10275786/=
environment

    2023-05-11T03:04:15.814574  =


    2023-05-11T03:04:15.915063  / # . /lava-10275786/environment/lava-10275=
786/bin/lava-test-runner /lava-10275786/1

    2023-05-11T03:04:15.915368  =


    2023-05-11T03:04:15.920511  / # /lava-10275786/bin/lava-test-runner /la=
va-10275786/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c14e20e605da72e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c14e20e605da72e85ed
        failing since 43 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T03:07:43.907550  <8>[   10.624074] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275841_1.4.2.3.1>

    2023-05-11T03:07:43.912092  + set +x

    2023-05-11T03:07:44.018299  #

    2023-05-11T03:07:44.121439  / # #export SHELL=3D/bin/sh

    2023-05-11T03:07:44.122351  =


    2023-05-11T03:07:44.224117  / # export SHELL=3D/bin/sh. /lava-10275841/=
environment

    2023-05-11T03:07:44.225046  =


    2023-05-11T03:07:44.326696  / # . /lava-10275841/environment/lava-10275=
841/bin/lava-test-runner /lava-10275841/1

    2023-05-11T03:07:44.327215  =


    2023-05-11T03:07:44.332457  / # /lava-10275841/bin/lava-test-runner /la=
va-10275841/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/645c598698f6ba805e2e85f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c598698f6ba805e2e85f6
        failing since 119 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-05-11T02:56:50.509470  / # #

    2023-05-11T02:56:50.610104  export SHELL=3D/bin/sh

    2023-05-11T02:56:50.610358  #

    2023-05-11T02:56:50.710850  / # export SHELL=3D/bin/sh. /lava-10275383/=
environment

    2023-05-11T02:56:50.711130  =


    2023-05-11T02:56:50.811716  / # . /lava-10275383/environment/lava-10275=
383/bin/lava-test-runner /lava-10275383/1

    2023-05-11T02:56:50.812075  =


    2023-05-11T02:56:50.822819  / # /lava-10275383/bin/lava-test-runner /la=
va-10275383/1

    2023-05-11T02:56:50.936911  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-11T02:56:50.937086  + cd /lava-10275383/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5ac8611b5e69a62e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5ac8611b5e69a62e8=
5fe
        failing since 73 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/645c597a04e270e0082e860d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c597a04e270e=
0082e8614
        failing since 69 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-05-11T02:56:46.529125  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4c6c200 pointer offset 4 size 512
    2023-05-11T02:56:46.561320  kern  :alert : Register r9 information: non=
-paged memory
    2023-05-11T02:56:46.562510  kern  :alert : Register r10 information: NU=
LL pointer
    2023-05-11T02:56:46.563015  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2f7000 allocated at load_module+0x6b0/0=
x1954
    2023-05-11T02:56:46.564489  kern  :alert : Register r12 information: no=
n-paged memory
    2023-05-11T02:56:46.668873  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-05-11T02:56:46.669762  kern  :emerg : Process udevd (pid: 66, stac=
k limit =3D 0x6eb56b3c)
    2023-05-11T02:56:46.670339  kern  :emerg : Stack: (0xc8905cf8 to 0xc890=
6000)
    2023-05-11T02:56:46.670857  kern  :emerg : 5ce0:                       =
                                c4c6c200 c0777860
    2023-05-11T02:56:46.671393  kern  :emerg : 5d00: 00000000 c03b02b8 0000=
0000 4df31a82 0000005d 4df31a82 c0777860 bf2f7220 =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645c597a04e270e=
0082e8615
        failing since 472 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-05-11T02:56:46.480623  kern  :alert : 8<--- cut here ---
    2023-05-11T02:56:46.481932  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-05-11T02:56:46.482376  kern  :alert : [00000060] *pgd=3Dc4a19831, =
*pte=3D00000000, *ppte=3D00000000
    2023-05-11T02:56:46.482747  kern  :alert : Register r0 information: non=
-paged memory
    2023-05-11T02:56:46.483092  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8904000 allocated at kernel_clone+0x98/0x=
3a0
    2023-05-11T02:56:46.484940  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-05-11T02:56:46.524044  kern  :alert : Register r3 information: non=
-paged memory
    2023-05-11T02:56:46.524838  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4c6c200 pointer offset 0 size 512
    2023-05-11T02:56:46.525285  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-05-11T02:56:46.525747  kern  :ale<8><LAVA_SIGNAL_TESTCASE TEST_CAS=
E_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c59ac8d2783d05c2e8613

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c59ac8d2783d05c2e8618
        failing since 43 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T02:57:33.029454  + set +x

    2023-05-11T02:57:33.036230  <8>[   41.514757] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275436_1.4.2.3.1>

    2023-05-11T02:57:33.140519  / # #

    2023-05-11T02:57:33.241161  export SHELL=3D/bin/sh

    2023-05-11T02:57:33.241358  #

    2023-05-11T02:57:33.341886  / # export SHELL=3D/bin/sh. /lava-10275436/=
environment

    2023-05-11T02:57:33.342067  =


    2023-05-11T02:57:33.442595  / # . /lava-10275436/environment/lava-10275=
436/bin/lava-test-runner /lava-10275436/1

    2023-05-11T02:57:33.442855  =


    2023-05-11T02:57:33.447789  / # /lava-10275436/bin/lava-test-runner /la=
va-10275436/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5cf4eb223324c82e8603

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5cf4eb223324c82e8608
        failing since 41 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-11T03:11:33.763707  + set +x

    2023-05-11T03:11:33.770091  <8>[   15.806418] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275758_1.4.2.3.1>

    2023-05-11T03:11:33.876987  / # #

    2023-05-11T03:11:33.977699  export SHELL=3D/bin/sh

    2023-05-11T03:11:33.977921  #

    2023-05-11T03:11:34.078479  / # export SHELL=3D/bin/sh. /lava-10275758/=
environment

    2023-05-11T03:11:34.078674  =


    2023-05-11T03:11:34.179194  / # . /lava-10275758/environment/lava-10275=
758/bin/lava-test-runner /lava-10275758/1

    2023-05-11T03:11:34.179557  =


    2023-05-11T03:11:34.183881  / # /lava-10275758/bin/lava-test-runner /la=
va-10275758/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5d000c0f556a2d2e8604

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5d000c0f556a2d2e8609
        failing since 43 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T03:11:46.577990  + set +x

    2023-05-11T03:11:46.584455  <8>[   11.924365] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275858_1.4.2.3.1>

    2023-05-11T03:11:46.688546  / # #

    2023-05-11T03:11:46.789128  export SHELL=3D/bin/sh

    2023-05-11T03:11:46.789330  #

    2023-05-11T03:11:46.889834  / # export SHELL=3D/bin/sh. /lava-10275858/=
environment

    2023-05-11T03:11:46.890042  =


    2023-05-11T03:11:46.990531  / # . /lava-10275858/environment/lava-10275=
858/bin/lava-test-runner /lava-10275858/1

    2023-05-11T03:11:46.990826  =


    2023-05-11T03:11:46.995505  / # /lava-10275858/bin/lava-test-runner /la=
va-10275858/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c596af90ed306b82e8626

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c596af90ed306b82e862b
        failing since 43 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T02:56:28.216529  + set +x

    2023-05-11T02:56:28.223167  <8>[   10.926593] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275413_1.4.2.3.1>

    2023-05-11T02:56:28.325247  =


    2023-05-11T02:56:28.425852  / # #export SHELL=3D/bin/sh

    2023-05-11T02:56:28.426089  =


    2023-05-11T02:56:28.526607  / # export SHELL=3D/bin/sh. /lava-10275413/=
environment

    2023-05-11T02:56:28.526817  =


    2023-05-11T02:56:28.627306  / # . /lava-10275413/environment/lava-10275=
413/bin/lava-test-runner /lava-10275413/1

    2023-05-11T02:56:28.627628  =


    2023-05-11T02:56:28.632645  / # /lava-10275413/bin/lava-test-runner /la=
va-10275413/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c6b33732278522e85fa

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c6b33732278522e85ff
        failing since 41 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-11T03:09:21.093252  + set<8>[   12.941536] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10275750_1.4.2.3.1>

    2023-05-11T03:09:21.093679   +x

    2023-05-11T03:09:21.201589  / # #

    2023-05-11T03:09:21.303525  export SHELL=3D/bin/sh

    2023-05-11T03:09:21.304416  #

    2023-05-11T03:09:21.405924  / # export SHELL=3D/bin/sh. /lava-10275750/=
environment

    2023-05-11T03:09:21.406579  =


    2023-05-11T03:09:21.507937  / # . /lava-10275750/environment/lava-10275=
750/bin/lava-test-runner /lava-10275750/1

    2023-05-11T03:09:21.509204  =


    2023-05-11T03:09:21.514511  / # /lava-10275750/bin/lava-test-runner /la=
va-10275750/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c9fa522e724ef2e85f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c9fa522e724ef2e85fd
        failing since 43 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T03:10:06.591325  <8>[    7.778265] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275876_1.4.2.3.1>

    2023-05-11T03:10:06.594536  + set +x

    2023-05-11T03:10:06.695686  #

    2023-05-11T03:10:06.695932  =


    2023-05-11T03:10:06.796488  / # #export SHELL=3D/bin/sh

    2023-05-11T03:10:06.796694  =


    2023-05-11T03:10:06.897177  / # export SHELL=3D/bin/sh. /lava-10275876/=
environment

    2023-05-11T03:10:06.897396  =


    2023-05-11T03:10:06.997999  / # . /lava-10275876/environment/lava-10275=
876/bin/lava-test-runner /lava-10275876/1

    2023-05-11T03:10:06.998291  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c598fdabc9f09752e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c598fdabc9f09752e85fc
        failing since 43 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T02:57:00.035323  + set<8>[   10.670604] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10275433_1.4.2.3.1>

    2023-05-11T02:57:00.035409   +x

    2023-05-11T02:57:00.139777  / # #

    2023-05-11T02:57:00.240473  export SHELL=3D/bin/sh

    2023-05-11T02:57:00.240670  #

    2023-05-11T02:57:00.341185  / # export SHELL=3D/bin/sh. /lava-10275433/=
environment

    2023-05-11T02:57:00.341394  =


    2023-05-11T02:57:00.441935  / # . /lava-10275433/environment/lava-10275=
433/bin/lava-test-runner /lava-10275433/1

    2023-05-11T02:57:00.442226  =


    2023-05-11T02:57:00.447040  / # /lava-10275433/bin/lava-test-runner /la=
va-10275433/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5b423f3f1585cd2e861b

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5b423f3f1585cd2e8620
        failing since 41 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-11T03:04:17.868454  + set +x

    2023-05-11T03:04:17.874735  <8>[   14.232879] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275793_1.4.2.3.1>

    2023-05-11T03:04:17.978964  / # #

    2023-05-11T03:04:18.079588  export SHELL=3D/bin/sh

    2023-05-11T03:04:18.079804  #

    2023-05-11T03:04:18.180304  / # export SHELL=3D/bin/sh. /lava-10275793/=
environment

    2023-05-11T03:04:18.180519  =


    2023-05-11T03:04:18.281004  / # . /lava-10275793/environment/lava-10275=
793/bin/lava-test-runner /lava-10275793/1

    2023-05-11T03:04:18.281349  =


    2023-05-11T03:04:18.285880  / # /lava-10275793/bin/lava-test-runner /la=
va-10275793/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c20df826adaa52e85f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c20df826adaa52e85f6
        failing since 43 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T03:07:54.612628  + set<8>[   11.136165] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10275887_1.4.2.3.1>

    2023-05-11T03:07:54.612747   +x

    2023-05-11T03:07:54.717946  / # #

    2023-05-11T03:07:54.818842  export SHELL=3D/bin/sh

    2023-05-11T03:07:54.819087  #

    2023-05-11T03:07:54.919665  / # export SHELL=3D/bin/sh. /lava-10275887/=
environment

    2023-05-11T03:07:54.919882  =


    2023-05-11T03:07:55.020451  / # . /lava-10275887/environment/lava-10275=
887/bin/lava-test-runner /lava-10275887/1

    2023-05-11T03:07:55.020738  =


    2023-05-11T03:07:55.025251  / # /lava-10275887/bin/lava-test-runner /la=
va-10275887/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/645c59f0c9808629a52e85f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c59f0c9808629a52e85f7
        failing since 101 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-11T02:58:32.549837  + set +x
    2023-05-11T02:58:32.550011  [   13.072272] <LAVA_SIGNAL_ENDRUN 0_dmesg =
946886_1.5.2.3.1>
    2023-05-11T02:58:32.658169  / # #
    2023-05-11T02:58:32.759878  export SHELL=3D/bin/sh
    2023-05-11T02:58:32.760433  #
    2023-05-11T02:58:32.861743  / # export SHELL=3D/bin/sh. /lava-946886/en=
vironment
    2023-05-11T02:58:32.862190  =

    2023-05-11T02:58:32.963452  / # . /lava-946886/environment/lava-946886/=
bin/lava-test-runner /lava-946886/1
    2023-05-11T02:58:32.964027  =

    2023-05-11T02:58:32.966963  / # /lava-946886/bin/lava-test-runner /lava=
-946886/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5a40e90418fbc42e8610

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5a40e90418fbc42e8615
        failing since 101 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-11T02:59:51.093913  + set +x
    2023-05-11T02:59:51.094162  [   12.881844] <LAVA_SIGNAL_ENDRUN 0_dmesg =
946895_1.5.2.3.1>
    2023-05-11T02:59:51.202088  / # #
    2023-05-11T02:59:51.303884  export SHELL=3D/bin/sh
    2023-05-11T02:59:51.304352  #
    2023-05-11T02:59:51.405703  / # export SHELL=3D/bin/sh. /lava-946895/en=
vironment
    2023-05-11T02:59:51.406222  =

    2023-05-11T02:59:51.507580  / # . /lava-946895/environment/lava-946895/=
bin/lava-test-runner /lava-946895/1
    2023-05-11T02:59:51.508250  =

    2023-05-11T02:59:51.511430  / # /lava-946895/bin/lava-test-runner /lava=
-946895/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5af36fae9e75dd2e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5af36fae9e75dd2e85ec
        failing since 101 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-11T03:02:55.125755  + set +x
    2023-05-11T03:02:55.125954  [   14.350243] <LAVA_SIGNAL_ENDRUN 0_dmesg =
946904_1.5.2.3.1>
    2023-05-11T03:02:55.233543  / # #
    2023-05-11T03:02:55.335102  export SHELL=3D/bin/sh
    2023-05-11T03:02:55.335530  #
    2023-05-11T03:02:55.436746  / # export SHELL=3D/bin/sh. /lava-946904/en=
vironment
    2023-05-11T03:02:55.437258  =

    2023-05-11T03:02:55.538769  / # . /lava-946904/environment/lava-946904/=
bin/lava-test-runner /lava-946904/1
    2023-05-11T03:02:55.539590  =

    2023-05-11T03:02:55.542790  / # /lava-946904/bin/lava-test-runner /lava=
-946904/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5b443f3f1585cd2e8631

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5b443f3f1585cd2e8636
        failing since 101 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-11T03:04:14.223556  + set +x
    2023-05-11T03:04:14.223711  [   12.599181] <LAVA_SIGNAL_ENDRUN 0_dmesg =
946912_1.5.2.3.1>
    2023-05-11T03:04:14.330561  / # #
    2023-05-11T03:04:14.432139  export SHELL=3D/bin/sh
    2023-05-11T03:04:14.432693  #
    2023-05-11T03:04:14.533888  / # export SHELL=3D/bin/sh. /lava-946912/en=
vironment
    2023-05-11T03:04:14.534394  =

    2023-05-11T03:04:14.635696  / # . /lava-946912/environment/lava-946912/=
bin/lava-test-runner /lava-946912/1
    2023-05-11T03:04:14.636369  =

    2023-05-11T03:04:14.639658  / # /lava-946912/bin/lava-test-runner /lava=
-946912/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c34e20e605da72e861f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c34e20e605da72e8624
        failing since 101 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-11T03:08:12.601860  + set +x
    2023-05-11T03:08:12.602028  [   13.134846] <LAVA_SIGNAL_ENDRUN 0_dmesg =
946925_1.5.2.3.1>
    2023-05-11T03:08:12.708744  / # #
    2023-05-11T03:08:12.810176  export SHELL=3D/bin/sh
    2023-05-11T03:08:12.810538  #
    2023-05-11T03:08:12.911836  / # export SHELL=3D/bin/sh. /lava-946925/en=
vironment
    2023-05-11T03:08:12.912151  =

    2023-05-11T03:08:13.013526  / # . /lava-946925/environment/lava-946925/=
bin/lava-test-runner /lava-946925/1
    2023-05-11T03:08:13.014145  =

    2023-05-11T03:08:13.017707  / # /lava-946925/bin/lava-test-runner /lava=
-946925/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5b588b08a668d22e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5b588b08a668d22e85eb
        new failure (last pass: v6.4-rc1-166-g16fe96af4971)

    2023-05-11T03:04:46.762661  + set[   14.612143] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 946919_1.5.2.3.1>
    2023-05-11T03:04:46.762918   +x
    2023-05-11T03:04:46.868806  / # #
    2023-05-11T03:04:46.970430  export SHELL=3D/bin/sh
    2023-05-11T03:04:46.970892  #
    2023-05-11T03:04:47.072166  / # export SHELL=3D/bin/sh. /lava-946919/en=
vironment
    2023-05-11T03:04:47.072646  =

    2023-05-11T03:04:47.173943  / # . /lava-946919/environment/lava-946919/=
bin/lava-test-runner /lava-946919/1
    2023-05-11T03:04:47.174568  =

    2023-05-11T03:04:47.177475  / # /lava-946919/bin/lava-test-runner /lava=
-946919/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c21df826adaa52e85fc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c21df826adaa52e85ff
        failing since 126 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-05-11T03:06:57.146509  + set<8>[   31.384636] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1218269_1.5.2.4.1>
    2023-05-11T03:06:57.146805   +x
    2023-05-11T03:06:57.250911  / # #
    2023-05-11T03:06:58.410183  export SHELL=3D/bin/sh
    2023-05-11T03:06:58.415926  #
    2023-05-11T03:06:59.962543  / # export SHELL=3D/bin/sh. /lava-1218269/e=
nvironment
    2023-05-11T03:06:59.967976  =

    2023-05-11T03:07:02.787144  / # . /lava-1218269/environment/lava-121826=
9/bin/lava-test-runner /lava-1218269/1
    2023-05-11T03:07:02.792775  =

    2023-05-11T03:07:02.804794  / # /lava-1218269/bin/lava-test-runner /lav=
a-1218269/1 =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c1bd5565445be2e8617

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c1bd5565445be2e861a
        failing since 126 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-05-11T03:07:39.994046  + set +x<8>[   56.342775] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1218268_1.5.2.4.1>
    2023-05-11T03:07:39.994360  =

    2023-05-11T03:07:40.103134  / # #
    2023-05-11T03:07:41.263734  export SHELL=3D/bin/sh
    2023-05-11T03:07:41.269428  #
    2023-05-11T03:07:41.269750  / # export SHELL=3D/bin/sh
    2023-05-11T03:07:42.817406  / # . /lava-1218268/environment
    2023-05-11T03:07:45.642779  /lava-1218268/bin/lava-test-runner /lava-12=
18268/1
    2023-05-11T03:07:45.648585  . /lava-1218268/environment
    2023-05-11T03:07:45.648774  / # /lava-1218268/bin/lava-test-runner /lav=
a-1218268/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c584a032364eafb2e8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c584a032364eafb2e8=
641
        new failure (last pass: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5a8d8267d880222e861c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5a8d8267d880222e8=
61d
        failing since 376 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5835032364eafb2e85f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5835032364eafb2e85fc
        failing since 2 days (last pass: v6.3-rc7-210-g884374c58391a, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)

    2023-05-11T02:51:16.341895  <8>[    8.859170] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3573899_1.5.2.4.1>
    2023-05-11T02:51:16.445434  / # #
    2023-05-11T02:51:16.548248  export SHELL=3D/bin/sh
    2023-05-11T02:51:16.549244  #
    2023-05-11T02:51:16.651367  / # export SHELL=3D/bin/sh. /lava-3573899/e=
nvironment
    2023-05-11T02:51:16.651713  =

    2023-05-11T02:51:16.752802  / # . /lava-3573899/environment/lava-357389=
9/bin/lava-test-runner /lava-3573899/1
    2023-05-11T02:51:16.753272  =

    2023-05-11T02:51:16.757723  / # /lava-3573899/bin/lava-test-runner /lav=
a-3573899/1
    2023-05-11T02:51:16.802780  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5f85e0d07c89eb2e8605

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5f85e0d07c89eb2e860a
        failing since 14 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.3-5614-gbe56a31d3d65)

    2023-05-11T03:22:32.619579  <8>[   19.339161] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3574243_1.5.2.4.1>
    2023-05-11T03:22:32.754445  #
    2023-05-11T03:22:32.856352  / # #export SHELL=3D/bin/sh
    2023-05-11T03:22:32.856748  =

    2023-05-11T03:22:32.957961  / # export SHELL=3D/bin/sh. /lava-3574243/e=
nvironment
    2023-05-11T03:22:32.958589  =

    2023-05-11T03:22:33.059711  / # . /lava-357/lava-3574243/bin/lava-test-=
runner /lava-3574243/1
    2023-05-11T03:22:33.060514  4243/environment
    2023-05-11T03:22:33.101843  / # /lava-3574243/bin/lava-test-runner /lav=
a-3574243/1
    2023-05-11T03:22:33.323308  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c597504e270e0082e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c597504e270e0082e85eb
        failing since 43 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T02:56:40.896209  <8>[   11.765413] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275450_1.4.2.3.1>

    2023-05-11T02:56:41.000806  / # #

    2023-05-11T02:56:41.101597  export SHELL=3D/bin/sh

    2023-05-11T02:56:41.101864  #

    2023-05-11T02:56:41.202470  / # export SHELL=3D/bin/sh. /lava-10275450/=
environment

    2023-05-11T02:56:41.202708  =


    2023-05-11T02:56:41.303306  / # . /lava-10275450/environment/lava-10275=
450/bin/lava-test-runner /lava-10275450/1

    2023-05-11T02:56:41.303701  =


    2023-05-11T02:56:41.308200  / # /lava-10275450/bin/lava-test-runner /la=
va-10275450/1

    2023-05-11T02:56:41.314559  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c39da16bca9622e8617

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c39da16bca9622e861c
        failing since 41 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-11T03:08:32.363024  + <8>[   13.771049] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10275764_1.4.2.3.1>

    2023-05-11T03:08:32.363113  set +x

    2023-05-11T03:08:32.467750  / # #

    2023-05-11T03:08:32.568500  export SHELL=3D/bin/sh

    2023-05-11T03:08:32.568768  #

    2023-05-11T03:08:32.669434  / # export SHELL=3D/bin/sh. /lava-10275764/=
environment

    2023-05-11T03:08:32.669638  =


    2023-05-11T03:08:32.770156  / # . /lava-10275764/environment/lava-10275=
764/bin/lava-test-runner /lava-10275764/1

    2023-05-11T03:08:32.770462  =


    2023-05-11T03:08:32.774974  / # /lava-10275764/bin/lava-test-runner /la=
va-10275764/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5c899238c1563c2e8609

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c5c899238c1563c2e860e
        failing since 43 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-11T03:09:47.717064  <8>[   15.555428] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275833_1.4.2.3.1>

    2023-05-11T03:09:47.821842  / # #

    2023-05-11T03:09:47.922508  export SHELL=3D/bin/sh

    2023-05-11T03:09:47.922737  #

    2023-05-11T03:09:48.023308  / # export SHELL=3D/bin/sh. /lava-10275833/=
environment

    2023-05-11T03:09:48.023523  =


    2023-05-11T03:09:48.124077  / # . /lava-10275833/environment/lava-10275=
833/bin/lava-test-runner /lava-10275833/1

    2023-05-11T03:09:48.124371  =


    2023-05-11T03:09:48.128619  / # /lava-10275833/bin/lava-test-runner /la=
va-10275833/1

    2023-05-11T03:09:48.135294  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c584fdadf0141082e861c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c584fdadf0141082e8=
61d
        failing since 0 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c60b0b6c61a98462e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c60b0b6c61a98462e8=
5ea
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c60d5d2085c6a6e2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c60d5d2085c6a6e2e8=
5e7
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6020721e9346932e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6020721e9346932e8=
5f2
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c601df9d7ef25e52e8615

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c601df9d7ef25e52e8=
616
        failing since 80 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c603cf39cfa66162e864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c603cf39cfa66162e8=
64c
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c62de5dcd7f3b892e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c62de5dcd7f3b892e8=
5f2
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c60d8b6c61a98462e8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c60d8b6c61a98462e8=
639
        failing since 92 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c603e6f5f413c032e8628

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c603e6f5f413c032e8=
629
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c604453403658482e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c604453403658482e8=
606
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6039f39cfa66162e8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6039f39cfa66162e8=
646
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5fd5e87efb88ee2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5fd5e87efb88ee2e8=
5e7
        failing since 106 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5aae3946ac76cc2e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5aae3946ac76cc2e8=
5f1
        failing since 14 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5fd7c13da19fa72e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5fd7c13da19fa72e8=
5fa
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5a98109a2ac18d2e8614

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5a98109a2ac18d2e8=
615
        failing since 14 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5fd5c13da19fa72e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5fd5c13da19fa72e8=
5f4
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c63a00884faf3db2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c63a00884faf3db2e8=
5e9
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c663433bfd453a02e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c663433bfd453a02e8=
5e7
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645c59e4ef71d2408e2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c59e4ef71d2408e2e8=
5e8
        failing since 12 days (last pass: v6.3-8745-gc94d3163e00b, first fa=
il: v6.3-10703-gb3f869e79cdf) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5b3f8d83a2e7622e8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5b3f8d83a2e7622e8=
654
        failing since 146 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5a3ddf46bb34172e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5a3ddf46bb34172e8=
601
        failing since 146 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/645c59c075f6891da32e8602

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c59c075f6891=
da32e8659
        failing since 14 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-11T02:57:33.271310  at virtual address 0000000000000008

    2023-05-11T02:57:33.273938  kern  :alert : Mem abort info:

    2023-05-11T02:57:33.278573  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-11T02:57:33.283960  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-11T02:57:33.287904  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-11T02:57:33.290960  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-11T02:57:33.296810  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645c59c075f6891=
da32e865a
        failing since 14 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-11T02:57:33.229836  <8>[   19.107097] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-11T02:57:33.267313  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   19.143927] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6001f19f8ee5712e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6001f19f8ee5712e8=
603
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645c583433f506a7122e85ec

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c583433f506a=
7122e85f3
        failing since 2 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-11T02:51:09.779697  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-11T02:51:09.781226  kern  :emerg : Code: 97ff7910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-11T02:51:09.792148  <8>[   21.607037] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-11T02:51:09.792529  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645c583433f506a=
7122e85f4
        failing since 2 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-11T02:51:09.753903  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-11T02:51:09.754829  kern  :alert : Mem abort info:
    2023-05-11T02:51:09.755184  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-11T02:51:09.755745  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-11T02:51:09.756566  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-11T02:51:09.756931  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-11T02:51:09.757541  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-11T02:51:09.758407  kern  :alert : Data abort info:
    2023-05-11T02:51:09.758778  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-11T02:51:09.759344  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c602c0d93d82df32e8625

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c602c0d93d82df32e8=
626
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645c584133f506a7122e8613

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c584133f506a=
7122e861a
        failing since 2 days (last pass: v6.3-1432-g527c4dda86b8, first fai=
l: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-11T02:51:23.358612  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-11T02:51:23.359031  kern  :emerg : Code: 97fd7110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-11T02:51:23.359362  <8>[   23.200588] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-11T02:51:23.359672  + set +x

    2023-05-11T02:51:23.359966  <8>[   23.202597] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10275162_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645c584133f506a=
7122e861b
        failing since 2 days (last pass: v6.3-1432-g527c4dda86b8, first fai=
l: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-11T02:51:23.312223  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-11T02:51:23.312639  kern  :alert : Mem abort info:

    2023-05-11T02:51:23.313053  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-11T02:51:23.313475  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-11T02:51:23.313863  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-11T02:51:23.314238  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-11T02:51:23.314603  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-11T02:51:23.314970  kern  :alert : Data abort info:

    2023-05-11T02:51:23.315333  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-11T02:51:23.315693  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645c601ff9d7ef25e52e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c601ff9d7ef25e52e8=
619
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5fcfc4132ee28c2e864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5fcfc4132ee28c2e8=
650
        failing since 92 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c59234ea5c30e732e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c59234ea5c30e732e8=
5e8
        failing since 1 day (last pass: v6.4-rc1-91-g2f19ff6b99223, first f=
ail: v6.4-rc1-141-gb95366eba58e) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645c59c275f6891da32e865d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c59c275f6891da32e8662
        failing since 98 days (last pass: v6.0-12387-ge54e01f1826aa, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-05-11T02:57:45.172537  / # #
    2023-05-11T02:57:45.279103  export SHELL=3D/bin/sh
    2023-05-11T02:57:45.280882  #
    2023-05-11T02:57:45.384775  / # export SHELL=3D/bin/sh. /lava-3573882/e=
nvironment
    2023-05-11T02:57:45.386881  =

    2023-05-11T02:57:45.491293  / # . /lava-3573882/environment/lava-357388=
2/bin/lava-test-runner /lava-3573882/1
    2023-05-11T02:57:45.494537  =

    2023-05-11T02:57:45.509096  / # /lava-3573882/bin/lava-test-runner /lav=
a-3573882/1
    2023-05-11T02:57:45.633270  + export 'TESTRUN_ID=3D1_bootrr'
    2023-05-11T02:57:45.634528  + cd /lava-3573882/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645c7dc2c8940004012e85ee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c7dc2c8940004012e85f3
        failing since 69 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-05-11T05:31:21.831994  <8>[    9.852069] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3573883_1.5.2.4.1>
    2023-05-11T05:31:21.974932  / # #
    2023-05-11T05:31:22.080951  export SHELL=3D/bin/sh
    2023-05-11T05:31:22.082643  #
    2023-05-11T05:31:22.186043  / # export SHELL=3D/bin/sh. /lava-3573883/e=
nvironment
    2023-05-11T05:31:22.188497  =

    2023-05-11T05:31:22.293721  / # . /lava-3573883/environment/lava-357388=
3/bin/lava-test-runner /lava-3573883/1
    2023-05-11T05:31:22.296618  =

    2023-05-11T05:31:22.300246  / # /lava-3573883/bin/lava-test-runner /lav=
a-3573883/1
    2023-05-11T05:31:22.396220  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c5d0c0c0f556a2d2e8623

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c5d0c0c0f556a2d2e8=
624
        new failure (last pass: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645c580beb319274282e8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-20=
6-g1360b04fa3df/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c580beb319274282e8=
676
        failing since 13 days (last pass: v6.3-5614-gbe56a31d3d65, first fa=
il: v6.3-8745-gc94d3163e00b) =

 =20
