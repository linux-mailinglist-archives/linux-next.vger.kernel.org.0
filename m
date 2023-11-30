Return-Path: <linux-next+bounces-143-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F757FEC97
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 11:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1F8281E38
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 10:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57905125CC;
	Thu, 30 Nov 2023 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lDT4jB5k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E462C10D0
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 02:11:29 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cfc34b6890so6876735ad.1
        for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 02:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701339089; x=1701943889; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KFgXbNAYW06v5VDbBufmv/CRQzrVWmnzTJ3uXR1vO1Y=;
        b=lDT4jB5ksiXWmz4KfZRWahMsN7gcd32/bHOQSRnEXlOlqBx1eV/kHY1yUPUxacA2ze
         j7YenaW5PaPtw9/zxLYTYOMYTJl2ZRKOiX47BNxYWZPmIIupcgJGUXLAJ7TQ9uX3JBIr
         0hbnkeN6y6yKb0hRnKQ0NQaYQDIYGtTWK2FtUC2y8b+Xer2ODxTaBaCZ7YwtnyI5kb6R
         vVh5UibrE88wxXeaB8RHNqFVwgJZWv6vYsRUXmte027o22dN0kRBNcteLl0tOSGjCCR7
         az2tkLGPhoEtxr/RWNlKlK4K4tuRvCEURrmikenyi5xm5DXDEoKFV2PaKH9SX7vRpTXB
         sUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701339089; x=1701943889;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFgXbNAYW06v5VDbBufmv/CRQzrVWmnzTJ3uXR1vO1Y=;
        b=XwCfHgRwG9Wdj6sabSf9p+UGG0adGdMvloQ9HBvG3eGZkAQMEmEvjwrNcrR1Jp+bL1
         wAgY3VDE5+e6xue79Vq2l4xTIooiCp7gzbmsTaq9upVsvwauYVoYeqQAxhfRUoLibp1d
         7iDdRsZVSPFrhosqkhsXppVrmE7nt4bS8UPB7IoYBNv38FdDzKKyhfXOa1y7YZhjsCcp
         muVd3vvWF6jJkZ8oRWdOF7qZJ0MCBQbC6T00oLyP05sVLpsYHjytkr4dO+jHMBr0Cezt
         9Xyt5ZutZkkhQpMMZG6ta96fduP4h1O8RGTvEv2s3AkPNERMxcwIljNTuaGpJ5bO1gD1
         tA5A==
X-Gm-Message-State: AOJu0YzJqB9o7GVCYM9+iB1q1sH7aKxeECbP6UF9VIE0XywZh0Nq+OkE
	C+S6VFlqPciWfA8ibLRRgr/SDuagQHOQ73KksEGnrw==
X-Google-Smtp-Source: AGHT+IEKCz7qU5WR7+F02T5Cc1N3vsvX6gcq6dZhsuZNAIkcHMC18YujYcGjmQ+vmMdRbjiqVQ64+w==
X-Received: by 2002:a17:902:c18b:b0:1cf:b2a9:fc00 with SMTP id d11-20020a170902c18b00b001cfb2a9fc00mr22962970pld.9.1701339088849;
        Thu, 30 Nov 2023 02:11:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id bd9-20020a656e09000000b0058ee60f8e4dsm794133pgb.34.2023.11.30.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 02:11:28 -0800 (PST)
Message-ID: <65685fd0.650a0220.86362.1b12@mx.google.com>
Date: Thu, 30 Nov 2023 02:11:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc3-291-g1867b4f140ac1
Subject: next/pending-fixes baseline: 93 runs,
 3 regressions (v6.7-rc3-291-g1867b4f140ac1)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 93 runs, 3 regressions (v6.7-rc3-291-g1867b4f1=
40ac1)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig          =
| regressions
-------------------+-------+---------------+----------+--------------------=
+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig          =
| 1          =

meson-gxm-q200     | arm64 | lab-baylibre  | gcc-10   | defconfig          =
| 1          =

rk3288-veyron-jaq  | arm   | lab-collabora | gcc-10   | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc3-291-g1867b4f140ac1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc3-291-g1867b4f140ac1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1867b4f140ac1336fdc9f7989171e230ab3cea6a =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig          =
| regressions
-------------------+-------+---------------+----------+--------------------=
+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig          =
| 1          =


  Details:     https://kernelci.org/test/plan/id/65682fddba9146ff267e4bf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-29=
1-g1867b4f140ac1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-29=
1-g1867b4f140ac1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65682fddba9146ff267e4=
bf1
        new failure (last pass: v6.7-rc3-265-g1618cb8f57417) =

 =



platform           | arch  | lab           | compiler | defconfig          =
| regressions
-------------------+-------+---------------+----------+--------------------=
+------------
meson-gxm-q200     | arm64 | lab-baylibre  | gcc-10   | defconfig          =
| 1          =


  Details:     https://kernelci.org/test/plan/id/65682ff98141c2bdc77e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-29=
1-g1867b4f140ac1/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-q20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-29=
1-g1867b4f140ac1/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-q20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65682ff98141c2bdc77e4=
a6e
        new failure (last pass: v6.7-rc3-265-g1618cb8f57417) =

 =



platform           | arch  | lab           | compiler | defconfig          =
| regressions
-------------------+-------+---------------+----------+--------------------=
+------------
rk3288-veyron-jaq  | arm   | lab-collabora | gcc-10   | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/65682ee8301a0ee3a57e4ae9

  Results:     65 PASS, 5 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-29=
1-g1867b4f140ac1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk328=
8-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-29=
1-g1867b4f140ac1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk328=
8-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
65682ee8301a0ee3a57e4b2f
        new failure (last pass: v6.7-rc3-265-g1618cb8f57417)

    2023-11-30T06:48:52.606922  <8>[   20.106153] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-driver-present RESULT=3Dpass>

    2023-11-30T06:48:53.624452  /lava-12131779/1/../bin/lava-test-case

    2023-11-30T06:48:53.653300  <8>[   21.153610] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>
   =

 =20

