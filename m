Return-Path: <linux-next+bounces-3652-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4596F6E8
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 16:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCBC91F23B4D
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 14:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D3D1D04A0;
	Fri,  6 Sep 2024 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Wts8rr4b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844A1D221D
	for <linux-next@vger.kernel.org>; Fri,  6 Sep 2024 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633211; cv=none; b=vABy7blqZjkXV1dHjwdPhbMT+Dh3qTGlX/sBjVcjwl0PJkjb7UG5wiGhkfp8CUOaeQBAu7T4ZVpQPNPwpMlNc2VuQYS50rhza8XMw5aNUagxyF1jE0l28YFCUrscxs1Rdrj84VSgI/75GlzBDUsdXBxTypBHw1SOAwliJvIsNs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633211; c=relaxed/simple;
	bh=/oUpO88xrVPHQlU15HHDi0V+tJ4tsW+/jXmsSB0a8Pk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=WOCsljxivXpJU48AcIEIHwNErBqD+Tg7uLZuHIsE8ERCxPrKEfK4zLo9lqQsXGiTNVGxU1B7xora8bnjYuhuyMe9xaqdOnuvMNODXNnqIO61GxioLYbIg3XSuzZ9qQ5FoSATNE55Jx1OR+4WIzxjyPrdeqN8M6ifCP/xNFtN4zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Wts8rr4b; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20570b42f24so26977245ad.1
        for <linux-next@vger.kernel.org>; Fri, 06 Sep 2024 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725633209; x=1726238009; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XOwOEHtJfMFaXsxxeJwfr0bACcR1TxTSlmClVNvtHzQ=;
        b=Wts8rr4bGeHNg2nBs6gho7Stn7mzOCIZ0ITyqgh51sd8Z2qkdizHa9naf8j4RAKizE
         NuD7f4EyZuABDgMIPYLxNqQzHdzcj8JzRoDAyDSuWMnPw4Uy61DC74DqX3hl0Gfvl6J4
         Nsjq6GZp/2nY9uhomlVrVnJbtthVG8CQcy9SeO4NGXrGdGHwSBWUs0AZ+qoTScM/m4f5
         54r5HVuaCODj8aEmgOh1crykIbeO655myPTsf8E1kxoehoWhDFn8GMCxbvCdKiBZvFOb
         qlpXyIFsmPr8Ad+opNtsCHeGpngK90ZJTVqC8uMlGiFXNhijbV30rfNE9705S8Qqp8SP
         CxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725633209; x=1726238009;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOwOEHtJfMFaXsxxeJwfr0bACcR1TxTSlmClVNvtHzQ=;
        b=vk6P6bEPAM5HUKvo7Wg/llJ2ehaJBZ8S8y9l8WBlDKL14DIofH6MU19EKfJdUR8ebI
         2o8BhkiPHkBKCZoOcyMrD7wDA9blwTlhSZWqIJ+AWP2Dh7z8i2ZjEtxI/JWNdPqxELRq
         X0IiHadS7jO1izf2m1ZSEl4smKBO3JkT3Xj1ALMTP/Fts5asZcfQPvFqPIJV9ixXBi/6
         iIa3hESplKE8WnRM7qd+ellonL8mqi39R7ng/Cjl/4ExX4m3r3oN1XayntCS5DNAcEN6
         Hook+Suqn424YsqYNDMPPrBk2IAWS9flHg4qMRKn5Wv2qG1kJ1Qps7bWguQ/oON/R3Md
         UOpw==
X-Gm-Message-State: AOJu0Yxf0hiKM+JbXFOHljvRoE+JzThPR7J6n92jI0LpO7+ZlbQqF8B+
	Byuy1uBvU2geoArgz9vfVCFYzDplqHEGg1G3DlLVkO3MMUD0/wU/lh3h4xrQxsyqkcmHnQPyaGK
	O
X-Google-Smtp-Source: AGHT+IHrOLk9jcxkXNHWl3ppfuR+YAkw4aZBS1D+ipKZt0Rb0Y6I/Whq6oFfY7DFdVHeRYqAqBJjlg==
X-Received: by 2002:a17:903:2303:b0:202:54b8:72d5 with SMTP id d9443c01a7336-206f065df3dmr30822175ad.59.1725633208825;
        Fri, 06 Sep 2024 07:33:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae950e5csm43913695ad.97.2024.09.06.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:33:28 -0700 (PDT)
Message-ID: <66db12b8.170a0220.17f942.0c64@mx.google.com>
Date: Fri, 06 Sep 2024 07:33:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240906
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 135 runs, 2 regressions (next-20240906)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 135 runs, 2 regressions (next-20240906)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
r8a7743-iwg20d-q7      | arm   | lab-cip     | gcc-12   | shmobile_defconfi=
g           | 1          =

sun50i-a64-pine64-plus | arm64 | lab-broonie | gcc-12   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240906/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240906
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9aaeb87ce1e966169a57f53a02ba05b30880ffb8 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
r8a7743-iwg20d-q7      | arm   | lab-cip     | gcc-12   | shmobile_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/66dad11e5242dc8106c8686a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240906/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240906/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66dad11e5242dc8106c86=
86b
        failing since 16 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
sun50i-a64-pine64-plus | arm64 | lab-broonie | gcc-12   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66dad89f3530608335c86861

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240906/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240906/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66dad8a03530608=
335c86864
        new failure (last pass: next-20240904)
        2 lines

    2024-09-06T10:25:24.351944  kern  :emerg : thermal thermal_zone2: gpu1-=
thermal: critical temperature reached
    2024-09-06T10:25:24.357640  kern  :emerg : reboot: HARDWARE PROTECTION =
shutdown (Temperature too high)
    2024-09-06T10:25:24.372545  <8>[   17.563733] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =20

