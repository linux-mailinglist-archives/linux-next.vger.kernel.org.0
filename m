Return-Path: <linux-next+bounces-1973-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84F8AA4CC
	for <lists+linux-next@lfdr.de>; Thu, 18 Apr 2024 23:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F0E1F2254A
	for <lists+linux-next@lfdr.de>; Thu, 18 Apr 2024 21:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0D9180A67;
	Thu, 18 Apr 2024 21:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Vhl9dZTC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3D8199E87
	for <linux-next@vger.kernel.org>; Thu, 18 Apr 2024 21:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713476476; cv=none; b=flab5N+8CGN9bfYR5a6Of91Qf+4xHT7JeNkIte2bCAzON2vyYJMVko+TQN2USzkpMaLAU/4heIs6BJekflVMsLrurifKboZJB37r9NcPWsoMCH2aQVH3Ww2C7neKK0Ipj63ZdmqPKpdnBG6CJ+qzexx62xQXrWbjDKf4kSHu7l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713476476; c=relaxed/simple;
	bh=nDZ+Oh3JLIR2Q+eXJZcFbPRUSPeQb2PnJNYL0aWLSQk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=QeAKAWqBBYX7MyWtYvhmNfOaWUlGvs4CgQBkBQWhpjKnogC0vlAf144XApMzJkJtFeLxfyDamiq+l2daxP5lqjPX/orWCfPjkIGi3khdm/pwyKyIsexq7CVtl8pD4W0IVdJktna8XDmLNq2fZ8fYXcsQyn0jhPXa8fUlDL6BVTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Vhl9dZTC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6eff9dc1821so1474342b3a.3
        for <linux-next@vger.kernel.org>; Thu, 18 Apr 2024 14:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713476474; x=1714081274; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bxGRBLa1eQjwtnlJN5DBNBFNQ7r/5UwLd/s/myTpEz0=;
        b=Vhl9dZTCUmKbHCZ/RHpwhHxGDM//ZMzQq/fymFwyGmWKd0qw/fwOyI1kDaBRzdcjyj
         Uk83kdVrENFTQLwN0mMA54/wvfDYfKFyASO0PReVyLzPkWX6VgPFV1Fa341Co7KrQm7B
         AgBtn9UPG6nRriUeztTw7FyBbe1vsCAHga3l6zQhLAmD2zDJZdRi79QZNmOzXqqu3w+x
         SqwlLlluubXCwJXPP92ptYLXwXAsPfSMQEkmOf+vKsGMy/eznT80MaOqfNadShEUl+KL
         pxGjMVRPnbwrimY5hUFuvKjx9kN/IAzEBhp1Q4Z2i2FLaNrSb8h2CtodZlIBSfVIPYds
         Z5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713476474; x=1714081274;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxGRBLa1eQjwtnlJN5DBNBFNQ7r/5UwLd/s/myTpEz0=;
        b=rrk8+R4fawPc7nblPfSZ3D5M3ZwVNsQxmHygFqzkMxz5U8RTW+39CbaW5uyU0IIcUR
         WY6zTIhxj7OzST07+BszY1+yd5lxdgQI95tu/pZso8kHmyHuAIdAcfbRYd2WPQv7z0Rt
         0X3wxF/LyO8M6sGQtX/LfDCnn3/mKvkJ4lWAiMLgmOZQCT/HlHVhE1FqcG0UydiJ7a8A
         S1/+x0XmDW5F6TA4KsQqpalnr436fBqngjGqkhsL6DhfKDeURU23UEUX+aJKOaFYFZvP
         3jVV4xCSEW9XFA2XoXc5XFnRU+ZMxCerIwyJbrrMAo0J8YxJIr4WfgCFiiQ8tsQMvGHl
         TAVg==
X-Gm-Message-State: AOJu0YwoaCL24j1SlzhbKG1puxHDfnYjE7x4GZkXstqBvJnLev7z7Z1c
	oJ+hsZOrcyLJpEqEN7vt7fyKDWBdn7tcbCSLcmkoZsAnOatRjHm0vNK11D2ToBBlsb2M8YUlp+X
	O
X-Google-Smtp-Source: AGHT+IFg2wOGUTiVgpOpIX+l54fVoB6rUaLr8stYMW981CbD8APXIpeXFWkPw4jIadTyJb6qmXMZGQ==
X-Received: by 2002:a05:6a00:842:b0:6ea:df6a:39e7 with SMTP id q2-20020a056a00084200b006eadf6a39e7mr483076pfk.13.1713476473667;
        Thu, 18 Apr 2024 14:41:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 17-20020a056a00073100b006eadc87233dsm1955765pfm.165.2024.04.18.14.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 14:41:13 -0700 (PDT)
Message-ID: <66219379.050a0220.ff1ee.72c8@mx.google.com>
Date: Thu, 18 Apr 2024 14:41:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20240418
X-Kernelci-Report-Type: test
Subject: next/master baseline: 175 runs, 7 regressions (next-20240418)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 175 runs, 7 regressions (next-20240418)

Regressions Summary
-------------------

platform            | arch | lab             | compiler | defconfig        =
        | regressions
--------------------+------+-----------------+----------+------------------=
--------+------------
bcm2836-rpi-2-b     | arm  | lab-collabora   | gcc-10   | bcm2835_defconfig=
        | 1          =

beaglebone-black    | arm  | lab-cip         | gcc-10   | omap2plus_defconf=
ig      | 1          =

imx6dl-riotboard    | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+debug | 1          =

qemu_arm-virt-gicv2 | arm  | lab-broonie     | gcc-10   | multi_v7_defconfi=
g+debug | 1          =

qemu_arm-virt-gicv2 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+debug | 1          =

qemu_arm-virt-gicv3 | arm  | lab-broonie     | gcc-10   | multi_v7_defconfi=
g+debug | 1          =

qemu_arm-virt-gicv3 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+debug | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240418/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240418
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7b4f2bc91c15fdcf948bb2d9741a9d7d54303f8d =



Test Regressions
---------------- =



platform            | arch | lab             | compiler | defconfig        =
        | regressions
--------------------+------+-----------------+----------+------------------=
--------+------------
bcm2836-rpi-2-b     | arm  | lab-collabora   | gcc-10   | bcm2835_defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6621539c57468256814c4308

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240418/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240418/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6621539c57468256814c4=
309
        failing since 318 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform            | arch | lab             | compiler | defconfig        =
        | regressions
--------------------+------+-----------------+----------+------------------=
--------+------------
beaglebone-black    | arm  | lab-cip         | gcc-10   | omap2plus_defconf=
ig      | 1          =


  Details:     https://kernelci.org/test/plan/id/662159a99fdb96d56b4c4317

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240418/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240418/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/662159a99fdb96d5=
6b4c431c
        new failure (last pass: next-20240417)
        1 lines

    2024-04-18T17:34:13.958755  / # =

    2024-04-18T17:34:13.968220  =

    2024-04-18T17:34:14.073969  / # #
    2024-04-18T17:34:14.080132  #
    2024-04-18T17:34:14.225513  / # export SHELL=3D/bin/sh
    2024-04-18T17:34:14.239602  export SHELL=3D/bin/sh
    2024-04-18T17:34:14.341365  / # . /lava-1121881/environment
    2024-04-18T17:34:14.352007  . /lava-1121881/environment
    2024-04-18T17:34:14.454001  / # /lava-1121881/bin/lava-test-runner /lav=
a-1121881/0
    2024-04-18T17:34:14.463936  /lava-1121881/bin/lava-test-runner /lava-11=
21881/0 =

    ... (9 line(s) more)  =

 =



platform            | arch | lab             | compiler | defconfig        =
        | regressions
--------------------+------+-----------------+----------+------------------=
--------+------------
imx6dl-riotboard    | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/66215e8c3e1668c8e64c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66215e8c3e1668c8e64c4=
2e3
        failing since 617 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform            | arch | lab             | compiler | defconfig        =
        | regressions
--------------------+------+-----------------+----------+------------------=
--------+------------
qemu_arm-virt-gicv2 | arm  | lab-broonie     | gcc-10   | multi_v7_defconfi=
g+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/66215d8753486ea6954c42e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66215d8753486ea6954c4=
2e9
        failing since 50 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform            | arch | lab             | compiler | defconfig        =
        | regressions
--------------------+------+-----------------+----------+------------------=
--------+------------
qemu_arm-virt-gicv2 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/66215d6b53486ea6954c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66215d6b53486ea6954c4=
2db
        failing since 50 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform            | arch | lab             | compiler | defconfig        =
        | regressions
--------------------+------+-----------------+----------+------------------=
--------+------------
qemu_arm-virt-gicv3 | arm  | lab-broonie     | gcc-10   | multi_v7_defconfi=
g+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/66215d8def7a1d23cb4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66215d8def7a1d23cb4c4=
2db
        failing since 50 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform            | arch | lab             | compiler | defconfig        =
        | regressions
--------------------+------+-----------------+----------+------------------=
--------+------------
qemu_arm-virt-gicv3 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/66215d6d0ceed453d34c42f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240418/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66215d6d0ceed453d34c4=
2fa
        failing since 50 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =20

