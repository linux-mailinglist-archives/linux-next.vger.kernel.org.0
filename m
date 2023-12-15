Return-Path: <linux-next+bounces-403-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E78141A4
	for <lists+linux-next@lfdr.de>; Fri, 15 Dec 2023 07:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A31E281E6A
	for <lists+linux-next@lfdr.de>; Fri, 15 Dec 2023 06:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8602748A;
	Fri, 15 Dec 2023 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dOPinwwp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A49746B
	for <linux-next@vger.kernel.org>; Fri, 15 Dec 2023 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5c690c3d113so298853a12.1
        for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 22:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702620125; x=1703224925; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FzL+YXZ8vEJbYnf0isrXwz4zALsdV0W8Nz6fc1p97/4=;
        b=dOPinwwpnAuEDLgAOL8SlCQSLjfhsAkKt5drhzyKzuCeRWegiadGhXqeJIk8KTnV2d
         QzaV/Q8gd+J97h3m8m5oHDE/B8txQXxS17fILgVcCAqNYcR9JJUzQ9rNn0b01yT2u9uf
         gKpc63/h5jy1CsGkH/cXQJNDaldI0UKHhAQMJuog2P0f8DsxswGAX5+ToGFzxblGPV1D
         TzcoT0uGsi50efeAQkPdPaAHwNLrUenrj0+eNwXto1grvvBKt8Jigg9EmmoxzIWGT1GJ
         W1MfY0O+fC5kt1V/pmzz918rwm8NY/8cmXcthO+V+wRqz1PVKpN2dhbj9iaFCBaRZsgw
         XI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702620125; x=1703224925;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzL+YXZ8vEJbYnf0isrXwz4zALsdV0W8Nz6fc1p97/4=;
        b=Gs+j8N+VQeGbMFSwTSy3XmibKezkwz1qwfhcFdDLVTX2gjW3fZHcIIwZPmCo4RYILF
         ynO99geJAo4AEd5XIzTf5nAZxSAIuLBgtFg/oLVPtX9t0Tj1ngoTkDPo/7q0BXMYLj3y
         /j5f5x4ZbkJVkuNOkSF14//N5LovUgn2e2+nDtPkKFGk9UnfmAPcnPY/o+DSF8mZFNyK
         CldXzNrNmsTMkgoBerVlQTvccrOozpJAeeit+htAn+0ybp+AEPZe4Joy9xHJfYqzSXge
         PR4sQSQDRhaaSS2rWHuGO0c2Zsp2CDbkiJqJqBiUKjfuktCPonZZoN2oyGVi4dqOs0xm
         KjwA==
X-Gm-Message-State: AOJu0Yw8qtIEGqI9XoIehEMIymlAG2aAcjl1ETvAAFSDKKhv7HtLJrjU
	CUqcIlWD77D+7W8ZY2CqwEHb2X1LUoa5+mmj6qA=
X-Google-Smtp-Source: AGHT+IGpSYiCEUyL6D1H6cH8+nSjdTroDg+fYroP1HMP+CE5/8hqzM8aWo8SGjdmm03qULrW1rmvcQ==
X-Received: by 2002:a17:90b:8d7:b0:28b:ed5:ed3c with SMTP id ds23-20020a17090b08d700b0028b0ed5ed3cmr1262735pjb.97.1702620124642;
        Thu, 14 Dec 2023 22:02:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id pa8-20020a17090b264800b0027df6ff00eesm14192405pjb.19.2023.12.14.22.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 22:02:04 -0800 (PST)
Message-ID: <657bebdc.170a0220.dcd24.d3c7@mx.google.com>
Date: Thu, 14 Dec 2023 22:02:04 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc5-313-g501631e4f287a
Subject: next/pending-fixes baseline: 107 runs,
 6 regressions (v6.7-rc5-313-g501631e4f287a)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 107 runs, 6 regressions (v6.7-rc5-313-g501631e=
4f287a)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
beaglebone-black      | arm   | lab-cip       | gcc-10   | multi_v7_defconf=
ig | 1          =

k3-am625-sk           | arm64 | lab-baylibre  | gcc-10   | defconfig       =
   | 1          =

panda                 | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =

rk3399-rock-pi-4b     | arm64 | lab-collabora | gcc-10   | defconfig       =
   | 1          =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =

sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc5-313-g501631e4f287a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc5-313-g501631e4f287a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      501631e4f287a33cbadd40c7a8ae137a125b0ca1 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
beaglebone-black      | arm   | lab-cip       | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/657bc17ca687d7d84ee13487

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657bc17ca687d7d84ee13=
488
        new failure (last pass: v6.7-rc5-272-gc68cf4cd434e0) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
k3-am625-sk           | arm64 | lab-baylibre  | gcc-10   | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/657bbc47f9222fe3b0e136be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657bbc47f9222fe3b0e13=
6bf
        new failure (last pass: v6.7-rc5-272-gc68cf4cd434e0) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
panda                 | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/657bbafe1f731f8817e1348b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657bbafe1f731f8817e13490
        failing since 8 days (last pass: v6.0-12387-ge54e01f1826aa, first f=
ail: v6.7-rc4-354-g2e06d594f8593)

    2023-12-15T02:33:09.647488  <8>[   13.492645] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3881548_1.5.2.4.1>
    2023-12-15T02:33:09.755313  / # #
    2023-12-15T02:33:09.857128  export SHELL=3D/bin/sh
    2023-12-15T02:33:09.857646  #
    2023-12-15T02:33:09.958495  / # export SHELL=3D/bin/sh. /lava-3881548/e=
nvironment
    2023-12-15T02:33:09.958996  =

    2023-12-15T02:33:10.059864  / # . /lava-3881548/environment/lava-388154=
8/bin/lava-test-runner /lava-3881548/1
    2023-12-15T02:33:10.060595  =

    2023-12-15T02:33:10.065724  / # /lava-3881548/bin/lava-test-runner /lav=
a-3881548/1
    2023-12-15T02:33:10.129668  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
rk3399-rock-pi-4b     | arm64 | lab-collabora | gcc-10   | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/657bbbcd8b244165e3e13481

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657bbbcd8b244165e3e13=
482
        new failure (last pass: v6.7-rc5-272-gc68cf4cd434e0) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/657bbb52653229e0f6e1350c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657bbb52653229e0f6e13511
        failing since 30 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-15T02:34:43.550454  <8>[   13.908159] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3881552_1.5.2.4.1>
    2023-12-15T02:34:43.667619  / # #
    2023-12-15T02:34:43.770783  export SHELL=3D/bin/sh
    2023-12-15T02:34:43.771302  #
    2023-12-15T02:34:43.872191  / # export SHELL=3D/bin/sh. /lava-3881552/e=
nvironment
    2023-12-15T02:34:43.872655  =

    2023-12-15T02:34:43.973530  / # . /lava-3881552/environment/lava-388155=
2/bin/lava-test-runner /lava-3881552/1
    2023-12-15T02:34:43.974053  =

    2023-12-15T02:34:44.015849  / # /lava-3881552/bin/lava-test-runner /lav=
a-3881552/1
    2023-12-15T02:34:44.117480  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/657bbafc1f731f8817e13480

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-31=
3-g501631e4f287a/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657bbafc1f731f8817e13485
        failing since 30 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-15T02:33:16.313273  + set +x
    2023-12-15T02:33:16.315060  [   22.021530] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448154_1.5.2.4.1>
    2023-12-15T02:33:16.423740  / # #
    2023-12-15T02:33:16.525362  export SHELL=3D/bin/sh
    2023-12-15T02:33:16.525943  #
    2023-12-15T02:33:16.626995  / # export SHELL=3D/bin/sh. /lava-448154/en=
vironment
    2023-12-15T02:33:16.627532  =

    2023-12-15T02:33:16.728578  / # . /lava-448154/environment/lava-448154/=
bin/lava-test-runner /lava-448154/1
    2023-12-15T02:33:16.729414  =

    2023-12-15T02:33:16.732123  / # /lava-448154/bin/lava-test-runner /lava=
-448154/1 =

    ... (12 line(s) more)  =

 =20

