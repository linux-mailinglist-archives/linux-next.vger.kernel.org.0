Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096DA4A54F8
	for <lists+linux-next@lfdr.de>; Tue,  1 Feb 2022 03:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbiBACBB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jan 2022 21:01:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbiBACAQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jan 2022 21:00:16 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A45C061773
        for <linux-next@vger.kernel.org>; Mon, 31 Jan 2022 18:00:00 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id o64so15704168pjo.2
        for <linux-next@vger.kernel.org>; Mon, 31 Jan 2022 18:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2FYw8a7CMtXn8+a9I+82pd4O2tuVIDj9mfKxEF3PYqI=;
        b=VYGK+T8FNwB5Vq1RtL7cax9Yy5dZILM3o8o9e2mS5Ndb/yn0Y2cDOFdQ8R9Tih6ujf
         tIyUnEXZd+w0Sp0UT6IdewzDchatyU49cmlBTS/5fIqmiKcvE7ThDdjt1jNZnl2nqWND
         7fFMm7fvqsYRaXwQdMb9aneDAVKxIUImRisZZDL8P5XafARtpldlT6dFxxB0BD6OlXnw
         dqQ47CCBkNULhPNWNYHVKzJd9awGYxlCY2rKieRXtLHuq4GzsEVixGoJO2X1SRuQPjQk
         Cu+fie40LtcFL8bIQbb9Eb1b182837eVXKWj65nQqNy20EQ+VdN6fL/+h8vbF7DMlc17
         8PRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2FYw8a7CMtXn8+a9I+82pd4O2tuVIDj9mfKxEF3PYqI=;
        b=LPdyXfPZI5sQTJbigUKdD23GDdTgnGXavnlOiEPQNzGb2iEkdM9cKSxKLvf4S6aHe/
         TmCC6/i0pLtMD265ycI9LxjhwSWfuf4xgHZcdFvSRElrec4tlLOkEORZNq02Z94TMX+O
         /tjYDtzKj019p/dT23DEjejNl0qMvYmTrVpslLsfZh217fniOhO+V1z3XaG99VgDS2lc
         w6Wq0aaVhLLwsQ+pxZH3PzsuoQZ5tZFFlGLnXyLG7+gx9P2DMJ31ZfwyktNSuJb7eNXi
         rem5YKgtxpZubMbxPr8tx2AzUtUA90NdtqMgHQoP06dElmtx/NabaZv++SIhc2j8N9y2
         qYkA==
X-Gm-Message-State: AOAM5331xBff8w/HbuNfm6kA5j/ES0a8Xy995q8hZaFLgJQtWFS9gmxn
        JcuNTIKSW5Uu+nNe2DvN1A8j2PGK0vnbeIhn
X-Google-Smtp-Source: ABdhPJzCwspncK+nH8yLVZunM0M54O0kH7Q8B7CdF0rx0yPaSt/ey355BJMt7OUdmJb2eKaKDQ+dUg==
X-Received: by 2002:a17:902:6847:: with SMTP id f7mr2027450pln.26.1643680799531;
        Mon, 31 Jan 2022 17:59:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y15sm19877671pfi.87.2022.01.31.17.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 17:59:59 -0800 (PST)
Message-ID: <61f8941f.1c69fb81.f72cc.5067@mx.google.com>
Date:   Mon, 31 Jan 2022 17:59:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220131
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: next/master baseline: 622 runs, 11 regressions (next-20220131)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 622 runs, 11 regressions (next-20220131)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1043a-rdb            | arm64 | lab-nxp       | clang-14 | defconfig  =
                  | 1          =

meson-gxbb-p200            | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 2          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220131/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220131
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      887a333c44eb67973622e530e43cd5e4cf9af927 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1043a-rdb            | arm64 | lab-nxp       | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/61f85e0a6b76caa4045d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig/clang-14/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig/clang-14/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f85e0a6b76caa4045d6=
ee9
        new failure (last pass: next-20220128) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f86917094111cb2e5d6f0b

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/61f86917094111cb=
2e5d6f11
        new failure (last pass: next-20220127)
        1 lines

    2022-01-31T22:55:57.108520  / # =

    2022-01-31T22:55:57.229060  #
    2022-01-31T22:55:57.335755  export SHELL=3D/bin/sh
    2022-01-31T22:55:57.337723  =

    2022-01-31T22:55:57.339059  / # #
    2022-01-31T22:55:57.442853  / # export SHELL=3D/bin/sh. /lava-1474535/e=
nvironment
    2022-01-31T22:55:57.546876  /lava-1474535/bin/lava-test-runner /lava-14=
74535/0
    2022-01-31T22:55:57.552956  =

    2022-01-31T22:55:57.554190  / # . /lava-1474535/environment
    2022-01-31T22:55:57.557217  / # /lava-1474535/bin/lava-test-runner /lav=
a-1474535/0 =

    ... (8 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f86917094111c=
b2e5d6f13
        new failure (last pass: next-20220127)
        2 lines

    2022-01-31T22:55:57.687003  <8>[   15.510978] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-01-31T22:55:57.688244  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2022-01-31T22:55:57.689479  kern  :emerg : Code: d2800028 d2e02809 f2e0=
0808 17ffffd1 (d4210000<8>[   15.532401] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-01-31T22:55:57.690792  ) =

    2022-01-31T22:55:57.692026  + set +x
    2022-01-31T22:55:57.693276  <8>[   15.541180] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1474535_1.5.2.4.1>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f85d2d915b5ec8875d6f1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f85d2d915b5ec8875d6=
f1b
        failing since 48 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f86325a1a0d9a3d45d6eed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f86325a1a0d9a3d45d6=
eee
        failing since 48 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f866cd433d9225325d6ef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f866cd433d9225325d6=
ef5
        failing since 48 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f85d05e48a1edff25d6f15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f85d05e48a1edff25d6=
f16
        failing since 47 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f862f662d3b807065d6ef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f862f662d3b807065d6=
ef8
        failing since 47 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f866c560b75fcaea5d6f3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f866c560b75fcaea5d6=
f3d
        failing since 47 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/61f860f00966c136d05d6f0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f860f00966c136d05d6=
f0f
        new failure (last pass: next-20220128) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61f85f0316d517ee435d6f12

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220131/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/61f85f0316d517ee435d6f34
        failing since 7 days (last pass: next-20220121, first fail: next-20=
220124)

    2022-01-31T22:13:04.186717  <4>[   22.893907] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-01-31T22:13:04.820335  /lava-5576348/1/../bin/lava-test-case
    2022-01-31T22:13:04.831182  <8>[   23.539766] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
