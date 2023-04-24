Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC166ED6F4
	for <lists+linux-next@lfdr.de>; Mon, 24 Apr 2023 23:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbjDXVs6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Apr 2023 17:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjDXVs5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Apr 2023 17:48:57 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD984193
        for <linux-next@vger.kernel.org>; Mon, 24 Apr 2023 14:48:51 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-63d4595d60fso31304856b3a.0
        for <linux-next@vger.kernel.org>; Mon, 24 Apr 2023 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682372930; x=1684964930;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IT6g7GLOtjjOc8NzufEKuKYyBAhDVc+WTbN/KUIfWRM=;
        b=Otg1pZMRCsPkAdxHVR+10Wsqw9GhL77g1UMZEF42NBcWVPoXlzOdlq89GQSnfEz1SU
         793LXPFpXMgzDjka/Jv24EBrWvxVRyNUf9Trul3O3FQ10qLnYT+Cc7SqYArL0S+KCIt5
         JQHc6Yr2XcXFDSjhWYjgis6g351wwTyi/GwFgXgrTvP9NEHnazQhtFWPnl6OHRFo8tiS
         ps9KHf705UTYJ2DOebwmt7CyZDNif5fmBg31UmYfaALdXY+RrWtZ6n0RrowxxFY6UIr2
         3kGNjEoknmHxw8bxFTKNvLBJTkji7FTg83QHa9nGwMeqxqUm+aSZ3aW11ciChmtPL8sl
         VmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682372931; x=1684964931;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IT6g7GLOtjjOc8NzufEKuKYyBAhDVc+WTbN/KUIfWRM=;
        b=RACQyX1sXw1FphJE1bo5OQtcjuZD3LkB6VKeiqKGbTm3aEu3gjSffuA1AELxXo7KuC
         kISJoJXGSb9RQpbxMX1praXs7Rk8bJ83XfpYZXLbLGIrelyJ2Ay269pDlOrwRxscNZmf
         7hGFoSpPn9mfkGyDluBXMlFngeBLFqge1rDz6PJOEmdjE+TAyRA+yiPpOFJs9fAcMcp7
         YyZ7Kq2RZ5BLh4M0opEiUQhFD0Bn8dby20KumOI4dH0I/vNwUuwe4Sn2a5BrhQTqqSoj
         lkJn/g0FfN10g4oGFy/xXXr3ToPj8KdN3AmZNbN0CEi9tZZXK1/Jk9Wip5DZ01tR4GE4
         paNw==
X-Gm-Message-State: AAQBX9c2QXgZ+isYm7iTcC8uK4WS9qxIQsFhF/p3S2qiO/NQmrMatGCN
        69LsHN59BD1x1Ow88wvrTKHDLHR5+OwooaN63ziVBA==
X-Google-Smtp-Source: AKy350b8BilPiRm2fEk7XDpOmdns997THDdahw80lofCfJkYCEkmZfmr0nUdoe32HpkyiyT+kbanTw==
X-Received: by 2002:a17:903:26c9:b0:1a2:7462:d674 with SMTP id jg9-20020a17090326c900b001a27462d674mr18913423plb.24.1682372929211;
        Mon, 24 Apr 2023 14:48:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a15-20020a65640f000000b0051afa49e07asm6896265pgv.50.2023.04.24.14.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 14:48:48 -0700 (PDT)
Message-ID: <6446f940.650a0220.74952.d740@mx.google.com>
Date:   Mon, 24 Apr 2023 14:48:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230424
X-Kernelci-Report-Type: test
Subject: next/master baseline: 583 runs, 88 regressions (next-20230424)
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

next/master baseline: 583 runs, 88 regressions (next-20230424)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+ima                | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

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

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 11         =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230424/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230424
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3b85b9b39960c08f29fa91b8d984d055dde6017e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446cd350fbef6f2d72e8692

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446cd350fbef6f2d72e86a1
        new failure (last pass: next-20230421)

    2023-04-24T18:40:23.729221  /usr/bin/tpm2_getcap

    2023-04-24T18:40:23.771869  <3>[   12.574978] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:40:24.814357  <3>[   13.617973] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:40:25.638281  <3>[   14.440971] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:40:25.859929  <3>[   14.662973] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:40:26.906005  <3>[   15.708972] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:40:27.951589  <3>[   16.754974] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:40:28.997921  <3>[   17.800978] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:40:30.043947  <3>[   18.846969] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:40:31.089498  <3>[   19.892976] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6446bfe389574513342e85f4

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bfe389574513342e8602
        new failure (last pass: next-20230421)

    2023-04-24T17:43:36.550607  /usr/bin/tpm2_getcap

    2023-04-24T17:43:36.576018  <3>[   10.725028] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:43:37.604354  <3>[   11.753031] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:43:38.632367  <3>[   12.781026] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:43:39.660486  <3>[   13.809026] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:43:40.688534  <3>[   14.837031] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:43:41.716826  <3>[   15.865030] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:43:42.744140  <3>[   16.893039] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:43:42.851931  <3>[   17.001030] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:43:43.772286  <3>[   17.921034] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c04cf57136c9372e85fb

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c04cf57136c9372e860c
        new failure (last pass: next-20230421)

    2023-04-24T17:45:23.645284  /usr/bin/tpm2_getcap

    2023-04-24T17:45:23.691773  <3>[   97.879878] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:45:23.712086  <3>[   97.900889] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:45:24.737222  <3>[   98.925908] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:45:25.784927  <3>[   99.973916] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:45:26.831889  <3>[  101.020910] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:45:27.878585  <3>[  102.067916] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:45:28.925713  <3>[  103.114914] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:45:29.972856  <3>[  104.161909] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:45:31.019608  <3>[  105.208916] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c1ec0f8a20a2882e85e9

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c1ec0f8a20a2882e85f8
        new failure (last pass: next-20230421)

    2023-04-24T17:52:21.346118  /usr/bin/tpm2_getcap

    2023-04-24T17:52:21.371870  <3>[    8.699038] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:22.399370  <3>[    9.727035] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:23.427403  <3>[   10.755035] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:24.455692  <3>[   11.783036] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:25.483778  <3>[   12.811039] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:26.511406  <3>[   13.839036] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:27.539482  <3>[   14.867035] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:28.567676  <3>[   15.895036] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:29.595669  <3>[   16.923036] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bdef9738f1e9042e85ec

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446bdef9738f1e9042e85f1
        failing since 27 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-24T17:35:28.356688  + set +x

    2023-04-24T17:35:28.363487  <8>[   12.910337] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107164_1.4.2.3.1>

    2023-04-24T17:35:28.467366  / # #

    2023-04-24T17:35:28.568164  export SHELL=3D/bin/sh

    2023-04-24T17:35:28.568382  #

    2023-04-24T17:35:28.668891  / # export SHELL=3D/bin/sh. /lava-10107164/=
environment

    2023-04-24T17:35:28.669097  =


    2023-04-24T17:35:28.769627  / # . /lava-10107164/environment/lava-10107=
164/bin/lava-test-runner /lava-10107164/1

    2023-04-24T17:35:28.769926  =


    2023-04-24T17:35:28.775840  / # /lava-10107164/bin/lava-test-runner /la=
va-10107164/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bf37b8cf722cde2e85f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446bf37b8cf722cde2e85fd
        failing since 24 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-24T17:40:58.937839  + set +x<8>[   13.519415] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10107198_1.4.2.3.1>

    2023-04-24T17:40:58.937932  =


    2023-04-24T17:40:59.042615  / # #

    2023-04-24T17:40:59.143192  export SHELL=3D/bin/sh

    2023-04-24T17:40:59.143395  #

    2023-04-24T17:40:59.243911  / # export SHELL=3D/bin/sh. /lava-10107198/=
environment

    2023-04-24T17:40:59.244131  =


    2023-04-24T17:40:59.344662  / # . /lava-10107198/environment/lava-10107=
198/bin/lava-test-runner /lava-10107198/1

    2023-04-24T17:40:59.344949  =


    2023-04-24T17:40:59.350939  / # /lava-10107198/bin/lava-test-runner /la=
va-10107198/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c1dcbb1cfc0eca2e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c1dcbb1cfc0eca2e85ed
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-24T17:52:15.060818  <8>[   50.843459] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107437_1.4.2.3.1>

    2023-04-24T17:52:15.064297  + set +x

    2023-04-24T17:52:15.165560  #

    2023-04-24T17:52:15.266315  / # #export SHELL=3D/bin/sh

    2023-04-24T17:52:15.266531  =


    2023-04-24T17:52:15.367089  / # export SHELL=3D/bin/sh. /lava-10107437/=
environment

    2023-04-24T17:52:15.367283  =


    2023-04-24T17:52:15.467821  / # . /lava-10107437/environment/lava-10107=
437/bin/lava-test-runner /lava-10107437/1

    2023-04-24T17:52:15.468134  =


    2023-04-24T17:52:15.473241  / # /lava-10107437/bin/lava-test-runner /la=
va-10107437/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c8232869416e852e8625

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c8232869416e852e8628
        new failure (last pass: next-20230421)

    2023-04-24T18:18:57.086444  <8>[   10.483035] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-24T18:18:57.096179  /usr/bin/tpm2_getcap

    2023-04-24T18:18:58.518410  <3>[   11.919201] tpm tpm0: Data still avai=
lable

    2023-04-24T18:18:58.526712  <3>[   11.925665] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-24T18:19:05.161863  <6>[   18.558360] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-24T18:19:07.455290  /lava-10108039/1/../bin/lava-test-case

    2023-04-24T18:19:07.467114  <8>[   20.863633] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bdfed02dadb2c02e85fc

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bdfed02dadb2c02e85ff
        new failure (last pass: next-20230421)

    2023-04-24T17:35:30.797603  /usr/bin/tpm2_getcap

    2023-04-24T17:35:38.798762  <6>[   21.120006] platform MX98357A:00: def=
erred probe pending

    2023-04-24T17:35:38.803607  <6>[   21.120922] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-24T17:35:41.152465  /lava-10107118/1/../bin/lava-test-case

    2023-04-24T17:35:41.164101  <8>[   23.486285] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bf3f9afe468f332e85f1

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bf3f9afe468f332e85f4
        new failure (last pass: next-20230421)

    2023-04-24T17:40:47.062024  /usr/bin/tpm2_getcap

    2023-04-24T17:40:47.180774  <3>[   18.614213] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:48.304624  <3>[   19.738237] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:49.427588  <3>[   20.861213] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:50.549233  <3>[   21.983232] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:51.670523  <3>[   23.104233] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:52.118298  <3>[   23.552240] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:52.773305  <3>[   24.207214] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:53.132145  <6>[   24.562515] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-24T17:40:53.138736  <6>[   24.572020] platform MX98357A:00: def=
erred probe pending
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c1e2eccef3ed002e86b8

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c1e2eccef3ed002e86bb
        new failure (last pass: next-20230421)

    2023-04-24T17:52:04.978504  /usr/bin/tpm2_getcap

    2023-04-24T17:52:07.918084  <6>[   15.228741] udevd (116) used greatest=
 stack depth: 13104 bytes left

    2023-04-24T17:52:12.785039  <6>[   20.096155] platform MX98357A:00: def=
erred probe pending

    2023-04-24T17:52:12.793286  <6>[   20.096168] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-24T17:52:14.337002  <3>[   21.649866] tpm tpm0: Data still avai=
lable

    2023-04-24T17:52:14.344061  <3>[   21.656017] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-24T17:52:15.296576  /lava-10107438/1/../bin/lava-test-case

    2023-04-24T17:52:15.308431  <8>[   22.617640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7f8a814344eaa2e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-CM1=
400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-CM1=
400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c7f8a814344eaa2e85fa
        new failure (last pass: next-20230421)

    2023-04-24T18:18:03.413299  /usr/bin/tpm2_getcap

    2023-04-24T18:18:03.438970  <3>[    7.988396] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:04.468043  <3>[    9.016672] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:05.495756  <3>[   10.044661] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:06.523567  <3>[   11.072658] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:07.552160  <3>[   12.101416] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:08.578992  <3>[   13.128414] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:09.404415  <3>[   13.953434] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:09.607355  <3>[   14.156414] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:10.634124  <3>[   15.183432] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bde1694e87373a2e85fe

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446bde1694e87373a2e8603
        failing since 27 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-24T17:35:14.531407  <8>[   11.151200] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107139_1.4.2.3.1>

    2023-04-24T17:35:14.534995  + set +x

    2023-04-24T17:35:14.639875  #

    2023-04-24T17:35:14.640928  =


    2023-04-24T17:35:14.742722  / # #export SHELL=3D/bin/sh

    2023-04-24T17:35:14.743421  =


    2023-04-24T17:35:14.844913  / # export SHELL=3D/bin/sh. /lava-10107139/=
environment

    2023-04-24T17:35:14.845629  =


    2023-04-24T17:35:14.947470  / # . /lava-10107139/environment/lava-10107=
139/bin/lava-test-runner /lava-10107139/1

    2023-04-24T17:35:14.948672  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bf51a848445e582e860a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446bf51a848445e582e860f
        failing since 24 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-24T17:41:11.602849  <8>[   10.919832] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107212_1.4.2.3.1>

    2023-04-24T17:41:11.606167  + set +x

    2023-04-24T17:41:11.707465  #

    2023-04-24T17:41:11.707753  =


    2023-04-24T17:41:11.808379  / # #export SHELL=3D/bin/sh

    2023-04-24T17:41:11.808592  =


    2023-04-24T17:41:11.909197  / # export SHELL=3D/bin/sh. /lava-10107212/=
environment

    2023-04-24T17:41:11.909438  =


    2023-04-24T17:41:12.009987  / # . /lava-10107212/environment/lava-10107=
212/bin/lava-test-runner /lava-10107212/1

    2023-04-24T17:41:12.010332  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c1ed79340d21a62e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c1ed79340d21a62e85eb
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-24T17:52:25.051692  <8>[   10.948157] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107452_1.4.2.3.1>

    2023-04-24T17:52:25.055236  + set +x

    2023-04-24T17:52:25.156660  =


    2023-04-24T17:52:25.257217  / # #export SHELL=3D/bin/sh

    2023-04-24T17:52:25.257414  =


    2023-04-24T17:52:25.357940  / # export SHELL=3D/bin/sh. /lava-10107452/=
environment

    2023-04-24T17:52:25.358177  =


    2023-04-24T17:52:25.458713  / # . /lava-10107452/environment/lava-10107=
452/bin/lava-test-runner /lava-10107452/1

    2023-04-24T17:52:25.459066  =


    2023-04-24T17:52:25.464219  / # /lava-10107452/bin/lava-test-runner /la=
va-10107452/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bdfd9738f1e9042e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446bdfd9738f1e9042e8=
618
        failing since 82 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c067f6672b8b482e86a1

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c067f6672b8b482e86d4
        failing since 9 days (last pass: next-20230411, first fail: v6.3-rc=
6-12018-gd3f2cd248191)

    2023-04-24T17:45:52.495783  <8>[   18.004245] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 381087_1.5.2.4.1>
    2023-04-24T17:45:52.628291  / # #
    2023-04-24T17:45:52.730456  export SHELL=3D/bin/sh
    2023-04-24T17:45:52.730845  #
    2023-04-24T17:45:52.832130  / # export SHELL=3D/bin/sh. /lava-381087/en=
vironment
    2023-04-24T17:45:52.832588  =

    2023-04-24T17:45:52.933849  / # . /lava-381087/environment/lava-381087/=
bin/lava-test-runner /lava-381087/1
    2023-04-24T17:45:52.934576  =

    2023-04-24T17:45:52.940844  / # /lava-381087/bin/lava-test-runner /lava=
-381087/1
    2023-04-24T17:45:53.119241  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c4e4e24e200b902e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c4e4e24e200b902e8=
62c
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7e560abd41e5b2e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c7e560abd41e5b2e85f7
        new failure (last pass: next-20230421)

    2023-04-24T18:17:41.706349  /lava-10108017/1/../bin/lava<8>[   10.16433=
3] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-24T18:17:41.707028  -test-case

    2023-04-24T18:17:41.709533  /usr/bin/tpm2_getcap

    2023-04-24T18:17:41.744495  <3>[   10.210977] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:42.774204  <3>[   11.241980] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:43.806062  <3>[   12.272964] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:44.835408  <3>[   13.302965] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:45.865298  <3>[   14.332966] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:46.895892  <3>[   15.362968] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:47.925323  <3>[   16.392965] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446be0f1377fade352e85e9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446be0f1377fade352e85ec
        new failure (last pass: next-20230421)

    2023-04-24T17:35:47.560688  -test-case

    2023-04-24T17:35:47.563320  /usr/bin/tpm2_getcap

    2023-04-24T17:35:47.597551  <3>[   16.558548] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:48.626259  <3>[   17.587522] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:48.646115  <3>[   17.607529] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:49.656263  <3>[   18.617521] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:50.704560  <3>[   19.665529] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:51.752110  <3>[   20.713529] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:52.800543  <3>[   21.761523] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:53.849413  <3>[   22.810530] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bf4f477431fc392e8631

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bf4f477431fc392e8634
        new failure (last pass: next-20230421)

    2023-04-24T17:41:05.793321  /usr/bin/tpm2_getcap

    2023-04-24T17:41:05.837301  <3>[   13.516098] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:06.879129  <3>[   14.558096] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:07.921722  <3>[   15.600092] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:08.521445  <3>[   16.200106] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:08.962597  <3>[   16.641092] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:10.023811  <3>[   17.702099] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:11.085329  <3>[   18.764091] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:12.149384  <3>[   19.828099] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:13.197996  <3>[   20.877083] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c1f471ec72be632e85ea

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c1f471ec72be632e85ed
        new failure (last pass: next-20230421)

    2023-04-24T17:52:32.404194  <8>[    9.395039] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-24T17:52:32.407676  /usr/bin/tpm2_getcap

    2023-04-24T17:52:32.442760  <3>[    9.439142] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:33.489291  <3>[   10.486150] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:34.536895  <3>[   11.534149] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:35.585782  <3>[   12.582150] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:36.615449  <3>[   13.612144] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:37.663790  <3>[   14.660150] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:38.711342  <3>[   15.708150] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:39.759321  <3>[   16.756153] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7fb49fa7b7d0f2e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c7fb49fa7b7d0f2e85f9
        new failure (last pass: next-20230421)

    2023-04-24T18:18:01.660063  + export 'PATH=3D/opt/bootrr/libexec/bootrr=
/helpers:/lava-10108034<8>[    9.167571] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-24T18:18:01.663724  /1/../bin:/sbin:/usr/sbin:/bin:/usr/bin'

    2023-04-24T18:18:01.666558  + cd /opt/bootrr/libexec/bootrr

    2023-04-24T18:18:01.669293  + sh helpers/bootrr-auto

    2023-04-24T18:18:01.672893  /lava-10108034/1/../bin/lava-test-case

    2023-04-24T18:18:01.677203  /lava-10108034/1/../bin/lava-test-case

    2023-04-24T18:18:01.679007  /usr/bin/tpm2_getcap

    2023-04-24T18:18:01.692873  <3>[    9.207531] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:02.725467  <3>[   10.239575] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:18:03.466855  <3>[   10.981529] tpm tpm0: Operation Timed=
 out
 =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bea3694e4abfb02e860a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bea3694e4abfb02e860d
        new failure (last pass: next-20230421)

    2023-04-24T17:38:17.783661  <8>[   10.587351] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-24T17:38:17.788211  /usr/bin/tpm2_getcap

    2023-04-24T17:38:17.828227  <3>[   10.638767] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:18.858054  <3>[   11.668828] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:19.194791  <3>[   12.005766] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:19.885768  <3>[   12.695766] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:20.912343  <3>[   13.722771] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:21.941186  <3>[   14.751820] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:22.968718  <3>[   15.779766] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:23.996992  <3>[   16.807772] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bf43aba43cfa212e861e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bf43aba43cfa212e8621
        new failure (last pass: next-20230421)

    2023-04-24T17:40:59.739829  /usr/bin/tpm2_getcap

    2023-04-24T17:40:59.779766  <3>[   14.422533] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:00.819891  <3>[   15.462556] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:01.858737  <3>[   16.501535] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:02.896729  <3>[   17.539510] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:03.956111  <3>[   18.598520] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:04.998404  <3>[   19.640549] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:06.036917  <3>[   20.679546] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:07.075058  <3>[   21.717553] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:41:08.114176  <3>[   22.756534] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c20358ea2cb0712e8609

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c20358ea2cb0712e860c
        new failure (last pass: next-20230421)

    2023-04-24T17:52:41.543837  <8>[    9.987309] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-24T17:52:41.549497  /usr/bin/tpm2_getcap

    2023-04-24T17:52:41.585123  <3>[   10.032743] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:42.616629  <3>[   11.063782] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:43.662191  <3>[   12.109745] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:44.692965  <3>[   13.139737] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:45.723136  <3>[   14.170783] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:46.421895  <6>[   14.866941] udevd (147) used greatest=
 stack depth: 13240 bytes left

    2023-04-24T17:52:46.631211  <3>[   15.078752] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:46.746592  <3>[   15.193758] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c2370ed17439262e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c2370ed17439262e8=
5ef
        failing since 91 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7a04c168ae2d42e8609

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c7a04c168ae2d42e8618
        new failure (last pass: next-20230421)

    2023-04-24T18:16:46.949583  /usr/bin/tpm2_getcap

    2023-04-24T18:16:46.988716  <3>[   12.470110] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:16:47.932510  <3>[   13.414122] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:16:48.034915  <3>[   13.516116] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:16:49.080699  <3>[   14.562118] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:16:50.126687  <3>[   15.608115] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:16:51.172773  <3>[   16.654118] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:16:52.218743  <3>[   17.700118] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:16:53.266468  <3>[   18.748119] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:16:54.312617  <3>[   19.794117] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6446bec3ca6090aa602e85f5

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bec3ca6090aa602e8604
        new failure (last pass: next-20230421)

    2023-04-24T17:38:54.877050  /usr/bin/tpm2_getcap

    2023-04-24T17:38:54.901449  <3>[   11.795282] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:55.927661  <3>[   12.822282] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:56.954327  <3>[   13.849282] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:57.543472  <3>[   14.438285] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:57.977159  <3>[   14.872284] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:38:59.004261  <3>[   15.899284] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:39:00.032323  <3>[   16.927285] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:39:01.059362  <3>[   17.954284] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:39:02.086074  <3>[   18.981285] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bf8b6d6a7800702e8600

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bf8b6d6a7800702e8611
        new failure (last pass: next-20230421)

    2023-04-24T17:42:06.137041  /usr/bin/tpm2_getcap

    2023-04-24T17:42:06.181316  <3>[   89.669088] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:42:07.229600  <3>[   90.717118] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:42:08.277592  <3>[   91.765089] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:42:09.335898  <3>[   92.824096] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:42:10.383306  <3>[   93.871089] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:42:11.431094  <3>[   94.919089] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:42:12.477890  <3>[   95.966087] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:42:13.524571  <3>[   97.013087] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:42:14.380856  <3>[   97.869088] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c1e76e63e7e2cf2e8633

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c1e76e63e7e2cf2e8642
        new failure (last pass: next-20230421)

    2023-04-24T17:52:13.288586  /usr/bin/tpm2_getcap

    2023-04-24T17:52:23.496969  /lava-10107471/1/../bin/lava-test-case

    2023-04-24T17:52:23.503660  <8>[   20.807459] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c93d28e8fa1f352e85f3

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c93d28e8fa1f352e8602
        new failure (last pass: next-20230421)

    2023-04-24T18:23:35.466039  /usr/bin/tpm2_getcap

    2023-04-24T18:23:35.508370  <3>[   12.326966] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:23:36.554670  <3>[   13.372965] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:23:37.600577  <3>[   14.418966] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:23:37.622910  <3>[   14.440966] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:23:38.646753  <3>[   15.464968] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:23:39.692664  <3>[   16.510966] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:23:40.738671  <3>[   17.556966] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:23:41.790021  <3>[   18.607964] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:23:42.835488  <3>[   19.653963] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6446bddff03534cbd62e865e

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bddff03534cbd62e866d
        new failure (last pass: next-20230421)

    2023-04-24T17:35:13.830436  /usr/bin/tpm2_getcap

    2023-04-24T17:35:13.854322  <3>[   12.430288] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:14.881530  <3>[   13.458280] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:15.910027  <3>[   14.486277] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:16.375945  <3>[   14.952284] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:16.932364  <3>[   15.509278] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:17.960470  <3>[   16.537279] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:18.988478  <3>[   17.565279] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:20.016574  <3>[   18.593285] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:35:21.043392  <3>[   19.620279] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bf1c18565c15802e85fa

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446bf1c18565c15802e8609
        new failure (last pass: next-20230421)

    2023-04-24T17:40:18.629890  /usr/bin/tpm2_getcap

    2023-04-24T17:40:18.673251  <3>[   12.176085] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:19.721803  <3>[   13.224105] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:20.769128  <3>[   14.272105] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:21.816374  <3>[   15.319097] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:22.446016  <3>[   15.949104] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:22.864196  <3>[   16.367113] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:23.912263  <3>[   17.415102] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:24.959756  <3>[   18.462108] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:40:26.005062  <3>[   19.508106] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6446c1e16e63e7e2cf2e85ff

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c1e16e63e7e2cf2e860e
        new failure (last pass: next-20230421)

    2023-04-24T17:52:00.569623  /usr/bin/tpm2_getcap

    2023-04-24T17:52:00.589340  <3>[   10.819284] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:01.616560  <3>[   11.846273] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:02.644500  <3>[   12.874280] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:03.672265  <3>[   13.902283] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:04.699512  <3>[   14.929281] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:05.234051  <3>[   15.464283] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:05.722160  <3>[   15.952282] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:06.750609  <3>[   16.980313] tpm tpm0: Operation Timed=
 out

    2023-04-24T17:52:07.778601  <3>[   18.008281] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bfa55dc51468cf2e85f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446bfa55dc51468cf2e85f6
        failing since 27 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-24T17:42:44.685009  + set +x

    2023-04-24T17:42:44.691794  <8>[   15.057852] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107161_1.4.2.3.1>

    2023-04-24T17:42:44.795646  / # #

    2023-04-24T17:42:44.896387  export SHELL=3D/bin/sh

    2023-04-24T17:42:44.897062  #

    2023-04-24T17:42:44.998704  / # export SHELL=3D/bin/sh. /lava-10107161/=
environment

    2023-04-24T17:42:44.999493  =


    2023-04-24T17:42:45.101220  / # . /lava-10107161/environment/lava-10107=
161/bin/lava-test-runner /lava-10107161/1

    2023-04-24T17:42:45.102397  =


    2023-04-24T17:42:45.107111  / # /lava-10107161/bin/lava-test-runner /la=
va-10107161/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bfd7f50444f6652e8617

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446bfd7f50444f6652e861c
        failing since 24 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-24T17:43:30.525629  + set +x

    2023-04-24T17:43:30.532223  <8>[   15.947231] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107220_1.4.2.3.1>

    2023-04-24T17:43:30.641827  / # #

    2023-04-24T17:43:30.744084  export SHELL=3D/bin/sh

    2023-04-24T17:43:30.744851  #

    2023-04-24T17:43:30.846443  / # export SHELL=3D/bin/sh. /lava-10107220/=
environment

    2023-04-24T17:43:30.847144  =


    2023-04-24T17:43:30.948638  / # . /lava-10107220/environment/lava-10107=
220/bin/lava-test-runner /lava-10107220/1

    2023-04-24T17:43:30.949962  =


    2023-04-24T17:43:30.955319  / # /lava-10107220/bin/lava-test-runner /la=
va-10107220/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c1d9eccef3ed002e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c1d9eccef3ed002e85ec
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-24T17:52:15.202668  + set +x

    2023-04-24T17:52:15.209726  <8>[   10.701892] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107465_1.4.2.3.1>

    2023-04-24T17:52:15.313731  / # #

    2023-04-24T17:52:15.414375  export SHELL=3D/bin/sh

    2023-04-24T17:52:15.414560  #

    2023-04-24T17:52:15.515072  / # export SHELL=3D/bin/sh. /lava-10107465/=
environment

    2023-04-24T17:52:15.515258  =


    2023-04-24T17:52:15.615734  / # . /lava-10107465/environment/lava-10107=
465/bin/lava-test-runner /lava-10107465/1

    2023-04-24T17:52:15.616024  =


    2023-04-24T17:52:15.620516  / # /lava-10107465/bin/lava-test-runner /la=
va-10107465/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446be462e312e51f02e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446be462e312e51f02e85fb
        failing since 27 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-24T17:36:56.037290  + set +x<8>[   10.331537] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10107125_1.4.2.3.1>

    2023-04-24T17:36:56.037772  =


    2023-04-24T17:36:56.145124  #

    2023-04-24T17:36:56.146333  =


    2023-04-24T17:36:56.248130  / # #export SHELL=3D/bin/sh

    2023-04-24T17:36:56.248890  =


    2023-04-24T17:36:56.350373  / # export SHELL=3D/bin/sh. /lava-10107125/=
environment

    2023-04-24T17:36:56.351206  =


    2023-04-24T17:36:56.452879  / # . /lava-10107125/environment/lava-10107=
125/bin/lava-test-runner /lava-10107125/1

    2023-04-24T17:36:56.454076  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446bf27a996ce7a092e860b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446bf27a996ce7a092e8610
        failing since 24 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-24T17:40:33.640735  + <8>[   14.830313] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10107183_1.4.2.3.1>

    2023-04-24T17:40:33.640821  set +x

    2023-04-24T17:40:33.745721  / # #

    2023-04-24T17:40:33.848032  export SHELL=3D/bin/sh

    2023-04-24T17:40:33.848765  #

    2023-04-24T17:40:33.950199  / # export SHELL=3D/bin/sh. /lava-10107183/=
environment

    2023-04-24T17:40:33.950941  =


    2023-04-24T17:40:34.052388  / # . /lava-10107183/environment/lava-10107=
183/bin/lava-test-runner /lava-10107183/1

    2023-04-24T17:40:34.052776  =


    2023-04-24T17:40:34.057886  / # /lava-10107183/bin/lava-test-runner /la=
va-10107183/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c1daeccef3ed002e85ff

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446c1daeccef3ed002e8604
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-24T17:52:10.672474  + set +x

    2023-04-24T17:52:10.679026  <8>[   10.731807] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107478_1.4.2.3.1>

    2023-04-24T17:52:10.781512  =


    2023-04-24T17:52:10.882187  / # #export SHELL=3D/bin/sh

    2023-04-24T17:52:10.882370  =


    2023-04-24T17:52:10.982847  / # export SHELL=3D/bin/sh. /lava-10107478/=
environment

    2023-04-24T17:52:10.983031  =


    2023-04-24T17:52:11.083543  / # . /lava-10107478/environment/lava-10107=
478/bin/lava-test-runner /lava-10107478/1

    2023-04-24T17:52:11.083861  =


    2023-04-24T17:52:11.088665  / # /lava-10107478/bin/lava-test-runner /la=
va-10107478/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7d354b5b9e9002e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c7d354b5b9e9002e85ee
        new failure (last pass: next-20230421)

    2023-04-24T18:17:30.745358  /usr/bin/tpm2_getcap

    2023-04-24T18:17:30.771837  <3>[   10.792269] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:31.801532  <3>[   11.821291] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:32.828536  <3>[   12.849334] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:33.855646  <3>[   13.876555] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:33.897838  <3>[   13.918550] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:34.882416  <3>[   14.903571] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:35.910705  <3>[   15.931580] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:36.937268  <3>[   16.958291] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:37.964346  <3>[   17.985545] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c2a691907dd43e2e861c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+ima/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+ima/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c2a691907dd43e2e8=
61d
        new failure (last pass: next-20230421) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c76d0171c278462e8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c76d0171c278462e8=
647
        failing since 4 days (last pass: next-20230417, first fail: next-20=
230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7b965f6019ff42e8664

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
446c7b965f6019ff42e8667
        new failure (last pass: next-20230421)

    2023-04-24T18:17:04.441995  /usr/bin/tpm2_getcap

    2023-04-24T18:17:04.469941  <3>[   11.213117] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:05.496353  <3>[   12.240102] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:06.523582  <3>[   13.267116] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:07.153792  <3>[   13.897100] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:07.550280  <3>[   14.293138] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:08.578318  <3>[   15.321355] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:09.604605  <3>[   16.348353] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:10.633294  <3>[   17.376365] tpm tpm0: Operation Timed=
 out

    2023-04-24T18:17:11.662857  <3>[   18.406100] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6446c730e8ae8e1b312e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c730e8ae8e1b312e8=
60a
        failing since 90 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c07c3465b7be352e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c07c3465b7be352e8=
5eb
        failing since 24 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c729cfe48bb00d2e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c729cfe48bb00d2e8=
628
        failing since 75 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c06dbbf2fcbd5e2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c06dbbf2fcbd5e2e8=
5e7
        failing since 9 days (last pass: next-20230411, first fail: v6.3-rc=
6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c72ee8ae8e1b312e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c72ee8ae8e1b312e8=
5ea
        failing since 75 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446d70e3180ed618c2e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446d70e3180ed618c2e8=
5ea
        failing since 75 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c33795a4ed94542e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c33795a4ed94542e8=
5f8
        failing since 4 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c30e19c11e40792e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c30e19c11e40792e8=
5f9
        new failure (last pass: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c32219c11e40792e86c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c32219c11e40792e8=
6c1
        new failure (last pass: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6446cd6954d9616c7d2e8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446cd6954d9616c7d2e8=
639
        failing since 13 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6446cbb1cb479d91702e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446cbb1cb479d91702e8=
5f1
        failing since 13 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c35390e5e984382e8628

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c35390e5e984382e8=
629
        failing since 153 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c24f9ece70f6ad2e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c24f9ece70f6ad2e8=
62c
        failing since 153 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446cf56b3b7ec4adb2e86c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446cf56b3b7ec4adb2e8=
6c3
        failing since 13 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6446bfa07cd49fceec2e8610

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6446bfa07cd49fc=
eec2e8667
        failing since 13 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-24T17:42:20.509320  fo:

    2023-04-24T17:42:20.513912  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-24T17:42:20.520327  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-24T17:42:20.523715  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-24T17:42:20.527130  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-24T17:42:20.532453  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-24T17:42:20.535857  kern  :alert : Data abort info:

    2023-04-24T17:42:20.539613  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-24T17:42:20.550045  kern  :<8>[   19.161473] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6446bfa07cd49fc=
eec2e8668
        failing since 13 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-24T17:42:20.458145  <8>[   19.072741] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-04-24T17:42:20.496562  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-24T17:42:20.508687  kern  :alert : Mem abort in<8>[   19.118346=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446cdda741a56b5c22e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446cdda741a56b5c22e8=
5f5
        failing since 75 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6446bfa6ba9ac996452e85ec

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6446bfa6ba9ac99=
6452e85f3
        failing since 13 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-24T17:42:42.438011  kern  :emerg : Code: 97f70910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-24T17:42:42.438538  <8>[   21.609084] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-24T17:42:42.438891  + set +x

    2023-04-24T17:42:42.439212  <8>[   21.611271] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107332_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6446bfa6ba9ac99=
6452e85f4
        failing since 13 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-24T17:42:42.397160  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-24T17:42:42.397706  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-24T17:42:42.398051  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078e4a000

    2023-04-24T17:42:42.398372  kern  :alert : [0000000000000008] pgd=3D080=
0000078e51003, p4d=3D0800000078e51003, pud=3D0800000078e52003, pmd=3D000000=
0000000000

    2023-04-24T17:42:42.398683  <8>[   21.586855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-04-24T17:42:42.398983  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6446c1f40f8a20a2882e8620

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6446c1f40f8a20a=
2882e8627
        failing since 13 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-04-24T17:52:33.428183  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-24T17:52:33.428276  kern  :emerg : Code: 97fd4110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-24T17:52:33.428349  <8>[   23.841809] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-24T17:52:33.428432  + set +x

    2023-04-24T17:52:33.428542  <8>[   23.843911] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107416_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6446c1f40f8a20a=
2882e8628
        failing since 13 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-04-24T17:52:33.381204  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-24T17:52:33.381315  kern  :alert : Mem abort info:

    2023-04-24T17:52:33.381415  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-24T17:52:33.381511  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-24T17:52:33.381604  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-24T17:52:33.381695  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-24T17:52:33.381785  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-24T17:52:33.381874  kern  :alert : Data abort info:

    2023-04-24T17:52:33.381934  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-24T17:52:33.381994  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/6446c2bc9b5a7fb4192e85ef

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6446c2bc9b5a7fb=
4192e85f6
        failing since 13 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-24T17:55:51.671542  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-24T17:55:51.672068  kern  :emerg : Code: 97f91d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-24T17:55:51.672411  <8>[   22.237787] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-24T17:55:51.672735  + set +x

    2023-04-24T17:55:51.673049  <8>[   22.239706] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107507_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6446c2bc9b5a7fb=
4192e85f7
        failing since 13 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-24T17:55:51.628861  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-24T17:55:51.629415  kern  :alert : Mem abort info:

    2023-04-24T17:55:51.629759  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-24T17:55:51.630077  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-24T17:55:51.630386  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-24T17:55:51.630685  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-24T17:55:51.630977  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-24T17:55:51.631269  kern  :alert : Data abort info:

    2023-04-24T17:55:51.631551  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-24T17:55:51.631836  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6446c65f1399a379692e86c5

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6446c65f1399a37=
9692e86cc
        failing since 13 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-04-24T18:11:36.220221  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-04-24T18:11:36.220755  kern  :emerg : Code: 9406b0be f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-24T18:11:36.221104  <8>[   17.623527] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-24T18:11:36.221464  + set +x

    2023-04-24T18:11:36.221784  <8>[   17.625175] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10107933_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6446c65f1399a37=
9692e86cd
        failing since 13 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-04-24T18:11:36.174510  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-24T18:11:36.175038  kern  :alert : Mem abort info:

    2023-04-24T18:11:36.175385  kern  :alert :   ESR =3D 0x0000000096000007

    2023-04-24T18:11:36.175710  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-24T18:11:36.176027  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-24T18:11:36.176335  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-24T18:11:36.176636  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-04-24T18:11:36.176931  kern  :alert : Data abort info:

    2023-04-24T18:11:36.177226  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-04-24T18:11:36.177554  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6446cb11e397a9eaf32e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446cb11e397a9eaf32e8=
5fc
        failing since 75 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c1bcd656bb163f2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c1bcd656bb163f2e8=
5f8
        new failure (last pass: next-20230421) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 11         =


  Details:     https://kernelci.org/test/plan/id/6446c3898d86a971752e862d

  Results:     24 PASS, 15 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-driver-present: https://kernelci.org/test/case/id/=
6446c3898d86a971752e8630
        new failure (last pass: next-20230421)

    2023-04-24T17:59:24.983712  FIRST, INC default to 1.
    2023-04-24T17:59:24.984135  =

    2023-04-24T17:59:24.984628  	-w	Pad to last with leading zeros
    2023-04-24T17:59:24.990792  	-s SEP	String separator
    2023-04-24T17:59:24.991221  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:26.003660  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:26.016141  <8>[   37.782864] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-mixer-driver-present: https://kernelci.org/test/c=
ase/id/6446c3898d86a971752e8633
        new failure (last pass: next-20230421)

    2023-04-24T17:59:23.864677  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:23.877088  <8>[   35.643941] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-phy-probed RESULT=3Dblocked>
    2023-04-24T17:59:24.896594  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:24.909660  <8>[   36.676073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-mixer-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-hdmi-phy-driver-present: https://kernelci.org/tes=
t/case/id/6446c3898d86a971752e8634
        new failure (last pass: next-20230421)

    2023-04-24T17:59:22.824405  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:22.838002  <8>[   34.603877] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-hdmi-phy-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sunxi-wdt-driver-present: https://kernelci.org/test/cas=
e/id/6446c3898d86a971752e8637
        new failure (last pass: next-20230421)

    2023-04-24T17:59:19.639751  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:19.652477  <8>[   31.418965] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsoc-crypto-probed RESULT=3Dblocked>
    2023-04-24T17:59:20.677232  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:20.690130  <8>[   32.456594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsunxi-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-ce-driver-present: https://kernelci.org/test/case=
/id/6446c3898d86a971752e8638
        new failure (last pass: next-20230421)

    2023-04-24T17:59:18.599735  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:18.612587  <8>[   30.379123] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-ce-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-dw-hdmi-driver-present: https://kernelci.org/test=
/case/id/6446c3898d86a971752e863d
        new failure (last pass: next-20230421)

    2023-04-24T17:59:16.376575  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:16.390225  <8>[   28.156200] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-dw-hdmi-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/6446c3898=
d86a971752e863e
        new failure (last pass: next-20230421)

    2023-04-24T17:59:14.307929  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:14.320076  <8>[   26.087510] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Di2s-probed RESULT=3Dblocked>
    2023-04-24T17:59:15.344932  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:15.356419  <8>[   27.124278] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sun4i-i2s-driver-present: https://kernelci.org/test/cas=
e/id/6446c3898d86a971752e863f
        new failure (last pass: next-20230421)

    2023-04-24T17:59:12.230779  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:12.243687  <8>[   24.010559] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcodec-digital-probed RESULT=3Dblocked>
    2023-04-24T17:59:13.267739  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:13.281892  <8>[   25.048444] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun4i-i2s-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-codec-driver-present: https://kernelci.org/test/c=
ase/id/6446c3898d86a971752e8640
        new failure (last pass: next-20230421)

    2023-04-24T17:59:10.151203  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:10.163196  <8>[   21.931009] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcodec-analog-probed RESULT=3Dblocked>
    2023-04-24T17:59:11.191272  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:11.204281  <8>[   22.970842] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-codec-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun50i-codec-analog-driver-present: https://kernelci.or=
g/test/case/id/6446c3898d86a971752e8641
        new failure (last pass: next-20230421)

    2023-04-24T17:59:09.111449  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:09.125439  <8>[   20.891689] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun50i-codec-analog-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.dwmac-sun8i-driver-present: https://kernelci.org/test/c=
ase/id/6446c3898d86a971752e864c
        new failure (last pass: next-20230421)

    2023-04-24T17:59:06.696101  /lava-381195/1/../bin/lava-test-case
    2023-04-24T17:59:06.709644  <8>[   18.476464] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmac-sun8i-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c9526d00c400b02e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c9526d00c400b02e8=
5e7
        failing since 6 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c0b7f812bb29392e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c0b7f812bb29392e8=
5fb
        new failure (last pass: next-20230420) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c3b04695f835f52e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c3b04695f835f52e8=
628
        failing since 5 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20230418) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c43e4f54d6211c2e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c43e4f54d6211c2e8=
60e
        failing since 4 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6446c7c15b5b4a1d2a2e8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230424/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446c7c15b5b4a1d2a2e8=
63a
        failing since 6 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20230417) =

 =20
