Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A647B99F3
	for <lists+linux-next@lfdr.de>; Thu,  5 Oct 2023 04:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbjJEC3x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Oct 2023 22:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjJEC3w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Oct 2023 22:29:52 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22515D9
        for <linux-next@vger.kernel.org>; Wed,  4 Oct 2023 19:29:47 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2799b7280d1so351393a91.1
        for <linux-next@vger.kernel.org>; Wed, 04 Oct 2023 19:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696472986; x=1697077786; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F5T1A0W6fWcoPyXqAJFjPutSO559yYPMqofZt+x0LZI=;
        b=2CoytN5SvwWXc2eXGe0lvqXuRtkqzMJUW+2TLZoQ7z60Xyv7p1hrutUA2HXCPc5KwU
         52NLhNljjko/TSRK1dVJr2MeLhMTHXEKH1qiCi/oU19p0vd5JfF68kOFYmw/OwhqX8hY
         dEnf6d+HYswF6StvSSiubtk7LIy71el65BN4T9wshOPa9y4y/bk+p6DbFqX5YYNarrwZ
         bpmn2+vwXnffM5UuVKzR0NUpSyPxL4ZS1VOg2oO847X/7CQNk6lxpprI6frCRX/LYcgh
         5XtE20RHgsK0e7kAIgRa6AlyQuVunyFBaJtEuNPz3tbdggrhZFqPCZ2B649zLAqf5yqM
         wYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696472986; x=1697077786;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5T1A0W6fWcoPyXqAJFjPutSO559yYPMqofZt+x0LZI=;
        b=OH+gopp4pCf4Vb8B+8YIi4rMEnnjOmFQIj/fc05Bc0u8WuMVhdcL7auC01BmvvUOl1
         rspfZh/534Nu4+6btLF7equuNthUgx4U+/F46ecpMfvvCqsDUFBRwwA7WzRXu5OVCEzy
         1Pahll2ew+slX6C6bWIvkWuckcj9QXfm4cNDUuhHwbq76PmTZZaO8n7Ft5fieb/9XD35
         jAeixyeclqRfzWp6ULm0j6yIaCioGnki95u1VKq8ZTeb74C95F+9tOjyZDm8fgURoaO8
         8dShrAVjn3EUehgJc2TrlygfM/zIKMdtVhIgP6gvCEhU0l4B9+QuW9G46XrjmYP/Y8jO
         rvpw==
X-Gm-Message-State: AOJu0Yw41+OvgZB9rV610x9Zk8NXuntssGkKEtaNKlAjAm9Xs3J9YYiZ
        oUVU0LfUxsjwODeT2DLJrAQpUlH1U0Lmi+bhOqSGZw==
X-Google-Smtp-Source: AGHT+IFCffGhDw6CN/so+haOPjpV1gm+QuM354DzJMlUAoSyFZN4+EcnHJw5AKh7nvzloXmRay0G3A==
X-Received: by 2002:a17:90b:38d2:b0:26d:fcd:89b3 with SMTP id nn18-20020a17090b38d200b0026d0fcd89b3mr3977364pjb.8.1696472985987;
        Wed, 04 Oct 2023 19:29:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n17-20020a170902e55100b001c0de73564dsm281463plf.205.2023.10.04.19.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 19:29:45 -0700 (PDT)
Message-ID: <651e1f99.170a0220.cd48a.1923@mx.google.com>
Date:   Wed, 04 Oct 2023 19:29:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc4-348-g4d6ee1bd3e382
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 67 runs,
 18 regressions (v6.6-rc4-348-g4d6ee1bd3e382)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 67 runs, 18 regressions (v6.6-rc4-348-g4d6ee1b=
d3e382)

Regressions Summary
-------------------

platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
imx8mm-innocomm-wb15-evk   | arm64  | lab-pengutronix | gcc-10   | defconfi=
g          | 1          =

imx8mn-ddr4-evk            | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =

imx8mp-evk                 | arm64  | lab-broonie     | gcc-10   | defconfi=
g          | 1          =

qemu_arm-virt-gicv2        | arm    | lab-baylibre    | gcc-10   | multi_v7=
_defconfig | 1          =

qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre    | gcc-10   | multi_v7=
_defconfig | 1          =

qemu_arm-virt-gicv3        | arm    | lab-baylibre    | gcc-10   | multi_v7=
_defconfig | 1          =

qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre    | gcc-10   | multi_v7=
_defconfig | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =

qemu_i386                  | i386   | lab-baylibre    | gcc-10   | i386_def=
config     | 1          =

qemu_i386-uefi             | i386   | lab-baylibre    | gcc-10   | i386_def=
config     | 1          =

qemu_riscv64               | riscv  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =

qemu_smp8_riscv64          | riscv  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =

qemu_x86_64                | x86_64 | lab-baylibre    | gcc-10   | x86_64_d=
efconfig   | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-10   | x86_64_d=
efconfig   | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-10   | x86_64_d=
efconfig   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc4-348-g4d6ee1bd3e382/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc4-348-g4d6ee1bd3e382
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4d6ee1bd3e3820b523d43349cbcae230fdfcb613 =



Test Regressions
---------------- =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
imx8mm-innocomm-wb15-evk   | arm64  | lab-pengutronix | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/651ded5260388e1db58a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ded5260388e1db58a0=
a44
        new failure (last pass: v6.6-rc4-285-g5819084cf40c) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/651ded39747451a2178a0a4d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651ded39747451a2178a0a56
        failing since 6 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b)

    2023-10-04T22:54:30.783925  + set<8>[   18.316975] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3796933_1.5.2.4.1>
    2023-10-04T22:54:30.784123   +x
    2023-10-04T22:54:30.889147  / # #
    2023-10-04T22:54:32.043128  export SHELL=3D/bin/sh
    2023-10-04T22:54:32.048671  #
    2023-10-04T22:54:33.588159  / # export SHELL=3D/bin/sh. /lava-3796933/e=
nvironment
    2023-10-04T22:54:33.593643  =

    2023-10-04T22:54:36.401324  / # . /lava-3796933/environment/lava-379693=
3/bin/lava-test-runner /lava-3796933/1
    2023-10-04T22:54:36.407055  =

    2023-10-04T22:54:36.407261  / # /lava-3796933/bin/lava<3>[   22.415208]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance =

    ... (13 line(s) more)  =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
imx8mp-evk                 | arm64  | lab-broonie     | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/651ded46747451a2178a0a79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651ded46747451a2178a0a82
        failing since 29 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-04T22:54:40.672503  + set<8>[   27.396153] <LAVA_SIGNAL_ENDRUN =
0_dmesg 154073_1.5.2.4.1>
    2023-10-04T22:54:40.672980   +x
    2023-10-04T22:54:40.783359  / # #
    2023-10-04T22:54:41.949914  export SHELL=3D/bin/sh
    2023-10-04T22:54:41.956040  #
    2023-10-04T22:54:43.455088  / # export SHELL=3D/bin/sh. /lava-154073/en=
vironment
    2023-10-04T22:54:43.461124  =

    2023-10-04T22:54:46.185169  / # . /lava-154073/environment/lava-154073/=
bin/lava-test-runner /lava-154073/1
    2023-10-04T22:54:46.191967  =

    2023-10-04T22:54:46.209678  / # /lava-154073/bin/lava-test-runner /lava=
-154073/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_arm-virt-gicv2        | arm    | lab-baylibre    | gcc-10   | multi_v7=
_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651dee7a5e0a8aeadb8a0a4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651dee7a5e0a8aeadb8a0=
a4b
        failing since 6 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre    | gcc-10   | multi_v7=
_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651dee7c4cc8eaaf898a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651dee7c4cc8eaaf898a0=
a43
        failing since 6 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_arm-virt-gicv3        | arm    | lab-baylibre    | gcc-10   | multi_v7=
_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651dee7b5e0a8aeadb8a0a4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651dee7b5e0a8aeadb8a0=
a4f
        failing since 6 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre    | gcc-10   | multi_v7=
_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651dee795e0a8aeadb8a0a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651dee795e0a8aeadb8a0=
a48
        failing since 6 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/651decec7f342fbba78a0a52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651decec7f342fbba78a0=
a53
        failing since 6 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/651decea7f342fbba78a0a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651decea7f342fbba78a0=
a50
        failing since 6 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/651dece8c6c1cb98fc8a0a59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651dece8c6c1cb98fc8a0=
a5a
        failing since 6 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/651dece9c6c1cb98fc8a0a5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651dece9c6c1cb98fc8a0=
a5d
        failing since 6 days (last pass: v6.5-rc2-295-ge510699ebeee, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_i386                  | i386   | lab-baylibre    | gcc-10   | i386_def=
config     | 1          =


  Details:     https://kernelci.org/test/plan/id/651ded12b65878257d8a0a55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ded12b65878257d8a0=
a56
        failing since 6 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_i386-uefi             | i386   | lab-baylibre    | gcc-10   | i386_def=
config     | 1          =


  Details:     https://kernelci.org/test/plan/id/651ded1196ec2fe0f48a0a74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ded1196ec2fe0f48a0=
a75
        failing since 6 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_riscv64               | riscv  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/651ded8975d75619378a0a5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ded8a75d75619378a0=
a5c
        failing since 6 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_smp8_riscv64          | riscv  | lab-baylibre    | gcc-10   | defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/651ded88005671fcf58a0aca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_ris=
cv64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_ris=
cv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651ded88005671fcf58a0=
acb
        failing since 6 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_x86_64                | x86_64 | lab-baylibre    | gcc-10   | x86_64_d=
efconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/651dec0d8c0d1a13f78a0a6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651dec0d8c0d1a13f78a0=
a6b
        failing since 6 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-10   | x86_64_d=
efconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/651dec0c8c0d1a13f78a0a66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651dec0c8c0d1a13f78a0=
a67
        failing since 6 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g          | regressions
---------------------------+--------+-----------------+----------+---------=
-----------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-10   | x86_64_d=
efconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/651dec0eb03364fd5a8a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc4-34=
8-g4d6ee1bd3e382/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651dec0eb03364fd5a8a0=
a46
        failing since 6 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =20
