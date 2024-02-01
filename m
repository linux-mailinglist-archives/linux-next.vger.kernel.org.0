Return-Path: <linux-next+bounces-953-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1DB845C99
	for <lists+linux-next@lfdr.de>; Thu,  1 Feb 2024 17:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0489B336F5
	for <lists+linux-next@lfdr.de>; Thu,  1 Feb 2024 16:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410575D46E;
	Thu,  1 Feb 2024 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="S6TZPJQj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E0C626C3
	for <linux-next@vger.kernel.org>; Thu,  1 Feb 2024 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706803406; cv=none; b=Dy+orQzZ80HtFi/t+4VUgL+JoXRK5c7m+IyU7LySkmM/2qACH2wJajeaiJDtC5VvXOjm/ur2KJ+TcbItCg3cVkeRwp6je/NZsulFXSSKSact+iEgaIQW54BRtmLUnTefWL+qjxHh8rins7HR04OTxmiWE0ZPaemekext//ww5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706803406; c=relaxed/simple;
	bh=EMPaJ4w2Us+xRf+4rrjWy/OiDU+ZDu3obiPxEReUDDI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cha1VlTcPynH6JCUZnc70alqoqCVEK6Qf+SR9nxpqBQwroAEvgY3lWZCWyeAnWOR6JhWIu0H8yO7iWg185uU+u883pJr4PDRH8yel4gN9ZFKgNvIPSDGiEESFJG0mT5NWGulWSseXHoyGkENCahXIzUkwWPMVgefedK5QH6GVwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=S6TZPJQj; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d7005ea1d0so747692a12.1
        for <linux-next@vger.kernel.org>; Thu, 01 Feb 2024 08:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706803402; x=1707408202; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fJndSG1gBKKyKeZ28n1VndtVaUTvO3JKE+4SbCRNkT4=;
        b=S6TZPJQjvePyR1Hgx+r0PNrYlZnxNiZpWVwZCn+7xj961w0aT9iKnVn7mAcQRpNLwh
         CTLAHdyfkUQKkWffnSt1aIGk+I5LuQ7T6Kq3LUySULJj7k43T/6tcBupvrP1eXibbGTx
         NL5y56KS+O+0/EOYe0JfjBjFXnAt2uUSnziyLlmAxh0GKavm12uFTJ86MHxv1H0bRO8A
         iWGSeax8r27+Q2XVe77D4W6uXjbOvTwed02tbhbClidO99IhdaknaGTiwlkezC8tb2p0
         k0/VbCSoFRVVDCBvWkwX6aS+KzWhBrE/RAl3np++YwFPBVXG2WaDJ3VdkE3BgGgLpx9m
         blIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706803402; x=1707408202;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJndSG1gBKKyKeZ28n1VndtVaUTvO3JKE+4SbCRNkT4=;
        b=luG5TKueaaUcUxaogVF5KwMCZQhMMbbhcIQYB9jMZqNV+5mVJFWIId3HoQqQdUUVAI
         oNsWwnSOasjiek0/rW9GB9jog5nm6XOwHDdAHaSdueYZxnbk5OC3SYM5/u7E1ajNRd4b
         DByCNTD9QOmfy4pPRFOj64zyGd45subiWYF5o/1VPf9YI+uWBcmpaDiWnI4zmPSYpIDW
         WzoGGyjdueGrWEpI64P6aBP58HK+A1JVWK9/Ldb0clWgxEdhtVZMzcqathMed8E2EjTq
         kBXm1L2h6L7FOraRQeNaxW5zBQQHbvoBrg6ehCM+m0FFVeX7h3+FM/v0k5WlfQ0upJHb
         IiuA==
X-Gm-Message-State: AOJu0YxSEHiV2P0CAPM1RKfw5///QHs23ihfUIuJn6mpvILflqVBLJA2
	PQGllu5tdg4enAsHdjtjEMh+Stqqj8N1lucYCg7hsTfrqp53V78NOSlk1eYW+r9QlZyNQLSTkUR
	b
X-Google-Smtp-Source: AGHT+IGxl8ZL3cP7nnKBap9xJkMtcRbZz2K4xpePr/nW6jjzeoCmoXHvSWK840wlE5vusPA7WSLiag==
X-Received: by 2002:a05:6a20:d80e:b0:19e:487e:39e7 with SMTP id iv14-20020a056a20d80e00b0019e487e39e7mr1382869pzb.16.1706803401137;
        Thu, 01 Feb 2024 08:03:21 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW/styxLIGPjkTGYAwljjfzEpq3oWMl6XdE0XM629DVQkxUzfwyNKebI4h1SlK/RlGSguz+nnss4iInTYUhIMZGq7GdxH6SSl5L98DZkqkR8XsBhLBJKfnuohD+fTTVORRhdAVYgA50COZDluebe2qSHg==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o15-20020a056a001b4f00b006dde15ca821sm11945066pfv.47.2024.02.01.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 08:03:20 -0800 (PST)
Message-ID: <65bbc0c8.050a0220.f1724.6b4e@mx.google.com>
Date: Thu, 01 Feb 2024 08:03:20 -0800 (PST)
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
X-Kernelci-Kernel: next-20240201
X-Kernelci-Report-Type: test
Subject: next/master baseline: 389 runs, 35 regressions (next-20240201)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 389 runs, 35 regressions (next-20240201)

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

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240201/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240201
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      51b70ff55ed88edd19b080a524063446bcc34b62 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb8505d0a706261d00a07a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb8505d0a706261d00a=
07b
        failing since 365 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb87ae94c009fe3600a039

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb87ae94c009fe3600a=
03a
        failing since 241 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb865ae9a7cd031500a056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb865ae9a7cd031500a=
057
        failing since 309 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb86fdffccbb53c200a048

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb86fdffccbb53c200a=
049
        failing since 307 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb83ef1e2471f9b200a055

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb83ef1e2471f9b200a=
056
        failing since 7 days (last pass: next-20240124, first fail: next-20=
240125) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb8bd50bda69790e00a04e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb8bd50bda69790e00a=
04f
        failing since 660 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb8370a1768291cc00a094

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb8370a1768291cc00a=
095
        failing since 2 days (last pass: next-20240125, first fail: next-20=
240130) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65bb82f2190534bc1800a05a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb82f2190534bc1800a061
        failing since 50 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-01T11:39:07.668763  / # #
    2024-02-01T11:39:07.770781  export SHELL=3D/bin/sh
    2024-02-01T11:39:07.771493  #
    2024-02-01T11:39:07.872800  / # export SHELL=3D/bin/sh. /lava-425051/en=
vironment
    2024-02-01T11:39:07.873513  =

    2024-02-01T11:39:07.974969  / # . /lava-425051/environment/lava-425051/=
bin/lava-test-runner /lava-425051/1
    2024-02-01T11:39:07.976102  =

    2024-02-01T11:39:07.980565  / # /lava-425051/bin/lava-test-runner /lava=
-425051/1
    2024-02-01T11:39:08.038689  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T11:39:08.039112  + <8>[   22.196623] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 425051_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65bb82f2190534bc1800a065
        failing since 50 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-01T11:39:10.147264  /lava-425051/1/../bin/lava-test-case
    2024-02-01T11:39:10.147717  <8>[   24.306689] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-01T11:39:10.148009  /lava-425051/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
bb82f2190534bc1800a067
        failing since 50 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-01T11:39:11.206962  /lava-425051/1/../bin/lava-test-case
    2024-02-01T11:39:11.207437  <8>[   25.346609] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bb82f2190534bc1800a06c
        failing since 50 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-01T11:39:12.283070  /lava-425051/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65bb82f2190534bc1800a06d
        failing since 50 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-01T11:39:12.286341  <8>[   26.459019] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-01T11:39:13.344640  /lava-425051/1/../bin/lava-test-case
    2024-02-01T11:39:13.345481  <8>[   27.480672] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-01T11:39:13.345764  /lava-425051/1/../bin/lava-test-case
    2024-02-01T11:39:13.346108  <8>[   27.498402] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-01T11:39:13.346383  /lava-425051/1/../bin/lava-test-case
    2024-02-01T11:39:13.346652  <8>[   27.517706] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-02-01T11:39:13.346916  /lava-425051/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65bb83f7a3426441a700a080

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb83f7a3426441a700a087
        failing since 51 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-01T11:43:26.452752  / # #
    2024-02-01T11:43:26.554822  export SHELL=3D/bin/sh
    2024-02-01T11:43:26.555368  #
    2024-02-01T11:43:26.656316  / # export SHELL=3D/bin/sh. /lava-425061/en=
vironment
    2024-02-01T11:43:26.657019  =

    2024-02-01T11:43:26.758470  / # . /lava-425061/environment/lava-425061/=
bin/lava-test-runner /lava-425061/1
    2024-02-01T11:43:26.759594  =

    2024-02-01T11:43:26.764279  / # /lava-425061/bin/lava-test-runner /lava=
-425061/1
    2024-02-01T11:43:26.822361  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T11:43:26.822782  + <8>[   22.239979] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 425061_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65bb83f7a3426441a700a08b
        failing since 51 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-01T11:43:28.896150  /lava-425061/1/../bin/lava-test-case
    2024-02-01T11:43:28.930919  <8>[   24.350204] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-01T11:43:28.931052  /lava-425061/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
bb83f7a3426441a700a08d
        failing since 51 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-01T11:43:29.991783  /lava-425061/1/../bin/lava-test-case
    2024-02-01T11:43:29.992236  <8>[   25.389347] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-01T11:43:29.992584  /lava-425061/1/../bin/lava-test-case
    2024-02-01T11:43:29.992855  <8>[   25.406509] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bb83f7a3426441a700a092
        failing since 51 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-01T11:43:31.066936  /lava-425061/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65bb83f7a3426441a700a093
        failing since 51 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-01T11:43:31.070275  <8>[   26.502756] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-01T11:43:32.129448  /lava-425061/1/../bin/lava-test-case
    2024-02-01T11:43:32.129958  <8>[   27.524409] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-01T11:43:32.130251  /lava-425061/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65bb82f5190534bc1800a0bb

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb82f5190534bc1800a0c2
        failing since 50 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-01T11:39:09.537874  / # #
    2024-02-01T11:39:09.639945  export SHELL=3D/bin/sh
    2024-02-01T11:39:09.640681  #
    2024-02-01T11:39:09.741857  / # export SHELL=3D/bin/sh. /lava-425054/en=
vironment
    2024-02-01T11:39:09.742210  =

    2024-02-01T11:39:09.843243  / # . /lava-425054/environment/lava-425054/=
bin/lava-test-runner /lava-425054/1
    2024-02-01T11:39:09.843854  =

    2024-02-01T11:39:09.849768  / # /lava-425054/bin/lava-test-runner /lava=
-425054/1
    2024-02-01T11:39:09.916773  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T11:39:09.917212  + <8>[   22.560409] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 425054_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bb82f5190534bc1800a0d5
        failing since 50 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-01T11:39:12.348965  /lava-425054/1/../bin/lava-test-case
    2024-02-01T11:39:12.349425  <8>[   24.978044] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-01T11:39:12.349773  /lava-425054/1/../bin/lava-test-case
    2024-02-01T11:39:12.350083  <8>[   24.995940] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-01T11:39:12.350361  /lava-425054/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65bb83ceb96bd7f6dd00a07c

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb83ceb96bd7f6dd00a083
        failing since 51 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-01T11:42:53.046707  / # #
    2024-02-01T11:42:53.147400  export SHELL=3D/bin/sh
    2024-02-01T11:42:53.147662  #
    2024-02-01T11:42:53.248282  / # export SHELL=3D/bin/sh. /lava-425060/en=
vironment
    2024-02-01T11:42:53.248615  =

    2024-02-01T11:42:53.349532  / # . /lava-425060/environment/lava-425060/=
bin/lava-test-runner /lava-425060/1
    2024-02-01T11:42:53.350476  =

    2024-02-01T11:42:53.361284  / # /lava-425060/bin/lava-test-runner /lava=
-425060/1
    2024-02-01T11:42:53.402065  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T11:42:53.422475  + <8>[   22.593918] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 425060_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bb83cfb96bd7f6dd00a096
        failing since 51 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-01T11:42:55.845989  /lava-425060/1/../bin/lava-test-case
    2024-02-01T11:42:55.846124  <8>[   25.007906] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-01T11:42:55.846224  /lava-425060/1/../bin/lava-test-case
    2024-02-01T11:42:55.846309  <8>[   25.025740] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-01T11:42:55.846393  /lava-425060/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb9dda63c60fabac00a09f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb9dda63c60fabac00a=
0a0
        new failure (last pass: next-20231222) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb84d0608938e66900a0bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb84d0608938e66900a=
0c0
        failing since 14 days (last pass: next-20240117, first fail: next-2=
0240118) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb8994b54ca5469500a0a8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb8994b54ca5469500a0b1
        failing since 177 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-02-01T12:07:33.487137  + set +x
    2024-02-01T12:07:33.489577  <8>[   30.007924] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1086153_1.5.2.4.1>
    2024-02-01T12:07:33.598855  / # #
    2024-02-01T12:07:35.063605  export SHELL=3D/bin/sh
    2024-02-01T12:07:35.084567  #
    2024-02-01T12:07:35.085040  / # export SHELL=3D/bin/sh
    2024-02-01T12:07:37.043368  / # . /lava-1086153/environment
    2024-02-01T12:07:40.636570  /lava-1086153/bin/lava-test-runner /lava-10=
86153/1
    2024-02-01T12:07:40.658407  . /lava-1086153/environment
    2024-02-01T12:07:40.658812  / # /lava-1086153/bin/lava-test-runner /lav=
a-1086153/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb8cdf26798cece600a0c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb8cdf26798cece600a=
0ca
        failing since 436 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb8bdb0bda69790e00a051

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb8bdb0bda69790e00a=
052
        failing since 436 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb84943c5fd0652f00a039

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb84943c5fd0652f00a=
03a
        new failure (last pass: next-20240125) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb860ecc7d92005600a047

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb860ecc7d92005600a050
        failing since 239 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-01T11:52:25.321851  / # #
    2024-02-01T11:52:25.424257  export SHELL=3D/bin/sh
    2024-02-01T11:52:25.424659  #
    2024-02-01T11:52:25.525473  / # export SHELL=3D/bin/sh. /lava-3917994/e=
nvironment
    2024-02-01T11:52:25.526589  =

    2024-02-01T11:52:25.628026  / # . /lava-3917994/environment/lava-391799=
4/bin/lava-test-runner /lava-3917994/1
    2024-02-01T11:52:25.629483  =

    2024-02-01T11:52:25.646313  / # /lava-3917994/bin/lava-test-runner /lav=
a-3917994/1
    2024-02-01T11:52:25.765264  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T11:52:25.765916  + cd /lava-3917994/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb86835d50e9c81600a039

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb86835d50e9c81600a042
        failing since 239 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-01T11:54:19.261520  / # #
    2024-02-01T11:54:19.362581  export SHELL=3D/bin/sh
    2024-02-01T11:54:19.363099  #
    2024-02-01T11:54:19.463947  / # export SHELL=3D/bin/sh. /lava-3917999/e=
nvironment
    2024-02-01T11:54:19.464410  =

    2024-02-01T11:54:19.565285  / # . /lava-3917999/environment/lava-391799=
9/bin/lava-test-runner /lava-3917999/1
    2024-02-01T11:54:19.565786  =

    2024-02-01T11:54:19.576144  / # /lava-3917999/bin/lava-test-runner /lav=
a-3917999/1
    2024-02-01T11:54:19.694795  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T11:54:19.694999  + cd /lava-3917999/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb89a5a97fd0182e00a052

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb89a5a97fd0182e00a05b
        failing since 239 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-01T12:07:50.171443  / # #
    2024-02-01T12:07:50.272819  export SHELL=3D/bin/sh
    2024-02-01T12:07:50.273247  #
    2024-02-01T12:07:50.374037  / # export SHELL=3D/bin/sh. /lava-3918062/e=
nvironment
    2024-02-01T12:07:50.374384  =

    2024-02-01T12:07:50.475016  / # . /lava-3918062/environment/lava-391806=
2/bin/lava-test-runner /lava-3918062/1
    2024-02-01T12:07:50.475679  =

    2024-02-01T12:07:50.520053  / # /lava-3918062/bin/lava-test-runner /lav=
a-3918062/1
    2024-02-01T12:07:50.606058  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T12:07:50.606512  + cd /lava-3918062/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb8622851f83dc6800a045

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb8622851f83dc6800a04e
        failing since 239 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-01T11:52:46.426826  + set +x[   19.274323] <LAVA_SIGNAL_ENDRUN =
0_dmesg 456284_1.5.2.4.1>
    2024-02-01T11:52:46.427143  =

    2024-02-01T11:52:46.534564  / # #
    2024-02-01T11:52:46.636239  export SHELL=3D/bin/sh
    2024-02-01T11:52:46.636850  #
    2024-02-01T11:52:46.737823  / # export SHELL=3D/bin/sh. /lava-456284/en=
vironment
    2024-02-01T11:52:46.738434  =

    2024-02-01T11:52:46.839421  / # . /lava-456284/environment/lava-456284/=
bin/lava-test-runner /lava-456284/1
    2024-02-01T11:52:46.840252  =

    2024-02-01T11:52:46.843236  / # /lava-456284/bin/lava-test-runner /lava=
-456284/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb88169f4a54b80600a04e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb88169f4a54b80600a057
        failing since 239 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-01T12:01:12.729402  + set +x
    2024-02-01T12:01:12.731191  [   23.110564] <LAVA_SIGNAL_ENDRUN 0_dmesg =
456286_1.5.2.4.1>
    2024-02-01T12:01:12.839133  / # #
    2024-02-01T12:01:12.940672  export SHELL=3D/bin/sh
    2024-02-01T12:01:12.941210  #
    2024-02-01T12:01:13.042177  / # export SHELL=3D/bin/sh. /lava-456286/en=
vironment
    2024-02-01T12:01:13.042688  =

    2024-02-01T12:01:13.143671  / # . /lava-456286/environment/lava-456286/=
bin/lava-test-runner /lava-456286/1
    2024-02-01T12:01:13.144497  =

    2024-02-01T12:01:13.147184  / # /lava-456286/bin/lava-test-runner /lava=
-456286/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb89a6a97fd0182e00a061

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb89a6a97fd0182e00a06a
        failing since 239 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-01T12:07:44.525490  + set +x[   20.457826] <LAVA_SIGNAL_ENDRUN =
0_dmesg 456296_1.5.2.4.1>
    2024-02-01T12:07:44.525818  =

    2024-02-01T12:07:44.633930  / # #
    2024-02-01T12:07:44.735448  export SHELL=3D/bin/sh
    2024-02-01T12:07:44.735951  #
    2024-02-01T12:07:44.836906  / # export SHELL=3D/bin/sh. /lava-456296/en=
vironment
    2024-02-01T12:07:44.837413  =

    2024-02-01T12:07:44.938381  / # . /lava-456296/environment/lava-456296/=
bin/lava-test-runner /lava-456296/1
    2024-02-01T12:07:44.939120  =

    2024-02-01T12:07:44.941762  / # /lava-456296/bin/lava-test-runner /lava=
-456296/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb9cd0506c38d31c00a0bc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb9cd0506c38d31c00a0c5
        failing since 52 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-01T13:29:37.256374  / # #
    2024-02-01T13:29:37.357605  export SHELL=3D/bin/sh
    2024-02-01T13:29:37.358083  #
    2024-02-01T13:29:37.458946  / # export SHELL=3D/bin/sh. /lava-3917978/e=
nvironment
    2024-02-01T13:29:37.459529  =

    2024-02-01T13:29:37.560624  / # . /lava-3917978/environment/lava-391797=
8/bin/lava-test-runner /lava-3917978/1
    2024-02-01T13:29:37.561397  =

    2024-02-01T13:29:37.584596  / # /lava-3917978/bin/lava-test-runner /lav=
a-3917978/1
    2024-02-01T13:29:37.648581  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T13:29:37.690244  + cd /lava-3917978/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb9cd5506c38d31c00a0ca

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240201/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240201/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb9cd5506c38d31c00a0d3
        failing since 49 days (last pass: next-20231213, first fail: next-2=
0231214)

    2024-02-01T13:29:25.144919  / # #
    2024-02-01T13:29:25.246079  export SHELL=3D/bin/sh
    2024-02-01T13:29:25.246445  #
    2024-02-01T13:29:25.347216  / # export SHELL=3D/bin/sh. /lava-3917980/e=
nvironment
    2024-02-01T13:29:25.347553  =

    2024-02-01T13:29:25.448379  / # . /lava-3917980/environment/lava-391798=
0/bin/lava-test-runner /lava-3917980/1
    2024-02-01T13:29:25.449050  =

    2024-02-01T13:29:25.492718  / # /lava-3917980/bin/lava-test-runner /lav=
a-3917980/1
    2024-02-01T13:29:25.569469  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T13:29:25.625911  + cd /lava-3917980/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

