Return-Path: <linux-next+bounces-2417-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D99E8D2C65
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 07:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCA0C1F225FA
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 05:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A69415B972;
	Wed, 29 May 2024 05:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qaeG3sZq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC15A15B567
	for <linux-next@vger.kernel.org>; Wed, 29 May 2024 05:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716960266; cv=none; b=hxsazP0WsmztCScgalqJcXCBUAU5VYWMGUIgGdprocioaWI6TqQJn/4u9wa2o2j7rz+V9lZR7fVwbCLmXB/cGLcwgLOFcByxfqcUgmTd7c5S/kZan5s/z+Wg1JrkZD+0dclpIkKmwDFr8wKSpc3iDKCMtFUz93JHBZSRVr03B/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716960266; c=relaxed/simple;
	bh=hB8urert2E7q2Do367YWCtcDA/6qCAFiOyVzTWT5Tys=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=MbUlvF/hYT9DjU8EjnUiEzfYBp9mvCRrzmkUCcPqm0fGe3Pb4y+9xYiFqnZ7vUPR+I8OQv3GlBdvJKBvijjHfYr3kf7JmFGzygB1u5JyjnEQ5l1ZNHxEd5Yfoy/KafuyfAo/cWj6Q34sH+CATctw9j9bFygtvW0Hix9jX1+xWuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qaeG3sZq; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-248f7fdc323so890387fac.1
        for <linux-next@vger.kernel.org>; Tue, 28 May 2024 22:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716960263; x=1717565063; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VxE4W40+CzIDTNK4FepQEHGqYEng+bxrvEvbcfuG7vg=;
        b=qaeG3sZq/FMeNJxiUTLpH3dOetKp5oTTKOM34HJlqHBCDWVDJIxWjo7+MYSumZiiDx
         6WWkMkH++iHcUXHhaDZQGh8Ql6+2SD0L6O7tXjclD5thnGVMOLd5ZmA2ppNAIomMAwLw
         p9s92V1PlYxVJ2lA7lYuC/zQAaJKW64MfOcgQGcHqgfXDxd1H/ohsl78+PyqhkCUzU6M
         y21yL0pFGcC/QzUqHlYftzuOpouHEf9aV6VRzRKtFNlgRbT0IWhVkbvXGbZMl+CFnp1a
         fPidDRgfLOwV4Mv9uWyxO2e0hxUWeurAwvU62YBdVCR4OHSYfL8YdnpiA6aj8FyfH7UB
         Trxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716960263; x=1717565063;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxE4W40+CzIDTNK4FepQEHGqYEng+bxrvEvbcfuG7vg=;
        b=VdmGXtfFy3/9IuhfwEY2MjcXQLAwjLKq2iwkUM4UNUhRW15TQWGESq9jcMPOuO2BmI
         wmAgv1OXR84+9QOJG1u8G+BmIX5p8iD1fCSFT/qhTIgP8vPk/OZOVljS11JERBMaU3UZ
         vnnKLL+fF3PMKPnlJZ4JM7+i7+xDBZSHfspGZt7Xr973w2s8cQmQifBfOUkQvDNggcjs
         PQpjhHaiJ1aFlh0+fww7Col3g0MF+uKgHZuVJX1RkKulJIv+U+9h2tHLlqEIsuR9/53+
         sJBvqmTQnk5/Bg4eiCTFM5POcLjn/yweur0sMPb7353ySK97zdX4sVCGPfuYacokDlhy
         u/BA==
X-Gm-Message-State: AOJu0YxZWLkaK54+7iKyPP12SrwWB8+ITxlerhgeaXCIIEdDpJTPt9CH
	8QdWanWR9sUix58fsfdzkh94JqmW5pAnvzrY2gRvwEVMLPsr2pa2ORZnfdtE0xuwP8Zn/GyuGmN
	v
X-Google-Smtp-Source: AGHT+IH+UeAzxILFODD96zkZsEth4viEuouqUS/sy1eHoAg2Wtj0oPO9srKqEl/qAmyTO6PD+Cl0LA==
X-Received: by 2002:a05:6870:e38b:b0:24f:d1bb:993e with SMTP id 586e51a60fabf-24fd1bbb9a4mr14477983fac.0.1716960263365;
        Tue, 28 May 2024 22:24:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fc05c148sm7270867b3a.69.2024.05.28.22.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 22:24:23 -0700 (PDT)
Message-ID: <6656bc07.050a0220.98acb.33d1@mx.google.com>
Date: Tue, 28 May 2024 22:24:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-179-g237cf74e86425
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 66 runs,
 1 regressions (v6.10-rc1-179-g237cf74e86425)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 66 runs, 1 regressions (v6.10-rc1-179-g237cf74=
e86425)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc1-179-g237cf74e86425/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc1-179-g237cf74e86425
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      237cf74e8642528ffb4ac35bd491ad996f945ee6 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6656901c65415e1e3f7e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc1-1=
79-g237cf74e86425/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc1-1=
79-g237cf74e86425/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6656901c65415e1e=
3f7e7072
        new failure (last pass: v6.9-12014-g1b94b2f9194be)
        1 lines

    2024-05-29T02:16:49.443006  / # =

    2024-05-29T02:16:49.451887  =

    2024-05-29T02:16:49.557006  / # #
    2024-05-29T02:16:49.563819  #
    2024-05-29T02:16:49.681630  / # export SHELL=3D/bin/sh
    2024-05-29T02:16:49.691741  export SHELL=3D/bin/sh
    2024-05-29T02:16:49.793533  / # . /lava-1139815/environment
    2024-05-29T02:16:49.803654  . /lava-1139815/environment
    2024-05-29T02:16:49.905480  / # /lava-1139815/bin/lava-test-runner /lav=
a-1139815/0
    2024-05-29T02:16:49.915651  /lava-1139815/bin/lava-test-runner /lava-11=
39815/0 =

    ... (9 line(s) more)  =

 =20

