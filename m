Return-Path: <linux-next+bounces-1316-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA505860F7D
	for <lists+linux-next@lfdr.de>; Fri, 23 Feb 2024 11:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A6871C21523
	for <lists+linux-next@lfdr.de>; Fri, 23 Feb 2024 10:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78436166C;
	Fri, 23 Feb 2024 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KOgcaiM/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE09A5C91B
	for <linux-next@vger.kernel.org>; Fri, 23 Feb 2024 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708684605; cv=none; b=RMSUjWKzwIzkCRc0zpfW0n4rUFy1/ZWAu7HODfnyV7J2S8AtWxgVYQlBZIqyUV2VZtDYoIk7YnAdOVNo41FaBUXLorYT/vkQYodFpqtQ8kTEHQcNqYvarMd33WT077XRLvj7dne4TTGcXWntyQ3ZR7qpFE43iIGSpJUjoHTYBQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708684605; c=relaxed/simple;
	bh=0LBQ970qgvqYUGWyft63FThx2TqgoT6h5Sv82+b23bs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=YAu4lwuPzw0NQ46DsnZgz+4CL0B8dzi9BtUUhKjRqy5OtagEZrXTmHUI+P5ytNneyCU52h8oVFp9KHFGqx3xIuTj0yvLcge4JqsBxjC5dj47NT7b5XV+iTcubdJxceSAmIjzvkfhsIgzij4qoBCgj0gqB7ayNhLs3HOKION+JDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KOgcaiM/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d8da50bffaso611605ad.2
        for <linux-next@vger.kernel.org>; Fri, 23 Feb 2024 02:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708684602; x=1709289402; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YpOlvgQ2D6yvpci6YLmSQtUVwtBkGuSnMiBl3IhGQQE=;
        b=KOgcaiM/Qka+tnL5lfgJtdqrUS/y1i8APVu9s+jqucdJEn8E2O5I/uKa2lJY1xg1cg
         HTngRA0GT/20lGmO0vMQ5OuOEMJckxc6fOV650w3C1iVOy7vfmPM85BFSJFxi6+wRzHc
         e9sMSsj+9pdEPz7hTu7ZAEOeQLknSVtVgg/HTHjZFKxX0anO29BLJXbSS4LaBCBf/M0N
         VnTBsI+R+NKzt8PaVT2YZFlxljDtr+jv5ugEaP8KTteJJmFKwOZe+9rTNama4o5/NiWd
         4zHF+wx5SvMVxXBm95C+JldtId4fQXtEBJ4vZSiQ/vZFWyeCwRGtvj0XgJ9f9wWJ9+Vn
         Eeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708684602; x=1709289402;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpOlvgQ2D6yvpci6YLmSQtUVwtBkGuSnMiBl3IhGQQE=;
        b=ip4bQTYax/VuJYGcZhGSoPwrdi/igvGs8jiv53av+x/RM3FwZ/cQt1yieRlZSh3T/N
         5kTWFw7jIEWNIeZQm66VrtTzJLr3wJmYWMYV+5qP69hYHhBduWDlbf6IFKOtmwFDshzX
         0iDOKl/U8gZsf0fOiROwM1iXtNcltZKissPXjFUTHLiFeHucIIvFcFshPwxauYoXDpUI
         mpOmY5mG/Vq4aGV2LoubjGu7E9vjObVr35r7QPfmGFr9onelZzqG77wdZm9bhA1u3Qev
         wYWbXx13iHtlI5+aGVsUg/JXPZjDzjawEMbXac54it0Bg37gvIna+ovBmw0P/xEUvOUJ
         A/uA==
X-Gm-Message-State: AOJu0Yxft1XOVU8FSs1/kf0vFuoryov+bzOrv6Jw7AhYomv1KhsUFuVj
	mVFqZvVU0I7B9PH00iCjV0NnBRvFN50FbmQb5n5HR7JVnmUqh6kLtsXVcLI3lw07RRmct/xYz9z
	1pP0=
X-Google-Smtp-Source: AGHT+IHxgfv75ycIj7G9J5bKrdO7by+WkoQ6/Mmr909Pf/W27LAsu/JY1DJ2izvWsPuTV4aXawZctA==
X-Received: by 2002:a17:902:7ec8:b0:1dc:fb2:d5fe with SMTP id p8-20020a1709027ec800b001dc0fb2d5femr1139107plb.22.1708684602331;
        Fri, 23 Feb 2024 02:36:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902ab8c00b001dc0d1fb3b1sm7177389plr.58.2024.02.23.02.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 02:36:41 -0800 (PST)
Message-ID: <65d87539.170a0220.ae899.a68a@mx.google.com>
Date: Fri, 23 Feb 2024 02:36:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20240223
X-Kernelci-Report-Type: test
Subject: next/master baseline: 190 runs, 10 regressions (next-20240223)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 190 runs, 10 regressions (next-20240223)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

r8a7743-iwg20d-q7        | arm   | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =

rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240223/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240223
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      33e1d31873f87d119e5120b88cd350efa68ef276 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/65d83902f50e2393e063701b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d83902f50e2393e0637=
01c
        failing since 263 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d83b6ff65983693663705e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d83b6ff659836936637=
05f
        failing since 331 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8424ca71c9a9055637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d8424ca71c9a9055637=
013
        new failure (last pass: next-20240216) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d83995755a98d82a637023

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d83995755a98d82a637=
024
        failing since 682 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7        | arm   | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d83de64346b92ba6637018

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d83de64346b92ba6637=
019
        failing since 9 days (last pass: next-20240212, first fail: next-20=
240213) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d83aa6d49d9b9ce363705a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d83aa6d49d9b9ce3637=
05b
        failing since 457 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d8398e3eddd96568637026

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d8398e3eddd96568637=
027
        failing since 457 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d836fc7fdf8c70156370d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d836fc7fdf8c70156370d6
        failing since 261 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-23T06:10:24.942761  / # #
    2024-02-23T06:10:25.046300  export SHELL=3D/bin/sh
    2024-02-23T06:10:25.047534  #
    2024-02-23T06:10:25.149583  / # export SHELL=3D/bin/sh. /lava-3937247/e=
nvironment
    2024-02-23T06:10:25.150824  =

    2024-02-23T06:10:25.252717  / # . /lava-3937247/environment/lava-393724=
7/bin/lava-test-runner /lava-3937247/1
    2024-02-23T06:10:25.254544  =

    2024-02-23T06:10:25.296837  / # /lava-3937247/bin/lava-test-runner /lav=
a-3937247/1
    2024-02-23T06:10:25.392565  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-23T06:10:25.393716  + cd /lava-3937247/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d83a6498c53d58cb63706c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d83a6498c53d58cb637071
        failing since 261 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-23T06:25:19.298993  <8>[   13.647559] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3937303_1.5.2.4.1>
    2024-02-23T06:25:19.405399  / # #
    2024-02-23T06:25:19.507393  export SHELL=3D/bin/sh
    2024-02-23T06:25:19.508168  #
    2024-02-23T06:25:19.609463  / # export SHELL=3D/bin/sh. /lava-3937303/e=
nvironment
    2024-02-23T06:25:19.610174  =

    2024-02-23T06:25:19.711628  / # . /lava-3937303/environment/lava-393730=
3/bin/lava-test-runner /lava-3937303/1
    2024-02-23T06:25:19.713128  =

    2024-02-23T06:25:19.730190  / # /lava-3937303/bin/lava-test-runner /lav=
a-3937303/1
    2024-02-23T06:25:19.835028  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65d841663fc705ec2d6370bc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d841663fc705ec2d6370c1
        failing since 261 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-23T06:55:22.911416  / # #
    2024-02-23T06:55:23.014774  export SHELL=3D/bin/sh
    2024-02-23T06:55:23.015986  #
    2024-02-23T06:55:23.117956  / # export SHELL=3D/bin/sh. /lava-3937342/e=
nvironment
    2024-02-23T06:55:23.118985  =

    2024-02-23T06:55:23.220913  / # . /lava-3937342/environment/lava-393734=
2/bin/lava-test-runner /lava-3937342/1
    2024-02-23T06:55:23.222727  =

    2024-02-23T06:55:23.234465  / # /lava-3937342/bin/lava-test-runner /lav=
a-3937342/1
    2024-02-23T06:55:23.314628  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-23T06:55:23.354164  + cd /lava-3937342/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

