Return-Path: <linux-next+bounces-1417-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEF86CA53
	for <lists+linux-next@lfdr.de>; Thu, 29 Feb 2024 14:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD0F1F24134
	for <lists+linux-next@lfdr.de>; Thu, 29 Feb 2024 13:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B184E4B5DA;
	Thu, 29 Feb 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zwyvedfu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B77CF20
	for <linux-next@vger.kernel.org>; Thu, 29 Feb 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213668; cv=none; b=cbO1ocBzMe7cCs/QDuavRycuAOFelPk1BUebLg07mXQdZ+ESczX/rJnB9NfYGa9xZeIxAuW1hh5qDjfJpQdVe2KBy9MHKTFI/eApOHwQIq3ePKVEN/ds59xaSNv4dwxxxExl+cE+WZzKdwJ3tfeJsfEJO3wuNZmbgwB38O6+Q3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213668; c=relaxed/simple;
	bh=IMM9iq1KDb2pL3DNZ3CXs+JkGDSi70PqLEoWQoB5L0g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nrBkzXUlce1bYN5m5Tv+mp/uwApLD6MpR+36mi51ao85oYmCraumXO8lBunLkwdGXZsVa5tfJ/0/7bGiWHl66wJ7PozU4MUelECZEw4Tk77yVRO3LGah4g47QC2162KeaOkod55iQvC+wLK8LlIzwwx0BNdiADhFVFpJd1hZm6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zwyvedfu; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5dc949f998fso549666a12.3
        for <linux-next@vger.kernel.org>; Thu, 29 Feb 2024 05:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709213664; x=1709818464; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7BMZSL1U5KuYyD9sXGgykXth+lIa8Tz97PQZs9Ihhrw=;
        b=zwyvedfuNhSiFN6suZ/snGcWgfKGQscrs0xvqGtCD06tZ+XvS29xdbfEpoKHcyzSZu
         fr2/f/2PpI4KQ8NjzfZgatEuxi3ePg/Zi+tcu1b29JgkOICH+OnBQbXTqR8sWzcyA7fq
         41qHU+DKtRaOYYejwSnm7lie/Yf5xxNcFkIafuEzTG5rtcYtJf5zXemI3BsSegRsBTYl
         Lm5iIT2rQYAxPZuWpIetEkX8vKcAZ5QPhjUxHC8yPz8nIYXKj6u+YkyuQMK6ldAXcvK3
         wqjr2a5LIgIQICL6/pzhBTWlZwZaO/eeI+kzOHcExRfh+1FiIIZy1XSsrxjQfSrSD5yY
         Gl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213664; x=1709818464;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BMZSL1U5KuYyD9sXGgykXth+lIa8Tz97PQZs9Ihhrw=;
        b=GAWKJ7k0L8fv2/umLthc2fdsg+1zlJgBTm0cy+ErNZMqSzRycRFNtLB/P3Ckfg/ZlX
         StDVLY6WgCWrUiF5+y66x5+0HGQUlsRgOQOfFidP2xtd8VDjbP0vN/yWWiuRXLflOmtH
         v1cRNveBrvmyZ7qxK+fKo7Wh3RO3QBrGVAh6Xcfj9fAKuqhrjhsEA3uc5hLeMVx/5VAI
         FR7MuqOnDzKOqxMn+LELhFOSt39seu5LfRR4gtPAqixCDp7qNJRm2RTYXTIojdbWdKkK
         lPlcq+BawRSP930j515UdXb8DvXRX90WBH8R2LfYFPBp3n42h3udJogVTKJd4e1agGL9
         w9cg==
X-Gm-Message-State: AOJu0YxeafHPQ4IlIzpkbISJSJFJzH7f6RNbpyXGy02tu9kqbjniLTIg
	EN+Wb+lH/jn9xngSZQEG5L4VPNXOlJnN5hO5RlteLNyaQlxo4u6RUUJuhFPUKM4+976/r443ej3
	/u6Q=
X-Google-Smtp-Source: AGHT+IEuvWlVAkXQLTBLVfFzxldiDlZx3326jklnf2K1tNSidT3DgZsV5UrFi6GKaXbWpmDwxyOkRA==
X-Received: by 2002:a17:90a:6d90:b0:29a:11b6:a333 with SMTP id a16-20020a17090a6d9000b0029a11b6a333mr2147305pjk.15.1709213664244;
        Thu, 29 Feb 2024 05:34:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id st3-20020a17090b1fc300b00299ef19177dsm3628734pjb.8.2024.02.29.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 05:34:23 -0800 (PST)
Message-ID: <65e087df.170a0220.38fad.03f7@mx.google.com>
Date: Thu, 29 Feb 2024 05:34:23 -0800 (PST)
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
X-Kernelci-Kernel: next-20240229
X-Kernelci-Report-Type: test
Subject: next/master baseline: 258 runs, 26 regressions (next-20240229)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 258 runs, 26 regressions (next-20240229)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+videodec           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240229/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240229
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f303a3e2bcfba900efb5aee55236d17030e9f882 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e047258654f551e3637024

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e047258654f551e3637=
025
        failing since 0 day (last pass: next-20240226, first fail: next-202=
40228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e047218654f551e3637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e047218654f551e3637=
016
        failing since 2 days (last pass: next-20231106, first fail: next-20=
240226) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e047248654f551e3637021

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C523NA-A20=
057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C523NA-A20=
057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e047248654f551e3637=
022
        failing since 2 days (last pass: next-20231106, first fail: next-20=
240226) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65e049f6d2595ad6ff637018

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e049f6d2595ad6ff637=
019
        failing since 269 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e04736625d4e2906637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e04736625d4e2906637=
016
        failing since 0 day (last pass: next-20240226, first fail: next-202=
40228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e047218654f551e3637018

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e047218654f551e3637=
019
        failing since 0 day (last pass: next-20240226, first fail: next-202=
40228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e047238654f551e363701b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e047238654f551e3637=
01c
        failing since 2 days (last pass: next-20231106, first fail: next-20=
240226) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65e04a13bcd53b00f7637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e04a13bcd53b00f7637=
013
        new failure (last pass: next-20240222) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e04b7b859802f069637028

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e04b7b859802f069637=
029
        new failure (last pass: next-20240222) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e04a474b6b0df5ac637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e04a474b6b0df5ac637=
016
        failing since 688 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e04d6b5944e28b78637030

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e04d6b5944e28b78637=
031
        new failure (last pass: next-20240222) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65e049c5976aed152763701d

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e049c5976aed1527637024
        failing since 6 days (last pass: next-20240221, first fail: next-20=
240222)

    2024-02-29T09:09:08.575700  / # #
    2024-02-29T09:09:08.677931  export SHELL=3D/bin/sh
    2024-02-29T09:09:08.678699  #
    2024-02-29T09:09:08.780157  / # export SHELL=3D/bin/sh. /lava-436697/en=
vironment
    2024-02-29T09:09:08.780863  =

    2024-02-29T09:09:08.882280  / # . /lava-436697/environment/lava-436697/=
bin/lava-test-runner /lava-436697/1
    2024-02-29T09:09:08.883369  =

    2024-02-29T09:09:08.902688  / # /lava-436697/bin/lava-test-runner /lava=
-436697/1
    2024-02-29T09:09:08.946510  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-29T09:09:08.946949  + <8>[   20.623406] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 436697_1.5.2.4.5> =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65e04c467bcab86cbe63701f

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e04c467bcab86cbe637026
        failing since 79 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-29T09:19:47.748235  / # #
    2024-02-29T09:19:47.850269  export SHELL=3D/bin/sh
    2024-02-29T09:19:47.851088  #
    2024-02-29T09:19:47.952346  / # export SHELL=3D/bin/sh. /lava-436714/en=
vironment
    2024-02-29T09:19:47.953151  =

    2024-02-29T09:19:48.054498  / # . /lava-436714/environment/lava-436714/=
bin/lava-test-runner /lava-436714/1
    2024-02-29T09:19:48.055478  =

    2024-02-29T09:19:48.060979  / # /lava-436714/bin/lava-test-runner /lava=
-436714/1
    2024-02-29T09:19:48.118503  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-29T09:19:48.118942  + <8>[   20.526657] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 436714_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65e04c467bcab86cbe63702a
        failing since 79 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-29T09:19:50.227513  /lava-436714/1/../bin/lava-test-case
    2024-02-29T09:19:50.227943  <8>[   22.635988] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-29T09:19:50.228256  /lava-436714/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
e04c467bcab86cbe63702c
        failing since 79 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-29T09:19:51.286290  /lava-436714/1/../bin/lava-test-case
    2024-02-29T09:19:51.286725  <8>[   23.675695] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-29T09:19:51.287120  /lava-436714/1/../bin/lava-test-case
    2024-02-29T09:19:51.287406  <8>[   23.693050] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-02-29T09:19:51.287678  /lava-436714/1/../bin/lava-test-case
    2024-02-29T09:19:51.287941  <8>[   23.712281] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e04c467bcab86cbe637031
        failing since 79 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-29T09:19:52.361775  /lava-436714/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65e04c467bcab86cbe637032
        failing since 79 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-29T09:19:52.364894  <8>[   24.788891] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-29T09:19:53.401692  /lava-436714/1/../bin/lava-test-case
    2024-02-29T09:19:53.401830  <8>[   25.810939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-29T09:19:53.401927  /lava-436714/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65e04b41364e225282637045

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e04b41364e22528263704c
        failing since 79 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-29T09:15:30.589176  / # #
    2024-02-29T09:15:30.691169  export SHELL=3D/bin/sh
    2024-02-29T09:15:30.691878  #
    2024-02-29T09:15:30.793272  / # export SHELL=3D/bin/sh. /lava-436713/en=
vironment
    2024-02-29T09:15:30.794023  =

    2024-02-29T09:15:30.895208  / # . /lava-436713/environment/lava-436713/=
bin/lava-test-runner /lava-436713/1
    2024-02-29T09:15:30.896140  =

    2024-02-29T09:15:30.901028  / # /lava-436713/bin/lava-test-runner /lava=
-436713/1
    2024-02-29T09:15:30.968706  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-29T09:15:30.969513  + <8>[   20.985469] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 436713_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e04b42364e22528263705f
        failing since 79 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-29T09:15:33.396931  /lava-436713/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e048001cd6a9d4876370df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e048001cd6a9d487637=
0e0
        failing since 15 days (last pass: next-20240212, first fail: next-2=
0240213) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e04eda1272d1c23b637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e04eda1272d1c23b637=
016
        new failure (last pass: next-20240222) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e04b22863e4f8632637013

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e04b22863e4f8632637=
014
        failing since 464 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65e04b7c859802f06963702e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e04b7c859802f069637033
        failing since 273 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-29T09:16:24.735224  / # #
    2024-02-29T09:16:24.837624  export SHELL=3D/bin/sh
    2024-02-29T09:16:24.838489  #
    2024-02-29T09:16:24.940363  / # export SHELL=3D/bin/sh. /lava-3942191/e=
nvironment
    2024-02-29T09:16:24.941176  =

    2024-02-29T09:16:25.042696  / # . /lava-3942191/environment/lava-394219=
1/bin/lava-test-runner /lava-3942191/1
    2024-02-29T09:16:25.044016  =

    2024-02-29T09:16:25.059651  / # /lava-3942191/bin/lava-test-runner /lav=
a-3942191/1
    2024-02-29T09:16:25.163597  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-29T09:16:25.164419  + cd /lava-3942191/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e0560527d31805c86370dc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e0560527d31805c86370e1
        failing since 273 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-29T10:01:31.915121  <8>[   14.139946] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3942254_1.5.2.4.1>
    2024-02-29T10:01:32.023173  / # #
    2024-02-29T10:01:32.125965  export SHELL=3D/bin/sh
    2024-02-29T10:01:32.127062  #
    2024-02-29T10:01:32.228869  / # export SHELL=3D/bin/sh. /lava-3942254/e=
nvironment
    2024-02-29T10:01:32.229948  =

    2024-02-29T10:01:32.331683  / # . /lava-3942254/environment/lava-394225=
4/bin/lava-test-runner /lava-3942254/1
    2024-02-29T10:01:32.333404  =

    2024-02-29T10:01:32.346446  / # /lava-3942254/bin/lava-test-runner /lav=
a-3942254/1
    2024-02-29T10:01:32.488230  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65e04b4d364e2252826370bc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e04b4d364e2252826370c1
        failing since 273 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-29T09:15:42.380387  + set +x
    2024-02-29T09:15:42.382167  [   21.693302] <LAVA_SIGNAL_ENDRUN 0_dmesg =
461097_1.5.2.4.1>
    2024-02-29T09:15:42.489458  / # #
    2024-02-29T09:15:42.590914  export SHELL=3D/bin/sh
    2024-02-29T09:15:42.591473  #
    2024-02-29T09:15:42.692364  / # export SHELL=3D/bin/sh. /lava-461097/en=
vironment
    2024-02-29T09:15:42.692929  =

    2024-02-29T09:15:42.793857  / # . /lava-461097/environment/lava-461097/=
bin/lava-test-runner /lava-461097/1
    2024-02-29T09:15:42.794651  =

    2024-02-29T09:15:42.797240  / # /lava-461097/bin/lava-test-runner /lava=
-461097/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e0560327d31805c86370d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240229/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e0560327d31805c86370d6
        failing since 273 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-29T10:01:26.063579  + set +x[   21.621543] <LAVA_SIGNAL_ENDRUN =
0_dmesg 461105_1.5.2.4.1>
    2024-02-29T10:01:26.063930  =

    2024-02-29T10:01:26.172165  / # #
    2024-02-29T10:01:26.273808  export SHELL=3D/bin/sh
    2024-02-29T10:01:26.274363  #
    2024-02-29T10:01:26.375369  / # export SHELL=3D/bin/sh. /lava-461105/en=
vironment
    2024-02-29T10:01:26.375958  =

    2024-02-29T10:01:26.476976  / # . /lava-461105/environment/lava-461105/=
bin/lava-test-runner /lava-461105/1
    2024-02-29T10:01:26.477862  =

    2024-02-29T10:01:26.480703  / # /lava-461105/bin/lava-test-runner /lava=
-461105/1 =

    ... (12 line(s) more)  =

 =20

