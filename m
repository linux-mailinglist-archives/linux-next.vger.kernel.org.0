Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 627946EE803
	for <lists+linux-next@lfdr.de>; Tue, 25 Apr 2023 21:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbjDYTGm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Apr 2023 15:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjDYTGl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Apr 2023 15:06:41 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEFEE43
        for <linux-next@vger.kernel.org>; Tue, 25 Apr 2023 12:06:35 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a98ac97d47so12431935ad.3
        for <linux-next@vger.kernel.org>; Tue, 25 Apr 2023 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682449595; x=1685041595;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AzaPlXNkzHkXHY9swvUrNKjIW6XNMtZlqG84Kh1Pon4=;
        b=CpHEFoexOj5sX8EwxD6BkRrnhESrHNWI371BY3ITuNgX8K64InWw5ROHdbJclUboT1
         BzzQqwsn6l5T7j2G3RZb7rYG96TZ2U9x9uxevnXZCuEYK//OFAxcbgWGXgSO4YkJCKFC
         YUE27hH2XNsw1VOle9VfUqvF3LqaqdaYvoAY5f+yfGDkz6HA9CJrFOkch81hjjkdrNnF
         o/pdananrUvf0DKjS2oLkG0suSfpBWG29ubDh0PzixHQIK6GLUytzyZqXDtzxf33BcRV
         IovXaolWcRxVO6kMtiAEMRcXWy1OD5Ka4PQbqrqyZegxYnHubctus90Pp93siZjaonib
         jYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682449595; x=1685041595;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzaPlXNkzHkXHY9swvUrNKjIW6XNMtZlqG84Kh1Pon4=;
        b=R/Rci8nMGtJrS5tua3HaoDFUrOFHA4GlVHwMykmOkPrc7+UQMQreYA8QmeqWkTMw+1
         CstkZJQXL8ldU60PNOmBHF3n7tv3MmUHr3EXL/aI+O7ocZd5+pUTsmS3CpblbM65uohH
         mJhx4yIwkrmjgIDmIei92cNdvs3Gq7FvHq0P0RR4xiMXLKH4KOAcbgpjdG/mHvhkBGDv
         msRp3jQb/zuDIadgrz+dTYimTTtOeAkrlmEwF8ZjTYAlWK1Ib+/3LAtRHKrdElm6KPhQ
         ONoo3LUoXQxoFav9E+7ik7NKAOwxnz30WoaW+/6kihKFB/0Z1u9o27RohlKPNMHY5lRI
         9oXw==
X-Gm-Message-State: AAQBX9eDFM4DXcVjQebiZjpEuzdpbaNKTZ0zzTS+886yP0m3kwcLGOCc
        5gDSoj7HjNnJ5gvd/DZQoM0+g1TznuR22wc5qWAx5yPR
X-Google-Smtp-Source: AKy350YrVpZoMatAaW+tj8VtfuadAjWEMwRgOm788NldJtaYSXof+9iOMZIVFxmpa7CbxyO/neIVQA==
X-Received: by 2002:a17:903:890:b0:1a1:b3bb:cd5b with SMTP id kt16-20020a170903089000b001a1b3bbcd5bmr16186144plb.62.1682449592885;
        Tue, 25 Apr 2023 12:06:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jm23-20020a17090304d700b001a1faed8707sm1744358plb.63.2023.04.25.12.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 12:06:32 -0700 (PDT)
Message-ID: <644824b8.170a0220.9a859.3d3a@mx.google.com>
Date:   Tue, 25 Apr 2023 12:06:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230425
X-Kernelci-Report-Type: test
Subject: next/master baseline: 478 runs, 61 regressions (next-20230425)
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

next/master baseline: 478 runs, 61 regressions (next-20230425)

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

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

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

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | clang-17 | multi_=
v7_defconfig           | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

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

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230425/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230425
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f600e0bbde8562a06bee31b3eb1b69d49acac4c5 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f71e4a5beb78ec2e8625

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f71e4a5beb78ec2e8636
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:51:26.405091  /usr/bin/tpm2_getcap

    2023-04-25T15:51:26.447893  <3>[    9.740793] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:51:27.491087  <3>[   10.783792] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:51:28.537298  <3>[   11.829792] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:51:29.583023  <3>[   12.875791] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:51:30.123201  <3>[   13.415796] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:51:30.627859  <3>[   13.920786] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:51:31.672279  <3>[   14.964787] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:51:32.718207  <3>[   16.010791] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:51:33.764108  <3>[   17.056792] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447f3891fd46ccfbe2e85e6

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f38a1fd46ccfbe2e85f5
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:36:19.118923  /usr/bin/tpm2_getcap

    2023-04-25T15:36:19.145488  <3>[    8.708027] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:20.172651  <3>[    9.736034] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:21.200623  <3>[   10.764034] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:22.228651  <3>[   11.792032] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:23.256431  <3>[   12.820034] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:24.284828  <3>[   13.848045] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:25.312626  <3>[   14.876039] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:26.340698  <3>[   15.904030] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:27.368994  <3>[   16.932033] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447f3a0bd97ff39152e85ea

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f3a0bd97ff39152e85f9
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:36:43.293202  /usr/bin/tpm2_getcap

    2023-04-25T15:36:43.314501  <3>[   10.974041] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:44.341843  <3>[   12.002029] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:45.370247  <3>[   13.030042] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:45.757819  <3>[   13.417032] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:46.398555  <3>[   14.058038] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:47.425446  <3>[   15.085040] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:48.453790  <3>[   16.113036] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:49.481730  <3>[   17.141041] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:36:50.509653  <3>[   18.169037] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447f40ea41e384cde2e860b

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f40ea41e384cde2e861a
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:38:35.301918  /usr/bin/tpm2_getcap

    2023-04-25T15:38:35.346156  <3>[   99.233096] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:38:36.391542  <3>[  100.279099] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:38:37.438759  <3>[  101.326092] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:38:38.485918  <3>[  102.373099] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:38:39.533852  <3>[  103.421101] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:38:40.580751  <3>[  104.468106] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:38:41.628031  <3>[  105.515096] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:38:42.674828  <3>[  106.562097] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:38:43.721952  <3>[  107.608915] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447f9b57cfd653a5b2e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447f9b57cfd653a5b2e8=
5ec
        failing since 220 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ea4e0036d73b672e8600

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ea4e0036d73b672e8605
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-25T14:57:03.972594  + set +x

    2023-04-25T14:57:03.979290  <8>[   10.290554] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10118783_1.4.2.3.1>

    2023-04-25T14:57:04.087935  =


    2023-04-25T14:57:04.189787  / # #export SHELL=3D/bin/sh

    2023-04-25T14:57:04.190565  =


    2023-04-25T14:57:04.292141  / # export SHELL=3D/bin/sh. /lava-10118783/=
environment

    2023-04-25T14:57:04.292972  =


    2023-04-25T14:57:04.394767  / # . /lava-10118783/environment/lava-10118=
783/bin/lava-test-runner /lava-10118783/1

    2023-04-25T14:57:04.396015  =


    2023-04-25T14:57:04.402369  / # /lava-10118783/bin/lava-test-runner /la=
va-10118783/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ee9c84e84365c32e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ee9c84e84365c32e8606
        failing since 27 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-25T15:15:20.851799  <8>[   10.357578] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10119055_1.4.2.3.1>

    2023-04-25T15:15:20.854545  + set +x

    2023-04-25T15:15:20.955826  #

    2023-04-25T15:15:21.056626  / # #export SHELL=3D/bin/sh

    2023-04-25T15:15:21.056803  =


    2023-04-25T15:15:21.157285  / # export SHELL=3D/bin/sh. /lava-10119055/=
environment

    2023-04-25T15:15:21.157461  =


    2023-04-25T15:15:21.257972  / # . /lava-10119055/environment/lava-10119=
055/bin/lava-test-runner /lava-10119055/1

    2023-04-25T15:15:21.258240  =


    2023-04-25T15:15:21.264154  / # /lava-10119055/bin/lava-test-runner /la=
va-10119055/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6447eed023476e5fc72e8671

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447eed023476e5fc72e8676
        failing since 25 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-25T15:16:09.803967  + set +x

    2023-04-25T15:16:09.810479  <8>[   13.637460] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10119089_1.4.2.3.1>

    2023-04-25T15:16:09.915279  / # #

    2023-04-25T15:16:10.015883  export SHELL=3D/bin/sh

    2023-04-25T15:16:10.016070  #

    2023-04-25T15:16:10.116589  / # export SHELL=3D/bin/sh. /lava-10119089/=
environment

    2023-04-25T15:16:10.116784  =


    2023-04-25T15:16:10.217323  / # . /lava-10119089/environment/lava-10119=
089/bin/lava-test-runner /lava-10119089/1

    2023-04-25T15:16:10.217619  =


    2023-04-25T15:16:10.223608  / # /lava-10119089/bin/lava-test-runner /la=
va-10119089/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f6dfc4b50815c42e85f6

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f6dfc4b50815c42e85f9
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:50:14.170634  /usr/bin/tpm2_getcap

    2023-04-25T15:50:18.528244  <3>[   19.600331] tpm tpm0: Data still avai=
lable

    2023-04-25T15:50:18.535519  <3>[   19.606489] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-25T15:50:22.099173  <6>[   23.167570] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-25T15:50:24.619152  /lava-10119537/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ea2cd6ff5af2bc2e85e6

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ea2cd6ff5af2bc2e85e9
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T14:56:28.252482  /usr/bin/tpm2_getcap

    2023-04-25T14:56:36.101203  <6>[   20.097009] platform MX98357A:00: def=
erred probe pending

    2023-04-25T14:56:36.109376  <6>[   20.097050] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-25T14:56:37.653486  <3>[   21.650830] tpm tpm0: Data still avai=
lable

    2023-04-25T14:56:37.660614  <3>[   21.656887] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-25T14:56:38.601389  /lava-10118793/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447edf7e545495b082e861e

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447edf7e545495b082e8621
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:12:27.878897  <8>[   12.836269] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-25T15:12:27.888014  /usr/bin/tpm2_getcap

    2023-04-25T15:12:30.846013  <6>[   15.804877] udevd (133) used greatest=
 stack depth: 13152 bytes left

    2023-04-25T15:12:35.651008  <6>[   20.608343] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-25T15:12:35.657101  <6>[   20.608953] platform MX98357A:00: def=
erred probe pending

    2023-04-25T15:12:36.689130  <3>[   21.649935] tpm tpm0: Data still avai=
lable

    2023-04-25T15:12:36.696248  <3>[   21.655897] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-25T15:12:38.301436  /lava-10118990/1/../bin/lava-test-case

    2023-04-25T15:12:38.312760  <8>[   23.270318] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ee6edcd1716df72e865d

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ee6edcd1716df72e8662
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:14:32.563647  /usr/bin/tpm2_getcap

    2023-04-25T15:14:37.177382  <3>[   23.558452] tpm tpm0: Data still avai=
lable

    2023-04-25T15:14:37.184212  <3>[   23.564464] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-25T15:14:38.702003  <6>[   25.081484] platform MX98357A:00: def=
erred probe pending

    2023-04-25T15:14:38.710644  <6>[   25.081839] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-25T15:14:43.686758  /lava-10119102/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f75b67799738a62e85ec

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-CM1=
400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-CM1=
400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f75b67799738a62e85ef
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:52:35.710571  /usr/bin/tpm2_getcap

    2023-04-25T15:52:35.735106  <3>[   10.944321] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:52:36.762979  <3>[   11.971600] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:52:37.790543  <3>[   12.999325] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:52:38.818015  <3>[   14.026578] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:52:39.768613  <3>[   14.977626] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:52:39.846007  <3>[   15.054323] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:52:40.873181  <3>[   16.082359] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:52:41.900186  <3>[   17.109363] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:52:42.928349  <3>[   18.137331] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447ea4d2fe06a02cf2e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ea4d2fe06a02cf2e860b
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-25T14:57:00.838346  <8>[   10.988644] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10118773_1.4.2.3.1>

    2023-04-25T14:57:00.842019  + set +x

    2023-04-25T14:57:00.945515  =


    2023-04-25T14:57:01.046165  / # #export SHELL=3D/bin/sh

    2023-04-25T14:57:01.046976  =


    2023-04-25T14:57:01.148608  / # export SHELL=3D/bin/sh. /lava-10118773/=
environment

    2023-04-25T14:57:01.149441  =


    2023-04-25T14:57:01.251154  / # . /lava-10118773/environment/lava-10118=
773/bin/lava-test-runner /lava-10118773/1

    2023-04-25T14:57:01.252278  =


    2023-04-25T14:57:01.257765  / # /lava-10118773/bin/lava-test-runner /la=
va-10118773/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447edf44e239567b82e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447edf44e239567b82e8606
        failing since 27 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-25T15:12:35.276662  <8>[   11.437994] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10118982_1.4.2.3.1>

    2023-04-25T15:12:35.279827  + set +x

    2023-04-25T15:12:35.381385  =


    2023-04-25T15:12:35.482020  / # #export SHELL=3D/bin/sh

    2023-04-25T15:12:35.482249  =


    2023-04-25T15:12:35.582813  / # export SHELL=3D/bin/sh. /lava-10118982/=
environment

    2023-04-25T15:12:35.583012  =


    2023-04-25T15:12:35.683565  / # . /lava-10118982/environment/lava-10118=
982/bin/lava-test-runner /lava-10118982/1

    2023-04-25T15:12:35.683900  =


    2023-04-25T15:12:35.688607  / # /lava-10118982/bin/lava-test-runner /la=
va-10118982/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ee633cf14fbc332e863c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ee633cf14fbc332e8641
        failing since 25 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-25T15:14:21.624959  + set +x

    2023-04-25T15:14:21.631221  <8>[   12.696609] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10119077_1.4.2.3.1>

    2023-04-25T15:14:21.735488  / # #

    2023-04-25T15:14:21.836218  export SHELL=3D/bin/sh

    2023-04-25T15:14:21.836419  #

    2023-04-25T15:14:21.936893  / # export SHELL=3D/bin/sh. /lava-10119077/=
environment

    2023-04-25T15:14:21.937116  =


    2023-04-25T15:14:22.037661  / # . /lava-10119077/environment/lava-10119=
077/bin/lava-test-runner /lava-10119077/1

    2023-04-25T15:14:22.038020  =


    2023-04-25T15:14:22.043298  / # /lava-10119077/bin/lava-test-runner /la=
va-10119077/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ec9f4c0e07c8072e86b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447ec9f4c0e07c8072e8=
6b1
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f6e64a5beb78ec2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f6e64a5beb78ec2e85e9
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:50:25.250363  /usr/bin/tpm2_getcap

    2023-04-25T15:50:25.280445  <3>[   10.362901] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:26.309389  <3>[   11.391882] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:27.357420  <3>[   12.439893] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:28.405415  <3>[   13.487894] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:29.434441  <3>[   14.516881] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:30.463532  <3>[   15.545878] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:31.511731  <3>[   16.593893] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:32.012412  <3>[   17.094897] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:32.536575  <3>[   17.618884] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447ea476f9491e4762e863b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ea476f9491e4762e863e
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T14:56:45.549745  /usr/bin/tpm2_getcap

    2023-04-25T14:56:45.580580  <3>[   12.787387] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:46.608761  <3>[   13.815370] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:47.656563  <3>[   14.863373] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:48.356316  <3>[   15.563377] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:48.681784  <3>[   15.889370] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:49.710745  <3>[   16.917370] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:50.740763  <3>[   17.947362] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:51.770327  <3>[   18.977364] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:52.799864  <3>[   20.007361] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447ee12ca717607f82e8650

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ee12ca717607f82e8653
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:12:54.497618  /usr/bin/tpm2_getcap

    2023-04-25T15:12:54.531797  <3>[    9.784316] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:55.562983  <3>[   10.815312] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:56.591832  <3>[   11.844314] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:57.622480  <3>[   12.874304] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:58.652328  <3>[   13.904304] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:59.682011  <3>[   14.934303] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:13:00.711823  <3>[   15.964305] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:13:01.334383  <3>[   16.586316] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:13:01.738305  <3>[   16.990303] tpm tpm0: Operation Timed=
 out
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ee9e21842a9b5d2e85f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ee9e21842a9b5d2e85fb
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:15:05.953271  /usr/bin/tpm2_getcap

    2023-04-25T15:15:06.001406  <3>[   16.010533] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:07.045437  <3>[   17.054565] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:08.098100  <3>[   18.106534] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:08.239805  <3>[   18.248568] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:09.140466  <3>[   19.149563] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:10.222303  <3>[   20.230563] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:11.285775  <3>[   21.294547] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:12.348966  <3>[   22.357565] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:13.400418  <3>[   23.408534] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447f79ccfba0cd4b62e862e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f79ccfba0cd4b62e8631
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:53:27.063665  /../bin:/sbin:/usr/sbin:/bin:/usr/bin'

    2023-04-25T15:53:27.066882  + cd /opt/bootrr/libexec/bootrr

    2023-04-25T15:53:27.069811  + sh helpers/bootrr-auto

    2023-04-25T15:53:27.074670  /lava-10119548/1/../bin/lava-test-case

    2023-04-25T15:53:27.077897  /lava-10119548/1/../bin/lava-test-case

    2023-04-25T15:53:27.079448  /usr/bin/tpm2_getcap

    2023-04-25T15:53:27.091185  <3>[    9.744566] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:53:28.119573  <3>[   10.772577] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:53:28.328633  <3>[   10.981531] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:53:29.144088  <3>[   11.797584] tpm tpm0: Operation Timed=
 out
 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ea59890fa55e8c2e85ed

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ea59890fa55e8c2e85f0
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T14:57:07.382715  elpers:/lava-10118777/1/../bin:/sbin:/usr/s=
bin:/bin:/usr/bin'

    2023-04-25T14:57:07.386785  + cd /opt/bootrr/libexec/bootrr

    2023-04-25T14:57:07.388756  + sh helpers/bootrr-auto

    2023-04-25T14:57:07.392647  /lava-10118777/1/../bin/lava-test-case

    2023-04-25T14:57:07.396447  /lava-10118777/1/../bin/lava-test-case

    2023-04-25T14:57:07.399083  /usr/bin/tpm2_getcap

    2023-04-25T14:57:07.414497  <3>[    9.411757] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:57:08.444619  <3>[   10.441762] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:57:09.472647  <3>[   11.469811] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:57:09.500524  <3>[   11.497763] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447ee08ca717607f82e861d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ee08ca717607f82e8620
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:12:48.123934  <8>[    8.955146] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-25T15:12:48.129506  /usr/bin/tpm2_getcap

    2023-04-25T15:12:48.165382  <3>[    9.003259] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:49.194671  <3>[   10.032259] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:50.145342  <3>[   10.983264] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:50.224942  <3>[   11.062265] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:51.253797  <3>[   12.091300] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:52.284008  <3>[   13.121260] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:53.312638  <3>[   14.150304] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:54.341190  <3>[   15.179252] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ee838e18fdb1922e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ee838e18fdb1922e85e9
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:14:50.829862  /usr/bin/tpm2_getcap

    2023-04-25T15:14:50.868828  <3>[   13.772924] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:14:51.908286  <3>[   14.812886] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:14:52.955664  <3>[   15.859915] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:14:53.995577  <3>[   16.899898] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:14:54.286584  <3>[   17.190902] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:14:55.032187  <3>[   17.935919] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:14:56.070569  <3>[   18.974905] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:14:57.109249  <3>[   20.013899] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:14:58.149095  <3>[   21.052910] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f0696e2d565a0d2e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447f0696e2d565a0d2e8=
603
        failing since 92 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f6b1bcd45237ee2e85e8

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f6b1bcd45237ee2e85f9
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:49:50.785477  /usr/bin/tpm2_getcap

    2023-04-25T15:49:53.271620  <3>[   14.436156] tpm tpm0: Data still avai=
lable

    2023-04-25T15:49:53.277862  <3>[   14.441376] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-25T15:50:01.191152  /lava-10119474/1/../bin/lava-test-case

    2023-04-25T15:50:01.208057  <8>[   22.369852] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ea436f9491e4762e8619

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ea436f9491e4762e862a
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T14:56:34.421097  /usr/bin/tpm2_getcap

    2023-04-25T14:56:44.634702  /lava-10118790/1/../bin/lava-test-case

    2023-04-25T14:56:44.642021  <8>[   20.803557] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447edf8e545495b082e8629

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447edf8e545495b082e8638
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:12:19.576730  /usr/bin/tpm2_getcap

    2023-04-25T15:12:19.599067  <3>[   11.208262] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:20.625286  <3>[   12.234273] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:21.651887  <3>[   13.261280] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:22.680318  <3>[   14.289279] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:22.831131  <3>[   14.440278] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:23.703172  <3>[   15.312281] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:24.729681  <3>[   16.339280] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:25.757989  <3>[   17.367280] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:26.785717  <3>[   18.395279] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447ee547ff1379cba2e8618

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ee547ff1379cba2e8627
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:14:08.637035  /usr/bin/tpm2_getcap

    2023-04-25T15:14:09.741164  <3>[   15.951241] tpm tpm0: Data still avai=
lable

    2023-04-25T15:14:09.747435  <3>[   15.956502] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-25T15:14:19.070259  /lava-10119073/1/../bin/lava-test-case

    2023-04-25T15:14:19.087353  <8>[   25.294400] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f6ad46ade9743b2e85ef

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f6ad46ade9743b2e85fe
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:49:43.765274  /usr/bin/tpm2_getcap

    2023-04-25T15:49:43.807552  <3>[   11.546945] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:49:44.852904  <3>[   12.591941] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:49:45.897532  <3>[   13.636944] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:49:46.699098  <3>[   14.437938] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:49:46.944930  <3>[   14.683936] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:49:47.989362  <3>[   15.728943] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:49:49.035493  <3>[   16.774944] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:49:50.081716  <3>[   17.820944] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:49:51.127860  <3>[   18.866815] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447ea346f9491e4762e85ef

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ea346f9491e4762e85fe
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T14:56:34.942910  /usr/bin/tpm2_getcap

    2023-04-25T14:56:34.966263  <3>[    8.340277] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:35.993439  <3>[    9.367289] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:37.020159  <3>[   10.394286] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:38.047147  <3>[   11.421286] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:39.075302  <3>[   12.449287] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:40.103497  <3>[   13.477286] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:41.066514  <3>[   14.440277] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:41.126638  <3>[   14.500288] tpm tpm0: Operation Timed=
 out

    2023-04-25T14:56:42.154534  <3>[   15.528286] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6447edfae545495b082e8644

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447edfae545495b082e8653
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:12:38.505877  /lava-10119058/1/../bin/lava-test-case<8>[ =
  10.983213] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall-cpus-are-online RESUL=
T=3Dpass>

    2023-04-25T15:12:38.505997  =


    2023-04-25T15:12:38.509223  /usr/bin/tpm2_getcap

    2023-04-25T15:12:38.531916  <3>[   11.014277] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:39.559202  <3>[   12.041282] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:40.585758  <3>[   13.068282] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:41.614008  <3>[   14.096280] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:42.470126  <3>[   14.952280] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:42.634473  <3>[   15.119278] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:12:43.664472  <3>[   16.146286] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ee998e18fdb1922e8631

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447ee998e18fdb1922e8640
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:15:12.539648  /usr/bin/tpm2_getcap

    2023-04-25T15:15:12.579264  <3>[   91.694093] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:13.627657  <3>[   92.742107] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:14.673084  <3>[   93.788099] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:15.720348  <3>[   94.835098] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:16.779580  <3>[   95.895102] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:17.826735  <3>[   96.942106] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:18.873915  <3>[   97.989099] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:19.920734  <3>[   99.036099] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:15:20.802390  <3>[   99.918098] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ea33d6ff5af2bc2e860d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ea33d6ff5af2bc2e8612
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-25T14:56:37.137048  + set +x

    2023-04-25T14:56:37.143155  <8>[   12.996451] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10118776_1.4.2.3.1>

    2023-04-25T14:56:37.247986  / # #

    2023-04-25T14:56:37.348591  export SHELL=3D/bin/sh

    2023-04-25T14:56:37.348773  #

    2023-04-25T14:56:37.449239  / # export SHELL=3D/bin/sh. /lava-10118776/=
environment

    2023-04-25T14:56:37.449428  =


    2023-04-25T14:56:37.549984  / # . /lava-10118776/environment/lava-10118=
776/bin/lava-test-runner /lava-10118776/1

    2023-04-25T14:56:37.550303  =


    2023-04-25T14:56:37.555094  / # /lava-10118776/bin/lava-test-runner /la=
va-10118776/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ee4d1905438bc92e8637

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ee4d1905438bc92e863c
        failing since 27 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-25T15:14:06.071848  + set +x

    2023-04-25T15:14:06.078507  <8>[   10.324991] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10119053_1.4.2.3.1>

    2023-04-25T15:14:06.182986  / # #

    2023-04-25T15:14:06.283649  export SHELL=3D/bin/sh

    2023-04-25T15:14:06.283860  #

    2023-04-25T15:14:06.384402  / # export SHELL=3D/bin/sh. /lava-10119053/=
environment

    2023-04-25T15:14:06.384620  =


    2023-04-25T15:14:06.485115  / # . /lava-10119053/environment/lava-10119=
053/bin/lava-test-runner /lava-10119053/1

    2023-04-25T15:14:06.485456  =


    2023-04-25T15:14:06.490375  / # /lava-10119053/bin/lava-test-runner /la=
va-10119053/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6447eeb38de37fa77e2e8611

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447eeb38de37fa77e2e8616
        failing since 25 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-25T15:15:40.123176  + set +x

    2023-04-25T15:15:40.130026  <8>[   16.223687] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10119101_1.4.2.3.1>

    2023-04-25T15:15:40.236702  / # #

    2023-04-25T15:15:40.337320  export SHELL=3D/bin/sh

    2023-04-25T15:15:40.337565  #

    2023-04-25T15:15:40.438139  / # export SHELL=3D/bin/sh. /lava-10119101/=
environment

    2023-04-25T15:15:40.438338  =


    2023-04-25T15:15:40.538865  / # . /lava-10119101/environment/lava-10119=
101/bin/lava-test-runner /lava-10119101/1

    2023-04-25T15:15:40.539153  =


    2023-04-25T15:15:40.544297  / # /lava-10119101/bin/lava-test-runner /la=
va-10119101/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ea34d6ff5af2bc2e861b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ea34d6ff5af2bc2e8620
        failing since 27 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-25T14:56:33.079791  + set +x

    2023-04-25T14:56:33.086733  <8>[   10.996695] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10118784_1.4.2.3.1>

    2023-04-25T14:56:33.189075  #

    2023-04-25T14:56:33.189427  =


    2023-04-25T14:56:33.290075  / # #export SHELL=3D/bin/sh

    2023-04-25T14:56:33.290316  =


    2023-04-25T14:56:33.390873  / # export SHELL=3D/bin/sh. /lava-10118784/=
environment

    2023-04-25T14:56:33.391082  =


    2023-04-25T14:56:33.491624  / # . /lava-10118784/environment/lava-10118=
784/bin/lava-test-runner /lava-10118784/1

    2023-04-25T14:56:33.491896  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447edf2e545495b082e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447edf2e545495b082e85ec
        failing since 27 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-25T15:12:42.185698  <8>[   11.037195] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10118993_1.4.2.3.1>

    2023-04-25T15:12:42.189169  + set +x

    2023-04-25T15:12:42.293236  / # #

    2023-04-25T15:12:42.393967  export SHELL=3D/bin/sh

    2023-04-25T15:12:42.394212  #

    2023-04-25T15:12:42.494773  / # export SHELL=3D/bin/sh. /lava-10118993/=
environment

    2023-04-25T15:12:42.495025  =


    2023-04-25T15:12:42.595599  / # . /lava-10118993/environment/lava-10118=
993/bin/lava-test-runner /lava-10118993/1

    2023-04-25T15:12:42.595945  =


    2023-04-25T15:12:42.601201  / # /lava-10118993/bin/lava-test-runner /la=
va-10118993/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ee581905438bc92e867c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ee581905438bc92e8681
        failing since 25 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-25T15:14:16.376884  + set +x

    2023-04-25T15:14:16.383782  <8>[   16.347958] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10119106_1.4.2.3.1>

    2023-04-25T15:14:16.487727  / # #

    2023-04-25T15:14:16.588438  export SHELL=3D/bin/sh

    2023-04-25T15:14:16.588664  #

    2023-04-25T15:14:16.689239  / # export SHELL=3D/bin/sh. /lava-10119106/=
environment

    2023-04-25T15:14:16.689478  =


    2023-04-25T15:14:16.790083  / # . /lava-10119106/environment/lava-10119=
106/bin/lava-test-runner /lava-10119106/1

    2023-04-25T15:14:16.790432  =


    2023-04-25T15:14:16.796174  / # /lava-10119106/bin/lava-test-runner /la=
va-10119106/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f6c646ade9743b2e8615

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f6c646ade9743b2e8618
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:50:04.415125  /usr/bin/tpm2_getcap

    2023-04-25T15:50:04.443256  <3>[   10.996222] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:05.470708  <3>[   12.023224] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:06.498068  <3>[   13.051222] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:06.853268  <3>[   13.406496] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:07.525840  <3>[   14.078248] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:08.551494  <3>[   15.105223] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:09.580192  <3>[   16.133495] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:10.606970  <3>[   17.160222] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:11.634872  <3>[   18.188492] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ee838e18fdb1922e85f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447ee838e18fdb1922e85f6
        new failure (last pass: next-20230424)

    2023-04-25T15:14:53.452658  + set[   15.159478] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 937111_1.5.2.3.1>
    2023-04-25T15:14:53.452827   +x
    2023-04-25T15:14:53.558872  / # #
    2023-04-25T15:14:53.660328  export SHELL=3D/bin/sh
    2023-04-25T15:14:53.660738  #
    2023-04-25T15:14:53.762096  / # export SHELL=3D/bin/sh. /lava-937111/en=
vironment
    2023-04-25T15:14:53.762587  =

    2023-04-25T15:14:53.863854  / # . /lava-937111/environment/lava-937111/=
bin/lava-test-runner /lava-937111/1
    2023-04-25T15:14:53.864420  =

    2023-04-25T15:14:53.867596  / # /lava-937111/bin/lava-test-runner /lava=
-937111/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6447f1e4475b5d565b2e85f2

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6447f1e4475b5d565b2e85f5
        new failure (last pass: next-20230424)

    2023-04-25T15:29:13.475832  / # #
    2023-04-25T15:29:13.578661  export SHELL=3D/bin/sh
    2023-04-25T15:29:13.579464  #
    2023-04-25T15:29:13.681391  / # export SHELL=3D/bin/sh. /lava-326262/en=
vironment
    2023-04-25T15:29:13.682185  =

    2023-04-25T15:29:13.783991  / # . /lava-326262/environment/lava-326262/=
bin/lava-test-runner /lava-326262/1
    2023-04-25T15:29:13.784672  =

    2023-04-25T15:29:13.802063  / # /lava-326262/bin/lava-test-runner /lava=
-326262/1
    2023-04-25T15:29:13.856912  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-25T15:29:13.857381  + cd /lava-326262/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/644=
7f1e4475b5d565b2e8605
        new failure (last pass: next-20230424)

    2023-04-25T15:29:16.252960  /lava-326262/1/../bin/lava-test-case
    2023-04-25T15:29:16.253142  <8>[   18.117911] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-04-25T15:29:16.253308  /lava-326262/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f6c946ade9743b2e862b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
447f6c946ade9743b2e862e
        failing since 0 day (last pass: next-20230421, first fail: next-202=
30424)

    2023-04-25T15:50:02.938582  /usr/bin/tpm2_getcap

    2023-04-25T15:50:02.963643  <3>[    7.863976] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:03.990853  <3>[    8.890992] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:05.017587  <3>[    9.918008] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:06.043334  <3>[   10.944330] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:07.070448  <3>[   11.971235] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:08.099913  <3>[   13.000233] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:09.125272  <3>[   14.026238] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:10.021897  <3>[   14.922453] tpm tpm0: Operation Timed=
 out

    2023-04-25T15:50:10.153027  <3>[   15.053011] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6447eee5f3f232d9e72e8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447eee5f3f232d9e72e8=
658
        failing since 25 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6447eee2f3f232d9e72e861a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447eee2f3f232d9e72e8=
61b
        failing since 10 days (last pass: next-20230411, first fail: v6.3-r=
c6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f0745007f05cd22e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447f0745007f05cd22e8=
5ee
        failing since 5 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f0755007f05cd22e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447f0755007f05cd22e8=
5f1
        failing since 0 day (last pass: next-20230419, first fail: next-202=
30424) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6447ec176274dbaef12e8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447ec176274dbaef12e8=
643
        new failure (last pass: next-20230424) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f3bcd7e2de76552e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447f3bcd7e2de76552e8=
60a
        failing since 14 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f52500f2dcfef52e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447f52500f2dcfef52e8=
5fe
        failing since 14 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f255b39c1b3a132e864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447f255b39c1b3a132e8=
64c
        failing since 154 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f1521ded48a7512e863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447f1521ded48a7512e8=
640
        failing since 154 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6447f2a0f25a6385ca2e86fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6447f2a0f25a6385ca2e8=
6fd
        failing since 14 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6447ee049ddc98be0d2e860a

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6447ee049ddc98b=
e0d2e8661
        failing since 14 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-25T15:12:30.952701  kern  :alert : Mem abort in<8>[   20.768171=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-04-25T15:12:30.952790  fo:

    2023-04-25T15:12:30.957078  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-25T15:12:30.963385  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-25T15:12:30.966820  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-25T15:12:30.970076  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-25T15:12:30.975252  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-25T15:12:30.978786  kern  :alert : Data abort info:

    2023-04-25T15:12:30.982958  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-25T15:12:30.986019  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (1 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6447ee049ddc98b=
e0d2e8662
        failing since 14 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-25T15:12:30.939911  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6447eb912585258c502e8602

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6447eb912585258=
c502e8609
        failing since 14 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-04-25T15:02:21.718860  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-25T15:02:21.719389  kern  :emerg : Code: 97fdb910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-25T15:02:21.719732  <8>[   22.992907] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-25T15:02:21.720054  + set +x

    2023-04-25T15:02:21.720365  <8>[   22.994971] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10118834_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6447eb912585258=
c502e860a
        failing since 14 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-04-25T15:02:21.672288  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-25T15:02:21.672819  kern  :alert : Mem abort info:

    2023-04-25T15:02:21.673162  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-25T15:02:21.673525  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-25T15:02:21.673838  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-25T15:02:21.674140  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-25T15:02:21.674436  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-25T15:02:21.674725  kern  :alert : Data abort info:

    2023-04-25T15:02:21.675010  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-25T15:02:21.675295  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6447f1ab51f035384c2e85f4

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230425/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6447f1ab51f0353=
84c2e85fb
        failing since 14 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-04-25T15:28:18.636240  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-25T15:28:18.636772  kern  :emerg : Code: 97f6e110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-25T15:28:18.637120  <8>[   24.325387] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-25T15:28:18.637473  + set +x

    2023-04-25T15:28:18.637784  <8>[   24.327822] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10119210_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6447f1ab51f0353=
84c2e85fc
        failing since 14 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-04-25T15:28:18.610326  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-25T15:28:18.610855  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-25T15:28:18.611194  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079748000

    2023-04-25T15:28:18.611513  kern  :alert : [0000000000000008] pgd=3D080=
0000079742003, p4d=3D0800000079742003, pud=3D0800000079741003, pmd=3D000000=
0000000000

    2023-04-25T15:28:18.611818  <8>[   24.301479] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =20
