Return-Path: <linux-next+bounces-759-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8371783129E
	for <lists+linux-next@lfdr.de>; Thu, 18 Jan 2024 07:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1306C1F22A2A
	for <lists+linux-next@lfdr.de>; Thu, 18 Jan 2024 06:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB139444;
	Thu, 18 Jan 2024 06:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MCeFZosp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A042B9447
	for <linux-next@vger.kernel.org>; Thu, 18 Jan 2024 06:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705558275; cv=none; b=Q2c8yKcMtwxdO3UXa3C6k/NjUSfeZ2HnAQGDHlRJ3LH+TDgDBaQ2INuS5355XjxNdUJ/eb+Xf6QUHmHiGiKRO7ILguXdxsqwndAzZ/J8bdXQlSVEhq7vJUnBjXORsPQoxp76Rm04GjCcHQkYbrLmDlmMLAqUPsu7BdcYhD/eY1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705558275; c=relaxed/simple;
	bh=0t5X/wd8sme3hT6KOltpsgW8hlMDBIaSfIupBS8eQis=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-Kernelci-Branch:X-Kernelci-Tree:
	 X-Kernelci-Kernel:X-Kernelci-Report-Type:Subject:To:From; b=tnpwLZgkGs2MjWwnvWgzDYbYXRWxGyGQZFjOUkSYNSOLdvNlpbipvIr+HQAyiR3mbnhZxFU6H+N8Hgte4oynSAED2QGJ0WyWY3HxkUwDn89qcsmK1L+QsyMJ9t8Kk/DjYnmkOxcmSluAlruKPIsVra0akhx96ASgLdbl6NMSnYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=MCeFZosp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d5f5a2e828so15098725ad.3
        for <linux-next@vger.kernel.org>; Wed, 17 Jan 2024 22:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705558272; x=1706163072; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D8y0zPQfrYES675f4ogXziasoy108CFFGdbCZKXZCpc=;
        b=MCeFZospaZ/BGD/m1ddzFsqvgDNcQWo+oQOR5+Isn3KwZly7cPafK1uFDwCNA0qS3h
         Ft1k+GuIi7C2AG7D9z3dtUCF1apLa8BdfQelLg3kXZecNqMq4YioVry+vjuCRc0zA1oR
         Nol2hNnBHiI1Vcc/g3uJTp3EM5F1s8/S44UJIiTEo2b99nAKbN1ornXM0V5HWVedSsTY
         DwmdaO5LRX8TSdBkeMhisq4w8CQJPBFC0nuYa+Famavz/QuncAvBVq0Y1xGJiuulyfsF
         reQ9E3Spm2CDRDsi3WKnXxB99dGd3/Jh3QkR0ZhBUAs/nOGAtPD3C5ZoeW+4bzFXLAWE
         yt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705558272; x=1706163072;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8y0zPQfrYES675f4ogXziasoy108CFFGdbCZKXZCpc=;
        b=KeAn9fl8zapRQKOqCn0jahWVcp8gJ2ajvXpCY/7inwf4Z4qyhq55zdLGzjzdOmiWv3
         fOxOViAs4qyu2uzyhtZztV1PISCdQ8NaBHblhRrMkVX0Dop/nsx8yZyuOpRtxV6aFC98
         gy0Es4jIAftCStHMvzyeiphKCalv7aF3Zzib+mgf+k/WKEtXMhuSXxpW4jGG7NoaYBNO
         73MY2kWVWUY+iiPqEIpqS/cf9WcQ1sCJXTU78+vgcFt+XmnuuS6R5s/L+mkSI0L0/4EW
         aXCHBZMSFGQSQyYIaLHDuRXzk/Xf8uE32BILNhXs0ZSguy20k9J5qlebZy7sMGsdSJBS
         j4eQ==
X-Gm-Message-State: AOJu0YwTvEcXqzPgbslXhs9laE6frwXHxfaUZ6eDYPVVSydZ0jKjQN9h
	xuJKblPoekzsxglf1/bp5lJSp8t5XCtSW0pbpFFYl8Nz22RjOgejDGmmuBep+DjkskX6bOn2eDD
	lcS8=
X-Google-Smtp-Source: AGHT+IHXqeXrkPmDf+GvRY5hT1g9p+4i5hLKcM08Ay9xHlQhTFCsa7kujI0qGXZa3zADi54zonb/9g==
X-Received: by 2002:a17:90b:128f:b0:28c:402d:1b1b with SMTP id fw15-20020a17090b128f00b0028c402d1b1bmr272785pjb.64.1705558272455;
        Wed, 17 Jan 2024 22:11:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p7-20020a170903248700b001cf6783fd41sm600166plw.17.2024.01.17.22.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 22:11:12 -0800 (PST)
Message-ID: <65a8c100.170a0220.358dd.2ca5@mx.google.com>
Date: Wed, 17 Jan 2024 22:11:12 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-10708-g52db520a0959c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 76 runs,
 3 regressions (v6.7-10708-g52db520a0959c)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 76 runs, 3 regressions (v6.7-10708-g52db520a09=
59c)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-10708-g52db520a0959c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-10708-g52db520a0959c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      52db520a0959c022cb5b72e9fbbdca5cdbf7fe8f =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8901de6255a640752a430

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-10708-=
g52db520a0959c/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoc=
omm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-10708-=
g52db520a0959c/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoc=
omm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8901de6255a640752a=
431
        new failure (last pass: v6.7-10328-g7e88b70257d4e) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65a88e7622f3fae19052a44d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-10708-=
g52db520a0959c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-10708-=
g52db520a0959c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a88e7622f3fae19052a456
        failing since 64 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-18T02:35:22.836618  / # #
    2024-01-18T02:35:22.940187  export SHELL=3D/bin/sh
    2024-01-18T02:35:22.941453  #
    2024-01-18T02:35:23.043346  / # export SHELL=3D/bin/sh. /lava-3910077/e=
nvironment
    2024-01-18T02:35:23.044599  =

    2024-01-18T02:35:23.146465  / # . /lava-3910077/environment/lava-391007=
7/bin/lava-test-runner /lava-3910077/1
    2024-01-18T02:35:23.148121  =

    2024-01-18T02:35:23.159719  / # /lava-3910077/bin/lava-test-runner /lav=
a-3910077/1
    2024-01-18T02:35:23.290719  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T02:35:23.291860  + cd /lava-3910077/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65a88e8e4429f3d85752a431

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-10708-=
g52db520a0959c/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-10708-=
g52db520a0959c/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a88e8e4429f3d85752a43a
        failing since 64 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-18T02:35:32.266331  + set +x
    2024-01-18T02:35:32.268242  [   20.921662] <LAVA_SIGNAL_ENDRUN 0_dmesg =
453237_1.5.2.4.1>
    2024-01-18T02:35:32.376444  / # #
    2024-01-18T02:35:32.477963  export SHELL=3D/bin/sh
    2024-01-18T02:35:32.478570  #
    2024-01-18T02:35:32.579542  / # export SHELL=3D/bin/sh. /lava-453237/en=
vironment
    2024-01-18T02:35:32.580067  =

    2024-01-18T02:35:32.681049  / # . /lava-453237/environment/lava-453237/=
bin/lava-test-runner /lava-453237/1
    2024-01-18T02:35:32.681867  =

    2024-01-18T02:35:32.684716  / # /lava-453237/bin/lava-test-runner /lava=
-453237/1 =

    ... (12 line(s) more)  =

 =20

