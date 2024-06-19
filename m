Return-Path: <linux-next+bounces-2605-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8EA90F781
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 22:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6551F21718
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 20:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0840477114;
	Wed, 19 Jun 2024 20:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="M1qJMI4l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D0FC0C
	for <linux-next@vger.kernel.org>; Wed, 19 Jun 2024 20:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718828875; cv=none; b=Wvu5iZtDAN+Ge+CrUAPLFW2ohxfcTGT3USs890gk3OvuvuAEfU4T8XRwiUtOigBt2wA+/XQvJdvodG6ORpPDITjnvdBlbFdp9VD0FVk40TMDcH0gFf8FTSy3qsBFG83n3HMVbz5DwDv1anSV8h7yCBLmGB6gIaoyjiZCjywOhpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718828875; c=relaxed/simple;
	bh=fLyI/ZRr9IvAWKlHVB35WQfJdIRGaJdjeSujN53CVGU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=u8e9zVTkXccUItfFKHt9lfj1a1POHDt6EC7CKwBuP3+5n1jckcPRqEPT0hmHL2hgVL6gr8asvZ0ejeaKEzs1XBbYO5w8YOLcpPETeEPBykTF03KtY76VJZeMmdUyDYi5m1f7OcjplW0EHagBuB12tGBLM82fjbYBAwVNBItOxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=M1qJMI4l; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-705bf368037so229713b3a.0
        for <linux-next@vger.kernel.org>; Wed, 19 Jun 2024 13:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718828873; x=1719433673; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dbXUsz0XpyK+CmcaHHYL3jy3ebcHLzQ6yadObReEP3w=;
        b=M1qJMI4lDOoFuG7x+au2FEcaR4xu97DxHfaCgF1LW1ZwM2KfGS4GlTlAmX5bF61s2N
         NEcqpJUUuMSYDJypX9VDp2ve6fcsgYJpiQvMlLuKp4FafEUWMmvngf2YHPg4goPd5ys6
         AB18knR/jzdNYNmhN0dz5fG512aFXuOSCQFRTlCJiaUSmeQeq3AmCqDXY6Vpfp5cxrpS
         1RsxOTpTxAWKISoqkK9c7/1mk/zGVSpcVdKBz7xCmau+MtzaqcGF0Kdw+/9zdAVwechh
         mHNM80T97wqpC4rN8T6WWCMT872UBMCdb1Xz0Ip4dU6XNh2c8KyYoKXAJ34zvCoc5DLQ
         Hnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718828873; x=1719433673;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbXUsz0XpyK+CmcaHHYL3jy3ebcHLzQ6yadObReEP3w=;
        b=sa98ifivCGQhYgb531JEAw923zgux3cjhs5QmgC3ICrgteDE4JojaleXnlKybM/1sN
         WfiIUQFT7ncZq0odp14h4rQlIvANndMwy+F46GMUfc6gwpL4gO+mKTkFhuapxFSQyGfm
         tPRTCibW18oGW1TFWDqh/NHlqsCHpNw77c4hYQ5r/vzovMrl5dnTyzwppO6Rt7NJHePh
         sr1wHn75rwYcaoj/CrfnDeYysTXJCx7zGNrcvhkYYHTFAu0pNtlV+VOuesMONq3ztUrh
         qlgQKYTz0BQeutNTXLfabQkNCJl32TmVttSJzMjgi7d3Ukc3RzXmJwzYp3LbWDZ9IKxl
         ayjQ==
X-Gm-Message-State: AOJu0YwoQBR7TxYgDg/TD0PL9z/Llu/fzlzzbb8qGcXtMvgbmFEFHpR7
	pA0k1JRinxq2vlxE1b9CJTJkpq4kyyW+9xXV5+FjtyCQ863THZ+lKWnXGVJdYqRYXLUxD2p9I3I
	+9uE=
X-Google-Smtp-Source: AGHT+IGgI4pYo5yd0FhP5Lr+cmQvddzqrGi1Vuq2u6ANqrDC8KRqqS90L3mIDypeKxb5J+ZD3TR1Kw==
X-Received: by 2002:a05:6a20:bf13:b0:1b5:6b5e:c104 with SMTP id adf61e73a8af0-1bcbb60abd6mr3054630637.51.1718828872857;
        Wed, 19 Jun 2024 13:27:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb4a830sm11048458b3a.128.2024.06.19.13.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 13:27:52 -0700 (PDT)
Message-ID: <66733f48.050a0220.85749.f060@mx.google.com>
Date: Wed, 19 Jun 2024 13:27:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc4-292-g76e16e788eb23
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 73 runs,
 3 regressions (v6.10-rc4-292-g76e16e788eb23)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 73 runs, 3 regressions (v6.10-rc4-292-g76e16e7=
88eb23)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
beaglebone-black  | arm   | lab-cip       | gcc-10   | multi_v7_defconfig |=
 1          =

jetson-tk1        | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig |=
 1          =

rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc4-292-g76e16e788eb23/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc4-292-g76e16e788eb23
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      76e16e788eb236320318386509b7912e9e618d35 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
beaglebone-black  | arm   | lab-cip       | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/66730dea532dc154b17e70bb

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
92-g76e16e788eb23/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
92-g76e16e788eb23/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66730dea532dc154=
b17e70c0
        failing since 1 day (last pass: v6.3-10703-gb3f869e79cdf0, first fa=
il: v6.10-rc4-262-g1ce98b2c2d5b0)
        1 lines

    2024-06-19T16:57:00.513088  / # =

    2024-06-19T16:57:00.521851  =

    2024-06-19T16:57:00.627009  / # #
    2024-06-19T16:57:00.633731  #
    2024-06-19T16:57:00.751493  / # export SHELL=3D/bin/sh
    2024-06-19T16:57:00.761751  export SHELL=3D/bin/sh
    2024-06-19T16:57:00.863578  / # . /lava-1152659/environment
    2024-06-19T16:57:00.873748  . /lava-1152659/environment
    2024-06-19T16:57:00.975440  / # /lava-1152659/bin/lava-test-runner /lav=
a-1152659/0
    2024-06-19T16:57:00.985506  /lava-1152659/bin/lava-test-runner /lava-11=
52659/0 =

    ... (9 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
jetson-tk1        | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/66730d4c2804458d087e709c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
92-g76e16e788eb23/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
92-g76e16e788eb23/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66730d4c2804458d087e7=
09d
        failing since 1 day (last pass: v6.3-10703-gb3f869e79cdf0, first fa=
il: v6.10-rc4-262-g1ce98b2c2d5b0) =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/66730f5cdf413a9edc7e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
92-g76e16e788eb23/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock=
-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
92-g76e16e788eb23/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock=
-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66730f5cdf413a9edc7e7=
073
        new failure (last pass: v6.10-rc4-262-g1ce98b2c2d5b0) =

 =20

