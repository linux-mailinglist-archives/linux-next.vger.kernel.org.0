Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C96E71053E
	for <lists+linux-next@lfdr.de>; Thu, 25 May 2023 07:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbjEYFUI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 May 2023 01:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237531AbjEYFT4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 May 2023 01:19:56 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F89E4B
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 22:07:14 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-52cb78647ecso848988a12.1
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 22:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684991233; x=1687583233;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QamM5s5W5XxRoJHYBZO8BsfuvB8IeFVkVCQZYQY9Its=;
        b=k+Qx3shWpH2SaAhX8Yn4cCrjT4J1bMAZ74kSSwZUmBOIqvMsEmoN0kWuPn0+pWKavj
         L9w/W8+4vMs/lfbIhpydJSQg/DqeSD/1IcwWjU23mQxXEdtduo8IgypKEd8LdrC9XhVx
         cDe8NrVSvtC2s41alTNcOV5KsvbSZhP9x50JIk0jtR+fesniVMDXHo6Q0E0MNCTBjcLw
         LlHURuS44NdTZAoc62zNL1Qyw2lQ859PjepbVRgNbf9InKQRKtbc/Nxw+etoOQgA9qXL
         Tzdn+xQOyqLZP5YNnAg3iB3pjftnCBsLixktkQkS67kHo0jjcLvUmX72QhBP7iemx2Qk
         y6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684991233; x=1687583233;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QamM5s5W5XxRoJHYBZO8BsfuvB8IeFVkVCQZYQY9Its=;
        b=DPOi9eHjDeWn9RBs49w1dFo528o5VUkyd6XhyY2dYjYcCVkVgc3qXEushbp12bA/qt
         ar6Y/GTqbjoWEckWfu2fU+p+dgtBOBQgyNDol/PGpqjK3mNXNoIfWXWSL0sjhW26VliH
         asADkT1dJV5GwstyNssHKf9cOLIzeaTBEI2CHFzS6Pbe11NFGb+yyRsP1+xWF/ETto72
         VJNcCTUWpDaonn821r3NL2ezl72UcBi285D/46JsYGaOGakV7DJUJ70U3zIFp28fIvex
         QTGNdzQ0WrZUZZ7R1JmCwfyeO1lKwdqcn+eFIF2TvJRPg1dR6KqyVPPi1NK+USUIO0ts
         4mZw==
X-Gm-Message-State: AC+VfDw3kCaJI5NJMT7lTgUo2EmE7eLVNlexYQiY2heEMSVMXA3fPPz7
        tJPJRk/4/A1YKdz3j5LRfJmY636w1DuFMVthapE7ug==
X-Google-Smtp-Source: ACHHUZ5tKJiZA7fdbjLeDiY5SIRPKIYkMfJ+DtpTttvwXFtclvJ3Sv1Io0nQ1Ve4pZFBFSVkEp36Dg==
X-Received: by 2002:a17:902:9686:b0:1af:daf7:7240 with SMTP id n6-20020a170902968600b001afdaf77240mr294953plp.58.1684991231477;
        Wed, 24 May 2023 22:07:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x11-20020a170902ea8b00b001a1a8e98e93sm349012plb.287.2023.05.24.22.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 22:07:10 -0700 (PDT)
Message-ID: <646eecfe.170a0220.83d65.0ca6@mx.google.com>
Date:   Wed, 24 May 2023 22:07:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.4-rc3-342-gff661430bdd5
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 594 runs,
 65 regressions (v6.4-rc3-342-gff661430bdd5)
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

next/pending-fixes baseline: 594 runs, 65 regressions (v6.4-rc3-342-gff6614=
30bdd5)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

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

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

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

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc3-342-gff661430bdd5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc3-342-gff661430bdd5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ff661430bdd5c5c124a2948a101326d3b07ee6e1 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb657d4f5adb9b72e863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eb657d4f5adb9b72e8=
63f
        failing since 227 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc5bdc3ee983e82e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc5bdc3ee983e82e8=
5e9
        failing since 224 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb3bc5ac3dda4752e85f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb3bc5ac3dda4752e85f6
        failing since 57 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:02:39.486821  <8>[   10.583205] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10444829_1.4.2.3.1>

    2023-05-25T01:02:39.489815  + set +x

    2023-05-25T01:02:39.594398  /#

    2023-05-25T01:02:39.696947   # #export SHELL=3D/bin/sh

    2023-05-25T01:02:39.697693  =


    2023-05-25T01:02:39.799122  / # export SHELL=3D/bin/sh. /lava-10444829/=
environment

    2023-05-25T01:02:39.799810  =


    2023-05-25T01:02:39.901228  / # . /lava-10444829/environment/lava-10444=
829/bin/lava-test-runner /lava-10444829/1

    2023-05-25T01:02:39.901577  =


    2023-05-25T01:02:39.906924  / # /lava-10444829/bin/lava-test-runner /la=
va-10444829/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb53ad8cb5abc4a2e865f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb53ad8cb5abc4a2e8664
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-25T01:08:57.476509  <8>[   13.272223] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10444995_1.4.2.3.1>

    2023-05-25T01:08:57.480320  + set +x

    2023-05-25T01:08:57.585325  #

    2023-05-25T01:08:57.686495  / # #export SHELL=3D/bin/sh

    2023-05-25T01:08:57.686675  =


    2023-05-25T01:08:57.787234  / # export SHELL=3D/bin/sh. /lava-10444995/=
environment

    2023-05-25T01:08:57.787411  =


    2023-05-25T01:08:57.887935  / # . /lava-10444995/environment/lava-10444=
995/bin/lava-test-runner /lava-10444995/1

    2023-05-25T01:08:57.888232  =


    2023-05-25T01:08:57.894151  / # /lava-10444995/bin/lava-test-runner /la=
va-10444995/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb6dd481d78f4182e8622

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb6dd481d78f4182e8627
        failing since 57 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:15:57.128093  + set +x

    2023-05-25T01:15:57.134654  <8>[   10.836799] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10445186_1.4.2.3.1>

    2023-05-25T01:15:57.237163  #

    2023-05-25T01:15:57.237526  =


    2023-05-25T01:15:57.338159  / # #export SHELL=3D/bin/sh

    2023-05-25T01:15:57.338407  =


    2023-05-25T01:15:57.438978  / # export SHELL=3D/bin/sh. /lava-10445186/=
environment

    2023-05-25T01:15:57.439195  =


    2023-05-25T01:15:57.539710  / # . /lava-10445186/environment/lava-10445=
186/bin/lava-test-runner /lava-10445186/1

    2023-05-25T01:15:57.540083  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb3c85ac3dda4752e8620

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb3c85ac3dda4752e8625
        failing since 57 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:02:53.762089  + <8>[   11.788585] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10444813_1.4.2.3.1>

    2023-05-25T01:02:53.762665  set +x

    2023-05-25T01:02:53.870354  / # #

    2023-05-25T01:02:53.972912  export SHELL=3D/bin/sh

    2023-05-25T01:02:53.973700  #

    2023-05-25T01:02:54.075283  / # export SHELL=3D/bin/sh. /lava-10444813/=
environment

    2023-05-25T01:02:54.076089  =


    2023-05-25T01:02:54.177992  / # . /lava-10444813/environment/lava-10444=
813/bin/lava-test-runner /lava-10444813/1

    2023-05-25T01:02:54.179234  =


    2023-05-25T01:02:54.184280  / # /lava-10444813/bin/lava-test-runner /la=
va-10444813/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/646eb5bc927ed66fb32e8629

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb5bc927ed66fb32e862e
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-25T01:11:03.969299  + set +x

    2023-05-25T01:11:03.975493  <8>[   15.376595] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10444980_1.4.2.3.1>

    2023-05-25T01:11:04.083809  / # #

    2023-05-25T01:11:04.186637  export SHELL=3D/bin/sh

    2023-05-25T01:11:04.187432  #

    2023-05-25T01:11:04.289093  / # export SHELL=3D/bin/sh. /lava-10444980/=
environment

    2023-05-25T01:11:04.289941  =


    2023-05-25T01:11:04.391591  / # . /lava-10444980/environment/lava-10444=
980/bin/lava-test-runner /lava-10444980/1

    2023-05-25T01:11:04.392904  =


    2023-05-25T01:11:04.397688  / # /lava-10444980/bin/lava-test-runner /la=
va-10444980/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646eb5bc927ed66=
fb32e8630
        failing since 14 days (last pass: v6.4-rc1-141-gb95366eba58e, first=
 fail: v6.4-rc1-166-g16fe96af4971)
        3 lines

    2023-05-25T01:11:03.945350  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-05-25T01:11:03.951532  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-05-25T01:11:03.958430  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-05-25T01:11:03.964898  <8>[   15.359870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb6dbe1715a3c442e8611

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb6dbe1715a3c442e8616
        failing since 57 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:15:54.520518  + set<8>[   11.584571] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10445156_1.4.2.3.1>

    2023-05-25T01:15:54.520654   +x

    2023-05-25T01:15:54.625183  / # #

    2023-05-25T01:15:54.726007  export SHELL=3D/bin/sh

    2023-05-25T01:15:54.726276  #

    2023-05-25T01:15:54.826941  / # export SHELL=3D/bin/sh. /lava-10445156/=
environment

    2023-05-25T01:15:54.827275  =


    2023-05-25T01:15:54.927955  / # . /lava-10445156/environment/lava-10445=
156/bin/lava-test-runner /lava-10445156/1

    2023-05-25T01:15:54.928461  =


    2023-05-25T01:15:54.932356  / # /lava-10445156/bin/lava-test-runner /la=
va-10445156/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb3bb4258cbbbdf2e8602

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb3bb4258cbbbdf2e8607
        failing since 57 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:02:35.188237  <8>[    8.374476] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10444827_1.4.2.3.1>

    2023-05-25T01:02:35.191068  + set +x

    2023-05-25T01:02:35.292434  =


    2023-05-25T01:02:35.393063  / # #export SHELL=3D/bin/sh

    2023-05-25T01:02:35.393251  =


    2023-05-25T01:02:35.493736  / # export SHELL=3D/bin/sh. /lava-10444827/=
environment

    2023-05-25T01:02:35.493927  =


    2023-05-25T01:02:35.594410  / # . /lava-10444827/environment/lava-10444=
827/bin/lava-test-runner /lava-10444827/1

    2023-05-25T01:02:35.594792  =


    2023-05-25T01:02:35.599745  / # /lava-10444827/bin/lava-test-runner /la=
va-10444827/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb536d8cb5abc4a2e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb536d8cb5abc4a2e860b
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-25T01:09:01.991994  <8>[   12.265836] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10444971_1.4.2.3.1>

    2023-05-25T01:09:01.995808  + set +x

    2023-05-25T01:09:02.100653  #

    2023-05-25T01:09:02.101726  =


    2023-05-25T01:09:02.203345  / # #export SHELL=3D/bin/sh

    2023-05-25T01:09:02.204146  =


    2023-05-25T01:09:02.305251  / # export SHELL=3D/bin/sh. /lava-10444971/=
environment

    2023-05-25T01:09:02.305455  =


    2023-05-25T01:09:02.405946  / # . /lava-10444971/environment/lava-10444=
971/bin/lava-test-runner /lava-10444971/1

    2023-05-25T01:09:02.406226  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb6e1e1715a3c442e862d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb6e1e1715a3c442e8632
        failing since 57 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:15:56.458972  <8>[   10.300156] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10445181_1.4.2.3.1>

    2023-05-25T01:15:56.462301  + set +x

    2023-05-25T01:15:56.563525  #

    2023-05-25T01:15:56.563885  =


    2023-05-25T01:15:56.664460  / # #export SHELL=3D/bin/sh

    2023-05-25T01:15:56.664645  =


    2023-05-25T01:15:56.765197  / # export SHELL=3D/bin/sh. /lava-10445181/=
environment

    2023-05-25T01:15:56.765403  =


    2023-05-25T01:15:56.865957  / # . /lava-10445181/environment/lava-10445=
181/bin/lava-test-runner /lava-10445181/1

    2023-05-25T01:15:56.866258  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb305e3c3a0de2f2e860d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb305e3c3a0de2f2e8612
        failing since 133 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-05-25T00:59:33.783938  / # #

    2023-05-25T00:59:33.884685  export SHELL=3D/bin/sh

    2023-05-25T00:59:33.884962  #

    2023-05-25T00:59:33.985515  / # export SHELL=3D/bin/sh. /lava-10444766/=
environment

    2023-05-25T00:59:33.985783  =


    2023-05-25T00:59:34.086324  / # . /lava-10444766/environment/lava-10444=
766/bin/lava-test-runner /lava-10444766/1

    2023-05-25T00:59:34.086806  =


    2023-05-25T00:59:34.097200  / # /lava-10444766/bin/lava-test-runner /la=
va-10444766/1

    2023-05-25T00:59:34.213121  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-25T00:59:34.213295  + cd /lava-10444766/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb8068de07e70022e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eb8068de07e70022e8=
5e8
        failing since 87 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb3bf4258cbbbdf2e8634

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb3bf4258cbbbdf2e8639
        failing since 57 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:02:37.284498  + set +x

    2023-05-25T01:02:37.291410  <8>[   10.619093] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10444815_1.4.2.3.1>

    2023-05-25T01:02:37.395990  / # #

    2023-05-25T01:02:37.496672  export SHELL=3D/bin/sh

    2023-05-25T01:02:37.496885  #

    2023-05-25T01:02:37.597427  / # export SHELL=3D/bin/sh. /lava-10444815/=
environment

    2023-05-25T01:02:37.597662  =


    2023-05-25T01:02:37.698257  / # . /lava-10444815/environment/lava-10444=
815/bin/lava-test-runner /lava-10444815/1

    2023-05-25T01:02:37.698636  =


    2023-05-25T01:02:37.703043  / # /lava-10444815/bin/lava-test-runner /la=
va-10444815/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb6b7a8684739e22e8610

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb6b7a8684739e22e8615
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-25T01:15:13.697151  + set +x

    2023-05-25T01:15:13.703647  <8>[   16.192681] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10445014_1.4.2.3.1>

    2023-05-25T01:15:13.810005  / # #

    2023-05-25T01:15:13.910585  export SHELL=3D/bin/sh

    2023-05-25T01:15:13.910818  #

    2023-05-25T01:15:14.011502  / # export SHELL=3D/bin/sh. /lava-10445014/=
environment

    2023-05-25T01:15:14.011696  =


    2023-05-25T01:15:14.112198  / # . /lava-10445014/environment/lava-10445=
014/bin/lava-test-runner /lava-10445014/1

    2023-05-25T01:15:14.112555  =


    2023-05-25T01:15:14.117513  / # /lava-10445014/bin/lava-test-runner /la=
va-10445014/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb6c7481d78f4182e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb6c7481d78f4182e85ec
        failing since 57 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:15:43.777471  + <8>[   10.451575] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10445168_1.4.2.3.1>

    2023-05-25T01:15:43.777590  set +x

    2023-05-25T01:15:43.879035  #

    2023-05-25T01:15:43.980165  / # #export SHELL=3D/bin/sh

    2023-05-25T01:15:43.980381  =


    2023-05-25T01:15:44.080871  / # export SHELL=3D/bin/sh. /lava-10445168/=
environment

    2023-05-25T01:15:44.081104  =


    2023-05-25T01:15:44.181659  / # . /lava-10445168/environment/lava-10445=
168/bin/lava-test-runner /lava-10445168/1

    2023-05-25T01:15:44.181963  =


    2023-05-25T01:15:44.186385  / # /lava-10445168/bin/lava-test-runner /la=
va-10445168/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb3a7635037d7682e8661

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb3a7635037d7682e8666
        failing since 57 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:02:18.643742  + set +x<8>[   10.328280] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10444844_1.4.2.3.1>

    2023-05-25T01:02:18.643909  =


    2023-05-25T01:02:18.746819  #

    2023-05-25T01:02:18.847752  / # #export SHELL=3D/bin/sh

    2023-05-25T01:02:18.848059  =


    2023-05-25T01:02:18.948741  / # export SHELL=3D/bin/sh. /lava-10444844/=
environment

    2023-05-25T01:02:18.949050  =


    2023-05-25T01:02:19.049729  / # . /lava-10444844/environment/lava-10444=
844/bin/lava-test-runner /lava-10444844/1

    2023-05-25T01:02:19.050212  =


    2023-05-25T01:02:19.055694  / # /lava-10444844/bin/lava-test-runner /la=
va-10444844/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb61ebcacf3b7a02e8637

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb61ebcacf3b7a02e863c
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-25T01:12:49.514669  + set +x

    2023-05-25T01:12:49.521453  <8>[   13.062356] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10445009_1.4.2.3.1>

    2023-05-25T01:12:49.629072  / # #

    2023-05-25T01:12:49.731401  export SHELL=3D/bin/sh

    2023-05-25T01:12:49.731619  #

    2023-05-25T01:12:49.832309  / # export SHELL=3D/bin/sh. /lava-10445009/=
environment

    2023-05-25T01:12:49.833078  =


    2023-05-25T01:12:49.934611  / # . /lava-10445009/environment/lava-10445=
009/bin/lava-test-runner /lava-10445009/1

    2023-05-25T01:12:49.934932  =


    2023-05-25T01:12:49.939943  / # /lava-10445009/bin/lava-test-runner /la=
va-10445009/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb6ce481d78f4182e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb6ce481d78f4182e8606
        failing since 57 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:15:42.164825  <8>[   10.108202] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10445165_1.4.2.3.1>

    2023-05-25T01:15:42.167936  + set +x

    2023-05-25T01:15:42.269231  #

    2023-05-25T01:15:42.269522  =


    2023-05-25T01:15:42.370087  / # #export SHELL=3D/bin/sh

    2023-05-25T01:15:42.370284  =


    2023-05-25T01:15:42.470792  / # export SHELL=3D/bin/sh. /lava-10445165/=
environment

    2023-05-25T01:15:42.471019  =


    2023-05-25T01:15:42.571571  / # . /lava-10445165/environment/lava-10445=
165/bin/lava-test-runner /lava-10445165/1

    2023-05-25T01:15:42.571845  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb3d63acd5d9d7e2e860d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb3d63acd5d9d7e2e8612
        failing since 57 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:02:50.834113  + set<8>[   11.740879] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10444851_1.4.2.3.1>

    2023-05-25T01:02:50.834204   +x

    2023-05-25T01:02:50.938862  / # #

    2023-05-25T01:02:51.039432  export SHELL=3D/bin/sh

    2023-05-25T01:02:51.039623  #

    2023-05-25T01:02:51.140092  / # export SHELL=3D/bin/sh. /lava-10444851/=
environment

    2023-05-25T01:02:51.140299  =


    2023-05-25T01:02:51.240865  / # . /lava-10444851/environment/lava-10444=
851/bin/lava-test-runner /lava-10444851/1

    2023-05-25T01:02:51.241142  =


    2023-05-25T01:02:51.245530  / # /lava-10444851/bin/lava-test-runner /la=
va-10444851/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb5387a1be1fdaa2e85e7

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb5387a1be1fdaa2e85ec
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-25T01:09:03.128202  + set +x

    2023-05-25T01:09:03.134528  <8>[   14.905151] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10444996_1.4.2.3.1>

    2023-05-25T01:09:03.241743  / # #

    2023-05-25T01:09:03.342567  export SHELL=3D/bin/sh

    2023-05-25T01:09:03.342785  #

    2023-05-25T01:09:03.443376  / # export SHELL=3D/bin/sh. /lava-10444996/=
environment

    2023-05-25T01:09:03.443576  =


    2023-05-25T01:09:03.544088  / # . /lava-10444996/environment/lava-10444=
996/bin/lava-test-runner /lava-10444996/1

    2023-05-25T01:09:03.544620  =


    2023-05-25T01:09:03.549808  / # /lava-10444996/bin/lava-test-runner /la=
va-10444996/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb6dc0060aeed082e8625

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb6dc0060aeed082e862a
        failing since 57 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:15:53.951820  + set<8>[   11.478748] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10445193_1.4.2.3.1>

    2023-05-25T01:15:53.951902   +x

    2023-05-25T01:15:54.056158  / # #

    2023-05-25T01:15:54.156784  export SHELL=3D/bin/sh

    2023-05-25T01:15:54.156954  #

    2023-05-25T01:15:54.257473  / # export SHELL=3D/bin/sh. /lava-10445193/=
environment

    2023-05-25T01:15:54.257644  =


    2023-05-25T01:15:54.358141  / # . /lava-10445193/environment/lava-10445=
193/bin/lava-test-runner /lava-10445193/1

    2023-05-25T01:15:54.358400  =


    2023-05-25T01:15:54.363358  / # /lava-10445193/bin/lava-test-runner /la=
va-10445193/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc68d2efbeca1d2e8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc68d2efbeca1d2e8=
64a
        failing since 199 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc67d2efbeca1d2e8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc67d2efbeca1d2e8=
644
        failing since 251 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/646eba56134945800c2e85e6

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eba56134945800c2e85e9
        new failure (last pass: v6.4-rc3-246-g48bfaadff1906)

    2023-05-25T01:30:40.227756  / # #
    2023-05-25T01:30:40.330156  export SHELL=3D/bin/sh
    2023-05-25T01:30:40.330834  #
    2023-05-25T01:30:40.432493  / # export SHELL=3D/bin/sh. /lava-343807/en=
vironment
    2023-05-25T01:30:40.433443  =

    2023-05-25T01:30:40.535217  / # . /lava-343807/environment/lava-343807/=
bin/lava-test-runner /lava-343807/1
    2023-05-25T01:30:40.535736  =

    2023-05-25T01:30:40.540948  / # /lava-343807/bin/lava-test-runner /lava=
-343807/1
    2023-05-25T01:30:40.606633  + export 'TESTRUN_ID=3D1_bootrr'
    2023-05-25T01:30:40.606802  + cd /lava-343807/1/tests/1_bootrr =

    ... (9 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/646=
eba56134945800c2e85f9
        new failure (last pass: v6.4-rc3-246-g48bfaadff1906)

    2023-05-25T01:30:43.000135  /lava-343807/1/../bin/lava-test-case
    2023-05-25T01:30:43.000615  <8>[   17.863177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-05-25T01:30:43.000955  /lava-343807/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb3aa635037d7682e8670

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb3aa635037d7682e8675
        failing since 57 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:02:24.277346  + set<8>[   11.882996] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10444825_1.4.2.3.1>

    2023-05-25T01:02:24.277441   +x

    2023-05-25T01:02:24.381664  / # #

    2023-05-25T01:02:24.482308  export SHELL=3D/bin/sh

    2023-05-25T01:02:24.482498  #

    2023-05-25T01:02:24.583004  / # export SHELL=3D/bin/sh. /lava-10444825/=
environment

    2023-05-25T01:02:24.583197  =


    2023-05-25T01:02:24.683722  / # . /lava-10444825/environment/lava-10444=
825/bin/lava-test-runner /lava-10444825/1

    2023-05-25T01:02:24.684024  =


    2023-05-25T01:02:24.689309  / # /lava-10444825/bin/lava-test-runner /la=
va-10444825/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb52cd8cb5abc4a2e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb52cd8cb5abc4a2e85fb
        failing since 55 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-25T01:08:37.948145  + <8>[   11.570105] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10445013_1.4.2.3.1>

    2023-05-25T01:08:37.948235  set +x

    2023-05-25T01:08:38.053037  / # #

    2023-05-25T01:08:38.153680  export SHELL=3D/bin/sh

    2023-05-25T01:08:38.153885  #

    2023-05-25T01:08:38.254358  / # export SHELL=3D/bin/sh. /lava-10445013/=
environment

    2023-05-25T01:08:38.254561  =


    2023-05-25T01:08:38.355063  / # . /lava-10445013/environment/lava-10445=
013/bin/lava-test-runner /lava-10445013/1

    2023-05-25T01:08:38.355363  =


    2023-05-25T01:08:38.360373  / # /lava-10445013/bin/lava-test-runner /la=
va-10445013/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb6cc0060aeed082e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb6cc0060aeed082e85f9
        failing since 57 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-25T01:15:43.820647  <8>[   11.374647] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10445158_1.4.2.3.1>

    2023-05-25T01:15:43.925244  / # #

    2023-05-25T01:15:44.026028  export SHELL=3D/bin/sh

    2023-05-25T01:15:44.026276  #

    2023-05-25T01:15:44.126820  / # export SHELL=3D/bin/sh. /lava-10445158/=
environment

    2023-05-25T01:15:44.127005  =


    2023-05-25T01:15:44.227513  / # . /lava-10445158/environment/lava-10445=
158/bin/lava-test-runner /lava-10445158/1

    2023-05-25T01:15:44.227828  =


    2023-05-25T01:15:44.232309  / # /lava-10445158/bin/lava-test-runner /la=
va-10445158/1

    2023-05-25T01:15:44.238926  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb3df6a726eceff2e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eb3df6a726eceff2e8=
5f4
        failing since 28 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc70af44d51ea42e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc70af44d51ea42e8=
5ec
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebd9cf069f1a33b2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebd9cf069f1a33b2e8=
5f8
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc5ddc3ee983e82e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc5ddc3ee983e82e8=
5ef
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc6eaf44d51ea42e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc6eaf44d51ea42e8=
5e7
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebcfb2751537c6a2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebcfb2751537c6a2e8=
5f8
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc5cd2efbeca1d2e862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc5cd2efbeca1d2e8=
630
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc6f45e8e3fde82e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc6f45e8e3fde82e8=
5e7
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebd9b6d7ba8f3732e8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebd9b6d7ba8f3732e8=
633
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc62dc3ee983e82e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc62dc3ee983e82e8=
5f5
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc7345e8e3fde82e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc7345e8e3fde82e8=
60d
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebd9e6d7ba8f3732e8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebd9e6d7ba8f3732e8=
639
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646ebc5ed2efbeca1d2e8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ebc5ed2efbeca1d2e8=
636
        failing since 224 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb4def66cedf3e12e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eb4def66cedf3e12e8=
5e8
        failing since 5 days (last pass: v6.4-rc2-426-gdec469ae11955, first=
 fail: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb84112fd9649312e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eb84112fd9649312e8=
5e8
        failing since 160 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb69f6e507cf8db2e867d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eb69f6e507cf8db2e8=
67e
        failing since 160 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/646eb2deb920e6f1132e860e

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646eb2deb920e6f=
1132e8665
        failing since 28 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-25T00:58:46.353466  fo:

    2023-05-25T00:58:46.356582  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-25T00:58:46.362122  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-25T00:58:46.364912  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-25T00:58:46.368626  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-25T00:58:46.373737  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-25T00:58:46.377939  kern  :alert : Data abort info:

    2023-05-25T00:58:46.381592  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-25T00:58:46.384828  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-25T00:58:46.398503  kern  :alert : user pgtable: 4k pages<8>[  =
 19.162572] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646eb2deb920e6f=
1132e8666
        failing since 28 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-25T00:58:46.338264  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-25T00:58:46.351457  kern  :alert : Mem abort in<8>[   19.115560=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/646eb5fdf47e5e5ada2e861a

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646eb5fdf47e5e5ada2e861f
        failing since 13 days (last pass: v6.4-rc1-166-g16fe96af4971, first=
 fail: v6.4-rc1-260-g4cffd190aeed9)

    2023-05-25T01:12:17.464355  <8>[   25.934854] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 433583_1.5.2.4.1>
    2023-05-25T01:12:17.571068  / # #
    2023-05-25T01:12:17.673234  export SHELL=3D/bin/sh
    2023-05-25T01:12:17.673757  #
    2023-05-25T01:12:17.775281  / # export SHELL=3D/bin/sh. /lava-433583/en=
vironment
    2023-05-25T01:12:17.775828  =

    2023-05-25T01:12:17.877417  / # . /lava-433583/environment/lava-433583/=
bin/lava-test-runner /lava-433583/1
    2023-05-25T01:12:17.878291  =

    2023-05-25T01:12:17.882668  / # /lava-433583/bin/lava-test-runner /lava=
-433583/1
    2023-05-25T01:12:17.928933  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646eb5fdf47e5e5=
ada2e8621
        failing since 19 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-13708-gfd7527bf42e6)
        2 lines

    2023-05-25T01:12:17.450008  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-25T01:12:17.451445  kern  :emerg : Code: 97fd9910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-25T01:12:17.462397  <8>[   25.932160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-25T01:12:17.462782  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646eb5fdf47e5e5=
ada2e8622
        failing since 19 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-13708-gfd7527bf42e6)
        12 lines

    2023-05-25T01:12:17.423813  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-25T01:12:17.425535  kern  :alert : Mem abort info:
    2023-05-25T01:12:17.425898  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-25T01:12:17.427191  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-25T01:12:17.429032  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-25T01:12:17.429392  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-25T01:12:17.430714  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-25T01:12:17.432604  kern  :alert : Data abort info:
    2023-05-25T01:12:17.432961  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-25T01:12:17.434289  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/646eb7ca87f73a95242e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646eb7ca87f73a9=
5242e85ed
        failing since 16 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-25T01:19:56.232761  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-25T01:19:56.234049  kern  :emerg : Code: 97fe4510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-25T01:19:56.246927  <8>[   21.499160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-25T01:19:56.247305  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646eb7ca87f73a9=
5242e85ee
        failing since 16 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-25T01:19:56.209541  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-25T01:19:56.211693  kern  :alert : Mem abort info:
    2023-05-25T01:19:56.212055  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-25T01:19:56.213868  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-25T01:19:56.215802  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-25T01:19:56.216160  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-25T01:19:56.217731  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-25T01:19:56.219692  kern  :alert : Data abort info:
    2023-05-25T01:19:56.220051  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-25T01:19:56.221438  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/646eb9344ca1472c522e8730

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-=
roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-=
roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646eb9344ca1472=
c522e8737
        failing since 27 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-25T01:25:54.438289  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-25T01:25:54.439551  kern  :emerg : Code: 97faad10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-25T01:25:54.449246  <8>[   21.438528] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-25T01:25:54.449633  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646eb9344ca1472=
c522e8738
        failing since 27 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-25T01:25:54.414305  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-25T01:25:54.415039  kern  :alert : Mem abort info:
    2023-05-25T01:25:54.415396  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-25T01:25:54.416015  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-25T01:25:54.416592  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-25T01:25:54.416909  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-25T01:25:54.417297  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-25T01:25:54.418220  kern  :alert : Data abort info:
    2023-05-25T01:25:54.418601  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-25T01:25:54.419647  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/646eba49aeeb3e932d2e864e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646eba49aeeb3e9=
32d2e8655
        failing since 26 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-25T01:30:33.785092  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-25T01:30:33.786579  kern  :emerg : Code: 97fdf910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-25T01:30:33.796428  <8>[   21.569575] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-25T01:30:33.796811  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646eba49aeeb3e9=
32d2e8656
        failing since 26 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-25T01:30:33.757955  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-25T01:30:33.759209  kern  :alert : Mem abort info:
    2023-05-25T01:30:33.759584  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-25T01:30:33.760377  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-25T01:30:33.761845  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-25T01:30:33.762205  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-25T01:30:33.763186  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-25T01:30:33.764238  kern  :alert : Data abort info:
    2023-05-25T01:30:33.764611  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-25T01:30:33.765431  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/646eb95a06404d64ad2e860b

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646eb95a06404d6=
4ad2e8612
        failing since 28 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-25T01:26:29.805385  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-25T01:26:29.805915  kern  :emerg : Code: 97fc4910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-25T01:26:29.806259  <8>[   23.838135] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-25T01:26:29.806584  + set +x

    2023-05-25T01:26:29.806890  <8>[   23.840333] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10445242_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646eb95a06404d6=
4ad2e8613
        failing since 28 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-25T01:26:29.777435  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-25T01:26:29.777966  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-25T01:26:29.778309  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000790af000

    2023-05-25T01:26:29.778634  kern  :alert : [0000000000000008] pgd=3D080=
00000790b5003, p4d=3D08000000790b5003, pud=3D08000000790b6003, pmd=3D000000=
0000000000

    2023-05-25T01:26:29.778944  <8>[   23.813723] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/646eba70134945800c2e86f4

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646eba701349458=
00c2e86fb
        failing since 26 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-25T01:31:08.021406  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-25T01:31:08.021901  kern  :emerg : Code: 97fec910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-25T01:31:08.022223  <8>[   22.648652] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-25T01:31:08.022524  + set +x

    2023-05-25T01:31:08.022811  <8>[   22.650708] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10445263_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646eba701349458=
00c2e86fc
        failing since 26 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-25T01:31:07.969188  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-25T01:31:07.969677  kern  :alert : Mem abort info:

    2023-05-25T01:31:07.969973  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-25T01:31:07.970244  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-25T01:31:07.970510  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-25T01:31:07.970781  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-25T01:31:07.971037  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-25T01:31:07.971288  kern  :alert : Data abort info:

    2023-05-25T01:31:07.971532  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-25T01:31:07.971814  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb70e42cdfaf0972e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eb70e42cdfaf0972e8=
5f3
        failing since 1 day (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first f=
ail: v6.4-rc3-246-g48bfaadff1906) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/646eba7e134945800c2e870c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eba7e134945800c2e8=
70d
        failing since 0 day (last pass: v6.4-rc3-205-ge885abc8cc39d, first =
fail: v6.4-rc3-295-g562100f4b12e) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb7c91c2368f0462e86e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eb7c91c2368f0462e8=
6e3
        new failure (last pass: v6.4-rc3-246-g48bfaadff1906) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/646eb891d6b4a77f142e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-34=
2-gff661430bdd5/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646eb891d6b4a77f142e8=
5e7
        failing since 0 day (last pass: v6.4-rc3-246-g48bfaadff1906, first =
fail: v6.4-rc3-295-g562100f4b12e) =

 =20
