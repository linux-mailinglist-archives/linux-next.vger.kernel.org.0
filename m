Return-Path: <linux-next+bounces-1198-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E313F8578DF
	for <lists+linux-next@lfdr.de>; Fri, 16 Feb 2024 10:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2AAD1C22A50
	for <lists+linux-next@lfdr.de>; Fri, 16 Feb 2024 09:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354B91BDD6;
	Fri, 16 Feb 2024 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CJJ6n5ym"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338E61BDD8
	for <linux-next@vger.kernel.org>; Fri, 16 Feb 2024 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708075930; cv=none; b=NabaetrWRrlUmLv03YYq79wdknSIDZ9R4EYeTL08tRhc7CGJR0rLpq8liTVhM43TDSZFR0bdBrkBTIRQVaOnTIZP8FsJerPLyiEsGPW2+95h73UbHv+L46Wi0oz9cSFmKMwiy26STdTUCS3/iN90cJdCUva/GnJrxGmXhNvt+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708075930; c=relaxed/simple;
	bh=M3AYtqBbg31uGQgVZDKzfoaKqX+ND1JWxe/hNChiZ4k=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=dgYT9gv/+fgzBKLDNPtbARbNK5Byvi8Rpie+NCbfk3bHPa/TGkTUA4Fqw31WrlCR9ZmGx8rlJE8G1H4LIHOMNqlqaTsOET9os6fJNpFx5SwJNieJ37DEb8UXIwRwQDmIXHAC7omKClnhk/0cWeXy0vNZHdYf7zpX/V/kQGlqj1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=CJJ6n5ym; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e2f12059f4so826371a34.0
        for <linux-next@vger.kernel.org>; Fri, 16 Feb 2024 01:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708075925; x=1708680725; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3zp7Ix66FcSEhAmwA2zsiB8g8U28doxoadUYU0Tbkh4=;
        b=CJJ6n5ymMja4M9cPBD7PGcviiy3qghw/hniJR/y1y9bD7Ga6hibjzR4aTHQYgepXRW
         ELjC+Wu0VwOphuQ5/qh/tpBZ6aTNP7bPFTRL8CowOdvJ1K1sm8RnUYwx+UV0t/UMsEJe
         nzWhe7d5RqCy53y1zuf5QgKc6SM5oedcVwRYRzFvctnqQQa8CbvGB/4X2N3umuM7Jm9K
         fwInw8F+K5bH+JiYKLMCWQr4M5ru2tbMKR8p1/gfEds0F3dP8QO75d8LLKzrb1+a0aar
         IMDgyhN1wL5ZM0d6ZAZOk+FhSwtvTfAUOMVFpDhKmTi8M6tDROISd6Kkzg7HekWA0RpA
         zJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708075925; x=1708680725;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zp7Ix66FcSEhAmwA2zsiB8g8U28doxoadUYU0Tbkh4=;
        b=U+5FyeLbjH0XGVJSsMnxgBtr9CdFrZpOiK3o/C4tApp85vGtJQI3D8vkNkYtCKdhFN
         87b9rCITllCTW7za2a31b69dBOUl49lHIu4goMp3vtmo8sUKbOYJdpF2pZehX5opAwzs
         tj6P2mT5h+UV3LET95sHVYZ4OsSF62cE0iJP4swVFmI9xc5Ul+VFB3nYLm5U9/vzSJO/
         sw2MXTiXv/XGEIm9jXRg3QrmQ6s7IuROYlfV/Y3Kh+bZ09CyZZCUVeiHYLYA5EzDeXcr
         XhU0gO9fd5qVJ6ANwvm50ldT3odC3RJSH12/1yM9FaIxSoX7OjG5yXtusHyUtN91rno+
         Z7/A==
X-Gm-Message-State: AOJu0YwXeeqY+5WY05ZUkcriaLRwU+6QzaVr4VGVkk4Fgp8l/0loXxyN
	mvDuEiCdt4rl/QFGUuCj8gnX1Ajd86vqUXorsEs+/zHLsqOBrUUPqoaCTIXxIxQh7u/XnzoYaVK
	GEdw=
X-Google-Smtp-Source: AGHT+IHKDd79VkKFDBZbJWVEcMbPbKw8GaxwyqTVzNRfWpA26TMkCL+y7Pl1LuGW2GcSbXYlBum0zA==
X-Received: by 2002:a05:6358:4292:b0:175:c1d8:7c61 with SMTP id s18-20020a056358429200b00175c1d87c61mr6335927rwc.12.1708075925078;
        Fri, 16 Feb 2024 01:32:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u21-20020a056a00099500b006e13ce6f4d8sm826267pfg.72.2024.02.16.01.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 01:32:04 -0800 (PST)
Message-ID: <65cf2b94.050a0220.91abc.23af@mx.google.com>
Date: Fri, 16 Feb 2024 01:32:04 -0800 (PST)
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
X-Kernelci-Kernel: next-20240216
X-Kernelci-Report-Type: test
Subject: next/master baseline: 414 runs, 33 regressions (next-20240216)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 414 runs, 33 regressions (next-20240216)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | omap2pl=
us_defconfig          | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 2          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | exynos_=
defconfig             | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240216/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240216
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d37e1e4c52bc60578969f391fb81f947c3e83118 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65ceea6e792f6c20e1637013

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ceea6e792f6c20e1637=
014
        failing since 380 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65ceece345734b2e09637054

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ceece345734b2e09637=
055
        failing since 255 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65cef761db5332ff1b637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cef761db5332ff1b637=
016
        failing since 2 days (last pass: next-20240212, first fail: next-20=
240213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65cef727101021bd2263702d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cef727101021bd22637=
02e
        new failure (last pass: next-20240215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65cf0059f484fcf519637013

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cf0059f484fcf519637=
014
        new failure (last pass: next-20240215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ceeef1c000d3a732637070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ceeef1c000d3a732637=
071
        failing since 0 day (last pass: next-20240214, first fail: next-202=
40215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cef0479127e6cba863701f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cef0479127e6cba8637=
020
        failing since 675 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65ceee54298fd448c7637066

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ceee54298fd448c7637069
        failing since 65 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-16T05:10:15.828718  / # #
    2024-02-16T05:10:15.930865  export SHELL=3D/bin/sh
    2024-02-16T05:10:15.931578  #
    2024-02-16T05:10:16.033109  / # export SHELL=3D/bin/sh. /lava-430760/en=
vironment
    2024-02-16T05:10:16.033830  =

    2024-02-16T05:10:16.135260  / # . /lava-430760/environment/lava-430760/=
bin/lava-test-runner /lava-430760/1
    2024-02-16T05:10:16.136408  =

    2024-02-16T05:10:16.141788  / # /lava-430760/bin/lava-test-runner /lava=
-430760/1
    2024-02-16T05:10:16.199229  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-16T05:10:16.199652  + <8>[   20.729197] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430760_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ceee54298fd448c763706d
        failing since 65 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-16T05:10:17.268490  <8>[   21.813228] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-16T05:10:18.303714  /lava-430760/1/../bin/lava-test-case
    2024-02-16T05:10:18.304142  <8>[   22.835322] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-16T05:10:18.304449  /lava-430760/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ceee54298fd448c763706f
        failing since 65 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-16T05:10:19.363528  /lava-430760/1/../bin/lava-test-case
    2024-02-16T05:10:19.363982  <8>[   23.873827] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-16T05:10:19.364284  /lava-430760/1/../bin/lava-test-case
    2024-02-16T05:10:19.364503  <8>[   23.891061] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ceee54298fd448c7637074
        failing since 65 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-16T05:10:20.439722  /lava-430760/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ceee54298fd448c7637075
        failing since 65 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-16T05:10:20.443049  <8>[   24.987668] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-16T05:10:21.501773  /lava-430760/1/../bin/lava-test-case
    2024-02-16T05:10:21.502291  <8>[   26.009046] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-16T05:10:21.502572  /lava-430760/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65ceef54c8b3c91bf36370d0

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ceef54c8b3c91bf36370d3
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-16T05:14:39.187506  / # #
    2024-02-16T05:14:39.289466  export SHELL=3D/bin/sh
    2024-02-16T05:14:39.290263  #
    2024-02-16T05:14:39.391396  / # export SHELL=3D/bin/sh. /lava-430768/en=
vironment
    2024-02-16T05:14:39.391793  =

    2024-02-16T05:14:39.492602  / # . /lava-430768/environment/lava-430768/=
bin/lava-test-runner /lava-430768/1
    2024-02-16T05:14:39.493709  =

    2024-02-16T05:14:39.499526  / # /lava-430768/bin/lava-test-runner /lava=
-430768/1
    2024-02-16T05:14:39.556421  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-16T05:14:39.556847  + <8>[   20.583931] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430768_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ceef54c8b3c91bf36370d7
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-16T05:14:41.662326  /lava-430768/1/../bin/lava-test-case
    2024-02-16T05:14:41.662761  <8>[   22.691307] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-16T05:14:41.663201  /lava-430768/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ceef54c8b3c91bf36370d9
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-16T05:14:42.721026  /lava-430768/1/../bin/lava-test-case
    2024-02-16T05:14:42.721229  <8>[   23.729821] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-16T05:14:42.721364  /lava-430768/1/../bin/lava-test-case
    2024-02-16T05:14:42.721485  <8>[   23.747150] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-02-16T05:14:42.721603  /lava-430768/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ceef54c8b3c91bf36370de
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-16T05:14:43.796613  /lava-430768/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ceef54c8b3c91bf36370df
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-16T05:14:43.799746  <8>[   24.842258] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-16T05:14:44.853878  /lava-430768/1/../bin/lava-test-case
    2024-02-16T05:14:44.854007  <8>[   25.863965] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-16T05:14:44.854077  /lava-430768/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65ceeea1c5a0551d8a63701e

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ceeea1c5a0551d8a637021
        failing since 65 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-16T05:11:44.023624  / # #
    2024-02-16T05:11:44.125266  export SHELL=3D/bin/sh
    2024-02-16T05:11:44.125823  #
    2024-02-16T05:11:44.226805  / # export SHELL=3D/bin/sh. /lava-430759/en=
vironment
    2024-02-16T05:11:44.227492  =

    2024-02-16T05:11:44.328728  / # . /lava-430759/environment/lava-430759/=
bin/lava-test-runner /lava-430759/1
    2024-02-16T05:11:44.329585  =

    2024-02-16T05:11:44.336095  / # /lava-430759/bin/lava-test-runner /lava=
-430759/1
    2024-02-16T05:11:44.402034  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-16T05:11:44.402382  + <8>[   21.034723] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430759_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ceeea1c5a0551d8a637034
        failing since 65 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-16T05:11:46.828090  /lava-430759/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65ceef0549c721e4b463704b

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ceef0549c721e4b463704e
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-16T05:13:16.634581  / # #
    2024-02-16T05:13:16.736004  export SHELL=3D/bin/sh
    2024-02-16T05:13:16.736337  #
    2024-02-16T05:13:16.837400  / # export SHELL=3D/bin/sh. /lava-430770/en=
vironment
    2024-02-16T05:13:16.838204  =

    2024-02-16T05:13:16.939357  / # . /lava-430770/environment/lava-430770/=
bin/lava-test-runner /lava-430770/1
    2024-02-16T05:13:16.940247  =

    2024-02-16T05:13:16.946512  / # /lava-430770/bin/lava-test-runner /lava=
-430770/1
    2024-02-16T05:13:17.012698  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-16T05:13:17.013130  + <8>[   21.005584] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430770_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ceef0549c721e4b4637061
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-16T05:13:19.440403  /lava-430770/1/../bin/lava-test-case
    2024-02-16T05:13:19.440865  <8>[   23.420411] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-16T05:13:19.441159  /lava-430770/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/65cefa2319e9f0e04663701b

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/65cefa2319e9f0e046637032
        new failure (last pass: next-20240213)

    2024-02-16T06:00:55.326159  /lava-12773752/1/../bin/lava-test-case

    2024-02-16T06:00:55.336021  <8>[   31.425244] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/65cefa2319e9f0e046637033
        new failure (last pass: next-20240213)

    2024-02-16T06:00:54.297743  /lava-12773752/1/../bin/lava-test-case

    2024-02-16T06:00:54.306364  <8>[   30.396174] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65cefa2e31f4f80e5c637184

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cefa2e31f4f80e5c637=
185
        new failure (last pass: next-20240213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | exynos_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65ceedfccd3544b50f637022

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ceedfccd3544b50f637=
023
        new failure (last pass: next-20240215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cef3653d3796641b637063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cef3653d3796641b637=
064
        failing since 2 days (last pass: next-20240212, first fail: next-20=
240213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65ceeeb0c5aaf2bc4563707b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ceeeb0c5aaf2bc4563707f
        failing since 191 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-02-16T05:11:50.673223  + set +x
    2024-02-16T05:11:50.676446  <8>[   28.368378] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1094026_1.5.2.4.1>
    2024-02-16T05:11:50.785676  / # #
    2024-02-16T05:11:52.243755  export SHELL=3D/bin/sh
    2024-02-16T05:11:52.264497  #
    2024-02-16T05:11:52.264941  / # export SHELL=3D/bin/sh
    2024-02-16T05:11:54.214905  / # . /lava-1094026/environment
    2024-02-16T05:11:57.801053  /lava-1094026/bin/lava-test-runner /lava-10=
94026/1
    2024-02-16T05:11:57.822191  . /lava-1094026/environment
    2024-02-16T05:11:57.822485  / # /lava-1094026/bin/lava-test-runner /lav=
a-1094026/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cef0cc450aed8f6a63702c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cef0cc450aed8f6a637=
02d
        failing since 450 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ceefb45086ecb9c6637038

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ceefb45086ecb9c6637=
039
        failing since 450 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65ceef6df31d501f6b6370b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ceef6df31d501f6b637=
0b9
        failing since 13 days (last pass: next-20240125, first fail: next-2=
0240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cef76ff198b9f4a7637025

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cef76ff198b9f4a7637=
026
        new failure (last pass: next-20240213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65ceee49fd498b726963703a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ceee49fd498b726963703f
        failing since 259 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-16T05:10:09.681073  + set +x
    2024-02-16T05:10:09.682873  [   18.766741] <LAVA_SIGNAL_ENDRUN 0_dmesg =
458525_1.5.2.4.1>
    2024-02-16T05:10:09.790616  / # #
    2024-02-16T05:10:09.892198  export SHELL=3D/bin/sh
    2024-02-16T05:10:09.892784  #
    2024-02-16T05:10:09.993774  / # export SHELL=3D/bin/sh. /lava-458525/en=
vironment
    2024-02-16T05:10:09.994297  =

    2024-02-16T05:10:10.095295  / # . /lava-458525/environment/lava-458525/=
bin/lava-test-runner /lava-458525/1
    2024-02-16T05:10:10.096144  =

    2024-02-16T05:10:10.099944  / # /lava-458525/bin/lava-test-runner /lava=
-458525/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65ceeeb8c5aaf2bc456370d7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240216/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240216/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ceeeb8c5aaf2bc456370dc
        failing since 66 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-16T05:12:05.738863  #
    2024-02-16T05:12:05.840244  / # #export SHELL=3D/bin/sh
    2024-02-16T05:12:05.840616  =

    2024-02-16T05:12:05.941414  / # export SHELL=3D/bin/sh. /lava-3929085/e=
nvironment
    2024-02-16T05:12:05.941795  =

    2024-02-16T05:12:06.042612  / # . /lava-3929085/environment/lava-392908=
5/bin/lava-test-runner /lava-3929085/1
    2024-02-16T05:12:06.043226  =

    2024-02-16T05:12:06.051382  / # /lava-3929085/bin/lava-test-runner /lav=
a-3929085/1
    2024-02-16T05:12:06.189268  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-16T05:12:06.189513  + cd /lava-3929085/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

