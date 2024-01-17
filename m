Return-Path: <linux-next+bounces-754-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC3830445
	for <lists+linux-next@lfdr.de>; Wed, 17 Jan 2024 12:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C92281923
	for <lists+linux-next@lfdr.de>; Wed, 17 Jan 2024 11:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3806A1DFC8;
	Wed, 17 Jan 2024 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xtVrLwyi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6A1DFC4
	for <linux-next@vger.kernel.org>; Wed, 17 Jan 2024 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705489879; cv=none; b=GHUXQV0fAQ08ff2OJplbroquLFNDMpn6dzOd+qvpnNUUJaYxGou1jVmgAPZ+0twTn9LoWFUKa0IcAeRcLan0+8LVqubL2uvbRkw4W9bRr/Seg4lAFJJRb6OOiQY2rsg0Y3PDixnhcWByTtXpZbKq7JcOTpi4Ukzv8jzDOkn7/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705489879; c=relaxed/simple;
	bh=dLGzDx02MmD9+b28shbMOLxeugTXM9/clFu092uaVCc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-Kernelci-Branch:X-Kernelci-Tree:
	 X-Kernelci-Kernel:X-Kernelci-Report-Type:Subject:To:From; b=EBxWpHYJ8XTyEnohf6KCDjrQy53A27NC/W9CERAxb2cktciQEtLFxlRHiQ7VkV+kn/1VYBydp28dzz7iKbHs9g086P8/rLWxDWgkj7oUe93S/gw/FAHBkpDzLL8hCtp+ITUsZh2h6fLCTp/ebzhLYPwUpoYsq6lXMFgdzTjS+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xtVrLwyi; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2108bbf0040so755585fac.0
        for <linux-next@vger.kernel.org>; Wed, 17 Jan 2024 03:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705489876; x=1706094676; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GO+cJZB5haaBL05v0b22UTUIBcnL/FyI2Uxojb5A62Y=;
        b=xtVrLwyilO35sgX9POaWhku2rDcLTDuWD48mq3dm0T3C+ANLwFK22U2/FTrpytI0gq
         J/i6yOSuQbgeMHVjZLW1DRiHYtGE5oQmA/7w3opqaf7Qi84h6S+nxImi9QkEzBoZM80J
         7N9UW5CJ2Gmkm54hlMolARM2YKtDwu2I7npiPTAsEsVk6BLDeGdBv1G7puxtc1UbbrGS
         oP24GIHUOFQcyv+gIvkqW3wr/ygYV8EiKpo+qQWIqGHzxpLXuVS0vgFUA2dhwjJsbask
         BnPH4RUMAnklMJHDshxKJLDjJykqvA3xitD9GFG3Nkn0ba92gN2TDE+Q9Yrt3CZGl6gA
         hmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705489876; x=1706094676;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GO+cJZB5haaBL05v0b22UTUIBcnL/FyI2Uxojb5A62Y=;
        b=L86FwO93dz4QATo2O2RdsNLTsIsJvtfwQF9td/mKh/zK7N9xDJ/1+aZztY0SLx6v6X
         Gy7ZDT1a+k0gFH7STvaOqXUCkc9UjGBxcFiVQCKNT+y9U+EZ/9ws4QrGIT4taRXMfR9b
         SGudmC88SisFqs0M5VNkR2N6wGZSnrNQPrvvTwQxZTXwDm2oqSz2ObntFMpqgUhw/b4k
         1J//yRwGyqRyfTJzKd4CHMeGecx5vH2nIxiyNPf2duZXi69lzrKP2I1oNnd96sqqn5lL
         N/2mckcKgb+OoCELKTR3U0P2m9z9IMX6s9z5J7bobEIHHBIuYo6V/neC5RKo3ISWXRv5
         KvsQ==
X-Gm-Message-State: AOJu0Yyqpma6H6lmszv2m+i5KN/9MEg6EGUP0Nki83M64wFvkIvlY0I7
	s0ArnEnEL9xXUuj2BJzTSUhvAB39jWLFYF8fjcYooIZJj3bB+Q==
X-Google-Smtp-Source: AGHT+IFeuceO/8rK5zfBznzdGiRfFIsr0ZtBM4EicDKWdhtQ8h405avILh4vUGsWJLInsOYupKkVMA==
X-Received: by 2002:a05:6871:3310:b0:206:9dcd:d7b with SMTP id nf16-20020a056871331000b002069dcd0d7bmr12341203oac.22.1705489875841;
        Wed, 17 Jan 2024 03:11:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e26-20020a65679a000000b005cddfe17c0csm10202876pgr.92.2024.01.17.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 03:11:15 -0800 (PST)
Message-ID: <65a7b5d3.650a0220.4b877.f160@mx.google.com>
Date: Wed, 17 Jan 2024 03:11:15 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-10328-g7e88b70257d4e
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 64 runs,
 2 regressions (v6.7-10328-g7e88b70257d4e)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 64 runs, 2 regressions (v6.7-10328-g7e88b70257=
d4e)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-10328-g7e88b70257d4e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-10328-g7e88b70257d4e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7e88b70257d4e6fd94e17264a830f76fc532cee9 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/65a784a899253d3eb152a3f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-10328-=
g7e88b70257d4e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-10328-=
g7e88b70257d4e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a784a899253d3eb152a3fa
        failing since 63 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-17T07:41:17.654128  / # #
    2024-01-17T07:41:17.755366  export SHELL=3D/bin/sh
    2024-01-17T07:41:17.755996  #
    2024-01-17T07:41:17.856917  / # export SHELL=3D/bin/sh. /lava-3909769/e=
nvironment
    2024-01-17T07:41:17.857522  =

    2024-01-17T07:41:17.958510  / # . /lava-3909769/environment/lava-390976=
9/bin/lava-test-runner /lava-3909769/1
    2024-01-17T07:41:17.959775  =

    2024-01-17T07:41:17.977478  / # /lava-3909769/bin/lava-test-runner /lav=
a-3909769/1
    2024-01-17T07:41:18.099619  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T07:41:18.100154  + cd /lava-3909769/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7849327e591d8f752a3f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-10328-=
g7e88b70257d4e/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-10328-=
g7e88b70257d4e/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7849327e591d8f752a3fa
        failing since 63 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-17T07:40:47.219725  + set +x
    2024-01-17T07:40:47.221591  [   20.893404] <LAVA_SIGNAL_ENDRUN 0_dmesg =
453090_1.5.2.4.1>
    2024-01-17T07:40:47.330027  / # #
    2024-01-17T07:40:47.431639  export SHELL=3D/bin/sh
    2024-01-17T07:40:47.432199  #
    2024-01-17T07:40:47.533221  / # export SHELL=3D/bin/sh. /lava-453090/en=
vironment
    2024-01-17T07:40:47.533798  =

    2024-01-17T07:40:47.634788  / # . /lava-453090/environment/lava-453090/=
bin/lava-test-runner /lava-453090/1
    2024-01-17T07:40:47.635865  =

    2024-01-17T07:40:47.638246  / # /lava-453090/bin/lava-test-runner /lava=
-453090/1 =

    ... (12 line(s) more)  =

 =20

