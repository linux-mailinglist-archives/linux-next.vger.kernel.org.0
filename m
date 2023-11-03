Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452047E00D6
	for <lists+linux-next@lfdr.de>; Fri,  3 Nov 2023 11:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjKCKZp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Nov 2023 06:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbjKCKZo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Nov 2023 06:25:44 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D777AD57
        for <linux-next@vger.kernel.org>; Fri,  3 Nov 2023 03:25:30 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc5b6d6228so14773045ad.2
        for <linux-next@vger.kernel.org>; Fri, 03 Nov 2023 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699007130; x=1699611930; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NLCFTwExURR7czM9i6j07KN41FVVbL33kTuoXXI2ZVU=;
        b=fGpSPF29xIeerrM1nQdxdCnVIgpF26J5r8MsRgpc+mfFq1dHbksCiEWPOdEfuqFc5j
         ZRsU1oWGtBCR5xoMD1Jp8+j2AYoWHSMCzc6BxSRsOmjrFAB4mj9WT62MCIn/Nfi5smoD
         qJ+mRAbNtDHo4OCDGk1QBIiyQvl2MqTzRyKZMwZ2Ws+uGnLLAZnR07XQ4exkipP7bfuj
         km3oRnp9oHUG0SwprygUgkTT559eNRvWlrNlJqueBDA+P/aEBtXLj6jPXcip3j5Zzh6x
         bvu/UU7YuvKon2GSMDGmDH2zwWygh0Y0iX97ZVt2EyCFy3La5jy3BGcbA5EtYVKFd/Ru
         55Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699007130; x=1699611930;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLCFTwExURR7czM9i6j07KN41FVVbL33kTuoXXI2ZVU=;
        b=qPDPSc361YaRE5LykCVE4G5kf/cWql7FWwfyzGGKx5BNTdhFy87n278ktP5fl8eaDo
         P+7qkDjNmP318juaOX9nML0NpMp796spRYTqzvM2iPvp4SkNP2kdrJRpvbkL1vbF/2+U
         5/O7tOO+rId3xWLatThI6ewcLm2pCehZim7Gk8POYWB7Tvu6cRQT6/PfI1KnTZ41HSy8
         Xg31lTCkUEGNjdXl0AWmhErsCVdBMVxKLEzGC46MXPqytTmOOJuyKyKuliQjzwA7+hLT
         dHk5dFWI7lDTpTiocXA5pTBRaI/H85Me/FJHzB7/nbj4XONQfrJjEqb/sLNFfDwwS4XO
         9DBg==
X-Gm-Message-State: AOJu0YxrRKMuwADEM1AG4VC/WNHksFUkZJlEHWAB2Qw4PdEsVk/YWBZN
        vHv3Bqncu/fVfErrnMKw/3tZAem3Zyyum5s4zJv+Qg==
X-Google-Smtp-Source: AGHT+IGTtsWQ+fBk1BEJzuFoh30juGY4WuiOO+7lnvwylmm1XvTM1GK9ZIpBXdyLbaP136i7vj4pEQ==
X-Received: by 2002:a17:903:1248:b0:1cc:c0f:2e9b with SMTP id u8-20020a170903124800b001cc0c0f2e9bmr21995380plh.24.1699007129550;
        Fri, 03 Nov 2023 03:25:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001c771740da4sm1111395plc.195.2023.11.03.03.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 03:25:29 -0700 (PDT)
Message-ID: <6544ca99.170a0220.8f8b0.29bc@mx.google.com>
Date:   Fri, 03 Nov 2023 03:25:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231103
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 205 runs, 8 regressions (next-20231103)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 205 runs, 8 regressions (next-20231103)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231103/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231103
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e27090b1413ff236ca1aec26d6b022149115de2c =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/654469c2004bc7eda4efcf3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654469c2004bc7eda4efc=
f3e
        new failure (last pass: next-20231102) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65446d1ceec2c171d6efcfd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65446d1ceec2c171d6efc=
fda
        new failure (last pass: next-20231025) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65446d5b7f1ab402dfefcef8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65446d5b7f1ab402dfefc=
ef9
        failing since 268 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65446cf88764c9e011efcef8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65446cf88764c9e011efc=
ef9
        failing since 268 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65446ce59154bb8b05efcefb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65446ce59154bb8b05efc=
efc
        failing since 268 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65446abd9675dcb5aeefcf62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65446abd9675dcb5aeefc=
f63
        new failure (last pass: next-20231102) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65446ce424dacd0bf4efcf0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65446ce424dacd0bf4efc=
f0c
        failing since 265 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65446d12eec2c171d6efcf1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231103/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65446d12eec2c171d6efc=
f20
        failing since 265 days (last pass: next-20230127, first fail: next-=
20230210) =

 =20
