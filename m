Return-Path: <linux-next+bounces-857-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC74983BED1
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 11:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3BA1F25F8D
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 10:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700571C6B0;
	Thu, 25 Jan 2024 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="eX+24vKW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B81CA94
	for <linux-next@vger.kernel.org>; Thu, 25 Jan 2024 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178674; cv=none; b=h6Yn/+CdVfO+8LSWXl8fvbQdBiRsL/YnwW9qCVebDDxcSllWLpdlx1KIembo1+Uq9+gJrY+/nnWqFgg1CXCIyv7AroQhQ8XdJyik9rPrke/ncgvrE6pMdBJh41fwObQHPt7+YDwsITJeN4TaLpUPZMbf91cZidJ1yL/h/5jdD0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178674; c=relaxed/simple;
	bh=n8pp5NgbbdbMT71fOBLrdDcrGaEJz1U5e84rkrH+opY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=uh47kVeDq3UKryBwaI2gwTuNae52q3+WPYlzVq+PaPz+lFNp/6CUpkn7UFezNfE2lsYdyEeOIm2mKHQxh0SXOWg3+ujjQmbMJtW1WuM/i3FTPGqiUs/AIp6sPmKa96Sb7WykL86tJEPNvL80owW9Ep64Gq2sGaZVSJTXRKxObVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=eX+24vKW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso3594956a12.1
        for <linux-next@vger.kernel.org>; Thu, 25 Jan 2024 02:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706178669; x=1706783469; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd/nupQ5StgqR8K46IKmXD3fCbVsi/dCUWIqFsYslp4=;
        b=eX+24vKWuAcEd5LeSNaxwgo1gRKkSBkRCjfQhcpNtV2QvetgV1U9IM9MD4kfcbqMFI
         bRidvRgSt60XcI1ZCOBUCcxqRcIfYdT76ncEhwzKb0wwM9U95T9KWcd/gpGebplo68vt
         HpY/yn3oYIuskUAm639MyyQ98S3qAUXMmjzAFyvdEzVqF6IKn64tLoMINb5z0Pi5klDr
         dHkIEIz+n3FOOuJq/7hDTGnMZ9cQBD7gFQEvbrR97REpIzf2/crI/YFAMfvEMtL6n3oM
         vqnd/4bZNQIduztVVN9lr8OuTf66XLFh4u6LlW1On/zVB2mfQyw1nL9hK/gtsK/n0xA1
         y4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706178669; x=1706783469;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jd/nupQ5StgqR8K46IKmXD3fCbVsi/dCUWIqFsYslp4=;
        b=Pc2+FSDIPcFpHkDCgkZZddWPq19ptKp82PxuQaofd6qPJzXKvKxiZIiEpsYMUCVMEI
         u9dZkQUVFyEMEPoTdx3QaBJ/W+owdr4RzMSnYNkfEP3290BYrUVGclAW/KLqz85C7BLB
         eOs/mSXdT5QvnfGoB/vmFB5GM7iFGQCRsDp8eZf08Q3XKGlLmPpKv9E6XneXMoEgADTk
         kLaP24ewaWQnh5obRrEsldo7hipuxitpkZ4hbrN+3Tx7XyYlZWZ4awhXNGr3RZH1rvhI
         Tg6fgAGL7ZtuxW1g4qSDmHXDgWp+WADuvpUVetzcwlG2J6iWt19HryZ4pJlZ18QbaHKw
         Oq3A==
X-Gm-Message-State: AOJu0YxdeiFqBVT2ICXCCvDW6xCeCwTGaHbCBrdwDR82yNr4oUg8/r40
	WWNlsSoxk1KeU7hJ9WTHPzNoGjq/ZmsYVauEgE/2OarRSjFhiCDEGFWCiAHle1IRb/IauZo8acm
	sYSo=
X-Google-Smtp-Source: AGHT+IGUJAGFyccTcr3MKK4JReGGARzOx4Wpff5giSh6+jlCVV6cic4mFxdZCBZmapWsI5Q4StCgSQ==
X-Received: by 2002:a05:6a20:158a:b0:19a:d8e2:feea with SMTP id h10-20020a056a20158a00b0019ad8e2feeamr776254pzj.34.1706178667569;
        Thu, 25 Jan 2024 02:31:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t28-20020a056a00139c00b006dd84763ce3sm4147789pfg.169.2024.01.25.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 02:31:06 -0800 (PST)
Message-ID: <65b2386a.050a0220.13b04.114d@mx.google.com>
Date: Thu, 25 Jan 2024 02:31:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20240125
X-Kernelci-Report-Type: test
Subject: next/master baseline: 470 runs, 76 regressions (next-20240125)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 470 runs, 76 regressions (next-20240125)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 7          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

odroid-xu3                   | arm   | lab-collabora | clang-17 | multi_v7_=
defconfig           | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240125/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240125
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      01af33cc9894b4489fb68fa35c40e9fe85df63dc =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1f2a8bb7e1fa7d552a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1f2a8bb7e1fa7d552a=
3f2
        failing since 358 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1f94f7a633f616e52a425

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65b1f94f7a633f616e52a445
        failing since 234 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-25T06:01:32.128994  /lava-505460/1/../bin/lava-test-case
    2024-01-25T06:01:32.174597  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fd9b11d2e14abd52a3f1

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65b1fd9b11d2e14abd52a410
        failing since 234 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-25T06:19:47.814153  /lava-505641/1/../bin/lava-test-case
    2024-01-25T06:19:47.855622  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1f532f555c4bbb052a497

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1f532f555c4bbb052a=
498
        failing since 234 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fe45b8ecc679e452a3f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1fe45b8ecc679e452a=
3f3
        failing since 302 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fe9ccdc6a204ef52a3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1fe9ccdc6a204ef52a=
3f9
        failing since 300 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b2023ff57087c24152a3fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b2023ff57087c24152a=
3fd
        new failure (last pass: next-20240124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65b201c9dc273c547852a42b

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65b201c9dc273c54=
7852a430
        new failure (last pass: next-20240124)
        1 lines

    2024-01-25T06:37:38.645901  / # =

    2024-01-25T06:37:38.653658  =

    2024-01-25T06:37:38.759646  / # #
    2024-01-25T06:37:38.765016  #
    2024-01-25T06:37:38.909922  / # export SHELL=3D/bin/sh
    2024-01-25T06:37:38.926052  export SHELL=3D/bin/sh
    2024-01-25T06:37:39.028104  / # . /lava-1082687/environment
    2024-01-25T06:37:39.038130  . /lava-1082687/environment
    2024-01-25T06:37:39.140652  / # /lava-1082687/bin/lava-test-runner /lav=
a-1082687/0
    2024-01-25T06:37:39.149784  /lava-1082687/bin/lava-test-runner /lava-10=
82687/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65b20197964fc0dd1252a44e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b20197964fc0dd1252a=
44f
        failing since 653 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b20258f94673913f52a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b20258f94673913f52a=
3f2
        failing since 76 days (last pass: next-20231103, first fail: next-2=
0231110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b202202a2f446bed52a41e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b202202a2f446bed52a=
41f
        failing since 83 days (last pass: next-20231025, first fail: next-2=
0231103) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65b1fb7583c9df00ab52a3fa

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1fb7583c9df00ab52a401
        failing since 42 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-25T06:10:38.094130  / # #
    2024-01-25T06:10:38.196340  export SHELL=3D/bin/sh
    2024-01-25T06:10:38.197080  #
    2024-01-25T06:10:38.298354  / # export SHELL=3D/bin/sh. /lava-421837/en=
vironment
    2024-01-25T06:10:38.299076  =

    2024-01-25T06:10:38.400323  / # . /lava-421837/environment/lava-421837/=
bin/lava-test-runner /lava-421837/1
    2024-01-25T06:10:38.401496  =

    2024-01-25T06:10:38.442345  / # /lava-421837/bin/lava-test-runner /lava=
-421837/1
    2024-01-25T06:10:38.470483  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:10:38.504483  + cd /lava-421837/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65b1fb7583c9df00ab52a405
        failing since 42 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-25T06:10:40.720088  /lava-421837/1/../bin/lava-test-case
    2024-01-25T06:10:40.748331  <8>[   26.038653] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
b1fb7583c9df00ab52a407
        failing since 42 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-25T06:10:41.809566  /lava-421837/1/../bin/lava-test-case
    2024-01-25T06:10:41.836069  <8>[   27.126695] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b1fb7583c9df00ab52a40c
        failing since 42 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-25T06:10:43.068825  /lava-421837/1/../bin/lava-test-case
    2024-01-25T06:10:43.096032  <8>[   28.386007] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65b1fb7583c9df00ab52a40d
        failing since 42 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-25T06:10:44.119123  /lava-421837/1/../bin/lava-test-case
    2024-01-25T06:10:44.146307  <8>[   29.436630] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b201b2dc273c547852a3f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b201b2dc273c547852a=
3f4
        failing since 41 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/65b2023ff57087c24152a3ff

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b2023ff57087c24152a406
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:39:28.771633  / # #
    2024-01-25T06:39:28.873758  export SHELL=3D/bin/sh
    2024-01-25T06:39:28.874559  #
    2024-01-25T06:39:28.975921  / # export SHELL=3D/bin/sh. /lava-421866/en=
vironment
    2024-01-25T06:39:28.976683  =

    2024-01-25T06:39:29.077951  / # . /lava-421866/environment/lava-421866/=
bin/lava-test-runner /lava-421866/1
    2024-01-25T06:39:29.079191  =

    2024-01-25T06:39:29.122354  / # /lava-421866/bin/lava-test-runner /lava=
-421866/1
    2024-01-25T06:39:29.186756  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:39:29.187196  + cd /lava-421866/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65b2023ff57087c24152a40a
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:39:31.399886  /lava-421866/1/../bin/lava-test-case
    2024-01-25T06:39:31.427312  <8>[   26.009787] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
b2023ff57087c24152a40c
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:39:32.488720  /lava-421866/1/../bin/lava-test-case
    2024-01-25T06:39:32.514627  <8>[   27.097290] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b2023ff57087c24152a411
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:39:33.748799  /lava-421866/1/../bin/lava-test-case
    2024-01-25T06:39:33.774790  <8>[   28.356173] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65b2023ff57087c24152a412
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:39:34.798202  /lava-421866/1/../bin/lava-test-case
    2024-01-25T06:39:34.825408  <8>[   29.406259] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65b202ba403d20916152a477

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b202ba403d20916152a47e
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:41:46.262128  / # #
    2024-01-25T06:41:46.364534  export SHELL=3D/bin/sh
    2024-01-25T06:41:46.365286  #
    2024-01-25T06:41:46.466841  / # export SHELL=3D/bin/sh. /lava-421876/en=
vironment
    2024-01-25T06:41:46.467593  =

    2024-01-25T06:41:46.569029  / # . /lava-421876/environment/lava-421876/=
bin/lava-test-runner /lava-421876/1
    2024-01-25T06:41:46.570324  =

    2024-01-25T06:41:46.589016  / # /lava-421876/bin/lava-test-runner /lava=
-421876/1
    2024-01-25T06:41:46.669092  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:41:46.669530  + cd /lava-421876/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65b202ba403d20916152a482
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:41:48.832832  /lava-421876/1/../bin/lava-test-case
    2024-01-25T06:41:48.853893  <8>[   25.824024] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
b202ba403d20916152a484
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:41:49.903688  /lava-421876/1/../bin/lava-test-case
    2024-01-25T06:41:49.924836  <8>[   26.896303] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b202ba403d20916152a489
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:41:51.116380  /lava-421876/1/../bin/lava-test-case
    2024-01-25T06:41:51.137785  <8>[   28.109003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65b202ba403d20916152a48a
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:41:52.175974  /lava-421876/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65b20678b9e058b27352a47d

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b20678b9e058b27352a484
        failing since 43 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-25T06:57:37.269488  =

    2024-01-25T06:57:37.370931  / # #export SHELL=3D/bin/sh
    2024-01-25T06:57:37.371605  =

    2024-01-25T06:57:37.472639  / # export SHELL=3D/bin/sh. /lava-421888/en=
vironment
    2024-01-25T06:57:37.472921  =

    2024-01-25T06:57:37.573480  / # . /lava-421888/environment/lava-421888/=
bin/lava-test-runner /lava-421888/1
    2024-01-25T06:57:37.573996  =

    2024-01-25T06:57:37.613976  / # /lava-421888/bin/lava-test-runner /lava=
-421888/1
    2024-01-25T06:57:37.643429  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:57:37.677369  + cd /lava-421888/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65b20678b9e058b27352a488
        failing since 43 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-25T06:57:39.894679  /lava-421888/1/../bin/lava-test-case
    2024-01-25T06:57:39.921739  <8>[   26.006780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
b20678b9e058b27352a48a
        failing since 43 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-25T06:57:40.982830  /lava-421888/1/../bin/lava-test-case
    2024-01-25T06:57:41.010204  <8>[   27.095289] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b20678b9e058b27352a48f
        failing since 43 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-25T06:57:42.243271  /lava-421888/1/../bin/lava-test-case
    2024-01-25T06:57:42.270151  <8>[   28.354961] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65b20678b9e058b27352a490
        failing since 43 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-25T06:57:43.293050  /lava-421888/1/../bin/lava-test-case
    2024-01-25T06:57:43.321098  <8>[   29.405457] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65b1fb72a50cbdc4be52a3f4

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1fb72a50cbdc4be52a3fb
        failing since 42 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-25T06:10:39.057711  / # #
    2024-01-25T06:10:39.159970  export SHELL=3D/bin/sh
    2024-01-25T06:10:39.160698  #
    2024-01-25T06:10:39.261980  / # export SHELL=3D/bin/sh. /lava-421835/en=
vironment
    2024-01-25T06:10:39.262757  =

    2024-01-25T06:10:39.364050  / # . /lava-421835/environment/lava-421835/=
bin/lava-test-runner /lava-421835/1
    2024-01-25T06:10:39.364496  =

    2024-01-25T06:10:39.371357  / # /lava-421835/bin/lava-test-runner /lava=
-421835/1
    2024-01-25T06:10:39.468611  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:10:39.468952  + cd /lava-421835/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b1fb73a50cbdc4be52a40e
        failing since 42 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-25T06:10:42.400470  /lava-421835/1/../bin/lava-test-case
    2024-01-25T06:10:42.427672  <8>[   27.102842] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b201c6dc273c547852a425

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b201c6dc273c547852a=
426
        failing since 41 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65b202422a2f446bed52a440

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b202422a2f446bed52a447
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:39:38.528453  / # #
    2024-01-25T06:39:38.630752  export SHELL=3D/bin/sh
    2024-01-25T06:39:38.631467  #
    2024-01-25T06:39:38.732828  / # export SHELL=3D/bin/sh. /lava-421867/en=
vironment
    2024-01-25T06:39:38.733145  =

    2024-01-25T06:39:38.834081  / # . /lava-421867/environment/lava-421867/=
bin/lava-test-runner /lava-421867/1
    2024-01-25T06:39:38.835268  =

    2024-01-25T06:39:38.840445  / # /lava-421867/bin/lava-test-runner /lava=
-421867/1
    2024-01-25T06:39:38.904465  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:39:38.938312  + cd /lava-421867/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b202422a2f446bed52a45a
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:39:41.876148  /lava-421867/1/../bin/lava-test-case
    2024-01-25T06:39:41.904146  <8>[   27.090783] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65b202b7403d20916152a411

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b202b7403d20916152a418
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:41:37.982726  / # #
    2024-01-25T06:41:38.084725  export SHELL=3D/bin/sh
    2024-01-25T06:41:38.085435  #
    2024-01-25T06:41:38.186483  / # export SHELL=3D/bin/sh. /lava-421872/en=
vironment
    2024-01-25T06:41:38.187105  =

    2024-01-25T06:41:38.288316  / # . /lava-421872/environment/lava-421872/=
bin/lava-test-runner /lava-421872/1
    2024-01-25T06:41:38.289585  =

    2024-01-25T06:41:38.330371  / # /lava-421872/bin/lava-test-runner /lava=
-421872/1
    2024-01-25T06:41:38.399113  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:41:38.399328  + cd /lava-421872/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b202b7403d20916152a42b
        failing since 44 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-25T06:41:41.161004  /lava-421872/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65b2063cb9a5b876bd52a405

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b2063cb9a5b876bd52a40c
        failing since 43 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-25T06:56:41.624086  / # #
    2024-01-25T06:56:41.726413  export SHELL=3D/bin/sh
    2024-01-25T06:56:41.727177  #
    2024-01-25T06:56:41.828622  / # export SHELL=3D/bin/sh. /lava-421887/en=
vironment
    2024-01-25T06:56:41.829387  =

    2024-01-25T06:56:41.930798  / # . /lava-421887/environment/lava-421887/=
bin/lava-test-runner /lava-421887/1
    2024-01-25T06:56:41.931813  =

    2024-01-25T06:56:41.951077  / # /lava-421887/bin/lava-test-runner /lava=
-421887/1
    2024-01-25T06:56:42.038969  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:56:42.039413  + cd /lava-421887/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b2063cb9a5b876bd52a41f
        failing since 43 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-25T06:56:44.971027  /lava-421887/1/../bin/lava-test-case
    2024-01-25T06:56:45.000206  <8>[   27.088883] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/65b201b30f6f63989c52a411

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65b201b30f6f639=
89c52a414
        failing since 50 days (last pass: next-20231120, first fail: next-2=
0231205)
        2 lines

    2024-01-25T06:37:19.116302  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-01-25T06:37:19.116687  kern  :alert : Data abort info:
    2024-01-25T06:37:19.154279  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-01-25T06:37:19.155487  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-01-25T06:37:19.156021  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-01-25T06:37:19.156399  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-01-25T06:37:19.156747  kern  :emerg : Internal error: Oops: 00<8>[=
   19.587103] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNIT=
S=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65b201b30f6f639=
89c52a415
        failing since 50 days (last pass: next-20231120, first fail: next-2=
0231205)
        12 lines

    2024-01-25T06:37:19.111632  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-01-25T06:37:19.112240  kern  :alert : Mem abort info:
    2024-01-25T06:37:19.112636  kern  :alert :   ESR =3D 0x0000000096000004
    2024-01-25T06:37:19.112997  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits<8>[   19.540340] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3D=
alert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2024-01-25T06:37:19.113358  =

    2024-01-25T06:37:19.113692  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-01-25T06:37:19.114017  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b20287f94673913f52a435

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b20287f94673913f52a=
436
        failing since 351 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65b1ff558f149ff16e52a3f1

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65b1ff558f149ff=
16e52a3f4
        new failure (last pass: next-20240124)
        2 lines

    2024-01-25T06:27:05.321702  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2024-01-25T06:27:05.326573  kern  :emerg : Code: d2800027 d2e02809 f2e0=
0807 17ffffda (d4210000) =

    2024-01-25T06:27:05.389005  <8>[   28.333972] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-01-25T06:27:05.389575  + set +x   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65b1ff558f149ff1=
6e52a3f6
        new failure (last pass: next-20240124)
        1 lines

    2024-01-25T06:27:03.982574  / # =

    2024-01-25T06:27:03.990429  =

    2024-01-25T06:27:04.096563  / # #
    2024-01-25T06:27:04.104085  #
    2024-01-25T06:27:04.206661  / # export SHELL=3D/bin/sh
    2024-01-25T06:27:04.214994  export SHELL=3D/bin/sh
    2024-01-25T06:27:04.317048  / # . /lava-505665/environment
    2024-01-25T06:27:04.324324  . /lava-505665/environment
    2024-01-25T06:27:04.426115  / # /lava-505665/bin/lava-test-runner /lava=
-505665/0
    2024-01-25T06:27:04.431852  /lava-505665/bin/lava-test-runner /lava-505=
665/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b201dfbfdb88e3f352a3f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b201dfbfdb88e3f352a=
3f5
        failing since 351 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 7          =


  Details:     https://kernelci.org/test/plan/id/65b1ffe8f9666d5e8052a438

  Results:     41 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl-=
s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl-=
s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65b1ffe8f=
9666d5e8052a43f
        new failure (last pass: next-20240124)

    2024-01-25T06:29:31.867892  /lava-454993/1/../bin/lava-test-case
    2024-01-25T06:29:31.931886  <8>[   48.786601] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
b1ffe8f9666d5e8052a440
        new failure (last pass: next-20240124)

    2024-01-25T06:29:30.721065  /lava-454993/1/../bin/lava-test-case
    2024-01-25T06:29:30.722168  <3>[   47.576775] mmc0: error -84 whilst in=
itialising SD card
    2024-01-25T06:29:30.780132  <8>[   47.634208] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =


  * baseline.bootrr.dw-hdmi-i2s-audio-driver-present: https://kernelci.org/=
test/case/id/65b1ffe8f9666d5e8052a448
        new failure (last pass: next-20240124)

    2024-01-25T06:29:26.499818  <3>[   43.353388] mmc0: error -84 whilst in=
itialising SD card
    2024-01-25T06:29:27.331708  /lava-454993/1/../bin/lava-test-case
    2024-01-25T06:29:27.395527  <8>[   44.250795] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddw-hdmi-i2s-audio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.lima-driver-present: https://kernelci.org/test/case/id/=
65b1ffe8f9666d5e8052a44b
        new failure (last pass: next-20240124)

    2024-01-25T06:29:23.552339  /lava-454993/1/../bin/lava-test-case
    2024-01-25T06:29:23.622391  <8>[   40.476515] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddrm-probed RESULT=3Dblocked>
    2024-01-25T06:29:24.387275  <3>[   41.241328] mmc0: error -84 whilst in=
itialising SD card
    2024-01-25T06:29:24.707154  /lava-454993/1/../bin/lava-test-case
    2024-01-25T06:29:24.778268  <8>[   41.632553] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.meson-drm-driver-present: https://kernelci.org/test/cas=
e/id/65b1ffe8f9666d5e8052a44c
        new failure (last pass: next-20240124)

    2024-01-25T06:29:20.160527  <3>[   37.016687] mmc0: error -84 whilst in=
itialising SD card
    2024-01-25T06:29:21.247699  /lava-454993/1/../bin/lava-test-case
    2024-01-25T06:29:21.307819  <8>[   38.161736] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-tx-present RESULT=3Dblocked>
    2024-01-25T06:29:22.275589  <3>[   39.129347] mmc0: error -84 whilst in=
itialising SD card
    2024-01-25T06:29:22.403555  /lava-454993/1/../bin/lava-test-case
    2024-01-25T06:29:22.464622  <8>[   39.318902] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmeson-drm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.meson-dw-hdmi-driver-present: https://kernelci.org/test=
/case/id/65b1ffe8f9666d5e8052a44d
        new failure (last pass: next-20240124)

    2024-01-25T06:29:20.075953  /lava-454993/1/../bin/lava-test-case
    2024-01-25T06:29:20.159156  <8>[   37.001288] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmeson-dw-hdmi-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1ffe8f9666d5e8052a46d
        new failure (last pass: next-20240124)

    2024-01-25T06:29:12.350424  / # #
    2024-01-25T06:29:12.452186  export SHELL=3D/bin/sh
    2024-01-25T06:29:12.452855  #
    2024-01-25T06:29:12.553810  / # export SHELL=3D/bin/sh. /lava-454993/en=
vironment
    2024-01-25T06:29:12.554433  =

    2024-01-25T06:29:12.655536  / # . /lava-454993/environment/lava-454993/=
bin/lava-test-runner /lava-454993/1
    2024-01-25T06:29:12.656408  =

    2024-01-25T06:29:12.660226  / # /lava-454993/bin/lava-test-runner /lava=
-454993/1
    2024-01-25T06:29:12.952214  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:29:12.953328  + cd /lava-454993/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b202cc45ffcf9e7b52a3f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b202cc45ffcf9e7b52a=
3f6
        failing since 351 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fc69eae6f223da52a3fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1fc69eae6f223da52a=
3fb
        new failure (last pass: next-20240124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fbe73a5e357f4952a3f6

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1fbe73a5e357f4952a3fb
        new failure (last pass: next-20240124)

    2024-01-25T06:12:39.919227  / # =


    2024-01-25T06:12:39.919573  <6>[   17.254035] mediatek-drm mediatek-drm=
.16.auto: bound 1c015000.dp-intf (ops mtk_dpi_component_ops [mediatek_drm])

    2024-01-25T06:12:39.919649  <6>[   17.266671] mtk-vcodec-enc 1a020000.v=
ideo-codec: Adding to iommu group 2

    2024-01-25T06:12:39.919712  <6>[   17.275185] mtk-vcodec-dec 18000000.v=
ideo-codec: Adding to iommu group 2

    2024-01-25T06:12:39.919772  <6>[   17.285918] mediatek-disp-ethdr 1c114=
000.hdr-engine: Adding to iommu group 1

    2024-01-25T06:12:39.919839  <6>[   17.294095] mediatek-mdp-rdma 1c10400=
0.dma-controller: Adding to iommu group 1

    2024-01-25T06:12:39.961951  <6>[   17.302314] mtk-vdec-comp 18002000.vi=
deo-codec: Adding to iommu group 2

    2024-01-25T06:12:39.962040  <6>[   17.309251] mediatek-mdp-rdma 1c10500=
0.dma-controller: Adding to iommu group 1

    2024-01-25T06:12:39.962109  =


    2024-01-25T06:12:39.962171  <6>[   17.316917] mtk-vdec-comp 18010000.vi=
deo-codec: Adding to iommu group 2
 =

    ... (85 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1f9a76c19fecae352a3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1f9a76c19fecae352a=
3f9
        new failure (last pass: next-20240124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fac22f1c8011bb52a43b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1fac22f1c8011bb52a=
43c
        failing since 7 days (last pass: next-20240117, first fail: next-20=
240118) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65b203c74a3c79ff3152a421

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b203c74a3c79ff3152a42a
        failing since 177 days (last pass: next-20230712, first fail: next-=
20230801)

    2024-01-25T06:46:04.908470  + set +x
    2024-01-25T06:46:04.911714  <8>[   28.649235] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1082783_1.5.2.4.1>
    2024-01-25T06:46:05.019763  / # #
    2024-01-25T06:46:06.477897  export SHELL=3D/bin/sh
    2024-01-25T06:46:06.498633  #
    2024-01-25T06:46:06.499038  / # export SHELL=3D/bin/sh
    2024-01-25T06:46:08.448499  / # . /lava-1082783/environment
    2024-01-25T06:46:12.034717  /lava-1082783/bin/lava-test-runner /lava-10=
82783/1
    2024-01-25T06:46:12.055903  . /lava-1082783/environment
    2024-01-25T06:46:12.056265  / # /lava-1082783/bin/lava-test-runner /lav=
a-1082783/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65b20290a91bc1050652a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b20290a91bc1050652a=
3f2
        failing since 428 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65b20178964fc0dd1252a401

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b20178964fc0dd1252a=
402
        failing since 428 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1f7a717b4a4b2c652a405

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1f7a717b4a4b2c652a=
406
        failing since 351 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1f785a20559f56852a423

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1f785a20559f56852a=
424
        failing since 351 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b20204bfdb88e3f352a402

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b20204bfdb88e3f352a=
403
        failing since 103 days (last pass: next-20230125, first fail: next-=
20231013) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65b204849d3b93fd0c52a43b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b204849d3b93fd0c52a=
43c
        new failure (last pass: next-20240118) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b201b30f6f63989c52a41d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b201b30f6f63989c52a=
41e
        failing since 349 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65b201b4dc273c547852a3fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b201b4dc273c547852a=
3fd
        failing since 349 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1f925e43748906752a48b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1f925e43748906752a494
        failing since 232 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-25T06:00:50.503668  / # #
    2024-01-25T06:00:50.605848  export SHELL=3D/bin/sh
    2024-01-25T06:00:50.606188  #
    2024-01-25T06:00:50.706928  / # export SHELL=3D/bin/sh. /lava-3914105/e=
nvironment
    2024-01-25T06:00:50.707274  =

    2024-01-25T06:00:50.808190  / # . /lava-3914105/environ/lava-3914105/bi=
n/lava-test-runner /lava-3914105/1
    2024-01-25T06:00:50.809584  ment
    2024-01-25T06:00:50.828547  / # /lava-3914105/bin/lava-test-runner /lav=
a-3914105/1
    2024-01-25T06:00:50.924417  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:00:50.960168  + cd /lava-3914105/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1f92ff05aa82b4052a3f5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1f92ff05aa82b4052a3fe
        failing since 232 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-25T06:00:57.693990  + set +x
    2024-01-25T06:00:57.695763  [   20.607839] <LAVA_SIGNAL_ENDRUN 0_dmesg =
454968_1.5.2.4.1>
    2024-01-25T06:00:57.804324  / # #
    2024-01-25T06:00:57.905913  export SHELL=3D/bin/sh
    2024-01-25T06:00:57.906444  #
    2024-01-25T06:00:58.007410  / # export SHELL=3D/bin/sh. /lava-454968/en=
vironment
    2024-01-25T06:00:58.007976  =

    2024-01-25T06:00:58.108905  / # . /lava-454968/environment/lava-454968/=
bin/lava-test-runner /lava-454968/1
    2024-01-25T06:00:58.109716  =

    2024-01-25T06:00:58.112418  / # /lava-454968/bin/lava-test-runner /lava=
-454968/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fa490538a8c51752a3f5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1fa490538a8c51752a3fe
        failing since 238 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-25T06:05:45.228206  / #
    2024-01-25T06:05:45.331063  # #export SHELL=3D/bin/sh
    2024-01-25T06:05:45.332194  =

    2024-01-25T06:05:45.433791  / # export SHELL=3D/bin/sh. /lava-3914109/e=
nvironment
    2024-01-25T06:05:45.434778  =

    2024-01-25T06:05:45.536854  / # . /lava-3914109/environment/lava-391410=
9/bin/lava-test-runner /lava-3914109/1
    2024-01-25T06:05:45.538491  =

    2024-01-25T06:05:45.553311  / # /lava-3914109/bin/lava-test-runner /lav=
a-3914109/1
    2024-01-25T06:05:45.675046  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:05:45.676226  + cd /lava-3914109/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fda4cf2760c8fb52a405

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1fda4cf2760c8fb52a40e
        failing since 232 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-25T06:19:56.067118  / # #
    2024-01-25T06:19:56.169902  export SHELL=3D/bin/sh
    2024-01-25T06:19:56.170793  #
    2024-01-25T06:19:56.272529  / # export SHELL=3D/bin/sh. /lava-3914173/e=
nvironment
    2024-01-25T06:19:56.273423  =

    2024-01-25T06:19:56.374899  / # . /lava-3914173/environment/lava-391417=
3/bin/lava-test-runner /lava-3914173/1
    2024-01-25T06:19:56.376577  =

    2024-01-25T06:19:56.390500  / # /lava-3914173/bin/lava-test-runner /lav=
a-3914173/1
    2024-01-25T06:19:56.510098  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T06:19:56.510850  + cd /lava-3914173/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65b2053a57ad50523052a443

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b2053a57ad50523052a44c
        failing since 238 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-25T06:52:13.379976  <8>[   16.096494] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3914248_1.5.2.4.1>
    2024-01-25T06:52:13.484103  / # #
    2024-01-25T06:52:13.585198  export SHELL=3D/bin/sh
    2024-01-25T06:52:13.585554  #
    2024-01-25T06:52:13.686278  / # export SHELL=3D/bin/sh. /lava-3914248/e=
nvironment
    2024-01-25T06:52:13.686634  =

    2024-01-25T06:52:13.787335  / # . /lava-3914248/environment/lava-391424=
8/bin/lava-test-runner /lava-3914248/1
    2024-01-25T06:52:13.787910  =

    2024-01-25T06:52:13.797841  / # /lava-3914248/bin/lava-test-runner /lav=
a-3914248/1
    2024-01-25T06:52:13.916966  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fa47321923340352a3fc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1fa47321923340352a405
        failing since 238 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-25T06:05:42.011479  + set +x
    2024-01-25T06:05:42.013121  [   20.616060] <LAVA_SIGNAL_ENDRUN 0_dmesg =
454972_1.5.2.4.1>
    2024-01-25T06:05:42.122347  / # #
    2024-01-25T06:05:42.223877  export SHELL=3D/bin/sh
    2024-01-25T06:05:42.224429  #
    2024-01-25T06:05:42.325408  / # export SHELL=3D/bin/sh. /lava-454972/en=
vironment
    2024-01-25T06:05:42.325978  =

    2024-01-25T06:05:42.426965  / # . /lava-454972/environment/lava-454972/=
bin/lava-test-runner /lava-454972/1
    2024-01-25T06:05:42.427806  =

    2024-01-25T06:05:42.430210  / # /lava-454972/bin/lava-test-runner /lava=
-454972/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1fe432a8633764852a411

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1fe432a8633764852a41a
        failing since 232 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-25T06:22:40.562555  + set +x[   20.494741] <LAVA_SIGNAL_ENDRUN =
0_dmesg 454991_1.5.2.4.1>
    2024-01-25T06:22:40.562880  =

    2024-01-25T06:22:40.670636  / # #
    2024-01-25T06:22:40.772179  export SHELL=3D/bin/sh
    2024-01-25T06:22:40.772694  #
    2024-01-25T06:22:40.873668  / # export SHELL=3D/bin/sh. /lava-454991/en=
vironment
    2024-01-25T06:22:40.874211  =

    2024-01-25T06:22:40.975199  / # . /lava-454991/environment/lava-454991/=
bin/lava-test-runner /lava-454991/1
    2024-01-25T06:22:40.976022  =

    2024-01-25T06:22:40.978643  / # /lava-454991/bin/lava-test-runner /lava=
-454991/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65b2053857ad50523052a403

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240125/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b2053857ad50523052a40c
        failing since 238 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-25T06:52:13.839441  + set +x
    2024-01-25T06:52:13.841232  [   24.226270] <LAVA_SIGNAL_ENDRUN 0_dmesg =
455008_1.5.2.4.1>
    2024-01-25T06:52:13.949359  / # #
    2024-01-25T06:52:14.050899  export SHELL=3D/bin/sh
    2024-01-25T06:52:14.051418  #
    2024-01-25T06:52:14.152406  / # export SHELL=3D/bin/sh. /lava-455008/en=
vironment
    2024-01-25T06:52:14.152995  =

    2024-01-25T06:52:14.254009  / # . /lava-455008/environment/lava-455008/=
bin/lava-test-runner /lava-455008/1
    2024-01-25T06:52:14.254829  =

    2024-01-25T06:52:14.257381  / # /lava-455008/bin/lava-test-runner /lava=
-455008/1 =

    ... (12 line(s) more)  =

 =20

