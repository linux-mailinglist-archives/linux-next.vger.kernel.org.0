Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E743D7650EF
	for <lists+linux-next@lfdr.de>; Thu, 27 Jul 2023 12:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbjG0KWj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Jul 2023 06:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbjG0KWf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Jul 2023 06:22:35 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7C71710
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 03:22:21 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-55b22f82ac8so1340516a12.1
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690453340; x=1691058140;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fQIrPncvjRl0DKsXcgNgmO/KgHYRG3nJVG0VQ3RHkdQ=;
        b=lXMNm4d1aPHKGveLPyRLb7/kUv1tc0Tuwec6aPr6Ex6j50G857Jy2ZHm+IyK2XNRGX
         3rOgeWchKVX30sWRf5Hi0xlXGMmkT9r3mtEIomx+jm01klqyZ24Aa00Zw4aH8Om+Z/Vd
         iMAb6cC5vKKxWMB8scKi5FcVO6ihf+oQo4HQr9gUkuO/NepMgU+6Ncb7tFLOACjVLRS2
         S4xYZmmRIVOAVP7byrVcXueuYkfGN90tuGYv7+zWkVLNTp8maA4pxFmddZ/irlfMa3bj
         hWxH0hixkUFE7vYUtucbprNrHvgPPGlYHVCOQu10ckHqoku90kVXipAAVH3oREHGhJIg
         6ZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690453340; x=1691058140;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQIrPncvjRl0DKsXcgNgmO/KgHYRG3nJVG0VQ3RHkdQ=;
        b=i7hSZT5r6co9X5gq1RcAx/akLRFd0wxltAUubaHy2EfSlx20831coetFU0iV+Bhv5q
         1MpncAcnHbQwxHLOB+tns6LrCZK+MGAlWVPeGxiEO6C3Ry5ZKKfouOllxNL8zsqFV9Hu
         /bF2VU+Oi4WM+4+LSJI3T2cIYBRrEW7WwbvWpf0tenet5P+a1WF0Nsz7S3Lo9JlvlbA6
         NKfAIvbLMAPdmQEa5emk9tPhJeuPFScV//L+6KcKpkbJLliPhFHAkXjJByakjagzRTH0
         ijLqe9/z8RbzLkltF7qm/cAm/wBlL2ryPyCujRaNvTFuT25ZVoPXbLfgLM2a41akcJSY
         BJaw==
X-Gm-Message-State: ABy/qLbAdv6aFBC1TtD2ksZTcpvFtl2sK5WafK70NPhFWJ4nYL1U40K/
        fizEtrSCZc5CK+iFQvNe+YIawDiBm79bD+9OucFyqw==
X-Google-Smtp-Source: APBJJlEKS9N2IrsiIswd1umZfkDRPvpuGi5gL38yAEU+D5UU88BIh8U3FHXYB5/I+3q65OnrcYVOVA==
X-Received: by 2002:a17:90b:4014:b0:268:2f6:61c4 with SMTP id ie20-20020a17090b401400b0026802f661c4mr2913462pjb.12.1690453338893;
        Thu, 27 Jul 2023 03:22:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d3-20020a17090ad98300b00262eb0d141esm924788pjv.28.2023.07.27.03.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 03:22:18 -0700 (PDT)
Message-ID: <64c2455a.170a0220.f6f50.167f@mx.google.com>
Date:   Thu, 27 Jul 2023 03:22:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230727
X-Kernelci-Report-Type: test
Subject: next/master baseline: 314 runs, 108 regressions (next-20230727)
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

next/master baseline: 314 runs, 108 regressions (next-20230727)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2711-rpi-4-b              | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig                    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 22         =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 22         =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230727/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230727
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      451cc82bd11eb6a374f4dbcfc1cf007eafea91ab =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20ff67c18e6adf18ace5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20ff67c18e6adf18ac=
e5e
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c215ca016856a81e8ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c215ca016856a81e8ac=
e1d
        failing since 5 days (last pass: next-20230718, first fail: next-20=
230721) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2100165d92e99f68ace74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c2100165d92e99f68ac=
e75
        failing since 14 days (last pass: next-20230712, first fail: next-2=
0230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c210b609f92451148acfc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-cp514=
-3wh-r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-cp514=
-3wh-r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c210b609f92451148ac=
fc8
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20fc265d92e99f68ace27

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20fc265d92e99f68ace2c
        failing since 120 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-27T06:33:51.881951  + set +x

    2023-07-27T06:33:51.888743  <8>[    9.883475] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11148923_1.4.2.3.1>

    2023-07-27T06:33:51.990683  =


    2023-07-27T06:33:52.091305  / # #export SHELL=3D/bin/sh

    2023-07-27T06:33:52.091527  =


    2023-07-27T06:33:52.192144  / # export SHELL=3D/bin/sh. /lava-11148923/=
environment

    2023-07-27T06:33:52.192373  =


    2023-07-27T06:33:52.293028  / # . /lava-11148923/environment/lava-11148=
923/bin/lava-test-runner /lava-11148923/1

    2023-07-27T06:33:52.293332  =


    2023-07-27T06:33:52.299170  / # /lava-11148923/bin/lava-test-runner /la=
va-11148923/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20fc165d92e99f68ace1c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20fc165d92e99f68ace21
        failing since 120 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-27T06:33:21.801964  <8>[   10.097990] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11148909_1.4.2.3.1>

    2023-07-27T06:33:21.805820  + set +x

    2023-07-27T06:33:21.911506  /#

    2023-07-27T06:33:21.912724   # <4>[   10.161635] cros-ec-spi spi-PRP000=
1:01: EC failed to respond in time

    2023-07-27T06:33:21.913138  <3>[   10.169143] cros-ec-spi spi-PRP0001:0=
1: Cannot identify the EC: error -110

    2023-07-27T06:33:21.913611  <3>[   10.177127] cros-ec-spi spi-PRP0001:0=
1: cannot register EC

    2023-07-27T06:33:21.913975  <4>[   10.183605] cros-ec-spi: probe of spi=
-PRP0001:01 failed with error -110

    2023-07-27T06:33:21.914308  #<4>[   10.204898] cros-ec-sensorhub cros-e=
c-sensorhub.2.auto: no info for EC sensor 3 : -22/3

    2023-07-27T06:33:22.016028  export SHELL=3D/bin/sh

    2023-07-27T06:33:22.016825  =

 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20e35d7928d951a8ace63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20e35d7928d951a8ac=
e64
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20e49d7928d951a8ace79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20e49d7928d951a8ace7c
        failing since 13 days (last pass: next-20220831, first fail: next-2=
0230629)

    2023-07-27T06:26:54.987342  + [   17.510453] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1238832_1.5.2.4.1>
    2023-07-27T06:26:54.987622  set +x
    2023-07-27T06:26:55.093524  =

    2023-07-27T06:26:55.194841  / # #export SHELL=3D/bin/sh
    2023-07-27T06:26:55.195482  =

    2023-07-27T06:26:55.296562  / # export SHELL=3D/bin/sh. /lava-1238832/e=
nvironment
    2023-07-27T06:26:55.297128  =

    2023-07-27T06:26:55.398246  / # . /lava-1238832/environment/lava-123883=
2/bin/lava-test-runner /lava-1238832/1
    2023-07-27T06:26:55.398931  =

    2023-07-27T06:26:55.402912  / # /lava-1238832/bin/lava-test-runner /lav=
a-1238832/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c210aadc77a22e028ace3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c210aadc77a22e028ac=
e40
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20fed65d92e99f68ace64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20fed65d92e99f68ac=
e65
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20fc1f018a4b1ce8ace22

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20fc1f018a4b1ce8ace27
        failing since 120 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-27T06:33:19.449708  + set +x

    2023-07-27T06:33:19.456789  <8>[   12.579378] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11148913_1.4.2.3.1>

    2023-07-27T06:33:19.560762  / # #

    2023-07-27T06:33:19.661327  export SHELL=3D/bin/sh

    2023-07-27T06:33:19.661517  #

    2023-07-27T06:33:19.762049  / # export SHELL=3D/bin/sh. /lava-11148913/=
environment

    2023-07-27T06:33:19.762239  =


    2023-07-27T06:33:19.862708  / # . /lava-11148913/environment/lava-11148=
913/bin/lava-test-runner /lava-11148913/1

    2023-07-27T06:33:19.862952  =


    2023-07-27T06:33:19.867654  / # /lava-11148913/bin/lava-test-runner /la=
va-11148913/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20fa6cca29b9b808ace21

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20fa6cca29b9b808ace26
        failing since 120 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-27T06:32:57.356790  <8>[    9.834372] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11148927_1.4.2.3.1>

    2023-07-27T06:32:57.360511  + set +x

    2023-07-27T06:32:57.467741  / # #

    2023-07-27T06:32:57.570134  export SHELL=3D/bin/sh

    2023-07-27T06:32:57.570808  #

    2023-07-27T06:32:57.672126  / # export SHELL=3D/bin/sh. /lava-11148927/=
environment

    2023-07-27T06:32:57.672816  =


    2023-07-27T06:32:57.774347  / # . /lava-11148927/environment/lava-11148=
927/bin/lava-test-runner /lava-11148927/1

    2023-07-27T06:32:57.775473  =


    2023-07-27T06:32:57.780901  / # /lava-11148927/bin/lava-test-runner /la=
va-11148927/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c210aadc77a22e028ace3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c210aadc77a22e028ac=
e3d
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2122102e2d5c9d08ace2f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c2122102e2d5c9d08ace34
        new failure (last pass: next-20230726)

    2023-07-27T06:43:36.196674  + set[    4.852202] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 996299_1.5.2.3.1>
    2023-07-27T06:43:36.196840   +x
    2023-07-27T06:43:36.301539  / # #
    2023-07-27T06:43:36.403594  export SHELL=3D/bin/sh
    2023-07-27T06:43:36.404060  #
    2023-07-27T06:43:36.505323  / # xx|<8=EF=BF=BD=EF=BF=BD=17=17=EF=BF=BD!=
=1511=EF=BF=BD/bin/sh. /lava-996299/environment
    2023-07-27T06:43:36.505857  =

    2023-07-27T06:43:36.607151  / # =EF=BF=BD=EF=BF=BD>=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDz*=EF=BF=BD=D9=A5=C9=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDnt/lava-996299/bin/lava-test-runner /lava-996=
299/1
    2023-07-27T06:43:36.607781  =

    2023-07-27T06:43:36.611343  / # =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=1C=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=E8=84=81/lava-996299/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c213c41da5dfb0128ace2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c213c41da5dfb0128ac=
e2f
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20de842ffb311338ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20de842ffb311338ac=
e23
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21130f966ab8e628ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c21130f966ab8e628ac=
e1d
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21278614e1725508ace67

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c21278614e1725508ace6c
        new failure (last pass: next-20230726)

    2023-07-27T06:44:48.019911  + set<8>[   22.956233] <LAVA_SIGNAL_ENDRUN =
0_dmesg 12244_1.5.2.4.1>
    2023-07-27T06:44:48.020513   +x
    2023-07-27T06:44:48.129323  / # #
    2023-07-27T06:44:49.295300  export SHELL=3D/bin/sh
    2023-07-27T06:44:49.301383  #
    2023-07-27T06:44:50.744841  / # export SHELL=3D/bin/sh. /lava-12244/env=
ironment
    2023-07-27T06:44:50.750953  =

    2023-07-27T06:44:53.363371  / # . /lava-12244/environment/lava-12244/bi=
n/lava-test-runner /lava-12244/1
    2023-07-27T06:44:53.370073  =

    2023-07-27T06:44:53.379162  / # /lava-12244/bin/lava-test-runner /lava-=
12244/1 =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c213e02749047e528acec0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c213e02749047e528acec5
        new failure (last pass: next-20230726)

    2023-07-27T06:50:57.920500  + set<8>[   26.884778] <LAVA_SIGNAL_ENDRUN =
0_dmesg 12268_1.5.2.4.1>
    2023-07-27T06:50:57.921146   +x
    2023-07-27T06:50:58.031366  / # #
    2023-07-27T06:50:59.197464  export SHELL=3D/bin/sh
    2023-07-27T06:50:59.203598  #
    2023-07-27T06:51:00.647014  / # export SHELL=3D/bin/sh. /lava-12268/env=
ironment
    2023-07-27T06:51:00.653177  =

    2023-07-27T06:51:03.264738  / # . /lava-12268/environment/lava-12268/bi=
n/lava-test-runner /lava-12268/1
    2023-07-27T06:51:03.271525  =

    2023-07-27T06:51:03.279207  / # /lava-12268/bin/lava-test-runner /lava-=
12268/1 =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20e17d7928d951a8ace1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20e17d7928d951a8ace22
        new failure (last pass: next-20230726)

    2023-07-27T06:26:02.434102  + set<8>[   26.247427] <LAVA_SIGNAL_ENDRUN =
0_dmesg 12172_1.5.2.4.1>
    2023-07-27T06:26:02.434666   +x
    2023-07-27T06:26:02.542955  / # #
    2023-07-27T06:26:03.708544  export SHELL=3D/bin/sh
    2023-07-27T06:26:03.714727  #
    2023-07-27T06:26:05.157644  / # export SHELL=3D/bin/sh. /lava-12172/env=
ironment
    2023-07-27T06:26:05.163743  =

    2023-07-27T06:26:07.768167  / # . /lava-12172/environment/lava-12172/bi=
n/lava-test-runner /lava-12172/1
    2023-07-27T06:26:07.774871  =

    2023-07-27T06:26:07.777042  / # /lava-12172/bin/lava-test-runner /lava-=
12172/1 =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2114c30b6456e548ace33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c2114c30b6456e548ace38
        new failure (last pass: next-20230726)

    2023-07-27T06:39:47.739098  + set<8>[   21.318092] <LAVA_SIGNAL_ENDRUN =
0_dmesg 12219_1.5.2.4.1>
    2023-07-27T06:39:47.739672   +x
    2023-07-27T06:39:47.848181  / # #
    2023-07-27T06:39:49.014348  export SHELL=3D/bin/sh
    2023-07-27T06:39:49.019994  #
    2023-07-27T06:39:50.456791  / # export SHELL=3D/bin/sh. /lava-12219/env=
ironment
    2023-07-27T06:39:50.462721  =

    2023-07-27T06:39:53.064009  / # . /lava-12219/environment/lava-12219/bi=
n/lava-test-runner /lava-12219/1
    2023-07-27T06:39:53.070720  =

    2023-07-27T06:39:53.082005  / # /lava-12219/bin/lava-test-runner /lava-=
12219/1 =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20e0829e663c3698ace4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20e0829e663c3698ac=
e4c
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 22         =


  Details:     https://kernelci.org/test/plan/id/64c213bd2749047e528ace1c

  Results:     27 PASS, 22 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c213bd2749047e528ace1f
        new failure (last pass: next-20230726)

    2023-07-27T06:50:06.892652  / # #
    2023-07-27T06:50:06.995048  export SHELL=3D/bin/sh
    2023-07-27T06:50:06.995781  #
    2023-07-27T06:50:07.097327  / # export SHELL=3D/bin/sh. /lava-372295/en=
vironment
    2023-07-27T06:50:07.098061  =

    2023-07-27T06:50:07.199493  / # . /lava-372295/environment/lava-372295/=
bin/lava-test-runner /lava-372295/1
    2023-07-27T06:50:07.200664  =

    2023-07-27T06:50:07.220808  / # /lava-372295/bin/lava-test-runner /lava=
-372295/1
    2023-07-27T06:50:07.262666  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T06:50:07.276791  + cd /lava-372295/1/tests/1_bootrr =

    ... (41 line(s) more)  =


  * baseline.bootrr.imx-i2c-i2c0-probed: https://kernelci.org/test/case/id/=
64c213bd2749047e528ace23
        new failure (last pass: next-20230726)

    2023-07-27T06:50:09.314864  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:09.318130  <8>[   23.386779] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-i2c-i2c0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-i2c-i2c3-probed: https://kernelci.org/test/case/id/=
64c213bd2749047e528ace24
        new failure (last pass: next-20230726)

    2023-07-27T06:50:11.290349  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:11.290771  <8>[   25.444435] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-i2c-i2c3-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-i2c-i2c3-probed: https://kernelci.org/test/case/id/=
64c213bd2749047e528ace24
        new failure (last pass: next-20230726)

    2023-07-27T06:50:11.290349  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:11.290771  <8>[   25.444435] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-i2c-i2c3-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-uart-uart0-probed: https://kernelci.org/test/case/i=
d/64c213bd2749047e528ace26
        new failure (last pass: next-20230726)

    2023-07-27T06:50:12.299451  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:12.299866  <8>[   26.495875] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-uart-uart0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-uart-uart2-probed: https://kernelci.org/test/case/i=
d/64c213bd2749047e528ace28
        new failure (last pass: next-20230726)

    2023-07-27T06:50:13.312558  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:13.312977  <8>[   27.551057] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-uart-uart2-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/64c213bd2749047e528ace2a
        new failure (last pass: next-20230726)

    2023-07-27T06:50:14.321728  /lava-372295/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/64c=
213bd2749047e528ace2c
        new failure (last pass: next-20230726)

    2023-07-27T06:50:15.346795  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:15.347216  <8>[   29.654422] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-07-27T06:50:15.347525  /lava-372295/1/../bin/lava-test-case   =


  * baseline.bootrr.dwc3-usb0-probed: https://kernelci.org/test/case/id/64c=
213bd2749047e528ace2e
        new failure (last pass: next-20230726)

    2023-07-27T06:50:16.335134  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:16.338374  <8>[   30.705392] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/64c=
213bd2749047e528ace2f
        new failure (last pass: next-20230726)

    2023-07-27T06:50:17.348264  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:17.348699  <8>[   31.733799] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-07-27T06:50:17.349066  /lava-372295/1/../bin/lava-test-case   =


  * baseline.bootrr.imx2-wdt-driver-present: https://kernelci.org/test/case=
/id/64c213bd2749047e528ace33
        new failure (last pass: next-20230726)

    2023-07-27T06:50:18.384464  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:18.387738  <8>[   32.834504] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx2-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.imx-sdma-0-probed: https://kernelci.org/test/case/id/64=
c213bd2749047e528ace35
        new failure (last pass: next-20230726)

    2023-07-27T06:50:20.373647  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:20.376914  <8>[   34.911927] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-sdma-0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-sdma-1-probed: https://kernelci.org/test/case/id/64=
c213bd2749047e528ace36
        new failure (last pass: next-20230726)

    2023-07-27T06:50:21.386550  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:21.386710  <8>[   35.940334] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-sdma-1-probed RESULT=3Dfail>
    2023-07-27T06:50:21.387111  /lava-372295/1/../bin/lava-test-case   =


  * baseline.bootrr.sdhci-esdhc-imx-mmc0-probed: https://kernelci.org/test/=
case/id/64c213bd2749047e528ace3e
        new failure (last pass: next-20230726)

    2023-07-27T06:50:22.517833  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:22.521206  <8>[   37.140092] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsdhci-esdhc-imx-mmc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sdhci-esdhc-imx-mmc1-probed: https://kernelci.org/test/=
case/id/64c213bd2749047e528ace3f
        new failure (last pass: next-20230726)

    2023-07-27T06:50:23.505951  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:23.509326  <8>[   38.169825] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsdhci-esdhc-imx-mmc1-probed RESULT=3Dfail>
    2023-07-27T06:50:23.509749  /lava-372295/1/../bin/lava-test-case   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/64c213bd2749047e528ace41
        new failure (last pass: next-20230726)

    2023-07-27T06:50:24.515941  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:24.516366  <8>[   39.221730] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>   =


  * baseline.bootrr.reset-imx7-probed: https://kernelci.org/test/case/id/64=
c213bd2749047e528ace43
        new failure (last pass: next-20230726)

    2023-07-27T06:50:25.545711  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:25.546143  <8>[   40.273094] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dreset-imx7-probed RESULT=3Dfail>
    2023-07-27T06:50:25.546521  /lava-372295/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl-quadspi-spi0-probed: https://kernelci.org/test/case=
/id/64c213bd2749047e528ace45
        new failure (last pass: next-20230726)

    2023-07-27T06:50:26.534151  /lava-372295/1/../bin/lava-test-case   =


  * baseline.bootrr.pmic-pfuze100-probed: https://kernelci.org/test/case/id=
/64c213bd2749047e528ace47
        new failure (last pass: next-20230726)

    2023-07-27T06:50:27.544047  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:27.547214  <8>[   42.376607] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpmic-pfuze100-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/64c213bd2749047e528ace48
        new failure (last pass: next-20230726)

    2023-07-27T06:50:28.506472  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:28.529643  <8>[   43.401594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
64c213bd2749047e528ace49
        new failure (last pass: next-20230726)

    2023-07-27T06:50:29.509516  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:29.512795  <8>[   44.427077] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dblocked>
    2023-07-27T06:50:30.497609  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:30.500941  <8>[   45.452474] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.spi-nor-probed: https://kernelci.org/test/case/id/64c21=
3bd2749047e528ace4b
        new failure (last pass: next-20230726)

    2023-07-27T06:50:32.498818  /lava-372295/1/../bin/lava-test-case
    2023-07-27T06:50:32.498975  <8>[   47.528495] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dspi-nor-probed RESULT=3Dfail>
    2023-07-27T06:50:32.499089  + set<8>[   47.538943] <LAVA_SIGNAL_ENDRUN =
1_bootrr 372295_1.5.2.4.5>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 22         =


  Details:     https://kernelci.org/test/plan/id/64c20df442ffb311338ace2d

  Results:     27 PASS, 22 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20df442ffb311338ace30
        new failure (last pass: next-20230726)

    2023-07-27T06:25:14.564814  / # #
    2023-07-27T06:25:14.667050  export SHELL=3D/bin/sh
    2023-07-27T06:25:14.667780  #
    2023-07-27T06:25:14.769186  / # export SHELL=3D/bin/sh. /lava-372284/en=
vironment
    2023-07-27T06:25:14.769920  =

    2023-07-27T06:25:14.871339  / # . /lava-372284/environment/lava-372284/=
bin/lava-test-runner /lava-372284/1
    2023-07-27T06:25:14.872529  =

    2023-07-27T06:25:14.892088  / # /lava-372284/bin/lava-test-runner /lava=
-372284/1
    2023-07-27T06:25:14.934537  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T06:25:14.948052  + cd /lava-372284/1/tests/1_bootrr =

    ... (41 line(s) more)  =


  * baseline.bootrr.imx-i2c-i2c0-probed: https://kernelci.org/test/case/id/=
64c20df442ffb311338ace34
        new failure (last pass: next-20230726)

    2023-07-27T06:25:16.981054  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:16.984339  <8>[   22.359286] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-i2c-i2c0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-i2c-i2c3-probed: https://kernelci.org/test/case/id/=
64c20df442ffb311338ace35
        new failure (last pass: next-20230726)

    2023-07-27T06:25:18.983248  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:18.983672  <8>[   24.417336] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-i2c-i2c3-probed RESULT=3Dfail>
    2023-07-27T06:25:18.983981  /lava-372284/1/../bin/lava-test-case   =


  * baseline.bootrr.imx-i2c-i2c3-probed: https://kernelci.org/test/case/id/=
64c20df442ffb311338ace35
        new failure (last pass: next-20230726)

    2023-07-27T06:25:18.983248  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:18.983672  <8>[   24.417336] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-i2c-i2c3-probed RESULT=3Dfail>
    2023-07-27T06:25:18.983981  /lava-372284/1/../bin/lava-test-case   =


  * baseline.bootrr.imx-uart-uart0-probed: https://kernelci.org/test/case/i=
d/64c20df442ffb311338ace37
        new failure (last pass: next-20230726)

    2023-07-27T06:25:19.965941  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:19.969224  <8>[   25.468318] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-uart-uart0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-uart-uart2-probed: https://kernelci.org/test/case/i=
d/64c20df442ffb311338ace39
        new failure (last pass: next-20230726)

    2023-07-27T06:25:21.005470  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:21.005903  <8>[   26.523315] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-uart-uart2-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/64c20df442ffb311338ace3b
        new failure (last pass: next-20230726)

    2023-07-27T06:25:22.014993  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:22.015423  <8>[   27.574706] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/64c=
20df442ffb311338ace3d
        new failure (last pass: next-20230726)

    2023-07-27T06:25:23.018557  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:23.018979  <8>[   28.625899] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc3-usb0-probed: https://kernelci.org/test/case/id/64c=
20df442ffb311338ace3f
        new failure (last pass: next-20230726)

    2023-07-27T06:25:24.005167  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:24.008367  <8>[   29.676533] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/64c=
20df442ffb311338ace40
        new failure (last pass: next-20230726)

    2023-07-27T06:25:25.018868  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:25.019296  <8>[   30.704928] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-07-27T06:25:25.019650  /lava-372284/1/../bin/lava-test-case   =


  * baseline.bootrr.imx2-wdt-driver-present: https://kernelci.org/test/case=
/id/64c20df442ffb311338ace44
        new failure (last pass: next-20230726)

    2023-07-27T06:25:26.049293  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:26.051926  <8>[   31.805165] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx2-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.imx-sdma-0-probed: https://kernelci.org/test/case/id/64=
c20df442ffb311338ace46
        new failure (last pass: next-20230726)

    2023-07-27T06:25:28.042738  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:28.046000  <8>[   33.882108] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-sdma-0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-sdma-1-probed: https://kernelci.org/test/case/id/64=
c20df442ffb311338ace47
        new failure (last pass: next-20230726)

    2023-07-27T06:25:29.056177  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:29.056592  <8>[   34.910488] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-sdma-1-probed RESULT=3Dfail>
    2023-07-27T06:25:29.056893  /lava-372284/1/../bin/lava-test-case   =


  * baseline.bootrr.sdhci-esdhc-imx-mmc0-probed: https://kernelci.org/test/=
case/id/64c20df442ffb311338ace4f
        new failure (last pass: next-20230726)

    2023-07-27T06:25:30.186816  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:30.190523  <8>[   36.109709] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsdhci-esdhc-imx-mmc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sdhci-esdhc-imx-mmc1-probed: https://kernelci.org/test/=
case/id/64c20df442ffb311338ace50
        new failure (last pass: next-20230726)

    2023-07-27T06:25:31.175400  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:31.175815  <8>[   37.139272] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsdhci-esdhc-imx-mmc1-probed RESULT=3Dfail>   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/64c20df442ffb311338ace52
        new failure (last pass: next-20230726)

    2023-07-27T06:25:31.199440  <8>[   37.162089] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-driver-present RESULT=3Dpass>
    2023-07-27T06:25:32.205802  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:32.206260  <8>[   38.190695] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>   =


  * baseline.bootrr.reset-imx7-probed: https://kernelci.org/test/case/id/64=
c20df442ffb311338ace54
        new failure (last pass: next-20230726)

    2023-07-27T06:25:33.215523  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:33.215946  <8>[   39.242393] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dreset-imx7-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl-quadspi-spi0-probed: https://kernelci.org/test/case=
/id/64c20df442ffb311338ace56
        new failure (last pass: next-20230726)

    2023-07-27T06:25:34.225092  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:34.225517  <8>[   40.293531] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl-quadspi-spi0-probed RESULT=3Dfail>   =


  * baseline.bootrr.pmic-pfuze100-probed: https://kernelci.org/test/case/id=
/64c20df442ffb311338ace58
        new failure (last pass: next-20230726)

    2023-07-27T06:25:35.207407  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:35.210533  <8>[   41.345305] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpmic-pfuze100-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/64c20df442ffb311338ace59
        new failure (last pass: next-20230726)

    2023-07-27T06:25:36.196231  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:36.199575  <8>[   42.370226] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
64c20df442ffb311338ace5a
        new failure (last pass: next-20230726)

    2023-07-27T06:25:37.159112  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:37.181095  <8>[   43.395390] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dblocked>
    2023-07-27T06:25:38.160537  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:38.163770  <8>[   44.420735] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.spi-nor-probed: https://kernelci.org/test/case/id/64c20=
df442ffb311338ace5c
        new failure (last pass: next-20230726)

    2023-07-27T06:25:40.167666  /lava-372284/1/../bin/lava-test-case
    2023-07-27T06:25:40.168082  <8>[   46.496337] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dspi-nor-probed RESULT=3Dfail>
    2023-07-27T06:25:40.168383  + set<8>[   46.506894] <LAVA_SIGNAL_ENDRUN =
1_bootrr 372284_1.5.2.4.5>
    2023-07-27T06:25:40.168610   +x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20e0929e663c3698ace4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20e0929e663c3698ac=
e4f
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20fe342f3c5c8d18ace3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20fe342f3c5c8d18ac=
e3e
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c210465e06b0f2048ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c210465e06b0f2048ac=
e24
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2155cc1bf22e6ce8ace88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c2155cc1bf22e6ce8ac=
e89
        failing since 0 day (last pass: next-20230721, first fail: next-202=
30726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21660be2d66571f8ace93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c21660be2d66571f8ac=
e94
        new failure (last pass: next-20230725) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20def29e663c3698ace36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20def29e663c3698ac=
e37
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c210337c18e6adf18acea8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c210337c18e6adf18ac=
ea9
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21139f966ab8e628ace49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c21139f966ab8e628ac=
e4a
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20de99da0ac31f08ace3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20de99da0ac31f08ac=
e3d
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21131f966ab8e628ace35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c21131f966ab8e628ac=
e36
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20df377e6daa2e98ace64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20df377e6daa2e98ac=
e65
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2105b5e06b0f2048acf3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c2105b5e06b0f2048ac=
f3e
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c211c34f7309d1e58acf68

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c211c34f7309d1e58ac=
f69
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20de677e6daa2e98ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20de677e6daa2e98ac=
e23
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2103f09f92451148ace8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-qemu_arm64-virt-=
gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-qemu_arm64-virt-=
gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c2103f09f92451148ac=
e8f
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21132f966ab8e628ace43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c21132f966ab8e628ac=
e44
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20df19da0ac31f08ace44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20df19da0ac31f08ac=
e45
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21034561981a1978ace2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c21034561981a1978ac=
e30
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21137f966ab8e628ace46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c21137f966ab8e628ac=
e47
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20de59da0ac31f08ace36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20de59da0ac31f08ac=
e37
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2112eae71d1cc698acf97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c2112eae71d1cc698ac=
f98
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20df06525481abe8ace52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20df06525481abe8ac=
e53
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c210365e06b0f2048ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c210365e06b0f2048ac=
e1e
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2113af966ab8e628ace4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c2113af966ab8e628ac=
e4d
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20dfd6525481abe8ace58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c20dfd6525481abe8ac=
e59
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2103d5e06b0f2048ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-qemu_arm64-virt-=
gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-qemu_arm64-virt-=
gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c2103d5e06b0f2048ac=
e21
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2112fae71d1cc698acf9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c2112fae71d1cc698ac=
f9b
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2065f3f1bd33ff18ace56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c2065f3f1bd33ff18ac=
e57
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21627c7a01c41478ace1e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c21627c7a01c41478ace21
        failing since 9 days (last pass: next-20230710, first fail: next-20=
230717)

    2023-07-27T07:00:30.386716  / # #
    2023-07-27T07:00:31.849690  export SHELL=3D/bin/sh
    2023-07-27T07:00:31.870313  #
    2023-07-27T07:00:31.870520  / # export SHELL=3D/bin/sh
    2023-07-27T07:00:33.754938  / # . /lava-989524/environment
    2023-07-27T07:00:37.211108  /lava-989524/bin/lava-test-runner /lava-989=
524/1
    2023-07-27T07:00:37.231656  . /lava-989524/environment
    2023-07-27T07:00:37.231765  / # /lava-989524/bin/lava-test-runner /lava=
-989524/1
    2023-07-27T07:00:37.327958  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T07:00:37.328083  + cd /lava-989524/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2128e614e1725508ace96

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c2128e614e1725508ace99
        failing since 9 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-27T06:45:16.926050  / # #
    2023-07-27T06:45:18.387880  export SHELL=3D/bin/sh
    2023-07-27T06:45:18.408433  #
    2023-07-27T06:45:18.408644  / # export SHELL=3D/bin/sh
    2023-07-27T06:45:20.293595  / # . /lava-989510/environment
    2023-07-27T06:45:23.752899  /lava-989510/bin/lava-test-runner /lava-989=
510/1
    2023-07-27T06:45:23.773728  . /lava-989510/environment
    2023-07-27T06:45:23.773841  / # /lava-989510/bin/lava-test-runner /lava=
-989510/1
    2023-07-27T06:45:23.853987  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T06:45:23.854207  + cd /lava-989510/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c213e105369245268ace48

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c213e105369245268ace4b
        failing since 0 day (last pass: next-20230713, first fail: next-202=
30726)

    2023-07-27T06:50:53.217529  / # #
    2023-07-27T06:50:54.679547  export SHELL=3D/bin/sh
    2023-07-27T06:50:54.700119  #
    2023-07-27T06:50:54.700346  / # export SHELL=3D/bin/sh
    2023-07-27T06:50:56.585690  / # . /lava-989514/environment
    2023-07-27T06:51:00.041812  /lava-989514/bin/lava-test-runner /lava-989=
514/1
    2023-07-27T06:51:00.062573  . /lava-989514/environment
    2023-07-27T06:51:00.062684  / # /lava-989514/bin/lava-test-runner /lava=
-989514/1
    2023-07-27T06:51:00.145456  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T06:51:00.145676  + cd /lava-989514/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20e556a92b12fe78ace3d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20e556a92b12fe78ace40
        failing since 9 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-27T06:27:07.054690  / # #
    2023-07-27T06:27:08.517640  export SHELL=3D/bin/sh
    2023-07-27T06:27:08.538566  #
    2023-07-27T06:27:08.538852  / # export SHELL=3D/bin/sh
    2023-07-27T06:27:10.425503  / # . /lava-989483/environment
    2023-07-27T06:27:13.884706  /lava-989483/bin/lava-test-runner /lava-989=
483/1
    2023-07-27T06:27:13.905474  . /lava-989483/environment
    2023-07-27T06:27:13.905587  / # /lava-989483/bin/lava-test-runner /lava=
-989483/1
    2023-07-27T06:27:13.986951  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T06:27:13.987259  + cd /lava-989483/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21085561981a1978ace43

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c21085561981a1978ace46
        failing since 9 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-27T06:36:42.228193  / # #
    2023-07-27T06:36:43.690292  export SHELL=3D/bin/sh
    2023-07-27T06:36:43.710862  #
    2023-07-27T06:36:43.711067  / # export SHELL=3D/bin/sh
    2023-07-27T06:36:45.596221  / # . /lava-989495/environment
    2023-07-27T06:36:49.050418  /lava-989495/bin/lava-test-runner /lava-989=
495/1
    2023-07-27T06:36:49.070982  . /lava-989495/environment
    2023-07-27T06:36:49.071110  / # /lava-989495/bin/lava-test-runner /lava=
-989495/1
    2023-07-27T06:36:49.151577  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T06:36:49.151717  + cd /lava-989495/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2114e30b6456e548ace40

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c2114e30b6456e548ace43
        failing since 1 day (last pass: next-20230710, first fail: next-202=
30725)

    2023-07-27T06:39:55.058241  / # #
    2023-07-27T06:39:56.518770  export SHELL=3D/bin/sh
    2023-07-27T06:39:56.539268  #
    2023-07-27T06:39:56.539471  / # export SHELL=3D/bin/sh
    2023-07-27T06:39:58.421805  / # . /lava-989501/environment
    2023-07-27T06:40:01.875534  /lava-989501/bin/lava-test-runner /lava-989=
501/1
    2023-07-27T06:40:01.896278  . /lava-989501/environment
    2023-07-27T06:40:01.896389  / # /lava-989501/bin/lava-test-runner /lava=
-989501/1
    2023-07-27T06:40:01.938637  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-27T06:40:01.975313  + cd /lava-989501/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21296536a2a3fdd8ace62

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c21296536a2a3fdd8ace67
        failing since 9 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-27T06:45:34.621411  / # #

    2023-07-27T06:45:35.701678  export SHELL=3D/bin/sh

    2023-07-27T06:45:35.703540  #

    2023-07-27T06:45:37.194011  / # export SHELL=3D/bin/sh. /lava-11148994/=
environment

    2023-07-27T06:45:37.195998  =


    2023-07-27T06:45:39.921196  / # . /lava-11148994/environment/lava-11148=
994/bin/lava-test-runner /lava-11148994/1

    2023-07-27T06:45:39.923354  =


    2023-07-27T06:45:39.931422  / # /lava-11148994/bin/lava-test-runner /la=
va-11148994/1

    2023-07-27T06:45:39.990457  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T06:45:39.990918  + cd /lav<8>[   29.490685] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11148994_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c213d905369245268ace3b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c213d905369245268ace40
        failing since 0 day (last pass: next-20230713, first fail: next-202=
30726)

    2023-07-27T06:50:43.324672  / # #

    2023-07-27T06:50:44.404188  export SHELL=3D/bin/sh

    2023-07-27T06:50:44.405945  #

    2023-07-27T06:50:45.895955  / # export SHELL=3D/bin/sh. /lava-11149070/=
environment

    2023-07-27T06:50:45.897748  =


    2023-07-27T06:50:48.614947  / # . /lava-11149070/environment/lava-11149=
070/bin/lava-test-runner /lava-11149070/1

    2023-07-27T06:50:48.617085  =


    2023-07-27T06:50:48.617956  / # /lava-11149070/bin/lava-test-runner /la=
va-11149070/1

    2023-07-27T06:50:48.687147  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T06:50:48.687649  + cd /lava-111490<8>[   28.634038] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11149070_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20dfd9da0ac31f08ace4a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20dfd9da0ac31f08ace4f
        failing since 9 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-27T06:25:58.159120  / # #

    2023-07-27T06:25:59.238379  export SHELL=3D/bin/sh

    2023-07-27T06:25:59.240194  #

    2023-07-27T06:26:00.730437  / # export SHELL=3D/bin/sh. /lava-11148878/=
environment

    2023-07-27T06:26:00.732217  =


    2023-07-27T06:26:03.454961  / # . /lava-11148878/environment/lava-11148=
878/bin/lava-test-runner /lava-11148878/1

    2023-07-27T06:26:03.457408  =


    2023-07-27T06:26:03.468726  / # /lava-11148878/bin/lava-test-runner /la=
va-11148878/1

    2023-07-27T06:26:03.527631  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T06:26:03.528115  + cd /lava-111488<8>[   28.175952] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11148878_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2114330b6456e548ace25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c2114330b6456e548ace2a
        failing since 1 day (last pass: next-20230710, first fail: next-202=
30725)

    2023-07-27T06:39:59.797956  / # #

    2023-07-27T06:40:00.878401  export SHELL=3D/bin/sh

    2023-07-27T06:40:00.880359  #

    2023-07-27T06:40:02.371704  / # export SHELL=3D/bin/sh. /lava-11148973/=
environment

    2023-07-27T06:40:02.373596  =


    2023-07-27T06:40:02.425159  / # . /lava-11148973/environment
    2023-07-27T06:40:05.099488  /lava-11148973/bin/lava-test-runner /lava-1=
1148973/1

    2023-07-27T06:40:05.101845  =


    2023-07-27T06:40:05.105288  / # /lava-11148973/bin/lava-test-runner /la=
va-11148973/1

    2023-07-27T06:40:05.171102  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (45 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21285c8c83ca1c98ace23

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c21285c8c83ca1c98ace28
        failing since 9 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-27T06:46:40.355035  / # #

    2023-07-27T06:46:40.457095  export SHELL=3D/bin/sh

    2023-07-27T06:46:40.457805  #

    2023-07-27T06:46:40.559239  / # export SHELL=3D/bin/sh. /lava-11149001/=
environment

    2023-07-27T06:46:40.559961  =


    2023-07-27T06:46:40.661448  / # . /lava-11149001/environment/lava-11149=
001/bin/lava-test-runner /lava-11149001/1

    2023-07-27T06:46:40.662540  =


    2023-07-27T06:46:40.679534  / # /lava-11149001/bin/lava-test-runner /la=
va-11149001/1

    2023-07-27T06:46:40.755574  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T06:46:40.756083  + cd /lava-11149001/1/tests/1_boot<8>[   17=
.826586] <LAVA_SIGNAL_STARTRUN 1_bootrr 11149001_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c213b13fa6b560368acf3d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c213b13fa6b560368acf42
        failing since 0 day (last pass: next-20230713, first fail: next-202=
30726)

    2023-07-27T06:51:53.177146  / # #

    2023-07-27T06:51:53.279348  export SHELL=3D/bin/sh

    2023-07-27T06:51:53.280048  #

    2023-07-27T06:51:53.381517  / # export SHELL=3D/bin/sh. /lava-11149075/=
environment

    2023-07-27T06:51:53.382218  =


    2023-07-27T06:51:53.483634  / # . /lava-11149075/environment/lava-11149=
075/bin/lava-test-runner /lava-11149075/1

    2023-07-27T06:51:53.484798  =


    2023-07-27T06:51:53.501477  / # /lava-11149075/bin/lava-test-runner /la=
va-11149075/1

    2023-07-27T06:51:53.571645  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T06:51:53.572137  + cd /lava-11149075/1/tests/1_boot<8>[   17=
.010740] <LAVA_SIGNAL_STARTRUN 1_bootrr 11149075_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c20de96525481abe8ace44

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c20de96525481abe8ace49
        failing since 9 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-27T06:27:17.522807  / # #

    2023-07-27T06:27:17.625015  export SHELL=3D/bin/sh

    2023-07-27T06:27:17.625757  #<3>[   15.903036] dwmac-sun8i 5020000.ethe=
rnet: EMAC reset timeout

    2023-07-27T06:27:17.626164  <6>[   15.908995] dwmac-sun8i 5020000.ether=
net eth0: stmmac_dvr_remove: removing driver

    2023-07-27T06:27:17.626437  <4>[   15.937684] dwmac-sun8i: probe of 502=
0000.ethernet failed with error -110

    2023-07-27T06:27:17.626676  =


    2023-07-27T06:27:17.626907  / # <6>[   15.989781] ax88179_178a 1-1:1.0 =
eth0: register 'ax88179_178a' at usb-5311000.usb-1, ASIX AX88179 USB 3.0 Gi=
gabit Ethernet, 8c:ae:4c:e1:5d:0b

    2023-07-27T06:27:17.627147  ex<6>[   16.002908] usbcore: registered new=
 interface driver ax88179_178a

    2023-07-27T06:27:17.728392  port SHELL=3D/bin/sh. /lava-11148864/enviro=
nment

    2023-07-27T06:27:17.729168  =

 =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c21130f966ab8e628ace2a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230727/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c21130f966ab8e628ace2f
        failing since 1 day (last pass: next-20230710, first fail: next-202=
30725)

    2023-07-27T06:41:02.981590  / # #

    2023-07-27T06:41:03.083738  export SHELL=3D/bin/sh

    2023-07-27T06:41:03.084465  <6>[   16.465819] ax88179_178a 2-1:1.0 eth0=
: register 'ax88179_178a' at usb-5311000.usb-1, ASIX AX88179 USB 3.0 Gigabi=
t Ethernet, 8c:ae:4c:e1:5d:0b

    2023-07-27T06:41:03.084844  <6>[   16.478960] usbcore: registered new i=
nterface driver ax88179_178a

    2023-07-27T06:41:03.085150  #

    2023-07-27T06:41:03.186331  / # export SHELL=3D/bin/sh. /lava-11148968/=
environment

    2023-07-27T06:41:03.187050  =


    2023-07-27T06:41:03.288490  / # . /lava-11148968/environment/lava-11148=
968/bin/lava-test-runner /lava-11148968/1

    2023-07-27T06:41:03.289622  =


    2023-07-27T06:41:03.305680  / # /lava-11148968/bin/lava-test-runner /la=
va-11148968/1
 =

    ... (13 line(s) more)  =

 =20
