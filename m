Return-Path: <linux-next+bounces-790-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3BC835B06
	for <lists+linux-next@lfdr.de>; Mon, 22 Jan 2024 07:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05E6D1F21039
	for <lists+linux-next@lfdr.de>; Mon, 22 Jan 2024 06:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D96A1865;
	Mon, 22 Jan 2024 06:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CK4YX43b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ACB641
	for <linux-next@vger.kernel.org>; Mon, 22 Jan 2024 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705905285; cv=none; b=SkUnKyaAZxS/0qYK24WNjuyL942HSpUO98nTvB2mZsapb4VLjNt8/YdyU9LlD+a8wRjcZecRqjPwn4DkaPMTeGqyOQiPYg7qZ6hZvz0blVPoUhpOMkFd1HbrHbqawwY3A/MO+dNQXu7GnP8yYCaVxzx581RHsMDdxxmk33OR9u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705905285; c=relaxed/simple;
	bh=pJM4hidKjyu400yh42/xShrVtsf7NdDbUWYXb/tps00=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=RQT1NTHAiI8KHG1wUhLSCL+JrBd7SlA6cZ3BSIexh6HfcdpPse/ovwjnbwSLvjxIRuRKhWgVjCk95Zo0Ehn2Lhc8n22xlMyTg2ao7zFkEJ/cq1WIID4PnqlefR9/gcAnPZj0C8QKRt0YWi0TJRI9P+qnji4az7gNsgecLbnsHCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=CK4YX43b; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6da9c834646so2786288b3a.3
        for <linux-next@vger.kernel.org>; Sun, 21 Jan 2024 22:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705905281; x=1706510081; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6BdHPC085vxOWxf/IKkSN654HDOqu7HRhBKraqOFNxg=;
        b=CK4YX43b6GX0IQZGSlGeXUoojUfzBMmjTwJ9gnlPdxd1FcpCYw+77cDxJQifG8DjgU
         2iEyq9t7ZPBy4DaFkVxgw/809nO7YRVB9CkETVxCMQILn42usXtHAcZyM9ycC7aqxF9s
         woE/ESm5R03ruqkndlGOp3Ut8kBWTK7c1etcRCDK6V982yEB9WfJTIr+4u3mPchUtFvl
         tk6oMStKZ8v5wV9qgHkHEZZJsOH4OuuXklewev9Hgi0riInIqEeozzOa4Br1wBCfnejg
         0mSAHPN62QZM5BnDtwyoihvaZXnYHCZ/W/BMdgdyR8RPec4uK7FZaIlIjoaMD3arFRdF
         YWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705905281; x=1706510081;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BdHPC085vxOWxf/IKkSN654HDOqu7HRhBKraqOFNxg=;
        b=CCog6vSRk5f2QqpkE/F/uSKHIqOqCwMAHgnPxEq6FUIs6JjF0L/VGwdsP1MJfR/v6K
         e0wXYi+2887RaudqDnU0qinq+VMxZXh8+5xQ+ZvCBM6zRuf9NX7KfuFYyvRzGjXKrfMa
         bHom8IhvxVPbqgfDJ46dl53b1RCZtbf3ADyc0B2qpcv244rN4nHZg/AaqW8V1n94q9L7
         d/JZxoBN1Dv2p8k/mi3gmizi26W6GKmdvL0bCEFooa8O9FoaQZOXCuTH5cRGiq9t29i7
         Ef7npMraU1zl0bixRhIFOkS+hrkssJ4bMtwSUcLT0MA2fM0bq6nKKBqTN02Mn0vttyBM
         BSLw==
X-Gm-Message-State: AOJu0YyPS7m/Rx5oW+1BTtRGLiKtKveW6UDyr5vdB1mtUB9nl3qGTKl2
	nNNFoEw9A9b6mM1qB0hnZh+ptB8eTkSrp0ScVb0U5oTtD0VKpu08Ndn8mGZBVfGMOlv2a/HHZKJ
	cb9c=
X-Google-Smtp-Source: AGHT+IH9ra64l+vsw1mzqQVyqn0Hr4vsKBRTBQQM+XiLK8k617eXhA8a7oXk4sdDVq0706+Ctx0uLw==
X-Received: by 2002:a05:6a21:32a2:b0:19c:30a5:5c54 with SMTP id yt34-20020a056a2132a200b0019c30a55c54mr2622599pzb.28.1705905279976;
        Sun, 21 Jan 2024 22:34:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id sj5-20020a17090b2d8500b0029082d10fc4sm2811882pjb.39.2024.01.21.22.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 22:34:39 -0800 (PST)
Message-ID: <65ae0c7f.170a0220.55d1a.6064@mx.google.com>
Date: Sun, 21 Jan 2024 22:34:39 -0800 (PST)
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
X-Kernelci-Kernel: next-20240122
X-Kernelci-Report-Type: test
Subject: next/master baseline: 334 runs, 46 regressions (next-20240122)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 334 runs, 46 regressions (next-20240122)

Regressions Summary
-------------------

platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre    | gcc-10   | sama5_de=
fconfig              | 1          =

at91sam9g20ek               | arm   | lab-broonie     | gcc-10   | at91_dt_=
defconfig            | 1          =

at91sam9g20ek               | arm   | lab-broonie     | gcc-10   | multi_v5=
_defconfig           | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                   | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black            | arm   | lab-cip         | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black            | arm   | lab-cip         | gcc-10   | omap2plu=
s_defconfig          | 1          =

imx6dl-riotboard            | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

imx6qp-wandboard-revd1      | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

jetson-tk1                  | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron     | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g                    | 5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron     | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g                    | 2          =

mt8195-cherry-tomato-r2     | arm64 | lab-collabora   | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =

qemu_smp8_riscv64           | riscv | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =

r8a7743-iwg20d-q7           | arm   | lab-cip         | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square         | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq           | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64          | arm64 | lab-clabbe      | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64          | arm64 | lab-collabora   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240122/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240122
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      319fbd8fc6d339e0a1c7b067eed870c518a13a02 =



Test Regressions
---------------- =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre    | gcc-10   | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65add14067431dff6152a47b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65add14067431dff6152a=
47c
        failing since 355 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91sam9g20ek               | arm   | lab-broonie     | gcc-10   | at91_dt_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65adee2c9c55e15a4f52a3fd

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65adee2c9c55e15a4f52a41a
        failing since 230 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-22T04:25:00.927945  /lava-484462/1/../bin/lava-test-case
    2024-01-22T04:25:00.967660  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91sam9g20ek               | arm   | lab-broonie     | gcc-10   | multi_v5=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65adeea48e45ad646652a3f7

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65adeea48e45ad646652a416
        failing since 230 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-22T04:27:00.107243  /lava-484518/1/../bin/lava-test-case
    2024-01-22T04:27:00.149138  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65adcc079b0c4c2c2152a3fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65adcc079b0c4c2c2152a=
3fb
        failing since 230 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65adcfef7781f716aa52a45e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65adcfef7781f716aa52a=
45f
        failing since 299 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
beagle-xm                   | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65add087a7f535c51152a3fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65add087a7f535c51152a=
3fe
        failing since 296 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
beaglebone-black            | arm   | lab-cip         | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65addcec90cd73d95852a3ff

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65addcec90cd73d9=
5852a404
        new failure (last pass: next-20240118)
        1 lines

    2024-01-22T03:11:17.421335  / # =

    2024-01-22T03:11:17.430591  =

    2024-01-22T03:11:17.535640  / # #
    2024-01-22T03:11:17.542462  #
    2024-01-22T03:11:17.644610  / # export SHELL=3D/bin/sh
    2024-01-22T03:11:17.654602  export SHELL=3D/bin/sh
    2024-01-22T03:11:17.756370  / # . /lava-1080765/environment
    2024-01-22T03:11:17.766547  . /lava-1080765/environment
    2024-01-22T03:11:17.868356  / # /lava-1080765/bin/lava-test-runner /lav=
a-1080765/0
    2024-01-22T03:11:17.878199  /lava-1080765/bin/lava-test-runner /lava-10=
80765/0 =

    ... (9 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
beaglebone-black            | arm   | lab-cip         | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65adda455628ce6ab552a3fe

  Results:     51 PASS, 4 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65adda455628ce6a=
b552a403
        new failure (last pass: next-20240118)
        1 lines

    2024-01-22T03:00:08.684402  / # =

    2024-01-22T03:00:08.693181  =

    2024-01-22T03:00:08.798251  / # #
    2024-01-22T03:00:08.804757  #
    2024-01-22T03:00:08.950635  / # export SHELL=3D/bin/sh
    2024-01-22T03:00:08.964840  export SHELL=3D/bin/sh
    2024-01-22T03:00:09.066633  / # . /lava-1080760/environment
    2024-01-22T03:00:09.076872  . /lava-1080760/environment
    2024-01-22T03:00:09.178740  / # /lava-1080760/bin/lava-test-runner /lav=
a-1080760/0
    2024-01-22T03:00:09.188766  /lava-1080760/bin/lava-test-runner /lava-10=
80760/0 =

    ... (9 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6dl-riotboard            | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65add33d7d5c1f3cf452a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65add33d7d5c1f3cf452a=
3f2
        failing since 529 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6qp-wandboard-revd1      | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65add33e8fa70ddba052a448

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65add33e8fa70ddba052a=
449
        failing since 517 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
jetson-tk1                  | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65adcef0c368649d2352a427

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65adcef0c368649d2352a=
428
        failing since 650 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron     | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65add0e0d66923b44b52a457

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add0e0d66923b44b52a45e
        failing since 38 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-01-22T02:19:54.344436  / # #
    2024-01-22T02:19:54.445474  export SHELL=3D/bin/sh
    2024-01-22T02:19:54.445818  #
    2024-01-22T02:19:54.546591  / # export SHELL=3D/bin/sh. /lava-420137/en=
vironment
    2024-01-22T02:19:54.547040  =

    2024-01-22T02:19:54.647879  / # . /lava-420137/environment/lava-420137/=
bin/lava-test-runner /lava-420137/1
    2024-01-22T02:19:54.648270  =

    2024-01-22T02:19:54.658231  / # /lava-420137/bin/lava-test-runner /lava=
-420137/1
    2024-01-22T02:19:54.747058  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T02:19:54.747258  + cd /lava-420137/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65add0e0d66923b44b52a462
        failing since 38 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-01-22T02:19:56.912750  /lava-420137/1/../bin/lava-test-case
    2024-01-22T02:19:56.933786  <8>[   25.825913] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
add0e0d66923b44b52a464
        failing since 38 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-01-22T02:19:57.983692  /lava-420137/1/../bin/lava-test-case
    2024-01-22T02:19:58.005626  <8>[   26.898986] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65add0e0d66923b44b52a469
        failing since 38 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-01-22T02:19:59.200355  /lava-420137/1/../bin/lava-test-case
    2024-01-22T02:19:59.221249  <8>[   28.113105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65add0e0d66923b44b52a46a
        failing since 38 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-01-22T02:20:00.260371  /lava-420137/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65add1e5b2dd11a0ae52a3f2

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add1e5b2dd11a0ae52a3f9
        failing since 39 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-22T02:24:18.097559  / # #
    2024-01-22T02:24:18.199647  export SHELL=3D/bin/sh
    2024-01-22T02:24:18.200374  #
    2024-01-22T02:24:18.301503  / # export SHELL=3D/bin/sh. /lava-420139/en=
vironment
    2024-01-22T02:24:18.302172  =

    2024-01-22T02:24:18.403367  / # . /lava-420139/environment/lava-420139/=
bin/lava-test-runner /lava-420139/1
    2024-01-22T02:24:18.404450  =

    2024-01-22T02:24:18.409147  / # /lava-420139/bin/lava-test-runner /lava=
-420139/1
    2024-01-22T02:24:18.473667  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T02:24:18.507369  + cd /lava-420139/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65add1e5b2dd11a0ae52a3fd
        failing since 39 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-22T02:24:20.724128  /lava-420139/1/../bin/lava-test-case
    2024-01-22T02:24:20.753300  <8>[   26.161234] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
add1e5b2dd11a0ae52a3ff
        failing since 39 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-22T02:24:21.812903  /lava-420139/1/../bin/lava-test-case
    2024-01-22T02:24:21.840444  <8>[   27.249239] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65add1e5b2dd11a0ae52a404
        failing since 39 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-22T02:24:23.072449  /lava-420139/1/../bin/lava-test-case
    2024-01-22T02:24:23.101408  <8>[   28.509617] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65add1e5b2dd11a0ae52a405
        failing since 39 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-22T02:24:24.123311  /lava-420139/1/../bin/lava-test-case
    2024-01-22T02:24:24.151370  <8>[   29.559341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g                    | 5          =


  Details:     https://kernelci.org/test/plan/id/65add5557c3330c75e52a422

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add5557c3330c75e52a429
        failing since 41 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-22T02:39:00.885385  / # #
    2024-01-22T02:39:00.987211  export SHELL=3D/bin/sh
    2024-01-22T02:39:00.987967  #
    2024-01-22T02:39:01.089122  / # export SHELL=3D/bin/sh. /lava-420161/en=
vironment
    2024-01-22T02:39:01.089727  =

    2024-01-22T02:39:01.190824  / # . /lava-420161/environment/lava-420161/=
bin/lava-test-runner /lava-420161/1
    2024-01-22T02:39:01.192166  =

    2024-01-22T02:39:01.199669  / # /lava-420161/bin/lava-test-runner /lava=
-420161/1
    2024-01-22T02:39:01.296515  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T02:39:01.296909  + cd /lava-420161/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65add5557c3330c75e52a42d
        failing since 41 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-22T02:39:03.512277  /lava-420161/1/../bin/lava-test-case
    2024-01-22T02:39:03.539425  <8>[   26.060160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
add5557c3330c75e52a42f
        failing since 41 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-22T02:39:04.600649  /lava-420161/1/../bin/lava-test-case
    2024-01-22T02:39:04.627187  <8>[   27.147842] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65add5557c3330c75e52a434
        failing since 41 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-22T02:39:05.859891  /lava-420161/1/../bin/lava-test-case
    2024-01-22T02:39:05.886940  <8>[   28.407189] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65add5557c3330c75e52a435
        failing since 41 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-22T02:39:06.910285  /lava-420161/1/../bin/lava-test-case
    2024-01-22T02:39:06.937416  <8>[   29.457418] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron     | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65add0bbbf877dbd0352a406

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add0bbbf877dbd0352a40d
        failing since 38 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-01-22T02:19:17.530926  / # #
    2024-01-22T02:19:17.631552  export SHELL=3D/bin/sh
    2024-01-22T02:19:17.631801  #
    2024-01-22T02:19:17.732279  / # export SHELL=3D/bin/sh. /lava-420134/en=
vironment
    2024-01-22T02:19:17.732521  =

    2024-01-22T02:19:17.833046  / # . /lava-420134/environment/lava-420134/=
bin/lava-test-runner /lava-420134/1
    2024-01-22T02:19:17.833376  =

    2024-01-22T02:19:17.845749  / # /lava-420134/bin/lava-test-runner /lava=
-420134/1
    2024-01-22T02:19:17.943525  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T02:19:17.943698  + cd /lava-420134/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65add0bbbf877dbd0352a420
        failing since 38 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-01-22T02:19:20.712435  /lava-420134/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65add1d090449460ac52a41c

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add1d090449460ac52a423
        failing since 39 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-22T02:23:57.920601  / # #
    2024-01-22T02:23:58.021299  export SHELL=3D/bin/sh
    2024-01-22T02:23:58.021967  #
    2024-01-22T02:23:58.123012  / # export SHELL=3D/bin/sh. /lava-420141/en=
vironment
    2024-01-22T02:23:58.123635  =

    2024-01-22T02:23:58.224685  / # . /lava-420141/environment/lava-420141/=
bin/lava-test-runner /lava-420141/1
    2024-01-22T02:23:58.225342  =

    2024-01-22T02:23:58.234562  / # /lava-420141/bin/lava-test-runner /lava=
-420141/1
    2024-01-22T02:23:58.330606  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T02:23:58.330959  + cd /lava-420141/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65add1d090449460ac52a436
        failing since 39 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-22T02:24:01.262973  /lava-420141/1/../bin/lava-test-case
    2024-01-22T02:24:01.290929  <8>[   27.023803] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65add545b5bca64b3552a3f3

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add545b5bca64b3552a3fa
        failing since 41 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-22T02:38:41.518567  / # #
    2024-01-22T02:38:41.620329  export SHELL=3D/bin/sh
    2024-01-22T02:38:41.621278  #
    2024-01-22T02:38:41.722626  / # export SHELL=3D/bin/sh. /lava-420164/en=
vironment
    2024-01-22T02:38:41.722947  =

    2024-01-22T02:38:41.823841  / # . /lava-420164/environment/lava-420164/=
bin/lava-test-runner /lava-420164/1
    2024-01-22T02:38:41.824930  =

    2024-01-22T02:38:41.832931  / # /lava-420164/bin/lava-test-runner /lava=
-420164/1
    2024-01-22T02:38:41.928625  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T02:38:41.928817  + cd /lava-420164/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65add545b5bca64b3552a40d
        failing since 41 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-22T02:38:44.860875  /lava-420164/1/../bin/lava-test-case
    2024-01-22T02:38:44.888039  <8>[   27.119777] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
mt8195-cherry-tomato-r2     | arm64 | lab-collabora   | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65add6feefdb5c2dc952a4b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65add6feefdb5c2dc952a=
4b9
        failing since 9 days (last pass: next-20240110, first fail: next-20=
240112) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
qemu_smp8_riscv64           | riscv | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65add68dec3cb732ad52a3ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65add68dec3cb732ad52a=
400
        new failure (last pass: next-20240111) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7           | arm   | lab-cip         | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65adcb2ba89207c6ae52a409

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65adcb2ba89207c6ae52a=
40a
        failing since 3 days (last pass: next-20240117, first fail: next-20=
240118) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square         | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65adcfdb7781f716aa52a448

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65adcfdb7781f716aa52a=
449
        failing since 425 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq           | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65adced7c4d8bf0c6752a407

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65adced7c4d8bf0c6752a=
408
        failing since 425 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65add20c0d8aec40d052a402

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65add20c0d8aec40d052a=
403
        failing since 32 days (last pass: next-20231010, first fail: next-2=
0231220) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64          | arm64 | lab-clabbe      | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65add0b7d8f4aef67452a41c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add0b7d8f4aef67452a425
        failing since 103 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fi=
rst fail: next-20231010)

    2024-01-22T02:19:10.922839  <8>[   18.710724] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 454266_1.5.2.4.1>
    2024-01-22T02:19:11.027830  / # #
    2024-01-22T02:19:11.129696  export SHELL=3D/bin/sh
    2024-01-22T02:19:11.130441  #
    2024-01-22T02:19:11.231479  / # export SHELL=3D/bin/sh. /lava-454266/en=
vironment
    2024-01-22T02:19:11.232196  =

    2024-01-22T02:19:11.333228  / # . /lava-454266/environment/lava-454266/=
bin/lava-test-runner /lava-454266/1
    2024-01-22T02:19:11.334141  =

    2024-01-22T02:19:11.338109  / # /lava-454266/bin/lava-test-runner /lava=
-454266/1
    2024-01-22T02:19:11.423387  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64          | arm64 | lab-collabora   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65add0cbd66923b44b52a401

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add0cbd66923b44b52a40a
        failing since 103 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fi=
rst fail: next-20231010)

    2024-01-22T02:27:10.999978  / # #

    2024-01-22T02:27:11.102122  export SHELL=3D/bin/sh

    2024-01-22T02:27:11.102824  #

    2024-01-22T02:27:11.204219  / # export SHELL=3D/bin/sh. /lava-12593461/=
environment

    2024-01-22T02:27:11.204924  =


    2024-01-22T02:27:11.306278  / # . /lava-12593461/environment/lava-12593=
461/bin/lava-test-runner /lava-12593461/1

    2024-01-22T02:27:11.307366  =


    2024-01-22T02:27:11.309059  / # /lava-12593461/bin/lava-test-runner /la=
va-12593461/1

    2024-01-22T02:27:11.398309  + export 'TESTRUN_ID=3D1_bootrr'

    2024-01-22T02:27:11.398809  + cd /lava-12593461/1/tests/1_boot<8>[   19=
.206403] <LAVA_SIGNAL_STARTRUN 1_bootrr 12593461_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65adcef1c368649d2352a42b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65adcef1c368649d2352a434
        failing since 228 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-22T02:11:43.498259  / # #
    2024-01-22T02:11:43.601356  export SHELL=3D/bin/sh
    2024-01-22T02:11:43.602439  #
    2024-01-22T02:11:43.704346  / # export SHELL=3D/bin/sh. /lava-3912815/e=
nvironment
    2024-01-22T02:11:43.705416  =

    2024-01-22T02:11:43.807253  / # . /lava-3912815/environment/lava-391281=
5/bin/lava-test-runner /lava-3912815/1
    2024-01-22T02:11:43.808956  =

    2024-01-22T02:11:43.821506  / # /lava-3912815/bin/lava-test-runner /lav=
a-3912815/1
    2024-01-22T02:11:43.941247  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T02:11:43.942298  + cd /lava-3912815/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65adcf70d67ba87e6052a40d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65adcf70d67ba87e6052a416
        failing since 228 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-22T02:13:34.091468  / # #
    2024-01-22T02:13:34.192581  export SHELL=3D/bin/sh
    2024-01-22T02:13:34.192947  #
    2024-01-22T02:13:34.293629  / # export SHELL=3D/bin/sh. /lava-3912824/e=
nvironment
    2024-01-22T02:13:34.293999  =

    2024-01-22T02:13:34.394733  / # . /lava-3912824/environment/lava-391282=
4/bin/lava-test-runner /lava-3912824/1
    2024-01-22T02:13:34.395317  =

    2024-01-22T02:13:34.436063  / # /lava-3912824/bin/lava-test-runner /lav=
a-3912824/1
    2024-01-22T02:13:34.528063  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T02:13:34.528483  + cd /lava-3912824/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65add524a27914641052a44f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add524a27914641052a458
        failing since 228 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-22T02:38:17.256560  / #
    2024-01-22T02:38:17.357763  # #export SHELL=3D/bin/sh
    2024-01-22T02:38:17.358134  =

    2024-01-22T02:38:17.458827  / # export SHE. /lava-3912896/environment
    2024-01-22T02:38:17.459206  LL=3D/bin/sh
    2024-01-22T02:38:17.559966  / # . /lava-3912896/environment/lava-391289=
6/bin/lava-test-runner /lava-3912896/1
    2024-01-22T02:38:17.560601  =

    2024-01-22T02:38:17.571324  / # /lava-3912896/bin/lava-test-runner /lav=
a-3912896/1
    2024-01-22T02:38:17.696023  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T02:38:17.696499  + cd /lava-3912896/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65adcf14a6667bbe6a52a48e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65adcf14a6667bbe6a52a497
        failing since 228 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-22T02:12:09.741878  + set +x
    2024-01-22T02:12:09.743670  [   22.994392] <LAVA_SIGNAL_ENDRUN 0_dmesg =
454257_1.5.2.4.1>
    2024-01-22T02:12:09.851769  / # #
    2024-01-22T02:12:09.953312  export SHELL=3D/bin/sh
    2024-01-22T02:12:09.953837  #
    2024-01-22T02:12:10.054805  / # export SHELL=3D/bin/sh. /lava-454257/en=
vironment
    2024-01-22T02:12:10.055361  =

    2024-01-22T02:12:10.156348  / # . /lava-454257/environment/lava-454257/=
bin/lava-test-runner /lava-454257/1
    2024-01-22T02:12:10.157175  =

    2024-01-22T02:12:10.159880  / # /lava-454257/bin/lava-test-runner /lava=
-454257/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65adcf8af11ae4519c52a3f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65adcf8af11ae4519c52a3fd
        failing since 228 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-22T02:14:16.572275  + set +x[   19.705313] <LAVA_SIGNAL_ENDRUN =
0_dmesg 454263_1.5.2.4.1>
    2024-01-22T02:14:16.572590  =

    2024-01-22T02:14:16.680192  / # #
    2024-01-22T02:14:16.781822  export SHELL=3D/bin/sh
    2024-01-22T02:14:16.782391  #
    2024-01-22T02:14:16.883359  / # export SHELL=3D/bin/sh. /lava-454263/en=
vironment
    2024-01-22T02:14:16.883887  =

    2024-01-22T02:14:16.984883  / # . /lava-454263/environment/lava-454263/=
bin/lava-test-runner /lava-454263/1
    2024-01-22T02:14:16.985697  =

    2024-01-22T02:14:16.988568  / # /lava-454263/bin/lava-test-runner /lava=
-454263/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65add6a75905926ef952a42e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240122/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65add6a75905926ef952a437
        failing since 228 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-22T02:44:39.473873  + set +x
    2024-01-22T02:44:39.475638  [   20.874516] <LAVA_SIGNAL_ENDRUN 0_dmesg =
454282_1.5.2.4.1>
    2024-01-22T02:44:39.584005  / # #
    2024-01-22T02:44:39.685577  export SHELL=3D/bin/sh
    2024-01-22T02:44:39.686106  #
    2024-01-22T02:44:39.787082  / # export SHELL=3D/bin/sh. /lava-454282/en=
vironment
    2024-01-22T02:44:39.787621  =

    2024-01-22T02:44:39.888617  / # . /lava-454282/environment/lava-454282/=
bin/lava-test-runner /lava-454282/1
    2024-01-22T02:44:39.889442  =

    2024-01-22T02:44:39.892034  / # /lava-454282/bin/lava-test-runner /lava=
-454282/1 =

    ... (12 line(s) more)  =

 =20

