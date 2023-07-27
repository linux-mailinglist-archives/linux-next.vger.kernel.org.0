Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380D476445C
	for <lists+linux-next@lfdr.de>; Thu, 27 Jul 2023 05:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbjG0DbT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Jul 2023 23:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbjG0DbI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jul 2023 23:31:08 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B4E11F
        for <linux-next@vger.kernel.org>; Wed, 26 Jul 2023 20:31:04 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686f090310dso400268b3a.0
        for <linux-next@vger.kernel.org>; Wed, 26 Jul 2023 20:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690428663; x=1691033463;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WgA8h3vLxKodQBLtKPDlqGJQ99E6BOTEKvwgDcjLPyY=;
        b=BJnpuoJqFPfq17m4DwDOzL1KFNf2OpCiGS4pjlI6o7hXiCYctiYpZVrHMZZpP8C+bF
         /cOX4bu2VNPTd8xBH9Yvmsvnonool+4buLfoFGTsnN37+39zwwgDXOe/f/HUxv5zElIn
         EWw6fRiLcKL96EeY75qHfCKbO3kkVSijb4OtSF7SVdyr5E/Bwv1Af+Lwc2aQl8YckuhM
         M/FmOx6PVtTLLOCFAfCZE9ganNsz0oT9xdZdHhZiUgBdbA07jISHOGb9IXkvKWYdDt6T
         g9CL31l7GJ+5t9pHwVOmvczaXu1ZNXMYrlOhxZTq4lId9Df9UciCdH3GHamPkCI2MZPh
         iR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690428663; x=1691033463;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgA8h3vLxKodQBLtKPDlqGJQ99E6BOTEKvwgDcjLPyY=;
        b=A6zqchAadcLtlVr/0RfCk1AHEC7bUeYoWvhWI6ZzEPbMvJai+6ZCxfiKV2k6JxrLWu
         xPiOeEA+jHquDAzUP/7YJ01OE+L6fUC5Rbc2gBFqXWV+Wrt8qZmfkW/KISr/E4gJAwjM
         eEE2VaaNvvfl8qer58es3QmXvhYIsA5Xcs++agCjp2ND/xhrd9rSqI9vHxxrLxqo508X
         Tp5IUNWqaC6ilOE2PqH5BMOfpSJuQnGGQpO2/ZOVnMr7NT4A4Tw8wAaipCS04CZYOOrZ
         10HcysI1dCTRvW/16kKHhODd1r0jKviPRKjWQ+8nrqp62otaJRiom0PJMJBCfzJNdLIe
         Nxzw==
X-Gm-Message-State: ABy/qLYk+bWkX2pGBUGVFZj/NFMHFLbTWp4RqQimxIIxaotKMShN0j3J
        dWiYFYHnDHdSN/gSJePQE6X4DK3f0D7i83brpfrnww==
X-Google-Smtp-Source: APBJJlF6Xjr41ftKBJ9pk47fQlrWsi8sO10hTi+iUF6mFN6DzREo1Q8VleKCTPEdB2MX1mQCqZVgBA==
X-Received: by 2002:a05:6a00:13a2:b0:686:5a11:a434 with SMTP id t34-20020a056a0013a200b006865a11a434mr4907874pfg.3.1690428663293;
        Wed, 26 Jul 2023 20:31:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e9-20020aa78249000000b0065da94fe921sm343902pfn.50.2023.07.26.20.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 20:31:02 -0700 (PDT)
Message-ID: <64c1e4f6.a70a0220.fb6b.0c00@mx.google.com>
Date:   Wed, 26 Jul 2023 20:31:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc3-350-gb917f578dc45d
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 61 runs,
 19 regressions (v6.5-rc3-350-gb917f578dc45d)
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

next/pending-fixes baseline: 61 runs, 19 regressions (v6.5-rc3-350-gb917f57=
8dc45d)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig | 1          =

fsl-ls2088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig | 1          =

r8a77960-ulcb                | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc3-350-gb917f578dc45d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc3-350-gb917f578dc45d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b917f578dc45de7c9e1e7265353aac5537513acf =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b4d356a53f4bfb8ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b4d356a53f4bfb8ac=
e1d
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b484bad149b01b8acede

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c1b484bad149b01b8acee1
        failing since 12 days (last pass: v6.0-rc4-326-g49ccb7c6c3ca, first=
 fail: v6.4-11141-g4556f2dbce0d)

    2023-07-27T00:04:11.177304  + [   12.767810] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1238745_1.5.2.4.1>
    2023-07-27T00:04:11.177582  set +x
    2023-07-27T00:04:11.282997  =

    2023-07-27T00:04:11.384265  / # #export SHELL=3D/bin/sh
    2023-07-27T00:04:11.384657  =

    2023-07-27T00:04:11.485621  / # export SHELL=3D/bin/sh. /lava-1238745/e=
nvironment
    2023-07-27T00:04:11.486014  =

    2023-07-27T00:04:11.587008  / # . /lava-1238745/environment/lava-123874=
5/bin/lava-test-runner /lava-1238745/1
    2023-07-27T00:04:11.587718  =

    2023-07-27T00:04:11.591642  / # /lava-1238745/bin/lava-test-runner /lav=
a-1238745/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b57442117e04d28ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-lx2160a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b57442117e04d28ac=
e29
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b40ee82ff842d98ace36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b40ee82ff842d98ac=
e37
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b434c0adf9f7e48ace8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b434c0adf9f7e48ac=
e8d
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b55c42117e04d28ace21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b55c42117e04d28ac=
e22
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b3ffe82ff842d98ace30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b3ffe82ff842d98ac=
e31
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b4d0bad149b01b8acf03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b4d0bad149b01b8ac=
f04
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b3fec0adf9f7e48ace55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b3fec0adf9f7e48ac=
e56
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b5852901c68cf98ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b5852901c68cf98ac=
e1e
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b401af9f6222db8ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b401af9f6222db8ac=
e1e
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b4f956a53f4bfb8ace21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b4f956a53f4bfb8ac=
e22
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b415e82ff842d98ace3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b415e82ff842d98ac=
e3c
        new failure (last pass: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b48fbad149b01b8aceea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c1b48fbad149b01b8aceed
        failing since 8 days (last pass: v6.5-rc1-374-g7758824d54f7, first =
fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-27T00:04:10.953847  / # #
    2023-07-27T00:04:12.414092  export SHELL=3D/bin/sh
    2023-07-27T00:04:12.434553  #
    2023-07-27T00:04:12.434752  / # export SHELL=3D/bin/sh
    2023-07-27T00:04:14.319594  / # . /lava-989462/environment
    2023-07-27T00:04:17.776559  /lava-989462/bin/lava-test-runner /lava-989=
462/1
    2023-07-27T00:04:17.797310  . /lava-989462/environment
    2023-07-27T00:04:17.797418  / # /lava-989462/bin/lava-test-runner /lava=
-989462/1
    2023-07-27T00:04:17.880656  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T00:04:17.880872  + cd /lava-989462/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
r8a77960-ulcb                | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b401ae8ec9968d8ace2c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulc=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulc=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c1b401ae8ec9968d8ace31
        failing since 8 days (last pass: v6.5-rc1-374-g7758824d54f7, first =
fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-27T00:03:32.602975  / # #

    2023-07-27T00:03:32.705183  export SHELL=3D/bin/sh

    2023-07-27T00:03:32.705957  #<6>[   17.925268] mc: Linux media interfac=
e: v0.10

    2023-07-27T00:03:32.706367  =


    2023-07-27T00:03:32.706632  / # <6>[   17.971464] videodev: Linux video=
 capture interface: v2.00

    2023-07-27T00:03:32.706871  export SHELL=3D/bin/sh<6>[   18.004298] rca=
r_fdp1 fe940000.fdp1: Device registered as /dev/video2

    2023-07-27T00:03:32.808096  . /lava-11148130/environment

    2023-07-27T00:03:32.808845  =


    2023-07-27T00:03:32.910352  / # . /lava-11148130/environment/lava-11148=
130/bin/lava-test-runner /lava-11148130/1

    2023-07-27T00:03:32.911563  <6>[   18.119504] rcar-dw-hdmi fead0000.hdm=
i: Detected HDMI TX controller v2.01a with HDCP (DWC HDMI 2.0 TX PHY)
 =

    ... (16 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
r8a779m1-ulcb                | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b426c0adf9f7e48ace7c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulc=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulc=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c1b426c0adf9f7e48ace81
        failing since 8 days (last pass: v6.5-rc1-374-g7758824d54f7, first =
fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-27T00:02:37.637472  / # #

    2023-07-27T00:02:38.717460  export SHELL=3D/bin/sh

    2023-07-27T00:02:38.718781  #

    2023-07-27T00:02:40.207899  / # export SHELL=3D/bin/sh. /lava-11148133/=
environment

    2023-07-27T00:02:40.209871  =


    2023-07-27T00:02:42.935575  / # . /lava-11148133/environment/lava-11148=
133/bin/lava-test-runner /lava-11148133/1

    2023-07-27T00:02:42.938050  =


    2023-07-27T00:02:42.945726  / # /lava-11148133/bin/lava-test-runner /la=
va-11148133/1

    2023-07-27T00:02:43.008466  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T00:02:43.008977  + cd /lava-111481<8>[   28.236022] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11148133_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b50756a53f4bfb8ace25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pin=
e64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pin=
e64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b50756a53f4bfb8ac=
e26
        failing since 23 days (last pass: v6.4-4072-ge8f5f1933319, first fa=
il: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b42bc0adf9f7e48ace89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c1b42bc0adf9f7e48ac=
e8a
        failing since 7 days (last pass: v6.5-rc2-246-gefabeaa08ef1, first =
fail: v6.5-rc2-295-ge510699ebeee) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/64c1b415ae8ec9968d8ace48

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc3-35=
0-gb917f578dc45d/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c1b415ae8ec9968d8ace4d
        failing since 8 days (last pass: v6.5-rc1-374-g7758824d54f7, first =
fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-27T00:03:44.015206  / # #

    2023-07-27T00:03:44.117320  export SHELL=3D/bin/sh

    2023-07-27T00:03:44.118028  <4>[   15.953461] dwmac-sun8i: probe of 502=
0000.ethernet failed with error -110

    2023-07-27T00:03:44.118391  #

    2023-07-27T00:03:44.118657  / # <6>[   16.053262] ax88179_178a 1-1:1.0 =
eth0: register 'ax88179_178a' at usb-5311000.usb-1, ASIX AX88179 USB 3.0 Gi=
gabit Ethernet, 8c:ae:4c:e1:5d:0b

    2023-07-27T00:03:44.118898  <6>[   16.066375] usbcore: registered new i=
nterface driver ax88179_178a

    2023-07-27T00:03:44.220093  export SHELL=3D/bin/sh. /lava-11148121/envi=
ronment

    2023-07-27T00:03:44.220801  =


    2023-07-27T00:03:44.322277  / # . /lava-11148121/environment/lava-11148=
121/bin/lava-test-runner /lava-11148121/1

    2023-07-27T00:03:44.323359  =

 =

    ... (14 line(s) more)  =

 =20
