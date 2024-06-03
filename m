Return-Path: <linux-next+bounces-2454-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D198D7EF5
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 11:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD05428A502
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 09:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2689A7A140;
	Mon,  3 Jun 2024 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="pd4n3oeJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7F582891
	for <linux-next@vger.kernel.org>; Mon,  3 Jun 2024 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717407131; cv=none; b=IuPfoxLVh0AL8+TuxO7ZuEcrn56/5FtYwykAl+PN5b7X1lTkqic80DnlFU0GdvbwdZIVkkInB7pvhKLJt7XB/MaSNO3HekOO5WwBViRPBwFbcmfiY58qjE59Bb8Edex16WAV0ivHU/vKtBxTi2NkjnqG+SRQfcijVEJfR/rBm3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717407131; c=relaxed/simple;
	bh=T9JyWA+1Eg/xdFplR0GFvd0mV4fEe6angXY6FSOK2MM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=P4K4DjnjW1YREbRFevrtyTKR2fBW1l72cm/XwvOpJNfRNs8RAFGvAzppPvFnOzgy7y4+jFjocOihQknHA60IpohGfJQpvyBdrhH52PLnE3SW1de30HT3j1hJ5DW6/gtahS+0dLHhq8DS6KwbN08G/OCby3M3XXoKhhjnSyrcU80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=pd4n3oeJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-702442afa7dso2373428b3a.2
        for <linux-next@vger.kernel.org>; Mon, 03 Jun 2024 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717407128; x=1718011928; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=np4dE+ol2xeWo6Nd0ru5II5wL1Hz9zYTM6nFXdmFv1s=;
        b=pd4n3oeJKs7Zbfx94cehVUyVNPQkiZU/p+eRnd2QGPnOOvfFf/bZidrBRcZIlc09lG
         ERvs2/wJJPObTumo1L2wMxcjMEsqw0bFiikwJ9nfNJFHNL5u6InNOr6Hvrst1DCGDtWz
         7XQaiXFmhUoPP0YocSlLPVDRtWkAdjeOpVogF6qmsLotFD/p8yHbP3dcA7tkgCWAn34f
         uyAZ5h/5h+2LAUSn5EK/l+frZnAXFotJU0Sf5RqavUDwqycCVs12tVv4hSuKRN9L0KqH
         KJAnypn6SeoYKr2Fhi9qsjqr0+wAH71w7HYbtMtz0ITUWeFm/mbEansmaB3uoN/vlkF/
         pEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717407128; x=1718011928;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=np4dE+ol2xeWo6Nd0ru5II5wL1Hz9zYTM6nFXdmFv1s=;
        b=bXHyb4S4MTkGQxv4O8011s+F6BXcJw+szZaCUd9G+95OtUGCtxLf6bGT6TOtmGqiYs
         SNqsHJAw0uusLVqEmGgAx2EwbmTxdSzxCdVzeguYLG4V7TveRjcYTXcdnEe0Y9QjE96Z
         IGx7b5o+JOiT0irZ7q5hdicSQp66BRMpizcA3R324pStc6zVkR2rbjrxAzXZ0T8QFDI/
         aij8zwxtoO1w2bu0kU/lBHHMCULJkBEor8yh7Yn8WgFJNxU2aJ061/9DGgRT9xAlJ8jr
         zvoQphm4H/l86Y7UTstGOwm3X4eNr51dn/cZZvXLjZBQ+hO/k1VHpsfcesmhcO0+g6IV
         AxUg==
X-Gm-Message-State: AOJu0YxG73Jqx/0uxPK/kMVBo1m6vYPBa0cdCXHCB1/HrXiAoGlEjCq6
	SIx6GAtxbxuEhqyp0pZoP5Gjn+/wdDpYwan8HDUmmGU8tmoPfSUxu7RITpDzREMhWPoyKHSF6C9
	l
X-Google-Smtp-Source: AGHT+IHa1xXQAR0adx/c7mT86u+8+Jk27ZSGuE/CWC2i0vBGbs9U8B24qrZU1epo4gPxjQqhO+Z/RQ==
X-Received: by 2002:a05:6a21:2705:b0:1af:dd77:86ab with SMTP id adf61e73a8af0-1b26f316d92mr7034784637.54.1717407127718;
        Mon, 03 Jun 2024 02:32:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232dd6bsm60532605ad.54.2024.06.03.02.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 02:32:07 -0700 (PDT)
Message-ID: <665d8d97.170a0220.3988e5.ec96@mx.google.com>
Date: Mon, 03 Jun 2024 02:32:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240603
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 281 runs, 14 regressions (next-20240603)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 281 runs, 14 regressions (next-20240603)

Regressions Summary
-------------------

platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b     | arm  | lab-collabora   | gcc-10   | bcm2835_defconfig=
            | 1          =

bcm2836-rpi-2-b     | arm  | lab-collabora   | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

beaglebone-black    | arm  | lab-cip         | clang-17 | multi_v7_defconfi=
g           | 1          =

beaglebone-black    | arm  | lab-cip         | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

beaglebone-black    | arm  | lab-cip         | gcc-10   | omap2plus_defconf=
ig          | 1          =

imx6dl-riotboard    | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =

qemu_arm-virt-gicv2 | arm  | lab-broonie     | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =

qemu_arm-virt-gicv2 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =

qemu_arm-virt-gicv3 | arm  | lab-broonie     | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =

qemu_arm-virt-gicv3 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =

r8a7743-iwg20d-q7   | arm  | lab-cip         | gcc-10   | shmobile_defconfi=
g           | 1          =

rk3288-rock2-square | arm  | lab-collabora   | clang-17 | multi_v7_defconfi=
g           | 1          =

rk3288-rock2-square | arm  | lab-collabora   | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq   | arm  | lab-collabora   | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240603/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240603
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      861a3cb5a2a8480d361fa6708da24747d6fa72fe =



Test Regressions
---------------- =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b     | arm  | lab-collabora   | gcc-10   | bcm2835_defconfig=
            | 1          =


  Details:     https://kernelci.org/test/plan/id/665d53f22b590ef72a7e7073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d53f22b590ef72a7e7=
074
        failing since 364 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b     | arm  | lab-collabora   | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/665d5a1e3eea69e6a47e70a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d5a1e3eea69e6a47e7=
0a8
        failing since 432 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
beaglebone-black    | arm  | lab-cip         | clang-17 | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/665d7382f60b24ff907e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/665d7382f60b24ff=
907e7072
        new failure (last pass: next-20240531)
        1 lines

    2024-06-03T07:40:42.717016  / # =

    2024-06-03T07:40:42.726088  =

    2024-06-03T07:40:42.830877  / # #
    2024-06-03T07:40:42.837907  #
    2024-06-03T07:40:42.939873  / #export SHELL=3D/bin/sh
    2024-06-03T07:40:42.949816   export SHELL=3D/bin/sh
    2024-06-03T07:40:43.051400  / # . /lava-1142330/environment
    2024-06-03T07:40:43.061813  . /lava-1142330/environment
    2024-06-03T07:40:43.163666  / # /lava-1142330/bin/lava-test-runner /lav=
a-1142330/0
    2024-06-03T07:40:43.173633  /lava-1142330/bin/lava-test-runner /lava-11=
42330/0 =

    ... (9 line(s) more)  =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
beaglebone-black    | arm  | lab-cip         | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/665d7a9eba85cd94917e721d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/665d7a9eba85cd94=
917e7222
        new failure (last pass: next-20240531)
        1 lines

    2024-06-03T08:10:54.140183  / # =

    2024-06-03T08:10:54.149177  =

    2024-06-03T08:10:54.254264  / # #
    2024-06-03T08:10:54.261003  #
    2024-06-03T08:10:54.363370  / #export SHELL=3D/bin/sh
    2024-06-03T08:10:54.373082   export SHELL=3D/bin/sh
    2024-06-03T08:10:54.474941  / # . /lava-1142342/environment
    2024-06-03T08:10:54.485083  . /lava-1142342/environment
    2024-06-03T08:10:54.586884  / # /lava-1142342/bin/lava-test-runner /lav=
a-1142342/0
    2024-06-03T08:10:54.596881  /lava-1142342/bin/lava-test-runner /lava-11=
42342/0 =

    ... (9 line(s) more)  =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
beaglebone-black    | arm  | lab-cip         | gcc-10   | omap2plus_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/665d542e648f65d24f7e7076

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/665d542e648f65d2=
4f7e707b
        new failure (last pass: next-20240529)
        1 lines

    2024-06-03T05:27:06.203870  / # =

    2024-06-03T05:27:06.212680  =

    2024-06-03T05:27:06.317786  / # #
    2024-06-03T05:27:06.324626  #
    2024-06-03T05:27:06.469577  / # export SHELL=3D/bin/sh
    2024-06-03T05:27:06.484534  export SHELL=3D/bin/sh
    2024-06-03T05:27:06.586220  / # . /lava-1142269/environment
    2024-06-03T05:27:06.596473  . /lava-1142269/environment
    2024-06-03T05:27:06.698330  / # /lava-1142269/bin/lava-test-runner /lav=
a-1142269/0
    2024-06-03T05:27:06.708431  /lava-1142269/bin/lava-test-runner /lava-11=
42269/0 =

    ... (9 line(s) more)  =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
imx6dl-riotboard    | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/665d57b26e098cf8e47e70b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d57b26e098cf8e47e7=
0b8
        failing since 663 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
qemu_arm-virt-gicv2 | arm  | lab-broonie     | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/665d569165ba0ca3b67e7096

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d569165ba0ca3b67e7=
097
        failing since 95 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
qemu_arm-virt-gicv2 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/665d56882dd2f8d6fa7e7085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d56882dd2f8d6fa7e7=
086
        failing since 95 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
qemu_arm-virt-gicv3 | arm  | lab-broonie     | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/665d568965ba0ca3b67e7090

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d568965ba0ca3b67e7=
091
        failing since 95 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
qemu_arm-virt-gicv3 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfi=
g+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/665d568765ba0ca3b67e708a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d568765ba0ca3b67e7=
08b
        failing since 95 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
r8a7743-iwg20d-q7   | arm  | lab-cip         | gcc-10   | shmobile_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/665d5531ee2f8dacd17e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d5531ee2f8dacd17e7=
06e
        new failure (last pass: next-20240531) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
rk3288-rock2-square | arm  | lab-collabora   | clang-17 | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/665d59ce47972639957e712b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d59ce47972639957e7=
12c
        failing since 73 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
rk3288-rock2-square | arm  | lab-collabora   | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/665d556e51f8880a767e70f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d556e51f8880a767e7=
0fa
        failing since 558 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform            | arch | lab             | compiler | defconfig        =
            | regressions
--------------------+------+-----------------+----------+------------------=
------------+------------
rk3288-veyron-jaq   | arm  | lab-collabora   | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/665d54744a0cab2ef27e7927

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240603/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d54744a0cab2ef27e7=
928
        failing since 558 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

