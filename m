Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373767207A7
	for <lists+linux-next@lfdr.de>; Fri,  2 Jun 2023 18:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236593AbjFBQed (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Jun 2023 12:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235208AbjFBQec (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Jun 2023 12:34:32 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425571B1
        for <linux-next@vger.kernel.org>; Fri,  2 Jun 2023 09:34:28 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-25695bb6461so2728089a91.1
        for <linux-next@vger.kernel.org>; Fri, 02 Jun 2023 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685723667; x=1688315667;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=klTI1VL59B1kyGf9/WyUdSlB+fVCDNeA3ZIe+wHsadw=;
        b=mN1lKYppEmlqab6oKdPPP97j/B88LQ6IXQZnmuu3V9HV0o0fKEaRtQDKlIs+30jRs0
         U8ZxtBhVuS17OmkGgWB0RoIb2pkFCPmbktm22r/Y+kTd0j1qrEWumfImHfmBOyxD1/mt
         HH9LNX8/kZxHa2p28kmXzKSJVoyJc4Lw6F5KZXIB3/nvfFl8Bm1zrm5SrgBRBaR16DVB
         Q9O3nVfWrC/pTHMCIomL1YdUsiw3FhtxP6umx4YNdPoJJvg2kPNPdIOF6a9ZXMAMowne
         uofB8EbttHcdXyG6UJw3SBHO+WSs+tbeOuuGU0Bx37kLcSQKZhMOBtxNWzNNnH7uN5E/
         e/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685723667; x=1688315667;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=klTI1VL59B1kyGf9/WyUdSlB+fVCDNeA3ZIe+wHsadw=;
        b=jrlWCJpOC7aq3jSF5MPKypc2ZiW1pd92APxce+kwTMWnKrkFm5+23/IT3mbiQXo9Jr
         nP0aR37e+ybjk8dEbMBX5wxatEAxJl5NkSqr1JN00y/F3rkKeskNYlyvQgbtKtn2nIxR
         8uNYvo4lRAh05F9bte7/x9hX9poRFR2Yl16Hv/+7iwG9dRE+KWZy3t27y4PDAhAtILtx
         Ko5Ao0+IRIhM9gCT4Ddd4CPwXENu2PczepQ2b4OqbuJOJlPUqJHqtnb/LSaKX0/GiwLv
         fLu0ftHJlEqAr8KKCUAU4cJMK67ik0UC/MS9cCQ/ll8zhemKiXMLeIce7L7y7CTG6Kh9
         +nGg==
X-Gm-Message-State: AC+VfDwdwIprNq0Dh0uILVRBrIjPLeU69tL1wAFd2k0j3lO9imoq34pU
        jlJbptx/4XSBLk+j+syUVES11BX5XD9MRvuEfmUy+w==
X-Google-Smtp-Source: ACHHUZ4nJImzv9794OOl8D4cAg4Qy0vIjbVvCYR1dEHdAZfuNpmSqacxmtDgXPcIsB25+2RKv5i5cA==
X-Received: by 2002:a17:90b:1d8e:b0:256:6462:e399 with SMTP id pf14-20020a17090b1d8e00b002566462e399mr422939pjb.5.1685723667169;
        Fri, 02 Jun 2023 09:34:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a1a4300b0025677ccf217sm3566933pjl.1.2023.06.02.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 09:34:26 -0700 (PDT)
Message-ID: <647a1a12.170a0220.a516b.6aba@mx.google.com>
Date:   Fri, 02 Jun 2023 09:34:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230602
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 98 runs, 11 regressions (next-20230602)
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

next/master baseline: 98 runs, 11 regressions (next-20230602)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

mt8365-evk                   | arm64 | lab-baylibre  | clang-13 | cros://ch=
rome...avour.config | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230602/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230602
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bc708bbd8260ee4eb3428b0109f5f3be661fae46 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e50a03057795f9f5de4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e50a03057795f9f5d=
e4c
        failing since 9 days (last pass: next-20230519, first fail: next-20=
230524) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e491bc970c97ddf5de2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e491bc970c97ddf5d=
e30
        failing since 9 days (last pass: next-20230522, first fail: next-20=
230524) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e5d68617621b00f5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e5d68617621b00f5d=
e26
        new failure (last pass: next-20230531) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e4ef93b1ba80cdf5de29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e4ef93b1ba80cdf5d=
e2a
        failing since 126 days (last pass: next-20230120, first fail: next-=
20230127) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e48e3c7615a171f5de2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e48e3c7615a171f5d=
e2d
        failing since 129 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e60b6d8af07611f5de2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e60b6d8af07611f5d=
e30
        new failure (last pass: next-20230531) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e4dc67d6cf147bf5de7d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e4dc67d6cf147bf5d=
e7e
        failing since 2 days (last pass: next-20230530, first fail: next-20=
230531) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e48e6b3e844203f5de35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e48e6b3e844203f5d=
e36
        failing since 9 days (last pass: next-20230522, first fail: next-20=
230524) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e54fe41b1711abf5e05b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e54fe41b1711abf5e=
05c
        new failure (last pass: next-20230531) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8365-evk                   | arm64 | lab-baylibre  | clang-13 | cros://ch=
rome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e9665b308bbf22f5de3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-mt8365-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-mt8365-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479e9665b308bbf22f5d=
e3e
        new failure (last pass: next-20230531) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479e4725672951190f5de25

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230602/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230602/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rk808-clkout-driver-present: https://kernelci.org/test/=
case/id/6479e4725672951190f5de57
        failing since 16 days (last pass: next-20230512, first fail: next-2=
0230517)

    2023-06-02T12:45:20.701633  /lava-10564388/1/../bin/lava-test-case
   =

 =20
