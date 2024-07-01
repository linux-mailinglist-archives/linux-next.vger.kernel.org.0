Return-Path: <linux-next+bounces-2773-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3501591E5D5
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 18:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB4191F25D75
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 16:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A3A16DEAD;
	Mon,  1 Jul 2024 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="bC1bRHvc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA3116DC35
	for <linux-next@vger.kernel.org>; Mon,  1 Jul 2024 16:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719852737; cv=none; b=XyVFecO/TwmjfptVboJOl+0atk/NVhceAbsVGTlUSw9WOpNRUXVdvYG2tD6luDUDJ3f/tlsmRsop1iL9+1DLw+abipW/MiRaTIedatKi40s805rYOosvgm+FDMgdjVOBGytwiYLr2oTzkR41qKYuU5Ku0X2w2d3rrs19RcKGGXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719852737; c=relaxed/simple;
	bh=+BMy6M8hh6RiqtN7Au3TmtsTH5NnzKC5bwo/xVTDQOA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=mde9UMiC11r234kbhUzhXoVD2F2PxpefAO4no0Fg1kzMu1LMuDuH9sBmZY5Y6WOHWLt07Vsnj5IxrWplQEZniIk7xNr+Le2dGQdYDG3BR+hRqF0ghjeqIiG9Mw/+EhHOfGfR5opUsG8zXifZgQu81OpR995kS2L0CNMNUv9Z1k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=bC1bRHvc; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5c20995d038so1269248eaf.3
        for <linux-next@vger.kernel.org>; Mon, 01 Jul 2024 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719852734; x=1720457534; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xXs9al0zPr5G9CfASsR/MbqcMkUirCN5R4KFU8Mv2IA=;
        b=bC1bRHvcQcDbO/rLjjA4ort3xOMC32E3kRAZD9rL6yx2T+FX+Av/ZIEAfdTg6zpzIN
         /H1Xa3X27OO3H8jchZmBx2ZAiW/7lxlElqiCpJLJ/OMKNLD/0QRSy0Aei8hu5BimqYKE
         8d22Uu1FocY7QBWK345M02O/iV0nuaKEQ71hIShycNoLRLH5dgy8jrkxioS/pU/kAzG2
         wDJBjVIAMZSaEKC50wOResu84XTvzrabXbWSm0qxXpYeGVmHq8kibd8ztIBCvTpin9XN
         j/nRMsWTiPloznoZqrkq6YJAo6tgFHn5X+M2b3I+g2dbkuwKJt8NatdGZmnvFm44cirt
         /qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719852734; x=1720457534;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXs9al0zPr5G9CfASsR/MbqcMkUirCN5R4KFU8Mv2IA=;
        b=C9hnduv8brDJPEMX66WpUlve2Z1gRQ3gZxZQMElCV+XuHSXgulHqnHQqIr0OryvoSE
         zqEV1kP+upaGKprV2pHErw0qSXvDt9yJV0rx5KteRSkWFpgbGpfNNeSjXm+t+JTA7HnE
         Ju7L2RN86ZMBuO9N2+90iWW4Bj1WIWbu0ju4lLydqwb6RxJk3P5n/BeQP8deBF4WSPpj
         zzjb6aGzbMXI5P3ThzSYxac9rrRcpCGHrE8NzjJNgKAYl91CSf5xppIsPpclqA+Sb5K2
         pfdmnwr/FWhZpKvDL8wl5lhmYMaLY/IVjKXa8gvT/tmE6cxtz01dumPssOkwQ0QBshiw
         KJuA==
X-Gm-Message-State: AOJu0YzvZYysSrIvw7ArUc7jw1kJmxi2Ubz9afLeDKhetE6ZN+U2dEYO
	+0UP8nvnwEcIw5Gh1DxVsE3UTDqM1/f0z3MdKUCaFqbe2Xlvkt/Psz9BJa2XGTOe7k7KvL8qE10
	W
X-Google-Smtp-Source: AGHT+IH+XPVwMfiVK0j/EQ4ZdVwHlGB26pZ92eSLLtKsm9O0yhNQcRCgwOgUYFm33RjdDOvtjiP0/A==
X-Received: by 2002:a05:6358:c396:b0:1a6:b0b1:f036 with SMTP id e5c5f4694b2df-1a6b0b1f057mr202295455d.2.1719852734294;
        Mon, 01 Jul 2024 09:52:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d41655fsm5293884a12.92.2024.07.01.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:52:13 -0700 (PDT)
Message-ID: <6682debd.630a0220.87901.133e@mx.google.com>
Date: Mon, 01 Jul 2024 09:52:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240701
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 251 runs, 6 regressions (next-20240701)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 251 runs, 6 regressions (next-20240701)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =

bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

jetson-tk1              | arm   | lab-baylibre  | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm.=
..ok+kselftest | 1          =

rk3288-rock2-square     | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240701/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240701
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      74564adfd3521d9e322cfc345fdc132df80f3c79 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6682a6a5f3f67d305a7e707a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240701/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240701/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682a6a5f3f67d305a7e7=
07b
        failing since 392 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6682a0b444519182197e7087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240701/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240701/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682a0b444519182197e7=
088
        failing since 460 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
jetson-tk1              | arm   | lab-baylibre  | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6682db264df059ad0b7e7079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240701/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240701/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682db264df059ad0b7e7=
07a
        failing since 811 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm.=
..ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6682a3d28f1c1446cc7e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240701/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8195=
-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240701/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8195=
-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682a3d28f1c1446cc7e7=
076
        new failure (last pass: next-20240625) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-rock2-square     | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6682a85e97c2cb17127e70c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240701/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240701/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682a85e97c2cb17127e7=
0c6
        failing since 587 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6682a7592f03a66e587e70a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240701/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240701/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682a7592f03a66e587e7=
0a7
        failing since 587 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

