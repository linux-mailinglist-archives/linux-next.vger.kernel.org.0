Return-Path: <linux-next+bounces-2364-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C431F8CA753
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 06:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37E1FB21B60
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 04:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6582B9A3;
	Tue, 21 May 2024 04:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xxlTZFDk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AB72AE6A
	for <linux-next@vger.kernel.org>; Tue, 21 May 2024 04:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716265735; cv=none; b=MDvMsujn2GjV7xrUWIQppRV9bs7WRHBEkZ6idQc1oJSUYHG/eUMe6Cx+i2Zqpzp5Uzbj2ndTVr/0XPbD1Gkm6jmUKQirveClGPl3DWmCK8jKe+eH93vY0Q6U6TIiTjVcPv/hNlg2ENjFKZcW4bfR4zPwXIqITnJ6ceq2wyEayl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716265735; c=relaxed/simple;
	bh=Z4Mv1gXY/Hcf3BHRhPJFnB8A3gkNRyi3chuOBgZ1vqc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=jOu337mQ8YbFPIYvDq1P42QPC03RkaSWX2iETlWMNoGPEshGyJrSiS2XQmb4HxRPSZnZgWh+geG84LrhV4dWexs2HbFS/N0Hw58UV5IF0GkpJ08eK5rfXSRTzSu33Xc0T61EwktokxGICz/PdNY6I1Ycm0QUAn34XaQ6uPsCBBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xxlTZFDk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ee954e0aa6so66355115ad.3
        for <linux-next@vger.kernel.org>; Mon, 20 May 2024 21:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716265733; x=1716870533; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NMTZk08pzRDa5vXwpg89S4Yw1AxkJqthk6YhcyqYuh4=;
        b=xxlTZFDkiMZ5u3H4UdqVBydABygB9jaNLCMlMO7aZtg9KGd+NwID+52dCVhGuPhrIv
         1p/sXUkEVvIZdc1N9zMteKY4f/vjoVhe2/92rQ+yVnp17LGkCspQ+BJPOMK1xBwznugJ
         ZSVxIkQsLs/sqT3SIgje1k9xuBJ7zqUj5SfSck7tPlgWpHT1xEPBD1hmMW+zJstE6SON
         ekcUfm9neQhXfaUVZQzYs5YXXMYQlS3TPlArzCTVesyADwwZ9oYkPZE1ugHcz1Hsig2K
         ySkdnmX95VVCwBbudm+UEPRnqvoid6MSoC70x+jB/SJZ2ms1yHPPNOkL5EvRhl3y8Il5
         50xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716265733; x=1716870533;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMTZk08pzRDa5vXwpg89S4Yw1AxkJqthk6YhcyqYuh4=;
        b=Xw0EDzIDwg/1/yzrlYX+UhdVd7E73iTOx4xjoUrIgAHWutzMTsN9n6FjVxxYkV2eVe
         gWPasQE3H1KymDRbvon6wRJu1yRrZ4nwFnKgqpF9mwLPOpnKQkJeGBwKp605B4Yh6/bq
         MwpXqbEP9vkQ2wG3MLfWs4SX9fr2IYoFfFRUBD5vMJCvcx5PEFalnHsSc+HBc5x3E1ah
         B7mCeV6o6/fZhPwUhXyhsMZXXHGCNSSmwdjO3qn9m4B7pINp4R/mZwo8MqU3NCJ55ndi
         DL4aDly3lrpj360bqLoI+Ycv9lJYuDLpfphSsAoObABaVJ+4prwUQ7yezOIbAzTKjt2+
         wmeA==
X-Gm-Message-State: AOJu0Yz3JnTfydcl6692ZNTYp24P8F0tgWpY2xw9g3TCYCt12Vf0mQPO
	GqCd/tTU/efBRT/ecrS2lKR4H3pXuy8BKrxFTGma9MLWcAUMbNILKSQRs167CTuLI68yJ5+47nN
	dCwAJhg==
X-Google-Smtp-Source: AGHT+IELMCRK65O1aoCssGNtHeLgzWv8PZs59vJf/+E9o+X1PAY13dajYH5JQ1kW20Neu1pLHBc3MA==
X-Received: by 2002:a17:902:f604:b0:1f3:1092:ab51 with SMTP id d9443c01a7336-1f31092aca5mr1824625ad.57.1716265732872;
        Mon, 20 May 2024 21:28:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f0958d1e3csm100189965ad.191.2024.05.20.21.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 21:28:52 -0700 (PDT)
Message-ID: <664c2304.170a0220.989e5.a486@mx.google.com>
Date: Mon, 20 May 2024 21:28:52 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-10379-g312341eae7278
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 79 runs,
 5 regressions (v6.9-10379-g312341eae7278)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 79 runs, 5 regressions (v6.9-10379-g312341eae7=
278)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =

hifive-unleashed-a00     | riscv | lab-baylibre    | gcc-10   | defconfig  =
        | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig  =
        | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-10379-g312341eae7278/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-10379-g312341eae7278
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      312341eae7278480e299d1fd9f4810fbd5b53190 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/664beefa32f7096c2f4c43ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sam=
a5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sam=
a5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664beefa32f7096c2f4c4=
3ac
        new failure (last pass: v6.9-8349-g458b2d56b05c) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
hifive-unleashed-a00     | riscv | lab-baylibre    | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/664bee5fc976623ab14c4470

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashe=
d-a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashe=
d-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664bee5fc976623ab14c4=
471
        failing since 1 day (last pass: v6.9-8349-g458b2d56b05c, first fail=
: v6.9-9758-gebddc92261ee1) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/664bf22e7c81e4f79a4c42f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoc=
omm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoc=
omm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664bf22e7c81e4f79a4c4=
2f5
        new failure (last pass: v6.9-9758-gebddc92261ee1) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/664c07cfb795e1c5ec4c42ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664c07cfb795e1c5ec4c4=
2eb
        failing since 1 day (last pass: v6.9-8349-g458b2d56b05c, first fail=
: v6.9-9758-gebddc92261ee1) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/664bee4f60910c5a154c435f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-10379-=
g312341eae7278/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664bee4f60910c5a154c4=
360
        failing since 56 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

