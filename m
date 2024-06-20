Return-Path: <linux-next+bounces-2615-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4A8910F21
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 19:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9031F212F8
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 17:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA301B9AD1;
	Thu, 20 Jun 2024 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="hsxC5UCM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4811C9EA6
	for <linux-next@vger.kernel.org>; Thu, 20 Jun 2024 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904813; cv=none; b=e1fb/OyS/e0utuN6icAJjVLD/nkoNZHOVp08VoNEWe/Qs007OWYtVJeJrJhmwd8wWPfnu2rVK7t3Ex5vR0CNT7zIPL3nmC9J8216/DhdEuLtP/YZ/ZbuCvd2RUu/xlHauQieGcH/l9uFFeVluVRG3Avk59OY/LhUw5MsOBUvnLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904813; c=relaxed/simple;
	bh=fpJZFz9xhxh+xziwK2uWYTvuh5V1x5lHEki5IyD/I6I=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=HvJOz+4d7q1bIn7sAWJ1XEKvDJ69Kurz2ogkS1pGVf198SvnPjSI01lKEo3HeMfiqDeDT9nuBgwq2cnx4apSsB+XZ3JhxrIJf8zSf9SPDg7WJx7hoabDE7CdRqlE1NVTCqm6lwP9WdSbcdQ8776mmKKAM9PVBkaaIM3vCvbid1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=hsxC5UCM; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-1f9c6e59d34so10220785ad.2
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2024 10:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718904809; x=1719509609; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ+9DwElUCs2TkxryL6N46w/UgApaHQH8fH9FAxh+94=;
        b=hsxC5UCM4zDFWIu4iAZpLbflnE+BF+enl9ychS3I7VO5XVpK6CtayVz1G2Xkm6fROO
         4+ISkF8hPXjcDX5K2p29AMLSTQPrcyehAaheYZQQh53s1iCdY+4CM8Zi5YrUe0iX6+Mq
         CXBp8/xRJ4cHG/oT9xyECGPdVzFbruFia+LezfRmAi6/cRKiXSbEhnD8TKuOWd1cdE0S
         dmhRK0xnOMktKv6bYqE5LCZpFpTRf5wYNk6VfjKGgugfHYv5XMs1sF/vnBfUONGsa8Uz
         hvUTahdhEoomWIFTNq29HVx69UtM5G7AVecp3AZglV/6yIlCwtGzZnNvno6JVIMzE67c
         ltXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718904809; x=1719509609;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZ+9DwElUCs2TkxryL6N46w/UgApaHQH8fH9FAxh+94=;
        b=mqWbNH2j1LiwIBQoaJ4JcDEoFVQAZQVUWuiNaKL3xHMCI32UPvxI60Yx+18QxDf4vf
         k5Ri5Jz1BN4Bti8l04eK8Uuk3SDzgrGmLZaLxKvWBkBncHx2loy4z44aQ5v7h/TXOecM
         p7L89Y+Xas6y3d4IG/ui+VdflUYxZ5Pa9Lgn6YJyl38PWeThEUK6E08ueCJorJJRrgj6
         RaVhtMe7wpQSPGM9rCvlQNOkcFTahg3ZesSAjx1iKADlsQX5tEzRr+FmMO7TjZDXwvEU
         lkg+2NQCD4Ig6cDcJsEtZ5NPJjuWX39EVhNpiBhQk3XjRa0eNxtVm2hsfT3ymRhRCLPH
         K+fQ==
X-Gm-Message-State: AOJu0YwB8wQAvQota3NuOWLJ5wM4w53Rvyc2uHKfP+y8/t55ZjmJFAmQ
	nK9hB8+g9NrOMkPQL0mwQRQNa+IBk5/i4wjFD1y24YhLPXH2kQc3MtHITVMt4lZHvNjz8wICFlt
	5JldR3v2G
X-Google-Smtp-Source: AGHT+IE3RxhImHG6gImkK/dl57DPXlF6zmMXdapvLvVlcDCiBnkv9bR4YBJ0iVTflreFJczFVn8PmQ==
X-Received: by 2002:a17:903:41cb:b0:1f4:a392:ac5b with SMTP id d9443c01a7336-1f9aa46c299mr68120995ad.57.1718904809551;
        Thu, 20 Jun 2024 10:33:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f857914deasm139272735ad.136.2024.06.20.10.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:33:29 -0700 (PDT)
Message-ID: <667467e9.170a0220.ada00.7127@mx.google.com>
Date: Thu, 20 Jun 2024 10:33:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc4-318-gc7e7720403303
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 81 runs,
 2 regressions (v6.10-rc4-318-gc7e7720403303)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 81 runs, 2 regressions (v6.10-rc4-318-gc7e7720=
403303)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc4-318-gc7e7720403303/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc4-318-gc7e7720403303
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c7e7720403303c7a97157889efd02549905f737b =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6674361909f5f7342c7e7071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-3=
18-gc7e7720403303/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-in=
nocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-3=
18-gc7e7720403303/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-in=
nocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6674361909f5f7342c7e7=
072
        new failure (last pass: v6.10-rc4-292-g76e16e788eb23) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/667437488407882cd17e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-3=
18-gc7e7720403303/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-3=
18-gc7e7720403303/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667437488407882cd17e7=
076
        failing since 1 day (last pass: v6.3-10703-gb3f869e79cdf0, first fa=
il: v6.10-rc4-262-g1ce98b2c2d5b0) =

 =20

