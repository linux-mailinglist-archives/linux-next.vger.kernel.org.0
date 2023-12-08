Return-Path: <linux-next+bounces-284-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F059D809ABA
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 04:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10C631C20A10
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 03:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAED046B3;
	Fri,  8 Dec 2023 03:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dG9yznR0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AFB1709
	for <linux-next@vger.kernel.org>; Thu,  7 Dec 2023 19:57:39 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5908a63a83fso154289eaf.1
        for <linux-next@vger.kernel.org>; Thu, 07 Dec 2023 19:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702007858; x=1702612658; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=31jkyjJRI8Qn8PoED4IOoft8boScMbIWPL2wHhnCPAs=;
        b=dG9yznR0zaGJXRWrG9C05VDCZI3o9wiRuBOndszgYu9B9lHszu1Vvi6puUaKnEMoEW
         GPNe/7mMp9F5awi1IjhwFk1qgAVuUqVkbqlZk4uXu6NTsJPHyUyTWgejruvnzr0vs51i
         0OjJhlEYHfBjDs7iM1/1Wjz5epZKyobyv77su3Gao4QfY8lyJOUlCY/wSkQuuN2OOaTy
         /u/+NLQxxcTZwDsMEhdG/NIM6a5FNTJx4TZqmDmG1p0F+ajrqJCTQaS/qsyPEpgpDHEK
         qMWPsKP8srtSI+6QnDvj/7Redy7JAbpb/Gr9s3pcM23XS7+mrDNRZ0VYIYvtUKNExNod
         GJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702007858; x=1702612658;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31jkyjJRI8Qn8PoED4IOoft8boScMbIWPL2wHhnCPAs=;
        b=GdK3X/v5vvUlLcPtpwyFsUzd1hHqEBVkprvDwY1BtboHbTTiEInIVHm5+g8YWIbOIT
         3ymF4P0ykYW6FblEOdwRaFYd1O5WPUVEljph0EhZ1OOftwx9PDxt1JjfSVTlbksvo4ZS
         Mwp04DW/UEgaztUpaAUVip5W02qIxjD1ygLesrcfFFCCa9iiniXyAV7FYmUMhWsB+OvW
         U/Ybc8csrAUlDpQii70XRYlZfYk/B5PWIvAeKN7dXN/DGc4Ol5Idh7on2ALKF6jHbivO
         zWkgWR2V4GNmYE879wWFdje07s8OEirdW789ebXi9mIbdWZRiUuudeUiKQSNkWxxSocN
         sgYA==
X-Gm-Message-State: AOJu0Yz3O5EH7wfXjyIMBE8rqLqMp7rdA9g1hSX2+rj+0k5z1NN/gTLi
	8JEuN3vc9XYfJup3xtnHiRckJ937SKmNz/C0P1ySxA==
X-Google-Smtp-Source: AGHT+IEcHPeMesk1pNtsI/3a7TUUtTqu0wMHEHImYwtpxmTkJEC+NsDzzUOo2YxkPdBFB1tPW8Trww==
X-Received: by 2002:a05:6358:720f:b0:16d:fd30:6d14 with SMTP id h15-20020a056358720f00b0016dfd306d14mr5336680rwa.17.1702007857990;
        Thu, 07 Dec 2023 19:57:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x1-20020a63cc01000000b005742092c211sm541561pgf.64.2023.12.07.19.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 19:57:37 -0800 (PST)
Message-ID: <65729431.630a0220.4bfa4.268f@mx.google.com>
Date: Thu, 07 Dec 2023 19:57:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc4-412-ge142e0e4b174b
Subject: next/pending-fixes baseline: 101 runs,
 3 regressions (v6.7-rc4-412-ge142e0e4b174b)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 101 runs, 3 regressions (v6.7-rc4-412-ge142e0e=
4b174b)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
panda                 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc4-412-ge142e0e4b174b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc4-412-ge142e0e4b174b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e142e0e4b174b269d1fd400aa676c5f0483b608c =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
panda                 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6572636a0babb27d3de13499

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-41=
2-ge142e0e4b174b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-41=
2-ge142e0e4b174b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6572636a0babb27d3de134a2
        failing since 0 day (last pass: v6.0-12387-ge54e01f1826aa, first fa=
il: v6.7-rc4-354-g2e06d594f8593)

    2023-12-08T00:29:05.040260  <8>[   13.963348] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3864988_1.5.2.4.1>
    2023-12-08T00:29:05.146937  / # #
    2023-12-08T00:29:05.248048  export SHELL=3D/bin/sh
    2023-12-08T00:29:05.248432  #
    2023-12-08T00:29:05.349194  / # export SHELL=3D/bin/sh. /lava-3864988/e=
nvironment
    2023-12-08T00:29:05.349539  =

    2023-12-08T00:29:05.450314  / # . /lava-3864988/environment/lava-386498=
8/bin/lava-test-runner /lava-3864988/1
    2023-12-08T00:29:05.450886  =

    2023-12-08T00:29:05.456010  / # /lava-3864988/bin/lava-test-runner /lav=
a-3864988/1
    2023-12-08T00:29:05.520852  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6572638b7fbc42dc10e13476

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-41=
2-ge142e0e4b174b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-41=
2-ge142e0e4b174b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6572638b7fbc42dc10e1347f
        failing since 23 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-08T00:29:28.186239  <8>[   14.248549] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3864994_1.5.2.4.1>
    2023-12-08T00:29:28.292552  / # #
    2023-12-08T00:29:28.395512  export SHELL=3D/bin/sh
    2023-12-08T00:29:28.396103  #
    2023-12-08T00:29:28.496957  / # export SHELL=3D/bin/sh. /lava-3864994/e=
nvironment
    2023-12-08T00:29:28.497558  =

    2023-12-08T00:29:28.598406  / # . /lava-3864994/environment/lava-386499=
4/bin/lava-test-runner /lava-3864994/1
    2023-12-08T00:29:28.599225  =

    2023-12-08T00:29:28.618859  / # /lava-3864994/bin/lava-test-runner /lav=
a-3864994/1
    2023-12-08T00:29:28.739796  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6572635a0adec07ef9e13574

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-41=
2-ge142e0e4b174b/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-41=
2-ge142e0e4b174b/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6572635a0adec07ef9e1357d
        failing since 23 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-08T00:28:50.260725  + set +x
    2023-12-08T00:28:50.262469  [   20.474631] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446934_1.5.2.4.1>
    2023-12-08T00:28:50.371109  / # #
    2023-12-08T00:28:50.472796  export SHELL=3D/bin/sh
    2023-12-08T00:28:50.473352  #
    2023-12-08T00:28:50.574342  / # export SHELL=3D/bin/sh. /lava-446934/en=
vironment
    2023-12-08T00:28:50.574893  =

    2023-12-08T00:28:50.675902  / # . /lava-446934/environment/lava-446934/=
bin/lava-test-runner /lava-446934/1
    2023-12-08T00:28:50.676761  =

    2023-12-08T00:28:50.682632  / # /lava-446934/bin/lava-test-runner /lava=
-446934/1 =

    ... (12 line(s) more)  =

 =20

