Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B86753FF4
	for <lists+linux-next@lfdr.de>; Fri, 14 Jul 2023 18:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236043AbjGNQpQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Jul 2023 12:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235873AbjGNQpP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Jul 2023 12:45:15 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14B7B4
        for <linux-next@vger.kernel.org>; Fri, 14 Jul 2023 09:45:13 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6686ef86110so1439853b3a.2
        for <linux-next@vger.kernel.org>; Fri, 14 Jul 2023 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689353113; x=1691945113;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Us1dmLdCgpH8yPJTKDQR+/92g3827xKTmgpMpl9TapQ=;
        b=rYSB3aO/Vq5OZJ/bDNg1M+BCXDnaXATFs91n2ggBur6RS2H3Or94TofruMutzRntFo
         7iHsriQEVUjMlngXYJK+0f7Y2JSbRXki1V2v1fAUhixF1ghfiFDmf153ySx7on57pq6d
         WVhPZGRZi8v+6GGS69GPBSSFEsee/64p/b8LqsFxg8lMWMT3X3U2IfonLVj7wxOAQfeM
         qby14NEvvCtt44O0mVNTamKWcosozgGPJX0sbn8ZnQJJXOv74NN85g4aTmm0eCG4RZ4P
         G8zP3WPy/HqGfe5rIUD5YDeXKTnls3nUN7mL2Awmdc0VfM0cEibYhrJMibaCeT4024Ja
         xOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689353113; x=1691945113;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Us1dmLdCgpH8yPJTKDQR+/92g3827xKTmgpMpl9TapQ=;
        b=iM/6hsdra7Gh1Gyb1iK1UeV8sPM3lb8uz+40JG1S1znzbmTc8pfjm/P8WYyfwYY+Nt
         ZvBwFOhGI/l0QfbQt4iNWD7ybVILdQCXGCib+hicl1n5/faYRDlNQULVOjpK/ta4W6kj
         bbn1CG7Hn5/PH64yhJFHxelYvimlRoLBKR6TcZugdxcgOAMPJ/xcqn5L7TW9m4KfqN5y
         6toRma1ie/3tG2lZlbrv3hgc8NRizcRjmvHSC3dTOl3RXFl97GMlKM9fG7ltFZB7Wod/
         r9ph0wwAIg5UEe5vNB+i5G+6ufr9QhMih4nTWqQRF5AlST5I3DONRVzZBwSZvMuGOw++
         Um+Q==
X-Gm-Message-State: ABy/qLaBn/0gJGQkSTtLmL6JKZz7L29dPl3xB0GZfDo+rtrMGlHGNBPN
        nrUjA0nnQ82iM2TCIUwQY5Xi8mQEfw7PsgPKSMn0kw==
X-Google-Smtp-Source: APBJJlH1mGS8TvCL6HYRlKBJWw3P4NIUF6QQr5RBBk+llprf+2BkOdbasQ1R2hE7gr8WVKg08Dt8Eg==
X-Received: by 2002:a05:6a21:6d91:b0:132:c7de:7d77 with SMTP id wl17-20020a056a216d9100b00132c7de7d77mr4785116pzb.57.1689353112956;
        Fri, 14 Jul 2023 09:45:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e6-20020aa78c46000000b00682562b1549sm7355578pfd.24.2023.07.14.09.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:45:12 -0700 (PDT)
Message-ID: <64b17b98.a70a0220.b3760.06be@mx.google.com>
Date:   Fri, 14 Jul 2023 09:45:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc1-374-g7758824d54f7
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 84 runs,
 6 regressions (v6.5-rc1-374-g7758824d54f7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 84 runs, 6 regressions (v6.5-rc1-374-g7758824d=
54f7)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp      | gcc-10   | defconfig =
| 1          =

meson-g12a-u200              | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =

rk3328-rock64                | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc1-374-g7758824d54f7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc1-374-g7758824d54f7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7758824d54f71f083cf6962a924ea56ef20db6c6 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp      | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64b148a12ec8005d798ace1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b148a12ec8005d798ace22
        failing since 0 day (last pass: v6.0-rc4-326-g49ccb7c6c3ca, first f=
ail: v6.4-11141-g4556f2dbce0d)

    2023-07-14T13:07:26.780133  [   11.968451] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1236649_1.5.2.4.1>
    2023-07-14T13:07:26.886071  =

    2023-07-14T13:07:26.987524  / # #export SHELL=3D/bin/sh
    2023-07-14T13:07:26.988042  =

    2023-07-14T13:07:27.089089  / # export SHELL=3D/bin/sh. /lava-1236649/e=
nvironment
    2023-07-14T13:07:27.089578  =

    2023-07-14T13:07:27.190618  / # . /lava-1236649/environment/lava-123664=
9/bin/lava-test-runner /lava-1236649/1
    2023-07-14T13:07:27.191366  =

    2023-07-14T13:07:27.194480  / # /lava-1236649/bin/lava-test-runner /lav=
a-1236649/1
    2023-07-14T13:07:27.218370  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
meson-g12a-u200              | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64b148a275cd2251258ace29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b148a275cd2251258ac=
e2a
        failing since 1 day (last pass: v6.5-rc1-266-g5d4deffc2b3b, first f=
ail: v6.5-rc1-303-gcfab091a85bd) =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
rk3328-rock64                | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64b14838d4471666fe8ace87

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b14838d4471666fe8ace8c
        failing since 163 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-14T13:05:45.624021  [   28.828912] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3721131_1.5.2.4.1>
    2023-07-14T13:05:45.728809  =

    2023-07-14T13:05:45.830402  / # #export SHELL=3D/bin/sh
    2023-07-14T13:05:45.830843  =

    2023-07-14T13:05:45.932625  / # export SHELL=3D/bin/sh. /lava-3721131/e=
nvironment
    2023-07-14T13:05:45.933392  =

    2023-07-14T13:05:46.034948  / # . /lava-3721131/environment/lava-372113=
1/bin/lava-test-runner /lava-3721131/1
    2023-07-14T13:05:46.035626  =

    2023-07-14T13:05:46.039140  / # /lava-3721131/bin/lava-test-runner /lav=
a-3721131/1
    2023-07-14T13:05:46.075763  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64b149dc6ec89f3a4c8ace21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b149dc6ec89f3a4c8ac=
e22
        failing since 11 days (last pass: v6.4-4072-ge8f5f1933319, first fa=
il: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64b1492387c72b27118ace2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b1492387c72b27118ac=
e2b
        failing since 11 days (last pass: v6.4-4072-ge8f5f1933319, first fa=
il: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64b1492521f05d9b4e8ace30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-37=
4-g7758824d54f7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b1492521f05d9b4e8ac=
e31
        failing since 1 day (last pass: v6.5-rc1-146-g2654f2b00aa0, first f=
ail: v6.5-rc1-303-gcfab091a85bd) =

 =20
