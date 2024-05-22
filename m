Return-Path: <linux-next+bounces-2380-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6848CBA54
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 06:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CC33B20D72
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 04:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6CF433C5;
	Wed, 22 May 2024 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="y7K50+KB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED65360
	for <linux-next@vger.kernel.org>; Wed, 22 May 2024 04:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716351885; cv=none; b=MKB+uDhgHg3yck/zaBIixR15iRAZKXDtrpkA9XcEauoqxisrYWAKTb/qL1qHi2h6mKfX6GjtLvDWJLYQLkQ0wupvANMgTIhraJFdtVagKCWERXsK79FAqPAsWvo1EYZUSeX3SGbb00fs2Tg8U58bVay1Rc5Ma64hV7+ccRv3cLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716351885; c=relaxed/simple;
	bh=mNaDl7nmgi9PZGnYORkkNC+8f0el2YDFMvqzfAMv3jY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=UDUmXNFpYdcameIdZFemx0jf8QwNQsaenQsjWj0gNv/Ohj5wP/BHAg0UU344buIAmSAvYsz0guiV+qNpntMOi1GLDYWjDOpundlZsKihF/+es0yVG5Ha8KDRuwz1m4Ni99NCH2X3M+ZbVPGFlmysNZFcjJzSnNEoOWdzDFOZQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=y7K50+KB; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-602801ea164so814127a12.0
        for <linux-next@vger.kernel.org>; Tue, 21 May 2024 21:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716351882; x=1716956682; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=43m9I3526BztTqG4edokiVyGtxPghjmu9A07gB0zP6Q=;
        b=y7K50+KBcHx6Hf2VzyYqDvdyv1zZAKkqV30oAcEzFWKMVchPNkNLi5DcR9OrBSlax4
         AREBKTiv9EhnMzuLyLWIX+00wVtCjqnXn72wxYEKW907MvRu0ps7Bptt7gla7vye4wWC
         AgStlCleEZmtPiVCZdIzqOTrncjKTjEDdwE97RXadU9ai7lckNgq/0TMZK/2Yl5VMG8A
         CZY1kTS+vPmfd2w0poeeA9dO3unhjBG6TSBkjhjG1Tpc119dSUKjfZwuV+icNuS/nt4h
         L0utDxoKwyJvfPi2oOfB6q/jGej+PjcaOqHLEz0Yw+d0SmJktV1IaK4fvhvYX7I5lp5L
         OkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716351882; x=1716956682;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43m9I3526BztTqG4edokiVyGtxPghjmu9A07gB0zP6Q=;
        b=a58pqsaYYlIQjlb3PzHTSsZ5ylmQagEM7qULwgXeJwRDlIV6vnOO5+vRyBWDRNSgLr
         zUG0RvYbyxfgScEu6290BeLn+Okcc+7erTMFIF+N0gaj6z1zOlZSrpBftXNSoDe39ByX
         hbMKxW+WywLBP+RpC/TWdP+dwBBVHcy9GexXEm+lbaHc4c/hq9pe8n3WaY8M1nRuUOM+
         Tqzhh8zUvM0OsZA7g6mfQXyFg6sF3MWTjqAeAjprkczmQRDLpnNTT85SuZTvAH3vfUIj
         d/oO6LPpYf5IeCK8uWfQJQgAMWnyTmDOaApvkFj3AQgH1LGfqdYW4WRaOE7KR6oqfsmF
         tR6w==
X-Gm-Message-State: AOJu0Yz9ZQTiP3aMvRrPDD1rkOV1om3AMMIKIb7WvLqzP/VnKmUeiycX
	hFpVNmtYoSRuuvhJgPUEFOE3m95auZsS1oegxhlJ3q6fCnOr/U411tkKLTJeNqjRlx4bHGQnFqD
	W7Xg=
X-Google-Smtp-Source: AGHT+IGJIZr+KTzey27KAdbqaRei/RSaZNenpq/IfqsyK8fsGDvfD73r07bPDJxxcfUhBbvpfIfmpQ==
X-Received: by 2002:a05:6a21:9207:b0:1b0:1be7:3705 with SMTP id adf61e73a8af0-1b1f88476c1mr1380791637.7.1716351882448;
        Tue, 21 May 2024 21:24:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bd93ee6f92sm2033625a91.32.2024.05.21.21.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 21:24:42 -0700 (PDT)
Message-ID: <664d738a.170a0220.4f3ce.5b71@mx.google.com>
Date: Tue, 21 May 2024 21:24:42 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-11085-g4a09d8e8118e
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 79 runs,
 5 regressions (v6.9-11085-g4a09d8e8118e)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 79 runs, 5 regressions (v6.9-11085-g4a09d8e811=
8e)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig | 1          =

hifive-unleashed-a00     | riscv | lab-baylibre    | gcc-10   | defconfig  =
        | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig  =
        | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-11085-g4a09d8e8118e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-11085-g4a09d8e8118e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4a09d8e8118e00b2089aa04b5d4efae89ec44787 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/664d4697223d9f83ea4c42dd

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bla=
ck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bla=
ck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/664d4697223d9f83=
ea4c42e2
        new failure (last pass: v6.9-10379-g312341eae7278)
        1 lines

    2024-05-22T01:12:36.656924  / # =

    2024-05-22T01:12:36.664811  =

    2024-05-22T01:12:36.769520  / # #
    2024-05-22T01:12:36.776765  #
    2024-05-22T01:12:36.878945  / # export SHELL=3D/bin/sh
    2024-05-22T01:12:36.888780  export SHELL=3D/bin/sh
    2024-05-22T01:12:36.990364  / # . /lava-1136453/environment
    2024-05-22T01:12:37.000593  . /lava-1136453/environment
    2024-05-22T01:12:37.102435  / # /lava-1136453/bin/lava-test-runner /lav=
a-1136453/0
    2024-05-22T01:12:37.112550  /lava-1136453/bin/lava-test-runner /lava-11=
36453/0 =

    ... (9 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
hifive-unleashed-a00     | riscv | lab-baylibre    | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/664d424c6e5e828ed74c4302

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed=
-a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed=
-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664d424c6e5e828ed74c4=
303
        failing since 2 days (last pass: v6.9-8349-g458b2d56b05c, first fai=
l: v6.9-9758-gebddc92261ee1) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/664d429c812d8fa1574c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoco=
mm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoco=
mm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664d429c812d8fa1574c4=
2de
        failing since 0 day (last pass: v6.9-9758-gebddc92261ee1, first fai=
l: v6.9-10379-g312341eae7278) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/664d4ae16832371b464c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664d4ae16832371b464c4=
2e3
        failing since 1 day (last pass: v6.9-8349-g458b2d56b05c, first fail=
: v6.9-9758-gebddc92261ee1) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/664d417280ea0d840c4c4307

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-11085-=
g4a09d8e8118e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664d417280ea0d840c4c4=
308
        failing since 57 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

