Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BECF76370B7
	for <lists+linux-next@lfdr.de>; Thu, 24 Nov 2022 04:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiKXDDw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Nov 2022 22:03:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiKXDDu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Nov 2022 22:03:50 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB006C1F73
        for <linux-next@vger.kernel.org>; Wed, 23 Nov 2022 19:03:48 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id y13so466893pfp.7
        for <linux-next@vger.kernel.org>; Wed, 23 Nov 2022 19:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IsO7dAC0qvpwS2gr3+KOhtbwP1I5zL8PmFFhSKCKbLI=;
        b=jDibzoj2Fv4RZBY75nFnZA1JsI+w1CGIMrXKIKHjIeYr5qadoTg98g9XVZI2ZLQ8Ce
         asPfRgS9Mh8D87VP6rC6P0FpzUHdb+T5L/7hT+xefERXb48/5+TdnQR2p9B6jMQgycep
         dNZFncaWyZqIhhy2FN2BLbiHsPiqWwhX6MV1A4r8IUa///La3USgv4dW1r+OII7xOIpF
         LCGyG5CKPEnNofPzfYHNLnHY2AmKr+TF5RWw/ufqOTbOz72kG8/Or+Zey9GGt0RW9NKn
         01dwlfrODylAVP83L0n2DI3Iv/kTgKWiIKcsGP1+m2ak7KHw/fxYNmuSUTVCfAFN0Ovx
         kP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsO7dAC0qvpwS2gr3+KOhtbwP1I5zL8PmFFhSKCKbLI=;
        b=ifNSCqVnvmTvozgiVsfa3wQD6JePjqGUKqcKNYu5ZEX5O/9o3WBiv81wHP2PLb98Op
         pL9fhtONNUj2915U5cNbLO8VN2z852MzmDhGYT270Rg8+tWRdHBnn293fqDngtMb/mVH
         gb1iu0qx8nJZNSiT9dnHwL/awHLiDoE7Uw2K02P6ys+dzFs2g6UXH5quqrK6ykLPT7zE
         UoAoi70uhMd4kkj1XgBODQOs6Z7MjnlHtC4OGBtOV3/PM3VjJaYTp+Aa902sqHwe7WDC
         9AMRunv5qIfLlMdqBwMcOYT13XeE8D6ICpUd7cnl3tObU4h5iL9EKfGOuKfRWN6/QjCd
         agZA==
X-Gm-Message-State: ANoB5pm/dHHjIkvae5hBxBQAOgwcw3mhSyX1jpMaDqYIuZ0WsejFoSLE
        Gd6h6I0/5En+/2gBLyqfEvMHuBRHgFMXeWFc6Cc=
X-Google-Smtp-Source: AA0mqf4PrsEdnsnQrEhBNafa4cxu+Z3jwjvRpjlRMduw3ptIwaaDmByF7LoMYtFnV1OykTpblECpOw==
X-Received: by 2002:a05:6a02:187:b0:46b:26a6:51bc with SMTP id bj7-20020a056a02018700b0046b26a651bcmr28528132pgb.204.1669259027934;
        Wed, 23 Nov 2022 19:03:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x22-20020a170902821600b001873aa85e1fsm14807477pln.305.2022.11.23.19.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 19:03:47 -0800 (PST)
Message-ID: <637edf13.170a0220.dc92f.81f3@mx.google.com>
Date:   Wed, 23 Nov 2022 19:03:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.1-rc6-321-gf1946233996a
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 369 runs,
 15 regressions (v6.1-rc6-321-gf1946233996a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 369 runs, 15 regressions (v6.1-rc6-321-gf19462=
33996a)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug   | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug   | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig        | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug   | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug   | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug   | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug   | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig         | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 4          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig         | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig            | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-rc6-321-gf1946233996a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-rc6-321-gf1946233996a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f1946233996aa395cdd6b571e2d116fe40c4c08e =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/637eaf75cd2e5460692abd2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637eaf75cd2e5460692ab=
d2f
        failing since 17 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/637eac7c9c346793772abd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637eac7c9c346793772ab=
d12
        failing since 69 days (last pass: v6.0-rc4-291-g83a56f559828, first=
 fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/637eaf0efc7f496bb22abd27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637eaf0efc7f496bb22ab=
d28
        failing since 111 days (last pass: v5.19-1483-gffa33bbcf63ea, first=
 fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/637eafc36dcc189c2b2abcfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637eafc36dcc189c2b2ab=
cfd
        failing since 110 days (last pass: v5.19-8283-ga8bc7f656e322, first=
 fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/637ebd1b0c69c7e80f2abd0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637ebd1b0c69c7e80f2ab=
d0d
        failing since 42 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/637ebccc10a67ffed62abd3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637ebccc10a67ffed62ab=
d3d
        failing since 42 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/637ebe33ccbbdfa8bf2abd43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637ebe33ccbbdfa8bf2ab=
d44
        failing since 42 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/637ebccb0b503549f52abd08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637ebccb0b503549f52ab=
d09
        failing since 42 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/637ea8e83cc88250d92abd21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637ea8e83cc88250d92ab=
d22
        failing since 0 day (last pass: v6.1-rc6-197-ge7525a67d6a7, first f=
ail: v6.1-rc6-254-g5adecc331ab9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/637eb07b600a7420042abd07

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/637eb07b600a7420042abd29
        failing since 268 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-11-23T23:44:37.069217  /lava-8104692/1/../bin/lava-test-case
    2022-11-23T23:44:37.081846  <8>[   49.817897] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/637eb07b600a7420042abd4c
        failing since 176 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-11-23T23:44:33.015212  =

    2022-11-23T23:44:34.048646  /lava-8104692/1/../bin/lava-test-case
    2022-11-23T23:44:34.049599  =

    2022-11-23T23:44:34.067975  <8>[   46.803515] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/637eb07b600a7420042abd4d
        failing since 176 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-11-23T23:44:33.000185  /lava-8104692/1/../bin/lava-test-case
    2022-11-23T23:44:33.013000  <8>[   45.748844] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/637eb07b600a7420042abd4e
        failing since 176 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-11-23T23:44:30.865260  <8>[   43.599063] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-11-23T23:44:31.934932  /lava-8104692/1/../bin/lava-test-case
    2022-11-23T23:44:31.951839  <8>[   44.686935] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/637eaae111d2cff8f52abd28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-=
orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-=
orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637eaae111d2cff8f52ab=
d29
        new failure (last pass: v6.1-rc6-254-g5adecc331ab9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/637ea7ad8a83432d3f2abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-ora=
ngepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-32=
1-gf1946233996a/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-ora=
ngepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637ea7ad8a83432d3f2ab=
cfb
        new failure (last pass: v6.1-rc6-254-g5adecc331ab9) =

 =20
