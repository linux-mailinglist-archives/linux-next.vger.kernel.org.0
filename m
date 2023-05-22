Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33DCF70B4CC
	for <lists+linux-next@lfdr.de>; Mon, 22 May 2023 08:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbjEVGE4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 May 2023 02:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbjEVGEb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 May 2023 02:04:31 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5A0F9
        for <linux-next@vger.kernel.org>; Sun, 21 May 2023 23:04:22 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d41763796so1540515b3a.2
        for <linux-next@vger.kernel.org>; Sun, 21 May 2023 23:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684735461; x=1687327461;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gXUgf4FmtDgTc79TenGxNqjJwstlyqR0Y8jmsFXnC/Q=;
        b=HnT3sZKsu7gbxosgGe50oLzz7ukh9gcjSGZA68RGSAYnafyGeTYjGTDKCWuknUrA4l
         4nUupc3CN+u72oAUkvjKlNymToYk3UODdVKW8VuM77EqoMABXxLqKA8PUrM/K2mDJmwB
         SB36HTUebBC12gVnpU3s+irudUNPEM5qcZsBaALfmNLdywHK4rfO9jRRsj2FwifclF5U
         B1Dkt1FFFcaaPupnY+6Qu8KAL+toKeGE9wBnhIZtjMK8oLQZDNlLgVIn92GMiWfQrtt2
         njeV2XOP0MBWgVzgRaDGePD9lyXHwv382TBVrlHYVhEGtIzqhZp53syvL2NrfY75YbwU
         6Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684735461; x=1687327461;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXUgf4FmtDgTc79TenGxNqjJwstlyqR0Y8jmsFXnC/Q=;
        b=hZeDGhjsGmJ1jPuBulQPTOkZ13gQvydRbSsf68DLIHNKXtIkcN7DVLQ/5JvNSaYuwk
         58p9oiskyJkSW8tqoY0lG+MLQARKSEtrfHV8S2DOt7DezRp7EqHlnE5SGwM2QAJict+6
         cUB0eE8yXxZn/dH0SmUggZE/ZgVf8Ax0acBPJ4McOLXwIcZ+tNpLtFQN6znxTvo921IF
         pJSCNYnvkPPZb6phIyQCLacqqtwBjJjtoaz48W5SDRiyQQo8jmzkNDhupMZ72tEc55Vk
         gjDNMjZJ3cPVHzhKuiug+yMRfjZd8Sda89KuEykw1mKIBdA/zeoFFeYbt8ntMykIuoXm
         e1mQ==
X-Gm-Message-State: AC+VfDwT4rb8YDqaQd6PSeZSooBno1R1Ti6FsJBZdRuZ6eUMWsZL9EYF
        pZE5QsD22h9oc9reybhZ7ojqyYyHuJxKx3bCw6k=
X-Google-Smtp-Source: ACHHUZ4tD0Jz0EgHFs92nqLXEmU9bzvV3OBykQFIl8tprvNJ/VQCt7ohMQv3Xp9ZoymV6JSCdKOluQ==
X-Received: by 2002:a05:6a00:1505:b0:64d:2ea4:9377 with SMTP id q5-20020a056a00150500b0064d2ea49377mr14909515pfu.14.1684735459914;
        Sun, 21 May 2023 23:04:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z8-20020aa785c8000000b005a8de0f4c64sm3337051pfn.82.2023.05.21.23.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 23:04:19 -0700 (PDT)
Message-ID: <646b05e3.a70a0220.ea192.5210@mx.google.com>
Date:   Sun, 21 May 2023 23:04:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.4-rc3-205-ge885abc8cc39d
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 467 runs,
 44 regressions (v6.4-rc3-205-ge885abc8cc39d)
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

next/pending-fixes baseline: 467 runs, 44 regressions (v6.4-rc3-205-ge885ab=
c8cc39d)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc3-205-ge885abc8cc39d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc3-205-ge885abc8cc39d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e885abc8cc39d729ef87a853a5c245c28ffe11af =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/646aceabc5cd27a94d2e8622

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646aceabc5cd27a94d2e8=
623
        failing since 224 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646acddbb60f74d6132e8605

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acddbb60f74d6132e860a
        failing since 54 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:04:56.202984  + set +x

    2023-05-22T02:04:56.208897  <8>[   10.920598] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406201_1.4.2.3.1>

    2023-05-22T02:04:56.310698  =


    2023-05-22T02:04:56.411240  / # #export SHELL=3D/bin/sh

    2023-05-22T02:04:56.411420  =


    2023-05-22T02:04:56.511909  / # export SHELL=3D/bin/sh. /lava-10406201/=
environment

    2023-05-22T02:04:56.512103  =


    2023-05-22T02:04:56.612613  / # . /lava-10406201/environment/lava-10406=
201/bin/lava-test-runner /lava-10406201/1

    2023-05-22T02:04:56.612948  =


    2023-05-22T02:04:56.618185  / # /lava-10406201/bin/lava-test-runner /la=
va-10406201/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646acf15a8d88a9f1b2e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acf15a8d88a9f1b2e85ec
        failing since 54 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:10:13.531362  <8>[    9.259277] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406298_1.4.2.3.1>

    2023-05-22T02:10:13.534507  + set +x

    2023-05-22T02:10:13.639051  / # #

    2023-05-22T02:10:13.739716  export SHELL=3D/bin/sh

    2023-05-22T02:10:13.739917  #

    2023-05-22T02:10:13.840430  / # export SHELL=3D/bin/sh. /lava-10406298/=
environment

    2023-05-22T02:10:13.840641  =


    2023-05-22T02:10:13.941195  / # . /lava-10406298/environment/lava-10406=
298/bin/lava-test-runner /lava-10406298/1

    2023-05-22T02:10:13.941497  =


    2023-05-22T02:10:13.946639  / # /lava-10406298/bin/lava-test-runner /la=
va-10406298/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646acdd34e26b68f0e2e863d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acdd34e26b68f0e2e8642
        failing since 54 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:04:50.844661  + set<8>[   11.590070] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10406185_1.4.2.3.1>

    2023-05-22T02:04:50.845238   +x

    2023-05-22T02:04:50.953170  / # #

    2023-05-22T02:04:51.055647  export SHELL=3D/bin/sh

    2023-05-22T02:04:51.056463  #

    2023-05-22T02:04:51.157949  / # export SHELL=3D/bin/sh. /lava-10406185/=
environment

    2023-05-22T02:04:51.158824  =


    2023-05-22T02:04:51.260481  / # . /lava-10406185/environment/lava-10406=
185/bin/lava-test-runner /lava-10406185/1

    2023-05-22T02:04:51.261881  =


    2023-05-22T02:04:51.266722  / # /lava-10406185/bin/lava-test-runner /la=
va-10406185/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646acf1da87b35cda22e862d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acf1da87b35cda22e8632
        failing since 54 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:10:21.966033  + set<8>[   11.241984] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10406274_1.4.2.3.1>

    2023-05-22T02:10:21.966671   +x

    2023-05-22T02:10:22.074244  / # #

    2023-05-22T02:10:22.176705  export SHELL=3D/bin/sh

    2023-05-22T02:10:22.177443  #

    2023-05-22T02:10:22.279197  / # export SHELL=3D/bin/sh. /lava-10406274/=
environment

    2023-05-22T02:10:22.280005  =


    2023-05-22T02:10:22.381556  / # . /lava-10406274/environment/lava-10406=
274/bin/lava-test-runner /lava-10406274/1

    2023-05-22T02:10:22.382941  =


    2023-05-22T02:10:22.387065  / # /lava-10406274/bin/lava-test-runner /la=
va-10406274/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646acdc826d3a8c0092e85fb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acdc826d3a8c0092e8600
        failing since 54 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:04:49.245414  <8>[   10.007675] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406215_1.4.2.3.1>

    2023-05-22T02:04:49.249143  + set +x

    2023-05-22T02:04:49.350477  #

    2023-05-22T02:04:49.350731  =


    2023-05-22T02:04:49.451388  / # #export SHELL=3D/bin/sh

    2023-05-22T02:04:49.451567  =


    2023-05-22T02:04:49.552084  / # export SHELL=3D/bin/sh. /lava-10406215/=
environment

    2023-05-22T02:04:49.552275  =


    2023-05-22T02:04:49.652823  / # . /lava-10406215/environment/lava-10406=
215/bin/lava-test-runner /lava-10406215/1

    2023-05-22T02:04:49.653160  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646acf13ceb72833572e8667

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acf13ceb72833572e866c
        failing since 54 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:10:12.579088  <8>[   10.612162] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406275_1.4.2.3.1>

    2023-05-22T02:10:12.582228  + set +x

    2023-05-22T02:10:12.684208  #

    2023-05-22T02:10:12.785371  / # #export SHELL=3D/bin/sh

    2023-05-22T02:10:12.785708  =


    2023-05-22T02:10:12.886382  / # export SHELL=3D/bin/sh. /lava-10406275/=
environment

    2023-05-22T02:10:12.886717  =


    2023-05-22T02:10:12.987410  / # . /lava-10406275/environment/lava-10406=
275/bin/lava-test-runner /lava-10406275/1

    2023-05-22T02:10:12.987894  =


    2023-05-22T02:10:12.993013  / # /lava-10406275/bin/lava-test-runner /la=
va-10406275/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/646acd95adc89032652e85f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acd95adc89032652e85f6
        failing since 130 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-05-22T02:03:44.405844  / # #

    2023-05-22T02:03:44.507955  export SHELL=3D/bin/sh

    2023-05-22T02:03:44.508665  #

    2023-05-22T02:03:44.610074  / # export SHELL=3D/bin/sh. /lava-10406116/=
environment

    2023-05-22T02:03:44.610780  =


    2023-05-22T02:03:44.712215  / # . /lava-10406116/environment/lava-10406=
116/bin/lava-test-runner /lava-10406116/1

    2023-05-22T02:03:44.713314  =


    2023-05-22T02:03:44.714798  / # /lava-10406116/bin/lava-test-runner /la=
va-10406116/1

    2023-05-22T02:03:44.840050  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-22T02:03:44.840566  + cd /lava-10406116/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad0f1343f582f122e8615

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad0f1343f582f122e8=
616
        failing since 84 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646ace0e3c5fc9ffcb2e8674

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646ace0e3c5fc9ffcb2e8679
        failing since 54 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:05:51.376049  + set +x

    2023-05-22T02:05:51.382602  <8>[   10.456048] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406175_1.4.2.3.1>

    2023-05-22T02:05:51.491752  / # #

    2023-05-22T02:05:51.592411  export SHELL=3D/bin/sh

    2023-05-22T02:05:51.593286  #

    2023-05-22T02:05:51.695018  / # export SHELL=3D/bin/sh. /lava-10406175/=
environment

    2023-05-22T02:05:51.695814  =


    2023-05-22T02:05:51.797541  / # . /lava-10406175/environment/lava-10406=
175/bin/lava-test-runner /lava-10406175/1

    2023-05-22T02:05:51.798833  =


    2023-05-22T02:05:51.803920  / # /lava-10406175/bin/lava-test-runner /la=
va-10406175/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646acf133f16ffdf3c2e85fa

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acf133f16ffdf3c2e85ff
        failing since 54 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:10:10.915764  + set +x

    2023-05-22T02:10:10.922682  <8>[   10.928123] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406325_1.4.2.3.1>

    2023-05-22T02:10:11.026638  / # #

    2023-05-22T02:10:11.127359  export SHELL=3D/bin/sh

    2023-05-22T02:10:11.127590  #

    2023-05-22T02:10:11.228115  / # export SHELL=3D/bin/sh. /lava-10406325/=
environment

    2023-05-22T02:10:11.228396  =


    2023-05-22T02:10:11.328976  / # . /lava-10406325/environment/lava-10406=
325/bin/lava-test-runner /lava-10406325/1

    2023-05-22T02:10:11.329308  =


    2023-05-22T02:10:11.334000  / # /lava-10406325/bin/lava-test-runner /la=
va-10406325/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646acdbe4e26b68f0e2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acdbe4e26b68f0e2e85eb
        failing since 54 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:04:25.559298  <8>[   10.664200] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406162_1.4.2.3.1>

    2023-05-22T02:04:25.562598  + set +x

    2023-05-22T02:04:25.664300  =


    2023-05-22T02:04:25.764946  / # #export SHELL=3D/bin/sh

    2023-05-22T02:04:25.765155  =


    2023-05-22T02:04:25.865685  / # export SHELL=3D/bin/sh. /lava-10406162/=
environment

    2023-05-22T02:04:25.865880  =


    2023-05-22T02:04:25.966401  / # . /lava-10406162/environment/lava-10406=
162/bin/lava-test-runner /lava-10406162/1

    2023-05-22T02:04:25.966680  =


    2023-05-22T02:04:25.971387  / # /lava-10406162/bin/lava-test-runner /la=
va-10406162/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646acf00a89c6f4b652e862c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acf00a89c6f4b652e8631
        failing since 54 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:10:00.711087  <8>[   10.109347] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406280_1.4.2.3.1>

    2023-05-22T02:10:00.714342  + set +x

    2023-05-22T02:10:00.815660  #

    2023-05-22T02:10:00.815957  =


    2023-05-22T02:10:00.916493  / # #export SHELL=3D/bin/sh

    2023-05-22T02:10:00.916689  =


    2023-05-22T02:10:01.017178  / # export SHELL=3D/bin/sh. /lava-10406280/=
environment

    2023-05-22T02:10:01.017424  =


    2023-05-22T02:10:01.118025  / # . /lava-10406280/environment/lava-10406=
280/bin/lava-test-runner /lava-10406280/1

    2023-05-22T02:10:01.118361  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646acdc789c1b83ea32e8621

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acdc789c1b83ea32e8626
        failing since 54 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:04:35.301877  + set<8>[   10.939653] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10406151_1.4.2.3.1>

    2023-05-22T02:04:35.301962   +x

    2023-05-22T02:04:35.406011  / # #

    2023-05-22T02:04:35.506754  export SHELL=3D/bin/sh

    2023-05-22T02:04:35.506961  #

    2023-05-22T02:04:35.607448  / # export SHELL=3D/bin/sh. /lava-10406151/=
environment

    2023-05-22T02:04:35.607606  =


    2023-05-22T02:04:35.708065  / # . /lava-10406151/environment/lava-10406=
151/bin/lava-test-runner /lava-10406151/1

    2023-05-22T02:04:35.708318  =


    2023-05-22T02:04:35.713072  / # /lava-10406151/bin/lava-test-runner /la=
va-10406151/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646acf14580bda856c2e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acf14580bda856c2e85f9
        failing since 54 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:10:18.702344  + set<8>[   11.573623] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10406285_1.4.2.3.1>

    2023-05-22T02:10:18.702443   +x

    2023-05-22T02:10:18.806615  / # #

    2023-05-22T02:10:18.907310  export SHELL=3D/bin/sh

    2023-05-22T02:10:18.907523  #

    2023-05-22T02:10:19.008092  / # export SHELL=3D/bin/sh. /lava-10406285/=
environment

    2023-05-22T02:10:19.008315  =


    2023-05-22T02:10:19.108901  / # . /lava-10406285/environment/lava-10406=
285/bin/lava-test-runner /lava-10406285/1

    2023-05-22T02:10:19.109216  =


    2023-05-22T02:10:19.113823  / # /lava-10406285/bin/lava-test-runner /la=
va-10406285/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646acdc64e26b68f0e2e861e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646acdc64e26b68f0e2e8623
        failing since 54 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:04:38.953222  <8>[   11.529946] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406142_1.4.2.3.1>

    2023-05-22T02:04:39.057203  / # #

    2023-05-22T02:04:39.157796  export SHELL=3D/bin/sh

    2023-05-22T02:04:39.158005  #

    2023-05-22T02:04:39.258537  / # export SHELL=3D/bin/sh. /lava-10406142/=
environment

    2023-05-22T02:04:39.258744  =


    2023-05-22T02:04:39.359312  / # . /lava-10406142/environment/lava-10406=
142/bin/lava-test-runner /lava-10406142/1

    2023-05-22T02:04:39.359621  =


    2023-05-22T02:04:39.364480  / # /lava-10406142/bin/lava-test-runner /la=
va-10406142/1

    2023-05-22T02:04:39.371153  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646aceffa89c6f4b652e8621

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646aceffa89c6f4b652e8626
        failing since 54 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-22T02:09:59.322175  + set +x<8>[   11.645173] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10406321_1.4.2.3.1>

    2023-05-22T02:09:59.322300  =


    2023-05-22T02:09:59.426916  / # #

    2023-05-22T02:09:59.527696  export SHELL=3D/bin/sh

    2023-05-22T02:09:59.527931  #

    2023-05-22T02:09:59.628491  / # export SHELL=3D/bin/sh. /lava-10406321/=
environment

    2023-05-22T02:09:59.628741  =


    2023-05-22T02:09:59.729325  / # . /lava-10406321/environment/lava-10406=
321/bin/lava-test-runner /lava-10406321/1

    2023-05-22T02:09:59.729714  =


    2023-05-22T02:09:59.734298  / # /lava-10406321/bin/lava-test-runner /la=
va-10406321/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad1d7439a0178072e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad1d7439a0178072e8=
604
        failing since 117 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad1d07e08777d652e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad1d07e08777d652e8=
605
        failing since 103 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad4157b66407b7c2e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad4157b66407b7c2e8=
607
        failing since 25 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad1e5439a0178072e8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad1e5439a0178072e8=
641
        failing since 103 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad40538e10a39952e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad40538e10a39952e8=
60e
        failing since 25 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad7172283a84f852e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad7172283a84f852e8=
5e7
        failing since 103 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad3268b423c79032e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad3268b423c79032e8=
5fd
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad30f4a821850ae2e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad30f4a821850ae2e8=
60b
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad359b4e01c43b62e8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad359b4e01c43b62e8=
634
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad30e41a1c5862e2e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad30e41a1c5862e2e8=
60b
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad3278b423c79032e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad3278b423c79032e8=
602
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad3226261f427522e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad3226261f427522e8=
617
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/646acedfc4ddbb243a2e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646acedfc4ddbb243a2e8=
607
        failing since 3 days (last pass: v6.4-rc2-426-gdec469ae11955, first=
 fail: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad209ea519e74fc2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad209ea519e74fc2e8=
5e7
        failing since 157 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad213d77183b7dd2e8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad213d77183b7dd2e8=
652
        failing since 103 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/646ad374cd8ef99a1f2e85ea

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646ad374cd8ef99=
a1f2e8641
        failing since 25 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-22T02:28:32.000548  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   19.781143] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-05-22T02:28:32.004468  at virtual address 0000000000000008

    2023-05-22T02:28:32.007571  kern  :alert : Mem abort info:

    2023-05-22T02:28:32.011049  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-22T02:28:32.017259  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T02:28:32.021333  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T02:28:32.024251  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T02:28:32.030066  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646ad374cd8ef99=
a1f2e8642
        failing since 25 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/646acce6cbf940fe132e85f0

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646acce6cbf940f=
e132e85f7
        failing since 24 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-22T02:00:53.252838  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-22T02:00:53.254345  kern  :emerg : Code: 97fdb910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-22T02:00:53.265995  <8>[   21.631124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-22T02:00:53.266328  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646acce6cbf940f=
e132e85f8
        failing since 24 days (last pass: v6.3-rc6-249-g122e82851461, first=
 fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-22T02:00:53.224254  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-22T02:00:53.224920  kern  :alert : Mem abort info:
    2023-05-22T02:00:53.225176  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-22T02:00:53.225628  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-22T02:00:53.226278  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-22T02:00:53.226562  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-22T02:00:53.227058  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-22T02:00:53.227615  kern  :alert : Data abort info:
    2023-05-22T02:00:53.227860  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-22T02:00:53.229026  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/646ad147f0220884202e860c

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646ad147f022088=
4202e8613
        failing since 13 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-22T02:19:34.755631  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-22T02:19:34.756976  kern  :emerg : Code: 97fdf910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-22T02:19:34.768341  <8>[   19.339209] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-22T02:19:34.768607  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646ad147f022088=
4202e8614
        failing since 13 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-22T02:19:34.726054  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-22T02:19:34.727757  kern  :alert : Mem abort info:
    2023-05-22T02:19:34.728008  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-22T02:19:34.729450  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-22T02:19:34.731501  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-22T02:19:34.736210  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-22T02:19:34.737896  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-22T02:19:34.738148  kern  :alert : Data abort info:
    2023-05-22T02:19:34.739634  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-22T02:19:34.739882  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad29b3f9be9053f2e862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad29b3f9be9053f2e8=
630
        failing since 24 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/646accd07d71a1bb012e860a

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646accd07d71a1b=
b012e8611
        failing since 25 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-22T02:00:27.916495  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-22T02:00:27.917021  kern  :emerg : Code: 97fea510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T02:00:27.917389  <8>[   23.107351] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T02:00:27.917720  + set +x

    2023-05-22T02:00:27.918033  <8>[   23.109235] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406087_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646accd07d71a1b=
b012e8612
        failing since 25 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-22T02:00:27.890195  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-22T02:00:27.890715  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-22T02:00:27.891061  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079194000

    2023-05-22T02:00:27.891383  kern  :alert : [0000000000000008] pgd=3D080=
00000791e2003, p4d=3D08000000791e2003, pud=3D080000007914e003, pmd=3D000000=
0000000000

    2023-05-22T02:00:27.891692  <8>[   23.083342] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad1d17e08777d652e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad1d17e08777d652e8=
608
        failing since 103 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/646acd9c5e842311292e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i=
-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i=
-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646acd9c5e842311292e8=
5fa
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/646acba9983e5dc64d2e8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-b=
ananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc3-20=
5-ge885abc8cc39d/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-b=
ananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646acba9983e5dc64d2e8=
637
        new failure (last pass: v6.4-rc2-486-gf467b1d198e27) =

 =20
