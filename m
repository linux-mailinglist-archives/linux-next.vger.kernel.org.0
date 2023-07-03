Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC2167455BA
	for <lists+linux-next@lfdr.de>; Mon,  3 Jul 2023 09:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjGCHGv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Jul 2023 03:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjGCHGu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Jul 2023 03:06:50 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869F6D1
        for <linux-next@vger.kernel.org>; Mon,  3 Jul 2023 00:06:46 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3909756b8b1so2077029b6e.1
        for <linux-next@vger.kernel.org>; Mon, 03 Jul 2023 00:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688368005; x=1690960005;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0UCIhWfBf/5OP8TTdjpbayZfep2LrPviUNsEBTUXbTU=;
        b=4VWSsxQ5UChTZjY0rMBZfquyqhJXYdpJf8nyDOu0mTOtARMDU9L2ZRh45BWTxca4A4
         5QOLDciftEIBZSLM9GMfmEErVWPihYwUWZJqWYX2Ij49wdwkVuXpX+8WohFXICfL9WIW
         FN+k1l56o1plKuzJJyAXQE7H44i8M6ylfmuz817ykuHitqKG/LPMSFOOo5Fge7QLRi29
         fa53gVb7cfRZm9k9L7N4uhj1AHg4I/M/X1HyJj29l2Ud1Ad87FbJik8v0UGTrk8oaeLU
         jmZdaNW4b+m6qzeX9Jlre8kz40wLiYl7EVcH/YKPpemgkFSra8KP0kyE0PHidrwVA+a5
         bSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688368005; x=1690960005;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UCIhWfBf/5OP8TTdjpbayZfep2LrPviUNsEBTUXbTU=;
        b=L3T5K+VyD20RRjuKr5tN0MtM6HIhyA0cImbZEfQkAeaGc7gvv7LiF4K/mQAcTAvGxh
         QlQuDlwnZ+HMi7D3dvdvRV6ckEmpj1yfQTX/i/wxoNZqBqPeQUi7Fx8RFbt+ezJyBkkD
         NrygY18EIzrvh+Cw0/a+XIgw5Xquak7MANz8jCIILpfi3KA6mV2bLaCB41mMVbxdjYFJ
         dBKWjp0ogPKydjZJcSSG4VFkxmhFX1iLyfEFRLBsE/7GKf1r7mzr6ATbn0dPfxM6f3uP
         FenBgUnmEjnAH9vPXW/uX+hln2fKnvDARR1NOx1nLZUejqpAdbPPMPf3IRlJ3V/z68pr
         TTqA==
X-Gm-Message-State: AC+VfDxTZCIJGiio8GWcmDi60w+TKPO4/krnog5rDd2MehCYNHcwfXHV
        4x6vbFfjmVadrkUzQCeV/7lCQSUwTiypBg0PqWOHcLW+
X-Google-Smtp-Source: ACHHUZ7uCkbHmdcAgM1JNkRw5t2nleIKACuk5FrWT6gMJORB+IHusWiK1fnAGKz6+LIlE2QA+jj/yQ==
X-Received: by 2002:a05:6808:1496:b0:3a3:7b78:25ee with SMTP id e22-20020a056808149600b003a37b7825eemr8617054oiw.27.1688368004567;
        Mon, 03 Jul 2023 00:06:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ck21-20020a17090afe1500b00262fc84b931sm11535196pjb.44.2023.07.03.00.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 00:06:43 -0700 (PDT)
Message-ID: <64a27383.170a0220.b7963.6bb2@mx.google.com>
Date:   Mon, 03 Jul 2023 00:06:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.4-10301-g9e106c7d604e
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 388 runs,
 66 regressions (v6.4-10301-g9e106c7d604e)
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

next/pending-fixes baseline: 388 runs, 66 regressions (v6.4-10301-g9e106c7d=
604e)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 3          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 3          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxm-q200               | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-10301-g9e106c7d604e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-10301-g9e106c7d604e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9e106c7d604e1ca5e520b6c36c3e27f6837d31fd =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e1d050cc5b21dbb2aad

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e1d050cc5b21dbb2ab2
        failing since 96 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:34.376168  <8>[   10.923949] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987538_1.4.2.3.1>

    2023-07-03T03:18:34.379791  + set +x

    2023-07-03T03:18:34.484268  / # #

    2023-07-03T03:18:34.584951  export SHELL=3D/bin/sh

    2023-07-03T03:18:34.585160  #

    2023-07-03T03:18:34.685767  / # export SHELL=3D/bin/sh. /lava-10987538/=
environment

    2023-07-03T03:18:34.686013  =


    2023-07-03T03:18:34.786620  / # . /lava-10987538/environment/lava-10987=
538/bin/lava-test-runner /lava-10987538/1

    2023-07-03T03:18:34.787006  =


    2023-07-03T03:18:34.792335  / # /lava-10987538/bin/lava-test-runner /la=
va-10987538/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e1fca81aaf7a2bb2a7d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e1fca81aaf7a2bb2a82
        failing since 96 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:45.972302  + set +x

    2023-07-03T03:18:45.978873  <8>[   10.525841] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987525_1.4.2.3.1>

    2023-07-03T03:18:46.084512  / # #

    2023-07-03T03:18:46.185097  export SHELL=3D/bin/sh

    2023-07-03T03:18:46.185300  #

    2023-07-03T03:18:46.285793  / # export SHELL=3D/bin/sh. /lava-10987525/=
environment

    2023-07-03T03:18:46.285995  =


    2023-07-03T03:18:46.386491  / # . /lava-10987525/environment/lava-10987=
525/bin/lava-test-runner /lava-10987525/1

    2023-07-03T03:18:46.386765  =


    2023-07-03T03:18:46.392210  / # /lava-10987525/bin/lava-test-runner /la=
va-10987525/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23df76efba50b5bbb2a84

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23df76efba50b5bbb2a89
        failing since 96 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:06.040908  + <8>[   11.242890] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10987521_1.4.2.3.1>

    2023-07-03T03:18:06.041350  set +x

    2023-07-03T03:18:06.148338  / # #

    2023-07-03T03:18:06.249368  export SHELL=3D/bin/sh

    2023-07-03T03:18:06.250112  #

    2023-07-03T03:18:06.351749  / # export SHELL=3D/bin/sh. /lava-10987521/=
environment

    2023-07-03T03:18:06.352548  =


    2023-07-03T03:18:06.454043  / # . /lava-10987521/environment/lava-10987=
521/bin/lava-test-runner /lava-10987521/1

    2023-07-03T03:18:06.455158  =


    2023-07-03T03:18:06.459863  / # /lava-10987521/bin/lava-test-runner /la=
va-10987521/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e008eac301a55bb2a96

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e008eac301a55bb2a9b
        failing since 96 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:11.038374  + set<8>[   11.392549] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10987487_1.4.2.3.1>

    2023-07-03T03:18:11.038464   +x

    2023-07-03T03:18:11.142821  / # #

    2023-07-03T03:18:11.243516  export SHELL=3D/bin/sh

    2023-07-03T03:18:11.243711  #

    2023-07-03T03:18:11.344265  / # export SHELL=3D/bin/sh. /lava-10987487/=
environment

    2023-07-03T03:18:11.344468  =


    2023-07-03T03:18:11.445093  / # . /lava-10987487/environment/lava-10987=
487/bin/lava-test-runner /lava-10987487/1

    2023-07-03T03:18:11.445388  =


    2023-07-03T03:18:11.450441  / # /lava-10987487/bin/lava-test-runner /la=
va-10987487/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23dfe8eac301a55bb2a89

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23dfe8eac301a55bb2a8e
        failing since 96 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:22.929316  <8>[    8.329966] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987509_1.4.2.3.1>

    2023-07-03T03:18:22.932235  + set +x

    2023-07-03T03:18:23.033513  #

    2023-07-03T03:18:23.033763  =


    2023-07-03T03:18:23.134329  / # #export SHELL=3D/bin/sh

    2023-07-03T03:18:23.134500  =


    2023-07-03T03:18:23.234998  / # export SHELL=3D/bin/sh. /lava-10987509/=
environment

    2023-07-03T03:18:23.235174  =


    2023-07-03T03:18:23.335734  / # . /lava-10987509/environment/lava-10987=
509/bin/lava-test-runner /lava-10987509/1

    2023-07-03T03:18:23.335989  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e059eb7753668bb2ad9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e059eb7753668bb2ade
        failing since 96 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:12.011407  <8>[   10.762950] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987507_1.4.2.3.1>

    2023-07-03T03:18:12.015079  + set +x

    2023-07-03T03:18:12.120085  #

    2023-07-03T03:18:12.121497  =


    2023-07-03T03:18:12.223476  / # #export SHELL=3D/bin/sh

    2023-07-03T03:18:12.224286  =


    2023-07-03T03:18:12.325947  / # export SHELL=3D/bin/sh. /lava-10987507/=
environment

    2023-07-03T03:18:12.326701  =


    2023-07-03T03:18:12.428129  / # . /lava-10987507/environment/lava-10987=
507/bin/lava-test-runner /lava-10987507/1

    2023-07-03T03:18:12.428395  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e2020581c85adbb2a7f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e2020581c85adbb2a84
        failing since 96 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:39.743897  + set +x

    2023-07-03T03:18:39.750200  <8>[   10.827139] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987569_1.4.2.3.1>

    2023-07-03T03:18:39.854889  / # #

    2023-07-03T03:18:39.955675  export SHELL=3D/bin/sh

    2023-07-03T03:18:39.955894  #

    2023-07-03T03:18:40.056391  / # export SHELL=3D/bin/sh. /lava-10987569/=
environment

    2023-07-03T03:18:40.056672  =


    2023-07-03T03:18:40.157171  / # . /lava-10987569/environment/lava-10987=
569/bin/lava-test-runner /lava-10987569/1

    2023-07-03T03:18:40.157505  =


    2023-07-03T03:18:40.162088  / # /lava-10987569/bin/lava-test-runner /la=
va-10987569/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e2920581c85adbb2a9d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e2920581c85adbb2aa2
        failing since 96 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:19:01.116991  + set +x

    2023-07-03T03:19:01.124006  <8>[   10.178121] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987501_1.4.2.3.1>

    2023-07-03T03:19:01.228532  / # #

    2023-07-03T03:19:01.329306  export SHELL=3D/bin/sh

    2023-07-03T03:19:01.329568  #

    2023-07-03T03:19:01.430171  / # export SHELL=3D/bin/sh. /lava-10987501/=
environment

    2023-07-03T03:19:01.430403  =


    2023-07-03T03:19:01.531022  / # . /lava-10987501/environment/lava-10987=
501/bin/lava-test-runner /lava-10987501/1

    2023-07-03T03:19:01.531385  =


    2023-07-03T03:19:01.536363  / # /lava-10987501/bin/lava-test-runner /la=
va-10987501/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e16050cc5b21dbb2a77

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e16050cc5b21dbb2a7c
        failing since 96 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:24.842110  <8>[   10.622404] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987537_1.4.2.3.1>

    2023-07-03T03:18:24.845189  + set +x

    2023-07-03T03:18:24.950175  #

    2023-07-03T03:18:24.951280  =


    2023-07-03T03:18:25.052971  / # #export SHELL=3D/bin/sh

    2023-07-03T03:18:25.053667  =


    2023-07-03T03:18:25.154954  / # export SHELL=3D/bin/sh. /lava-10987537/=
environment

    2023-07-03T03:18:25.155631  =


    2023-07-03T03:18:25.257062  / # . /lava-10987537/environment/lava-10987=
537/bin/lava-test-runner /lava-10987537/1

    2023-07-03T03:18:25.258313  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e4507f04d04cfbb2ae5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e4507f04d04cfbb2aea
        failing since 96 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:19:14.949809  <8>[   10.861604] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987578_1.4.2.3.1>

    2023-07-03T03:19:14.953105  + set +x

    2023-07-03T03:19:15.054368  #

    2023-07-03T03:19:15.054687  =


    2023-07-03T03:19:15.155344  / # #export SHELL=3D/bin/sh

    2023-07-03T03:19:15.155574  =


    2023-07-03T03:19:15.256132  / # export SHELL=3D/bin/sh. /lava-10987578/=
environment

    2023-07-03T03:19:15.256349  =


    2023-07-03T03:19:15.356854  / # . /lava-10987578/environment/lava-10987=
578/bin/lava-test-runner /lava-10987578/1

    2023-07-03T03:19:15.357176  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23df78eac301a55bb2a79

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23df78eac301a55bb2a7e
        failing since 96 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:17:57.609520  + <8>[   11.089924] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10987479_1.4.2.3.1>

    2023-07-03T03:17:57.609601  set +x

    2023-07-03T03:17:57.713998  / # #

    2023-07-03T03:17:57.814545  export SHELL=3D/bin/sh

    2023-07-03T03:17:57.814713  #

    2023-07-03T03:17:57.915188  / # export SHELL=3D/bin/sh. /lava-10987479/=
environment

    2023-07-03T03:17:57.915423  =


    2023-07-03T03:17:58.016011  / # . /lava-10987479/environment/lava-10987=
479/bin/lava-test-runner /lava-10987479/1

    2023-07-03T03:17:58.016355  =


    2023-07-03T03:17:58.020939  / # /lava-10987479/bin/lava-test-runner /la=
va-10987479/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e014df4b0a645bb2aad

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e014df4b0a645bb2ab2
        failing since 96 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:06.308463  + <8>[   10.763192] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10987531_1.4.2.3.1>

    2023-07-03T03:18:06.308599  set +x

    2023-07-03T03:18:06.412825  / # #

    2023-07-03T03:18:06.513443  export SHELL=3D/bin/sh

    2023-07-03T03:18:06.513658  #

    2023-07-03T03:18:06.614181  / # export SHELL=3D/bin/sh. /lava-10987531/=
environment

    2023-07-03T03:18:06.614371  =


    2023-07-03T03:18:06.714866  / # . /lava-10987531/environment/lava-10987=
531/bin/lava-test-runner /lava-10987531/1

    2023-07-03T03:18:06.715135  =


    2023-07-03T03:18:06.719466  / # /lava-10987531/bin/lava-test-runner /la=
va-10987531/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23a42b295ef108ebb2ab3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23a42b295ef108ebb2ab8
        failing since 67 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-07-03T03:02:18.344411  + set +x
    2023-07-03T03:02:18.347843  <8>[    7.860794] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3706925_1.5.2.4.1>
    2023-07-03T03:02:18.452583  / # #
    2023-07-03T03:02:18.555514  export SHELL=3D/bin/sh
    2023-07-03T03:02:18.556555  #
    2023-07-03T03:02:18.658587  / # export SHELL=3D/bin/sh. /lava-3706925/e=
nvironment
    2023-07-03T03:02:18.659544  =

    2023-07-03T03:02:18.762066  / # . /lava-3706925/environment/lava-370692=
5/bin/lava-test-runner /lava-3706925/1
    2023-07-03T03:02:18.763713  =

    2023-07-03T03:02:18.779899  / # /lava-3706925/bin/lava-test-runner /lav=
a-3706925/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23ce6af9a079c51bb2a7f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23ce6af9a079c51bb2a84
        failing since 67 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-07-03T03:13:03.019657  <8>[    7.909787] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3707065_1.5.2.4.1>
    2023-07-03T03:13:03.127970  / # #
    2023-07-03T03:13:03.230032  export SHELL=3D/bin/sh
    2023-07-03T03:13:03.230996  #
    2023-07-03T03:13:03.333149  / # export SHELL=3D/bin/sh. /lava-3707065/e=
nvironment
    2023-07-03T03:13:03.334190  =

    2023-07-03T03:13:03.435998  / # . /lava-3707065/environment/lava-370706=
5/bin/lava-test-runner /lava-3707065/1
    2023-07-03T03:13:03.437688  =

    2023-07-03T03:13:03.452087  / # /lava-3707065/bin/lava-test-runner /lav=
a-3707065/1
    2023-07-03T03:13:03.497070  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e799bbc706c7dbb2abe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am6=
25-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am6=
25-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23e799bbc706c7dbb2ac3
        failing since 67 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.3-5614-gbe56a31d3d65)

    2023-07-03T03:20:17.228273  <8>[   14.122411] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3707146_1.5.2.4.1>
    2023-07-03T03:20:17.350889  / # #
    2023-07-03T03:20:17.454763  export SHELL=3D/bin/sh
    2023-07-03T03:20:17.455766  #
    2023-07-03T03:20:17.558073  / # export SHELL=3D/bin/sh. /lava-3707146/e=
nvironment
    2023-07-03T03:20:17.559263  =

    2023-07-03T03:20:17.661609  / # . /lava-3707146/environment/lava-370714=
6/bin/lava-test-runner /lava-3707146/1
    2023-07-03T03:20:17.663505  =

    2023-07-03T03:20:17.705519  / # /lava-3707146/bin/lava-test-runner /lav=
a-3707146/1
    2023-07-03T03:20:17.816966  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/64a23bfa7d444d91a8bb2aa2

  Results:     92 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
4a23bfa7d444d91a8bb2ad8
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-03T03:09:29.959023  /lava-367926/1/../bin/lava-test-case
    2023-07-03T03:09:29.962270  <8>[   41.817932] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
4a23bfa7d444d91a8bb2ad9
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-03T03:09:30.981837  /lava-367926/1/../bin/lava-test-case
    2023-07-03T03:09:30.985101  <8>[   42.839740] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
4a23bfa7d444d91a8bb2ada
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-03T03:09:32.042904  /lava-367926/1/../bin/lava-test-case
    2023-07-03T03:09:32.043083  <8>[   43.861043] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/64a23bfd7d444d91a8bb2b13

  Results:     100 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
4a23bfd7d444d91a8bb2b50
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-03T03:09:29.852015  /lava-367930/1/../bin/lava-test-case
    2023-07-03T03:09:29.855306  <8>[   41.211142] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
4a23bfd7d444d91a8bb2b51
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-03T03:09:30.872573  /lava-367930/1/../bin/lava-test-case
    2023-07-03T03:09:30.875868  <8>[   42.232397] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
4a23bfd7d444d91a8bb2b52
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-03T03:09:31.936229  /lava-367930/1/../bin/lava-test-case
    2023-07-03T03:09:31.936786  <8>[   43.254081] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23df8c20dbe90b7bb2a8e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23df8c20dbe90b7bb2a93
        failing since 96 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:17:56.904249  <8>[   11.334065] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987536_1.4.2.3.1>

    2023-07-03T03:17:57.009194  / # #

    2023-07-03T03:17:57.109856  export SHELL=3D/bin/sh

    2023-07-03T03:17:57.110128  #

    2023-07-03T03:17:57.210701  / # export SHELL=3D/bin/sh. /lava-10987536/=
environment

    2023-07-03T03:17:57.210909  =


    2023-07-03T03:17:57.311468  / # . /lava-10987536/environment/lava-10987=
536/bin/lava-test-runner /lava-10987536/1

    2023-07-03T03:17:57.311845  =


    2023-07-03T03:17:57.316736  / # /lava-10987536/bin/lava-test-runner /la=
va-10987536/1

    2023-07-03T03:17:57.323224  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23dfe6efba50b5bbb2ab0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23dfe6efba50b5bbb2ab5
        failing since 96 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T03:18:12.358763  <8>[    9.234463] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10987616_1.4.2.3.1>

    2023-07-03T03:18:12.463022  / # #

    2023-07-03T03:18:12.563632  export SHELL=3D/bin/sh

    2023-07-03T03:18:12.563816  #

    2023-07-03T03:18:12.664337  / # export SHELL=3D/bin/sh. /lava-10987616/=
environment

    2023-07-03T03:18:12.664483  =


    2023-07-03T03:18:12.764992  / # . /lava-10987616/environment/lava-10987=
616/bin/lava-test-runner /lava-10987616/1

    2023-07-03T03:18:12.765230  =


    2023-07-03T03:18:12.769924  / # /lava-10987616/bin/lava-test-runner /la=
va-10987616/1

    2023-07-03T03:18:12.776521  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23f59f40b99b26bbb2ac1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23f59f40b99b26bbb2=
ac2
        failing since 145 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23fbf123215b7dbbb2a7d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23fbf123215b7dbbb2=
a7e
        failing since 145 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a2402013682c1f76bb2a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a2402013682c1f76bb2=
a7b
        failing since 133 days (last pass: v6.2-rc8-150-g30cd52e17d48, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23b8fe0170093cbbb2a8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23b8fe0170093cbbb2=
a90
        new failure (last pass: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23d829db2793373bb2ab3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23d829db2793373bb2=
ab4
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a2416bcff230b99abb2a90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a2416bcff230b99abb2=
a91
        failing since 145 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23a56873aafe93fbb2a8b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23a56873aafe93fbb2a90
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-07-03T03:02:26.188598  <8>[   17.040083] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3706910_1.5.2.4.1>
    2023-07-03T03:02:26.298902  / # #
    2023-07-03T03:02:26.402847  export SHELL=3D/bin/sh
    2023-07-03T03:02:26.404001  #
    2023-07-03T03:02:26.506446  / # export SHELL=3D/bin/sh. /lava-3706910/e=
nvironment
    2023-07-03T03:02:26.507605  =

    2023-07-03T03:02:26.611589  / # . /lava-3706910/environment/lava-370691=
0/bin/lava-test-runner /lava-3706910/1
    2023-07-03T03:02:26.613292  =

    2023-07-03T03:02:26.617539  / # /lava-3706910/bin/lava-test-runner /lav=
a-3706910/1
    2023-07-03T03:02:26.659725  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23f8ba09493e5a1bb2acc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23f8ba09493e5a1bb2=
acd
        failing since 145 days (last pass: v6.2-rc6-351-gf42837eac380f, fir=
st fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23f59f40b99b26bbb2abe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23f59f40b99b26bbb2=
abf
        failing since 145 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a2464576c4a4b24fbb2a84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a2464576c4a4b24fbb2=
a85
        failing since 154 days (last pass: v6.2-rc5-286-g436294605dc5, firs=
t fail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23f58f40b99b26bbb2ab5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23f58f40b99b26bbb2=
ab6
        failing since 145 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23d7b09a023ea47bb2aaf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23d7b09a023ea47bb2=
ab0
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23dd03031a57c3fbb2ab9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23dd03031a57c3fbb2=
aba
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23d7a09a023ea47bb2aa9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23d7a09a023ea47bb2=
aaa
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23d7c09a023ea47bb2ab2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23d7c09a023ea47bb2=
ab3
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23dd24efdf156a5bb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23dd24efdf156a5bb2=
a76
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23da1745f7f35a4bb2aad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23da1745f7f35a4bb2=
aae
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23d7d09a023ea47bb2ab5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23d7d09a023ea47bb2=
ab6
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23de34efdf156a5bb2ac7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23de34efdf156a5bb2=
ac8
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23db407e5914a47bb2b4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23db407e5914a47bb2=
b4b
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23d7a09a023ea47bb2aac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23d7a09a023ea47bb2=
aad
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23dcf3031a57c3fbb2ab6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23dcf3031a57c3fbb2=
ab7
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23d7809a023ea47bb2aa3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23d7809a023ea47bb2=
aa4
        failing since 264 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23a43b295ef108ebb2ac1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23a43b295ef108ebb2ac6
        failing since 152 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-03T03:02:03.675131  [   29.526134] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3706921_1.5.2.4.1>
    2023-07-03T03:02:03.779571  =

    2023-07-03T03:02:03.881034  / # #export SHELL=3D/bin/sh
    2023-07-03T03:02:03.881410  =

    2023-07-03T03:02:03.982913  / # export SHELL=3D/bin/sh. /lava-3706921/e=
nvironment
    2023-07-03T03:02:03.983606  =

    2023-07-03T03:02:04.085280  / # . /lava-3706921/environment/lava-370692=
1/bin/lava-test-runner /lava-3706921/1
    2023-07-03T03:02:04.086224  =

    2023-07-03T03:02:04.089426  / # /lava-3706921/bin/lava-test-runner /lav=
a-3706921/1
    2023-07-03T03:02:04.125383  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23aa755bcc575e5bb2a79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23aa755bcc575e5bb2a7e
        failing since 152 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-03T03:03:56.283202  [   30.503791] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3706973_1.5.2.4.1>
    2023-07-03T03:03:56.388205  =

    2023-07-03T03:03:56.489711  / # #export SHELL=3D/bin/sh
    2023-07-03T03:03:56.490258  =

    2023-07-03T03:03:56.591628  / # export SHELL=3D/bin/sh. /lava-3706973/e=
nvironment
    2023-07-03T03:03:56.591964  =

    2023-07-03T03:03:56.693142  / # . /lava-3706973/environment/lava-370697=
3/bin/lava-test-runner /lava-3706973/1
    2023-07-03T03:03:56.693666  =

    2023-07-03T03:03:56.697289  / # /lava-3706973/bin/lava-test-runner /lav=
a-3706973/1
    2023-07-03T03:03:56.734054  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23bfc1f01f16f75bb2a7f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a23bfc1f01f16f75bb2a84
        failing since 152 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-03T03:09:30.338027  [   31.508475] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3707004_1.5.2.4.1>
    2023-07-03T03:09:30.442454  =

    2023-07-03T03:09:30.544008  / # #export SHELL=3D/bin/sh
    2023-07-03T03:09:30.544602  =

    2023-07-03T03:09:30.645999  / # export SHELL=3D/bin/sh. /lava-3707004/e=
nvironment
    2023-07-03T03:09:30.646432  =

    2023-07-03T03:09:30.747851  / # . /lava-3707004/environment/lava-370700=
4/bin/lava-test-runner /lava-3707004/1
    2023-07-03T03:09:30.748779  =

    2023-07-03T03:09:30.752313  / # /lava-3707004/bin/lava-test-runner /lav=
a-3707004/1
    2023-07-03T03:09:30.788084  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23f47cc8baae4bbbb2aa8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23f47cc8baae4bbbb2=
aa9
        failing since 145 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23b7a07e09472c2bb2a93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23b7a07e09472c2bb2=
a94
        failing since 3 days (last pass: v6.4-4072-ge8f5f1933319, first fai=
l: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23d0a963279bb74bb2a97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23d0a963279bb74bb2=
a98
        failing since 3 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e861849d61013bb2a88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine6=
4-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine6=
4-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23e861849d61013bb2=
a89
        new failure (last pass: v6.4-4072-ge8f5f1933319) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64a24003246ec31485bb2acc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a24003246ec31485bb2=
acd
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a2417f54fb95694bbb2a9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a2417f54fb95694bbb2=
a9c
        failing since 3 days (last pass: v6.4-1651-gf52dd2890422, first fai=
l: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23b2057827de367bb2a91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23b2057827de367bb2=
a92
        failing since 3 days (last pass: v6.4-4072-ge8f5f1933319, first fai=
l: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23c884967af08febb2ac6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23c884967af08febb2=
ac7
        failing since 3 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23ddc4efdf156a5bb2a94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64=
-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64=
-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23ddc4efdf156a5bb2=
a95
        new failure (last pass: v6.4-4072-ge8f5f1933319) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23f30f6dca06ec0bb2a8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64=
-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64=
-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23f30f6dca06ec0bb2=
a8b
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a24084a6ab4d654dbb2ab8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a24084a6ab4d654dbb2=
ab9
        failing since 3 days (last pass: v6.4-1651-gf52dd2890422, first fai=
l: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a243415bce452f65bb2a7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a243415bce452f65bb2=
a7d
        failing since 145 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23b0c05d55c7ce0bb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-librete=
ch-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-librete=
ch-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23b0c05d55c7ce0bb2=
a76
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4072-ge8f5f1933319) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23cec9a791691bcbb2a82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-=
libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-=
libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23cec9a791691bcbb2=
a83
        failing since 3 days (last pass: v6.4-4938-g5c1c4e99720d8, first fa=
il: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23e18050cc5b21dbb2a9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23e18050cc5b21dbb2=
a9b
        new failure (last pass: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23fa84284ec129fbb2ad2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23fa84284ec129fbb2=
ad3
        failing since 145 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a23f59f40b99b26bbb2abb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-10301-=
g9e106c7d604e/arm64/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a23f59f40b99b26bbb2=
abc
        failing since 3 days (last pass: v6.4-rc7-235-g8d8d57edb1481, first=
 fail: v6.4-8718-g6b8b1f7dba504) =

 =20
