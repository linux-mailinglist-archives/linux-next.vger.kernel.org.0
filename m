Return-Path: <linux-next+bounces-2325-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0674E8C6EB5
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 00:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC669285E4A
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 22:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1603B3987D;
	Wed, 15 May 2024 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NcwUB9Da"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAE639FEC
	for <linux-next@vger.kernel.org>; Wed, 15 May 2024 22:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715812703; cv=none; b=WKeAGtIfM0SmC0obXGmBV9T+g0xD/frDD9Hzlb5tcMqGV7jRATiDlqkqe+Ge6CF4kKAOTlSogJ3niyLv3bhc7ZpHIIVWxMBRcLEoBn6W3GiiVcF3enDjUqbu1mceE7NHdHjnEDIJqpYCjIzl03lto3GXxlS23VjDmynJA8C8uK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715812703; c=relaxed/simple;
	bh=3HFak9Zq0XOPlGFFp+gxcTS2Jhb4vu8dKAAAzP5aK1g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=IaY6v12yJraObfH/Ju8l/8KNigdX6lbRgoXy3lexTOJIGeenEyUEwfapuPQ8qsW7odQxB2IfzM6E8DWeU0Xr4WSx/Grs2pDoIaaIKVlIq1XGArhHl/FrDLNv/TkbVm0hifUqsIEFSthSOfZfTrSE78VjCE/mmCF5PTRf8X8+mYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NcwUB9Da; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1eeabda8590so54400045ad.0
        for <linux-next@vger.kernel.org>; Wed, 15 May 2024 15:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715812700; x=1716417500; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9d1twEo76B54mSBg8RFqXOkdm7Lp0zxWx9c2h5kjc8o=;
        b=NcwUB9DapjUUQeHgjDU2cDIWeU4UznYocV1/Bn0FXbK/9Wdp4h0U5DYbsgCC+VN39W
         7Dcg6k39eFGUrWsOBHtPyJsMYDZxt8J7V6M9wRU9q9DhkwmPRr8C1cY3esNIk/IB+0Um
         01vvep/7dmqpMB8wRK6Y2bWlRjlcCW73a3QzWuWVr/fGBW3JgiVVQ+P5rJKqPFCehj3w
         wHMyATg9SsaTEjvRO2MC56vAuS76aFkEXMqWJ/n0w69oGwmDxn/XtKmb5Xk5Ib2OyLk0
         ZGFYQbP1/GOmwnQ8scVOKiHVwg7fasXY083iRzvb7iICxyoFd0qLu6wk74goNfV9wmz3
         LZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715812700; x=1716417500;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9d1twEo76B54mSBg8RFqXOkdm7Lp0zxWx9c2h5kjc8o=;
        b=GlML4iYZJXDn9iUgr4PWEAYZwkIMKQietLhxBps8fOcpLmpJEsu3sfNPMTTdIDzeaR
         X2WHxUmRusc8tUxk+6xbKS+xVCHW7j/ceQGySiGmEFhhzXRTFT2FSfXV8qtGeEN9tFlh
         +FdfotxJS86eHoh26MBTRe5/pco+91yaivL4pFNiUrZBO7qtSYd0HlVARK5SV7C/wB0k
         7pXq8boow8MCJ9CNSu0AbJiMt7Pw9dfBhAWwMHbctsYP+w4DehUmhrjMrvjt4/lF074m
         +sAxyNJyRPpoTg1WtmgXRD3d8ltafiO9SPk5yxlJRI92akL9rIKF/I/d7dRMJeijliQB
         ZU6w==
X-Gm-Message-State: AOJu0YymlIf98pYIu3QmS9VFoEUC5kd/E+h9Rs0EY2Lnk0QAcatFxZEO
	X+744PEf8yZ/tmOhJrHKeT74OPkJ76BFvEJftZvRTuHHVKHB4Kk2dEV6kfvY1KqpAzT6dGEb2pZ
	lmJw=
X-Google-Smtp-Source: AGHT+IECV0fTGkaihwzsofdAfzQslOVyw55+K4yoN/33XftAkfgBQf8BDzVZS27YNQTDyXIbN2aoSA==
X-Received: by 2002:a17:903:11c7:b0:1ec:3c71:eae7 with SMTP id d9443c01a7336-1ef44160d99mr204632405ad.47.1715812700044;
        Wed, 15 May 2024 15:38:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c134c13sm124130245ad.238.2024.05.15.15.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 15:38:19 -0700 (PDT)
Message-ID: <6645395b.170a0220.9ec1d.0868@mx.google.com>
Date: Wed, 15 May 2024 15:38:19 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-3455-g73ce8fe833b0
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 81 runs,
 2 regressions (v6.9-3455-g73ce8fe833b0)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 81 runs, 2 regressions (v6.9-3455-g73ce8fe833b=
0)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

jetson-tk1            | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-3455-g73ce8fe833b0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-3455-g73ce8fe833b0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      73ce8fe833b0a506ddf12c1ee9f985c729c6d82c =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6645099d834f2097384c42fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-3455-g=
73ce8fe833b0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-3455-g=
73ce8fe833b0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6645099d834f2097384c4=
2ff
        failing since 7 days (last pass: v6.9-rc7-121-g9b1e89a69d08, first =
fail: v6.9-rc7-134-g5bd88a48bbb7) =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
jetson-tk1            | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/664509be963b3501604c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-3455-g=
73ce8fe833b0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-3455-g=
73ce8fe833b0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664509be963b3501604c4=
2dc
        failing since 51 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

