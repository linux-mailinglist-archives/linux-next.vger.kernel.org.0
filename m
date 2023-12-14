Return-Path: <linux-next+bounces-397-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD91813650
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 17:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EC471F215A8
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 16:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1395A5D48F;
	Thu, 14 Dec 2023 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="a5SDuKqW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B83DA6
	for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 08:32:38 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d3536cd414so17457125ad.2
        for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702571557; x=1703176357; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4/ldJbfa+mKVMc9KkmJ8PNFOLOv3Jtc973zxzsiFbLA=;
        b=a5SDuKqWJ9tcBFvhYMc1a4PCjkZXg81Lj88d9nCKMAyo4q2BLDJjOcNBp4QIAN+HzU
         rB7O7r4JPrtXztjPulDjWGEdaxgVyOp6jhy6T9nMjkvyvWuQ8pTrkd6zHbdPSzIoNHk2
         UO2NFJIY2NbmaqVOTp/PFlbuasAPE9H7zXg5ysY5yiAtkfDVa6LLafOeRwPXERFuCg38
         rKkWE/U4TrvH0VUGlxbQWR4qx5xAcgkScEMoPi3PDXU+t5LveWK6lDkIlGpCHSYgLFVr
         VOwk/NGse5pkux62jq+We9VBWlV0lDMOdGNU3nz3hs3fidfVbOKTf27ITWa2lJxTmF+o
         QAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571557; x=1703176357;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/ldJbfa+mKVMc9KkmJ8PNFOLOv3Jtc973zxzsiFbLA=;
        b=I2Pyubd2ML6ct4KSIaWhOmz7K+OHYJJY+5F1scXSphYr3+4gzr9nf3lrYNa3PM7FNG
         fwZL7yKz1jWJB6zi5H7UjUPo3aaFT//skPtx15H/ceOrtvTwHTMF5Da8blAZ/6Sb7zI6
         d4TkD+vpxXLg0xu1rs6Jvat6de9EkRbN9hcaLQKKHpJyITxWlodkzJRTfS6LEgzA3yAS
         NFB8ElRJFEmcZMg9Lr9i5BroNGTODs6GER79OKn6JNAPeGK3Muf/QoGKog/g43qdtlys
         wJT0+SiyT7QTprdBmSUk29Pwn3OsngnBo2TbJtzDItdWeCc3IFqGNaKB2K3wtZNLNVLV
         PcAg==
X-Gm-Message-State: AOJu0YwjOq7MKw7hU6adI6qwCD8xkP4i3zb5FWZtTSVqSdwc1gWd+PFT
	Nh3cVKiFVTa6VKBJSHeP2affFZE67hcigciSrRw=
X-Google-Smtp-Source: AGHT+IElyefhO5YL5NnGPZlZwyXbgzyY92DrjVG+xdpDnW49V/okyA2TfHhnyCdFviX7iB6WmFrtrg==
X-Received: by 2002:a17:903:595:b0:1d3:50e7:a24f with SMTP id jv21-20020a170903059500b001d350e7a24fmr2405477plb.129.1702571557168;
        Thu, 14 Dec 2023 08:32:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a17-20020a631a51000000b005c7024c429csm4561023pgm.81.2023.12.14.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:32:36 -0800 (PST)
Message-ID: <657b2e24.630a0220.fe1f2.fe70@mx.google.com>
Date: Thu, 14 Dec 2023 08:32:36 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc5-272-gc68cf4cd434e0
Subject: next/pending-fixes baseline: 105 runs,
 2 regressions (v6.7-rc5-272-gc68cf4cd434e0)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 105 runs, 2 regressions (v6.7-rc5-272-gc68cf4c=
d434e0)

Regressions Summary
-------------------

platform       | arch | lab          | compiler | defconfig          | regr=
essions
---------------+------+--------------+----------+--------------------+-----=
-------
panda          | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1   =
       =

qemu_i386-uefi | i386 | lab-broonie  | gcc-10   | i386_defconfig     | 1   =
       =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc5-272-gc68cf4cd434e0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc5-272-gc68cf4cd434e0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c68cf4cd434e0a4a7d1d4327a11081226810995e =



Test Regressions
---------------- =



platform       | arch | lab          | compiler | defconfig          | regr=
essions
---------------+------+--------------+----------+--------------------+-----=
-------
panda          | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1   =
       =


  Details:     https://kernelci.org/test/plan/id/657afba9131f943749e13475

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-27=
2-gc68cf4cd434e0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-27=
2-gc68cf4cd434e0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657afba9131f943749e1347e
        failing since 7 days (last pass: v6.0-12387-ge54e01f1826aa, first f=
ail: v6.7-rc4-354-g2e06d594f8593)

    2023-12-14T12:56:46.678477  <8>[   13.770782] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3880302_1.5.2.4.1>
    2023-12-14T12:56:46.782934  / # #
    2023-12-14T12:56:46.883990  export SHELL=3D/bin/sh
    2023-12-14T12:56:46.884336  #
    2023-12-14T12:56:46.985069  / # export SHELL=3D/bin/sh. /lava-3880302/e=
nvironment
    2023-12-14T12:56:46.985391  =

    2023-12-14T12:56:47.086132  / # . /lava-3880302/environment/lava-388030=
2/bin/lava-test-runner /lava-3880302/1
    2023-12-14T12:56:47.086661  =

    2023-12-14T12:56:47.091880  / # /lava-3880302/bin/lava-test-runner /lav=
a-3880302/1
    2023-12-14T12:56:47.157553  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform       | arch | lab          | compiler | defconfig          | regr=
essions
---------------+------+--------------+----------+--------------------+-----=
-------
qemu_i386-uefi | i386 | lab-broonie  | gcc-10   | i386_defconfig     | 1   =
       =


  Details:     https://kernelci.org/test/plan/id/657af9077f00e7f4eae13485

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-27=
2-gc68cf4cd434e0/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-27=
2-gc68cf4cd434e0/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657af9077f00e7f4eae13=
486
        new failure (last pass: v6.7-rc5-246-g91523d2e24e55) =

 =20

