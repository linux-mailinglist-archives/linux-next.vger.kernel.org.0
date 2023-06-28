Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6722A7409F6
	for <lists+linux-next@lfdr.de>; Wed, 28 Jun 2023 09:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjF1Hz4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Jun 2023 03:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjF1HyD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Jun 2023 03:54:03 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6527130D7
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2023 00:53:13 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6b75637076eso2020650a34.2
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2023 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687938792; x=1690530792;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=psUn/ak0jrx8hXiVIb7mJKJ3sQUmnMbLFNq8XOl8/2c=;
        b=0mvRxoLl6JROIQmqAuDRCWqJCknDb/XidyxMCpMXAkJGRTH8srFcGJYNdNSLyVDmEv
         wUznsP3PjB9cciFacB867OO9tj/i/cnnCWDwUAAM30k1OSKB5VJcQG60IhBBouc9wT72
         pJLGhLFhqMyVlXjSTdVsBHVZhVAg2lbYehuvq5s+kiJO1fQwk9hokIi3UaEIH81zJx4T
         gc/XwcJjyFq5FKWaa/GkAchoKsOhrMG8Gg6qQU9R42UqM0idcZgI7j8ZN7PhNu1Fkcs3
         kZFDW6pacK3R0bxo89o2MPuZAWwDduI0ttVFn2PAt8Yp9o3gvFdwmJlvFbDSlqoJR05G
         jCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687938792; x=1690530792;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psUn/ak0jrx8hXiVIb7mJKJ3sQUmnMbLFNq8XOl8/2c=;
        b=BauMtqJ+23Jv5RuKUETG6c8GMByTNFf+W0fQ/6MpFj9swY6qdXAURAPv9kn3D9fUK1
         yO3Rt8HExzkZba5G3tHma9Bz4/EaOQv9bIomR4Ke73cqJ4AbWbHfxat3C5LAQWsac5UO
         7by1AnmRKgaQi+i4O9IS0GCsBavU8E6CtFVqq/XwJ5RhYltI92Vi90kAKO0YdRtEgQPx
         +SqiGcnburGaeMCsmDnY/VSxuDyGg+B4QA/WBP9I45I6jd90oQNaCqb3xUopJeH0WGNr
         g992VCWMWZ9r7TEXCo97HqhXORs+YbKppz454YjhG1jKW05nAMuamTfWhO1LuEc6izrf
         aJ1A==
X-Gm-Message-State: AC+VfDwrrNJgwHec23BZn0I3pu4BpHVisBZP+G0+F2cqe4TZlxEVIJ0l
        dEa8GI/7ekHbrV73FfmUKE6opTjyfQ/h+TEWpiZ1jQ==
X-Google-Smtp-Source: ACHHUZ4ic9qZ31/oyVuC43irotptTj0KRUWl6VpJVEoLXPdmTyWfV8WvV051930azpSqRqW/7Sze2Q==
X-Received: by 2002:a17:902:bd4b:b0:1b0:74f5:bf10 with SMTP id b11-20020a170902bd4b00b001b074f5bf10mr7248482plx.65.1687935024624;
        Tue, 27 Jun 2023 23:50:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w11-20020a170902a70b00b001b80971609esm4252343plq.152.2023.06.27.23.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 23:50:24 -0700 (PDT)
Message-ID: <649bd830.170a0220.dcfe9.90e3@mx.google.com>
Date:   Tue, 27 Jun 2023 23:50:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-4072-ge8f5f1933319
Subject: next/pending-fixes baseline: 397 runs,
 50 regressions (v6.4-4072-ge8f5f1933319)
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

next/pending-fixes baseline: 397 runs, 50 regressions (v6.4-4072-ge8f5f1933=
319)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
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

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-4072-ge8f5f1933319/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-4072-ge8f5f1933319
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e8f5f19333191a84312f70b0bae33bdf0f934218 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649b96b9a2ad52641d30618f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b96b9a2ad52641d306198
        failing since 91 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:10:45.371426  <8>[   10.550955] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10928295_1.4.2.3.1>

    2023-06-28T02:10:45.374697  + set +x

    2023-06-28T02:10:45.479479  / # #

    2023-06-28T02:10:45.580065  export SHELL=3D/bin/sh

    2023-06-28T02:10:45.580279  #

    2023-06-28T02:10:45.680781  / # export SHELL=3D/bin/sh. /lava-10928295/=
environment

    2023-06-28T02:10:45.680967  =


    2023-06-28T02:10:45.781488  / # . /lava-10928295/environment/lava-10928=
295/bin/lava-test-runner /lava-10928295/1

    2023-06-28T02:10:45.781773  =


    2023-06-28T02:10:45.787480  / # /lava-10928295/bin/lava-test-runner /la=
va-10928295/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a6b1b9b439a0d30614d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9a6b1b9b439a0d306156
        failing since 91 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:26:50.133290  + set +x

    2023-06-28T02:26:50.136726  <8>[    9.432798] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10928800_1.4.2.3.1>

    2023-06-28T02:26:50.244950  / # #

    2023-06-28T02:26:50.347265  export SHELL=3D/bin/sh

    2023-06-28T02:26:50.347600  #

    2023-06-28T02:26:50.448393  / # export SHELL=3D/bin/sh. /lava-10928800/=
environment

    2023-06-28T02:26:50.449162  =


    2023-06-28T02:26:50.550473  / # . /lava-10928800/environment/lava-10928=
800/bin/lava-test-runner /lava-10928800/1

    2023-06-28T02:26:50.551988  =


    2023-06-28T02:26:50.557290  / # /lava-10928800/bin/lava-test-runner /la=
va-10928800/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649b96ab2175d04b6a306173

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b96ab2175d04b6a30617c
        failing since 91 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:10:32.378228  + <8>[   11.116871] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10928309_1.4.2.3.1>

    2023-06-28T02:10:32.378313  set +x

    2023-06-28T02:10:32.482191  / # #

    2023-06-28T02:10:32.582804  export SHELL=3D/bin/sh

    2023-06-28T02:10:32.583012  #

    2023-06-28T02:10:32.683541  / # export SHELL=3D/bin/sh. /lava-10928309/=
environment

    2023-06-28T02:10:32.683738  =


    2023-06-28T02:10:32.784300  / # . /lava-10928309/environment/lava-10928=
309/bin/lava-test-runner /lava-10928309/1

    2023-06-28T02:10:32.784624  =


    2023-06-28T02:10:32.789047  / # /lava-10928309/bin/lava-test-runner /la=
va-10928309/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a6c94fcbf86d130614f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9a6c94fcbf86d1306158
        failing since 91 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:26:49.033160  + set<8>[   12.515030] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10928803_1.4.2.3.1>

    2023-06-28T02:26:49.033701   +x

    2023-06-28T02:26:49.144023  / # #

    2023-06-28T02:26:49.246632  export SHELL=3D/bin/sh

    2023-06-28T02:26:49.247300  #

    2023-06-28T02:26:49.348546  / # export SHELL=3D/bin/sh. /lava-10928803/=
environment

    2023-06-28T02:26:49.349227  =


    2023-06-28T02:26:49.450613  / # . /lava-10928803/environment/lava-10928=
803/bin/lava-test-runner /lava-10928803/1

    2023-06-28T02:26:49.450961  =


    2023-06-28T02:26:49.455829  / # /lava-10928803/bin/lava-test-runner /la=
va-10928803/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649b96b9523374d8de306172

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b96b9523374d8de30617b
        failing since 91 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:10:54.604378  <8>[   11.263137] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10928324_1.4.2.3.1>

    2023-06-28T02:10:54.608425  + set +x

    2023-06-28T02:10:54.715442  =


    2023-06-28T02:10:54.817763  / # #export SHELL=3D/bin/sh

    2023-06-28T02:10:54.818659  =


    2023-06-28T02:10:54.920199  / # export SHELL=3D/bin/sh. /lava-10928324/=
environment

    2023-06-28T02:10:54.920934  =


    2023-06-28T02:10:55.022518  / # . /lava-10928324/environment/lava-10928=
324/bin/lava-test-runner /lava-10928324/1

    2023-06-28T02:10:55.023802  =


    2023-06-28T02:10:55.029110  / # /lava-10928324/bin/lava-test-runner /la=
va-10928324/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a6e199c647591306156

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9a6e199c64759130615f
        failing since 91 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:26:45.887330  <8>[    8.429175] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10928831_1.4.2.3.1>

    2023-06-28T02:26:45.890738  + set +x

    2023-06-28T02:26:45.993945  #

    2023-06-28T02:26:46.096742  / # #export SHELL=3D/bin/sh

    2023-06-28T02:26:46.097408  =


    2023-06-28T02:26:46.198608  / # export SHELL=3D/bin/sh. /lava-10928831/=
environment

    2023-06-28T02:26:46.199357  =


    2023-06-28T02:26:46.300907  / # . /lava-10928831/environment/lava-10928=
831/bin/lava-test-runner /lava-10928831/1

    2023-06-28T02:26:46.302027  =


    2023-06-28T02:26:46.307123  / # /lava-10928831/bin/lava-test-runner /la=
va-10928831/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/649b976f7968e80d40306373

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b976f7968e80d4030637c
        failing since 167 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-28T02:14:43.344998  / # #

    2023-06-28T02:14:43.447050  export SHELL=3D/bin/sh

    2023-06-28T02:14:43.447744  #

    2023-06-28T02:14:43.549039  / # export SHELL=3D/bin/sh. /lava-10928251/=
environment

    2023-06-28T02:14:43.549777  =


    2023-06-28T02:14:43.651194  / # . /lava-10928251/environment/lava-10928=
251/bin/lava-test-runner /lava-10928251/1

    2023-06-28T02:14:43.652262  =


    2023-06-28T02:14:43.669429  / # /lava-10928251/bin/lava-test-runner /la=
va-10928251/1

    2023-06-28T02:14:43.777281  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-28T02:14:43.777824  + cd /lava-10928251/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a160f1dca1ff9306173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9a160f1dca1ff9306=
174
        failing since 121 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649b96aaa2ad52641d306145

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b96aaa2ad52641d30614e
        failing since 91 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:10:30.922470  + set +x

    2023-06-28T02:10:30.929359  <8>[   10.521620] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10928344_1.4.2.3.1>

    2023-06-28T02:10:31.033456  / # #

    2023-06-28T02:10:31.134146  export SHELL=3D/bin/sh

    2023-06-28T02:10:31.134351  #

    2023-06-28T02:10:31.234878  / # export SHELL=3D/bin/sh. /lava-10928344/=
environment

    2023-06-28T02:10:31.235069  =


    2023-06-28T02:10:31.335584  / # . /lava-10928344/environment/lava-10928=
344/bin/lava-test-runner /lava-10928344/1

    2023-06-28T02:10:31.335847  =


    2023-06-28T02:10:31.340257  / # /lava-10928344/bin/lava-test-runner /la=
va-10928344/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a6994fcbf86d1306142

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9a6994fcbf86d130614b
        failing since 91 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:26:24.196808  + set +x

    2023-06-28T02:26:24.203326  <8>[   10.090529] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10928821_1.4.2.3.1>

    2023-06-28T02:26:24.308314  / # #

    2023-06-28T02:26:24.409015  export SHELL=3D/bin/sh

    2023-06-28T02:26:24.409203  #

    2023-06-28T02:26:24.509676  / # export SHELL=3D/bin/sh. /lava-10928821/=
environment

    2023-06-28T02:26:24.509856  =


    2023-06-28T02:26:24.610419  / # . /lava-10928821/environment/lava-10928=
821/bin/lava-test-runner /lava-10928821/1

    2023-06-28T02:26:24.610776  =


    2023-06-28T02:26:24.615500  / # /lava-10928821/bin/lava-test-runner /la=
va-10928821/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649b96a7523374d8de306132

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b96a7523374d8de30613b
        failing since 91 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:10:23.464724  + set +x

    2023-06-28T02:10:23.471157  <8>[    7.705690] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10928306_1.4.2.3.1>

    2023-06-28T02:10:23.577967  #

    2023-06-28T02:10:23.578268  =


    2023-06-28T02:10:23.678853  / # #export SHELL=3D/bin/sh

    2023-06-28T02:10:23.679031  =


    2023-06-28T02:10:23.779502  / # export SHELL=3D/bin/sh. /lava-10928306/=
environment

    2023-06-28T02:10:23.779724  =


    2023-06-28T02:10:23.880290  / # . /lava-10928306/environment/lava-10928=
306/bin/lava-test-runner /lava-10928306/1

    2023-06-28T02:10:23.880631  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a56cab8fd3c66306179

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9a56cab8fd3c66306182
        failing since 91 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:26:32.342218  + set +x<8>[    9.813547] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10928808_1.4.2.3.1>

    2023-06-28T02:26:32.342329  =


    2023-06-28T02:26:32.443973  #

    2023-06-28T02:26:32.544786  / # #export SHELL=3D/bin/sh

    2023-06-28T02:26:32.544981  =


    2023-06-28T02:26:32.645505  / # export SHELL=3D/bin/sh. /lava-10928808/=
environment

    2023-06-28T02:26:32.645690  =


    2023-06-28T02:26:32.746206  / # . /lava-10928808/environment/lava-10928=
808/bin/lava-test-runner /lava-10928808/1

    2023-06-28T02:26:32.746491  =


    2023-06-28T02:26:32.751648  / # /lava-10928808/bin/lava-test-runner /la=
va-10928808/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649b96bf71de0ce2f830613f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b96bf71de0ce2f8306148
        failing since 91 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:10:47.771993  + <8>[   11.151300] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10928337_1.4.2.3.1>

    2023-06-28T02:10:47.772480  set +x

    2023-06-28T02:10:47.880735  / # #

    2023-06-28T02:10:47.983041  export SHELL=3D/bin/sh

    2023-06-28T02:10:47.983777  #

    2023-06-28T02:10:48.085106  / # export SHELL=3D/bin/sh. /lava-10928337/=
environment

    2023-06-28T02:10:48.085757  =


    2023-06-28T02:10:48.187086  / # . /lava-10928337/environment/lava-10928=
337/bin/lava-test-runner /lava-10928337/1

    2023-06-28T02:10:48.188593  =


    2023-06-28T02:10:48.193314  / # /lava-10928337/bin/lava-test-runner /la=
va-10928337/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a679b6dabdda6306141

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9a679b6dabdda630614a
        failing since 91 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:26:38.315826  + set<8>[   11.436872] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10928832_1.4.2.3.1>

    2023-06-28T02:26:38.315938   +x

    2023-06-28T02:26:38.420313  / # #

    2023-06-28T02:26:38.520992  export SHELL=3D/bin/sh

    2023-06-28T02:26:38.521203  #

    2023-06-28T02:26:38.621697  / # export SHELL=3D/bin/sh. /lava-10928832/=
environment

    2023-06-28T02:26:38.621915  =


    2023-06-28T02:26:38.722463  / # . /lava-10928832/environment/lava-10928=
832/bin/lava-test-runner /lava-10928832/1

    2023-06-28T02:26:38.722766  =


    2023-06-28T02:26:38.727891  / # /lava-10928832/bin/lava-test-runner /la=
va-10928832/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649b995ec68983ac34306136

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b995ec68983ac3430613f
        failing since 149 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-28T02:21:57.732647  + set +x
    2023-06-28T02:21:57.732833  [   12.886749] <LAVA_SIGNAL_ENDRUN 0_dmesg =
989223_1.5.2.3.1>
    2023-06-28T02:21:57.840703  / # #
    2023-06-28T02:21:57.942655  export SHELL=3D/bin/sh
    2023-06-28T02:21:57.943193  #
    2023-06-28T02:21:58.044467  / # export SHELL=3D/bin/sh. /lava-989223/en=
vironment
    2023-06-28T02:21:58.044951  =

    2023-06-28T02:21:58.146216  / # . /lava-989223/environment/lava-989223/=
bin/lava-test-runner /lava-989223/1
    2023-06-28T02:21:58.146884  =

    2023-06-28T02:21:58.150336  / # /lava-989223/bin/lava-test-runner /lava=
-989223/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a130f1dca1ff9306132

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9a130f1dca1ff930613b
        failing since 149 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-28T02:24:58.291436  + set +x
    2023-06-28T02:24:58.291600  [   12.191583] <LAVA_SIGNAL_ENDRUN 0_dmesg =
989228_1.5.2.3.1>
    2023-06-28T02:24:58.398864  / # #
    2023-06-28T02:24:58.500452  export SHELL=3D/bin/sh
    2023-06-28T02:24:58.501004  #
    2023-06-28T02:24:58.602244  / # export SHELL=3D/bin/sh. /lava-989228/en=
vironment
    2023-06-28T02:24:58.602725  =

    2023-06-28T02:24:58.704101  / # . /lava-989228/environment/lava-989228/=
bin/lava-test-runner /lava-989228/1
    2023-06-28T02:24:58.704679  =

    2023-06-28T02:24:58.707798  / # /lava-989228/bin/lava-test-runner /lava=
-989228/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9b661f20ad7cce306148

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9b661f20ad7cce306151
        failing since 149 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-28T02:30:38.489970  + set +x
    2023-06-28T02:30:38.490151  [   13.040959] <LAVA_SIGNAL_ENDRUN 0_dmesg =
989246_1.5.2.3.1>
    2023-06-28T02:30:38.598575  / # #
    2023-06-28T02:30:38.700321  export SHELL=3D/bin/sh
    2023-06-28T02:30:38.700801  #
    2023-06-28T02:30:38.802118  / # export SHELL=3D/bin/sh. /lava-989246/en=
vironment
    2023-06-28T02:30:38.802608  =

    2023-06-28T02:30:38.904002  / # . /lava-989246/environment/lava-989246/=
bin/lava-test-runner /lava-989246/1
    2023-06-28T02:30:38.904757  =

    2023-06-28T02:30:38.908203  / # /lava-989246/bin/lava-test-runner /lava=
-989246/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9d1e159f435e4f306139

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9d1e159f435e4f306142
        failing since 149 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-28T02:37:59.834123  + set +x
    2023-06-28T02:37:59.834283  [   14.358080] <LAVA_SIGNAL_ENDRUN 0_dmesg =
989258_1.5.2.3.1>
    2023-06-28T02:37:59.942241  / # #
    2023-06-28T02:38:00.043837  export SHELL=3D/bin/sh
    2023-06-28T02:38:00.044235  #
    2023-06-28T02:38:00.145383  / # export SHELL=3D/bin/sh. /lava-989258/en=
vironment
    2023-06-28T02:38:00.145708  =

    2023-06-28T02:38:00.246824  / # . /lava-989258/environment/lava-989258/=
bin/lava-test-runner /lava-989258/1
    2023-06-28T02:38:00.247469  =

    2023-06-28T02:38:00.250848  / # /lava-989258/bin/lava-test-runner /lava=
-989258/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9e229da273b208306152

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9e229da273b20830615b
        failing since 149 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-28T02:42:18.444003  + set +x
    2023-06-28T02:42:18.444161  [   13.122899] <LAVA_SIGNAL_ENDRUN 0_dmesg =
989273_1.5.2.3.1>
    2023-06-28T02:42:18.551301  / # #
    2023-06-28T02:42:18.652636  export SHELL=3D/bin/sh
    2023-06-28T02:42:18.653141  #
    2023-06-28T02:42:18.754458  / # export SHELL=3D/bin/sh. /lava-989273/en=
vironment
    2023-06-28T02:42:18.754985  =

    2023-06-28T02:42:18.856261  / # . /lava-989273/environment/lava-989273/=
bin/lava-test-runner /lava-989273/1
    2023-06-28T02:42:18.856932  =

    2023-06-28T02:42:18.860243  / # /lava-989273/bin/lava-test-runner /lava=
-989273/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649b995fff7d08029f306132

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b995fff7d08029f30613b
        new failure (last pass: v6.4-1651-gf52dd2890422)

    2023-06-28T02:21:58.337668  + set[   15.095511] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 989226_1.5.2.3.1>
    2023-06-28T02:21:58.337830   +x
    2023-06-28T02:21:58.443362  / # #
    2023-06-28T02:21:58.544972  export SHELL=3D/bin/sh
    2023-06-28T02:21:58.545322  #
    2023-06-28T02:21:58.646495  / # export SHELL=3D/bin/sh. /lava-989226/en=
vironment
    2023-06-28T02:21:58.646865  =

    2023-06-28T02:21:58.748067  / # . /lava-989226/environment/lava-989226/=
bin/lava-test-runner /lava-989226/1
    2023-06-28T02:21:58.748684  =

    2023-06-28T02:21:58.752021  / # /lava-989226/bin/lava-test-runner /lava=
-989226/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba066d5782e489f306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ba066d5782e489f306=
135
        failing since 233 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649b96bc71de0ce2f830612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b96bc71de0ce2f8306138
        failing since 91 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:10:47.686053  <8>[    8.926863] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10928331_1.4.2.3.1>

    2023-06-28T02:10:47.794400  / # #

    2023-06-28T02:10:47.897020  export SHELL=3D/bin/sh

    2023-06-28T02:10:47.897721  #

    2023-06-28T02:10:47.999112  / # export SHELL=3D/bin/sh. /lava-10928331/=
environment

    2023-06-28T02:10:47.999914  =


    2023-06-28T02:10:48.101521  / # . /lava-10928331/environment/lava-10928=
331/bin/lava-test-runner /lava-10928331/1

    2023-06-28T02:10:48.102721  =


    2023-06-28T02:10:48.107030  / # /lava-10928331/bin/lava-test-runner /la=
va-10928331/1

    2023-06-28T02:10:48.114075  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a67199c64759130613a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649b9a67199c647591306143
        failing since 91 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-28T02:26:35.750526  <8>[   11.096988] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10928752_1.4.2.3.1>

    2023-06-28T02:26:35.854952  / # #

    2023-06-28T02:26:35.955673  export SHELL=3D/bin/sh

    2023-06-28T02:26:35.955866  #

    2023-06-28T02:26:36.056330  / # export SHELL=3D/bin/sh. /lava-10928752/=
environment

    2023-06-28T02:26:36.056577  =


    2023-06-28T02:26:36.157104  / # . /lava-10928752/environment/lava-10928=
752/bin/lava-test-runner /lava-10928752/1

    2023-06-28T02:26:36.157450  =


    2023-06-28T02:26:36.162163  / # /lava-10928752/bin/lava-test-runner /la=
va-10928752/1

    2023-06-28T02:26:36.168473  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9d8749f8c658f9306167

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9d8749f8c658f9306=
168
        failing since 154 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9acd6c6640787430616b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9acd6c66407874306=
16c
        failing since 50 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9d7749f8c658f930613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9d7749f8c658f9306=
13d
        failing since 140 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9af360cc3318f23061a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9af360cc3318f2306=
1a6
        failing since 50 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9db0d789727556306132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9db0d789727556306=
133
        failing since 140 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9fcb52e58f0f393061ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9fcb52e58f0f39306=
1eb
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba02f2dc1174e06306172

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ba02f2dc1174e06306=
173
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba02251673f0a9930614e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ba02251673f0a99306=
14f
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9fcacae6bafb7c306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9fcacae6bafb7c306=
135
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba02d51673f0a99306154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ba02d51673f0a99306=
155
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9ff6cae6bafb7c30614f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9ff6cae6bafb7c306=
150
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9fcc52e58f0f393061ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9fcc52e58f0f39306=
1ee
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba041df55f9649c306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ba041df55f9649c306=
13a
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba0388384814e8230612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ba0388384814e82306=
12f
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9fce52e58f0f393061f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9fce52e58f0f39306=
1f1
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba06a406b16d7d5306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ba06a406b16d7d5306=
141
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba01e2dc1174e0630612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ba01e2dc1174e06306=
130
        failing since 259 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9b1da25f9bf0c830614a

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-m=
alta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-m=
alta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/649b9b1da25f9bf=
0c830614e
        new failure (last pass: v6.4-1651-gf52dd2890422)
        1 lines

    2023-06-28T02:29:45.499460  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 60be7474, epc =3D=3D 801fedd8, ra =3D=
=3D 802017d4
    2023-06-28T02:29:45.499629  =


    2023-06-28T02:29:45.516458  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-06-28T02:29:45.516685  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9ae660cc3318f2306150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9ae660cc3318f2306=
151
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9a520afcb38aca306158

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9a520afcb38aca306=
159
        failing since 194 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649b98aefa072b6e033061b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b98aefa072b6e03306=
1b5
        failing since 194 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba74fa57d7bdadd306135

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ba74fa57d7bdadd30613e
        failing since 147 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-28T03:21:36.431591  [   29.372373] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3695509_1.5.2.4.1>
    2023-06-28T03:21:36.536348  =

    2023-06-28T03:21:36.638106  / # #export SHELL=3D/bin/sh
    2023-06-28T03:21:36.638696  =

    2023-06-28T03:21:36.740256  / # export SHELL=3D/bin/sh. /lava-3695509/e=
nvironment
    2023-06-28T03:21:36.740792  =

    2023-06-28T03:21:36.842356  / # . /lava-3695509/environment/lava-369550=
9/bin/lava-test-runner /lava-3695509/1
    2023-06-28T03:21:36.843084  =

    2023-06-28T03:21:36.846549  / # /lava-3695509/bin/lava-test-runner /lav=
a-3695509/1
    2023-06-28T03:21:36.882459  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9d7849f8c658f930613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9d7849f8c658f9306=
140
        failing since 140 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9d723d1b16e36730617e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9d723d1b16e367306=
17f
        failing since 140 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649b9d8649f8c658f9306164

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabor=
a/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649b9d8649f8c658f9306=
165
        failing since 140 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/649babcfef828e5eb6306182

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64=
-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64=
-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649babcfef828e5eb6306=
183
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/649ba88661a80543dd30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretec=
h-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4072-g=
e8f5f1933319/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretec=
h-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ba88661a80543dd306=
12f
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =20
