Return-Path: <linux-next+bounces-2267-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988BA8C25DD
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 15:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D652285792
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 13:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2354A7E583;
	Fri, 10 May 2024 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YBi5L8iF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4355E099
	for <linux-next@vger.kernel.org>; Fri, 10 May 2024 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348160; cv=none; b=Gil6TElkXH9TbKR2i5bAeZ2QkA/+42xwexUL0QH51OBX5GIGIhU70n35AXVCH/gXtHbWtuRfjx8gnXB6Uod2ltvJtCmCTf2NDXsx/vkJcZwIlAiskahdfPlFGKAWY1Rjl71Wcain/DkfEpV4Sl0mX2pLW2vbcfVplGwN0N5VX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348160; c=relaxed/simple;
	bh=LAaaEd3SoQ6HA53+8WuPWm6T5USxXb6iQptPjSehrB0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Hs02t/1dfojm3ot7+r+niDRiJQwSR4x42s2+7qJBHS9v629OHPBf0MwVg5eVkV1X5nP4/zSU95/sjBlOfrFmQ6mgYTbV6T3hgGJPqi4nbp/LLiJCaAFhJ0hG7ywo9QkKo6fPHBRmiibGJxdxdtPgUfCLihbQJEGNejvzt8O/wqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YBi5L8iF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso14212955ad.3
        for <linux-next@vger.kernel.org>; Fri, 10 May 2024 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715348157; x=1715952957; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GIco0C1pNEcJJKyK7CF68uKGAECWSiAJv8YA9pNC0zw=;
        b=YBi5L8iF5x7UtX4EFZsKoLee7kgHFr3WQg+FMYmTI8jU+AbIr0K5awROotbdP7WSLR
         mPN87U7tEjPwkjToZr32ewRVVHw8YWimff4bmRw3w2iHk6SorFij0IQgXPtd4sJz10+O
         DYfFIunNEbaPDj/uxp0UyoFgunDfD/NVwqDpJmkCnNIS8nOO3su6WJ5T7wVPriphcSu8
         cn2LlRpJevXljD9P9F3avbKPij3Y3yI4G2nN34nOFv1rXCuLs2op82lJnxVDBzXJgXSL
         m6m7G3bsTvwUAyzVOxunCV0QLjUDUv30oh6iRUo7RFHqNS/AbhtYqZR6/TjOMzWzLs9d
         F0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715348157; x=1715952957;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIco0C1pNEcJJKyK7CF68uKGAECWSiAJv8YA9pNC0zw=;
        b=n7JGtS66+UqUV0y5JABySEqifnSVeFux0puuaP1OfbaTFrBsR1AzOHARdsQC9khRrY
         pPa5W3A6cUuvGizG9Qc55ZH8Z/KdMxgR+kngPGLi38mVp7wW7mLW3O6PiPdhDxlQqJiz
         ZL5iwm/5rLF9yJ4Ej5fHnUVumpOBj2xFlza44G4PKzezmUhs+O8spds8ALPZ+NHXUuRw
         sKEPbIyVbrsOlXq6Kjd2jUzjRhZ/x7FH8+B86gvZ/1/h3uGhaT4dxi57I9FGNROmspw6
         UWYuwqPxaN1EVQK7uxcqKDTe1J6c57fXpVmBBnnA6isz/fNeW2IeyczPApOmjnkb3npR
         UNdg==
X-Gm-Message-State: AOJu0YyT2mHkobmQb3zpwWJDg17pdRCK6NnyRLh0ZfveS+U8Eskm0OAh
	/y6bIPpoWUqhNC/i53uD0/a/eYXzy/9Kmo0zkhFtJ3FKafrP1FnUh9jB8XB+HJtiRlmcMCfjgIL
	8KwE=
X-Google-Smtp-Source: AGHT+IEvGrKJq6yNM/C30BdIf8I1deJrlZj23HR8fiGwD2bMFon8oJhTM5yhmXfRMtutdcaVRMeUgA==
X-Received: by 2002:a17:903:2d2:b0:1eb:1008:2dca with SMTP id d9443c01a7336-1ef43f4cf0cmr31840095ad.49.1715348156743;
        Fri, 10 May 2024 06:35:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d4278sm32598395ad.12.2024.05.10.06.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 06:35:56 -0700 (PDT)
Message-ID: <663e22bc.170a0220.79856.8d2e@mx.google.com>
Date: Fri, 10 May 2024 06:35:56 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240510
X-Kernelci-Report-Type: test
Subject: next/master baseline: 214 runs, 7 regressions (next-20240510)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 214 runs, 7 regressions (next-20240510)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+kselftest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240510/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240510
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      75fa778d74b786a1608d55d655d42b480a6fa8bd =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/663de86273ad387db74c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240510/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240510/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663de86273ad387db74c4=
2e2
        failing since 464 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/663de93926ee8783cf4c4338

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240510/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240510/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663de93926ee8783cf4c4=
339
        failing since 340 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/663df006515df9b10a4c42da

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240510/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240510/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/663df006515df9b1=
0a4c42df
        new failure (last pass: next-20240508)
        1 lines

    2024-05-10T09:59:29.230679  / # =

    2024-05-10T09:59:29.239650  =

    2024-05-10T09:59:29.345371  / # #
    2024-05-10T09:59:29.351642  #
    2024-05-10T09:59:29.497506  / # export SHELL=3D/bin/sh
    2024-05-10T09:59:29.511694  export SHELL=3D/bin/sh
    2024-05-10T09:59:29.613584  / # . /lava-1130530/environment
    2024-05-10T09:59:29.623540  . /lava-1130530/environment
    2024-05-10T09:59:29.725502  / # /lava-1130530/bin/lava-test-runner /lav=
a-1130530/0
    2024-05-10T09:59:29.735466  /lava-1130530/bin/lava-test-runner /lava-11=
30530/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/663de4b3728238132f4c42eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240510/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240510/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663de4b3728238132f4c4=
2ec
        failing since 4 days (last pass: next-20240503, first fail: next-20=
240506) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/663de00b8930dcebe44c436c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240510/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240510/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663de00b8930dcebe44c4=
36d
        failing since 50 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/663de232333f531f8c4c42e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240510/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240510/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663de232333f531f8c4c4=
2e8
        new failure (last pass: next-20240506) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/663de21ece911a4f434c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240510/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240510/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663de21ece911a4f434c4=
2e3
        new failure (last pass: next-20240506) =

 =20

