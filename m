Return-Path: <linux-next+bounces-2801-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC2923E14
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 14:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B9C0B25246
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 12:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4F3167DB8;
	Tue,  2 Jul 2024 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FjZS+xxG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061A5167D8C
	for <linux-next@vger.kernel.org>; Tue,  2 Jul 2024 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719924227; cv=none; b=DDDehwyk12jDKbzFXmWQ+u14VvXk+eowG6KmXdrKgaou7DNDJk7exLG2CsxRs0P0tv9QfQQ11BOdpSnxS2bcBg1ob2VsLmyoZEGf4lf+RrGvAxGjAkaiEAy/R4f7K86U3TjrK4Ie5O0VWavARwsZIhWihH/5yhKt6oBlq3o8MyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719924227; c=relaxed/simple;
	bh=NwmktSOz+2S/0uokO4oPmt+97sUVqJFX+g9Libwx4+k=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=jvsW5j2ag0IK+skR2c6uxCu6OEJFw2e2U3elLwzt8NnOEkqF2uGPxIfbrLAm8levva5zg1do5pBXWSSanv5SmTepaTZ470jPeg2Yi+pVhlWYzH9+0kOA3rxldDICYeco3nbwgnOzAaVCLCV4VNtc03uGLolUAjGu86Vb27xlZmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FjZS+xxG; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7180e5f735bso2398442a12.0
        for <linux-next@vger.kernel.org>; Tue, 02 Jul 2024 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719924225; x=1720529025; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh/xdiD5faNy72+Eoc5nG4xksw4OjVNhmpV3za8q3P0=;
        b=FjZS+xxGvI7YZoc5uRWIqiGqZ9Bbp2KMgO48FFXPwxMEBcRDFgEtu5YZVbm/H5j+oD
         pR/UhTSXlSoIz5KRZp+mipxZY78ByPjp/WR9ZGc7BH3weW8wstdK26qiMmnlUqjKwPl7
         bNNmPSBIyFUbj8aEb9a+PUooVV8GEdCMBUmVkWgv/Z8jsqNLl16owZPqiCWyoaAgQ5Bj
         tC/sYFRmvr5Bdql6vD3RWVfhtqck25XNKsiq3myfemQlxDKiE/YGicB9AycX2QnIlJmC
         MVBRx/vLekgNoX4X2LjkzNnlLyCCMAzgCdGxb7ZkRSZgncUySMFlNR69P1cZIgmGC5li
         CEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719924225; x=1720529025;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dh/xdiD5faNy72+Eoc5nG4xksw4OjVNhmpV3za8q3P0=;
        b=TdsCQMZ6hniMjZVqjOGJE3mKn85iMzhaKDFWpIBhzuVWwN10j2YRp9lCm/SFr2k2SM
         PTwcpim1vrUlAgz9jiwmM0KiBkIqnbIFCCyX8aXfMLcaW9PfwkaduDf6ZmuOD+00ju4N
         lBXdKBF2LqvITe2+kh9BaarRG41J9VeejuZy3yBGSSP3M/3dHcIiM5/mR4dCmZ1h2U2z
         dIVlzMR/D5xW/QKfRO8q2Xn4dJ1X6pDzaRzI48sPWNLkgqMCecJxHvO9k9HYfAtRwNDw
         momAUyds0ulk1d1zJzBSEZ/OHvXOkttO8SYqlOz4JO6HH1zIizC+Rhh2Iu+faclJZjnH
         oc6Q==
X-Gm-Message-State: AOJu0YzaJAPrcipjrk3MzjGTjaOGzhJ5DojonKTZ/JgWoeHOA9+IxmzN
	Pm/UDPHg53s5WIGvPqA468dOY6yE8DIt785syVBF60bkPXlCtPHNApmlAQDt6iiyG1CfmdYI13s
	a
X-Google-Smtp-Source: AGHT+IGR6cF/NEHm3VdadMme4jXnS3VsL+zP18wKJhlFu3SME8n54191dDY6LggrBnyFO4rVNhC3eg==
X-Received: by 2002:a17:903:228e:b0:1fa:97ec:3a4 with SMTP id d9443c01a7336-1fadb432e91mr125870225ad.8.1719924224731;
        Tue, 02 Jul 2024 05:43:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1535b6esm82900425ad.156.2024.07.02.05.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 05:43:44 -0700 (PDT)
Message-ID: <6683f600.170a0220.229403.b5d4@mx.google.com>
Date: Tue, 02 Jul 2024 05:43:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc6-174-gf516b72fa9cc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 75 runs,
 1 regressions (v6.10-rc6-174-gf516b72fa9cc1)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 75 runs, 1 regressions (v6.10-rc6-174-gf516b72=
fa9cc1)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc6-174-gf516b72fa9cc1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc6-174-gf516b72fa9cc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f516b72fa9cc1236aad49df8524fcd99c945b616 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/6683c522fb90e9c93f7e707f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc6-1=
74-gf516b72fa9cc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc6-1=
74-gf516b72fa9cc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6683c522fb90e9c93f7e7=
080
        failing since 13 days (last pass: v6.3-10703-gb3f869e79cdf0, first =
fail: v6.10-rc4-262-g1ce98b2c2d5b0) =

 =20

