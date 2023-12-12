Return-Path: <linux-next+bounces-354-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF61C80E6A0
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 09:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E684B1C213A0
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 08:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4200933988;
	Tue, 12 Dec 2023 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kSYAY4XW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F905E3
	for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 00:49:25 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5c629a9fe79so2866726a12.3
        for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 00:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702370964; x=1702975764; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cCvilwcltMoZ+SIbBgU/8TqGF0HZUf35GohByg/nTBM=;
        b=kSYAY4XW9xyi33BEaI1Q+nN2KHcqa8G2Lq0cA/fFZHIfQqoOqz+h92Z6dC4XnqV7oH
         G2fcTJ7p5sx5TNmq/uuWHLzHtl1Rqwr2HoFAFNkIKtkP22b+oQVG1+dJ/k/UzDy48UJm
         7z6EaWnuUkgKViqk8YDN9c5T4ElaBs1g0B+FW/0fEjy/d6EHyUp9q07f6xGB3J8m0qkR
         n6wigonFDKGW4tUyprA2yLbYD1lIjxHBcUsC4mSjpK2rV6AzuucxpYLQj4oY4ge0NGYY
         UHMNyHqFejrQigX4xGePFnBkV+nfvyYFWRJaHGNlWImXDm68fs1NjzMmqrzQ4HThNbwP
         ngZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702370964; x=1702975764;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCvilwcltMoZ+SIbBgU/8TqGF0HZUf35GohByg/nTBM=;
        b=uYqarpts7ZjqML8XBgq0Y/MDyVPZi477p+XuNg4f5uUASslwy3XUqVj06xUOZ66PLu
         aFmBSgzuhPsCU7lyFShbS/W2yNDDfUoudaZVFeZ2OmrY0gkXhuvvjQ7NqNlmwk+0ua2G
         YC7AjolYfKymbbtOUrYY8Qhf8MXy219Lm+E5Nl9+hI7qAXPp/94jUFYccT+ROjxhNQ++
         MLrp5xFzNE3WzP0wtqqz2qm5dJZT/OORhebLxqqU+fI6367Ns5PMDQlssrVT7aqacEHb
         ZpjUZEw6F+Dt+O+MYBrFI1bVa/Wu8hKqkjuVMUZJEw3HwV0pSpZtfOI7/Fh67Blo25cF
         qiUA==
X-Gm-Message-State: AOJu0YzOSINu+6fbA92LfKHuAz70BzArCJGb03nDFL+Y3DPtLNmlaKoX
	Hzo4vjY4tQKCQmGLhXfmOzHE9dBQ4aLgStI9SKdMxQ==
X-Google-Smtp-Source: AGHT+IFwpIM23PapAIa1lI0Mt8c5Bzf6xb0ygJKb+vxEjHMVTYsCSRBpSIQ00fGjUPyZj2JA9aTXVg==
X-Received: by 2002:a05:6a21:1f05:b0:18f:97c:925d with SMTP id ry5-20020a056a211f0500b0018f097c925dmr2570343pzb.66.1702370964144;
        Tue, 12 Dec 2023 00:49:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902a70d00b001c726147a46sm8021153plq.234.2023.12.12.00.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:49:23 -0800 (PST)
Message-ID: <65781e93.170a0220.19e19.6fbf@mx.google.com>
Date: Tue, 12 Dec 2023 00:49:23 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc5-185-g633201d380c5e
Subject: next/pending-fixes baseline: 98 runs,
 5 regressions (v6.7-rc5-185-g633201d380c5e)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 98 runs, 5 regressions (v6.7-rc5-185-g633201d3=
80c5e)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
beaglebone-black      | arm   | lab-cip      | gcc-10   | multi_v7_defconfi=
g | 1          =

k3-am625-sk           | arm64 | lab-baylibre | gcc-10   | defconfig        =
  | 1          =

panda                 | arm   | lab-baylibre | gcc-10   | multi_v7_defconfi=
g | 1          =

sun7i-a20-cubieboard2 | arm   | lab-baylibre | gcc-10   | multi_v7_defconfi=
g | 1          =

sun7i-a20-cubieboard2 | arm   | lab-clabbe   | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc5-185-g633201d380c5e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc5-185-g633201d380c5e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      633201d380c5e2ae4efca694cc0b1a6ed50e4d81 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
beaglebone-black      | arm   | lab-cip      | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6577f329589d68ea18e13540

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6577f329589d68ea18e13=
541
        failing since 1 day (last pass: v6.7-rc4-412-ge142e0e4b174b, first =
fail: v6.7-rc4-604-g5336570f87c90) =

 =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
k3-am625-sk           | arm64 | lab-baylibre | gcc-10   | defconfig        =
  | 1          =


  Details:     https://kernelci.org/test/plan/id/6577ee1f049e881522e134de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6577ee1f049e881522e13=
4df
        new failure (last pass: v6.7-rc4-604-g5336570f87c90) =

 =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
panda                 | arm   | lab-baylibre | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6577edc9cd7d267b7de13487

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6577edc9cd7d267b7de13490
        failing since 5 days (last pass: v6.0-12387-ge54e01f1826aa, first f=
ail: v6.7-rc4-354-g2e06d594f8593)

    2023-12-12T05:20:50.600791  <8>[   13.787139] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3876264_1.5.2.4.1>
    2023-12-12T05:20:50.707552  / # #
    2023-12-12T05:20:50.808838  export SHELL=3D/bin/sh
    2023-12-12T05:20:50.809311  #
    2023-12-12T05:20:50.910120  / # export SHELL=3D/bin/sh. /lava-3876264/e=
nvironment
    2023-12-12T05:20:50.910490  =

    2023-12-12T05:20:51.011301  / # . /lava-3876264/environment/lava-387626=
4/bin/lava-test-runner /lava-3876264/1
    2023-12-12T05:20:51.011906  =

    2023-12-12T05:20:51.016676  / # /lava-3876264/bin/lava-test-runner /lav=
a-3876264/1
    2023-12-12T05:20:51.081345  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
sun7i-a20-cubieboard2 | arm   | lab-baylibre | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6577edc0e07a1ce8a2e13485

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6577edc0e07a1ce8a2e1348e
        failing since 27 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-12T05:20:47.412883  + set +x
    2023-12-12T05:20:47.413522  <8>[   14.238749] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3876263_1.5.2.4.1>
    2023-12-12T05:20:47.521899  / # #
    2023-12-12T05:20:47.624485  export SHELL=3D/bin/sh
    2023-12-12T05:20:47.625379  #
    2023-12-12T05:20:47.726898  / # export SHELL=3D/bin/sh. /lava-3876263/e=
nvironment
    2023-12-12T05:20:47.727867  =

    2023-12-12T05:20:47.829419  / # . /lava-3876263/environment/lava-387626=
3/bin/lava-test-runner /lava-3876263/1
    2023-12-12T05:20:47.830825  =

    2023-12-12T05:20:47.845024  / # /lava-3876263/bin/lava-test-runner /lav=
a-3876263/1 =

    ... (12 line(s) more)  =

 =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
sun7i-a20-cubieboard2 | arm   | lab-clabbe   | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6577edc0d8c1abccd6e13491

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-18=
5-g633201d380c5e/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6577edc0d8c1abccd6e1349a
        failing since 27 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-12T05:20:44.872402  + set +x[   18.741271] <LAVA_SIGNAL_ENDRUN =
0_dmesg 447682_1.5.2.4.1>
    2023-12-12T05:20:44.872748  =

    2023-12-12T05:20:44.980887  / # #
    2023-12-12T05:20:45.082616  export SHELL=3D/bin/sh
    2023-12-12T05:20:45.083200  #
    2023-12-12T05:20:45.184227  / # export SHELL=3D/bin/sh. /lava-447682/en=
vironment
    2023-12-12T05:20:45.184925  =

    2023-12-12T05:20:45.286112  / # . /lava-447682/environment/lava-447682/=
bin/lava-test-runner /lava-447682/1
    2023-12-12T05:20:45.286942  =

    2023-12-12T05:20:45.289630  / # /lava-447682/bin/lava-test-runner /lava=
-447682/1 =

    ... (12 line(s) more)  =

 =20

