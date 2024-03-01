Return-Path: <linux-next+bounces-1438-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B6786E099
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 12:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E2C1F23C96
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 11:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E646A34F;
	Fri,  1 Mar 2024 11:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wXV09Xih"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D806A8A2
	for <linux-next@vger.kernel.org>; Fri,  1 Mar 2024 11:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709293619; cv=none; b=C2pB9kuHF7ALlqGoahlcDAx8u78Mbtv/oVsSR0bw6lQ95+pwvGyFyCmo1LxT3Igfj8nv4nZY4xxUoXGSIgoZS5NPyVAK64i2L4dak7xxQdqaZuQEV7UplIJx7QmX/Qk3xTAbmpkNz6ya3OKt4c3S0ucV4zDEkh+HMueXbKU0w9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709293619; c=relaxed/simple;
	bh=zkCfq8ITyxGi/GnmB4rcd60fZwTgynssqlzBUsWKOkc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PL7QuBVBrqJvmf4WLSpReylbghJTAH2nuL80nawQP6Wo0OFWSe758sZxi/a9vL+Kjs5AnmLvfTWDPzQvq5g1RNHfyavHCQI7Nh+y5KapOdSb187f+VSilZ7ZLPMKjA+kJ1tQVipnBxpBXweGVWpkVCZx6Gy0kzkmkpM7xgtHtHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wXV09Xih; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36576b35951so12225595ab.3
        for <linux-next@vger.kernel.org>; Fri, 01 Mar 2024 03:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709293616; x=1709898416; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VsY6CfVyCbQ2vB/rGlJEn0VIwS5C90N/G+T/dHMf44Y=;
        b=wXV09Xihl/VrUxH1Px6QRkHc4HnIa/dw5Ebl4g0zozRUX2SHEGXisBTq+rm9p7Os3f
         Gq23DvHfLJ09fFQIoN1NKH5FUjXGhZOQQ0+Xo+d4BhwrSfRmMfcCyNKwfnWKKKdefWJf
         VNi36A7VfOsLBgS1x2BEmDmM3P2lHgjgsxhvaS2o1DmhOuTPexnpw5/40q172PSdNWrs
         0CESTqQ9i/MV38UOsOI89+7l1vs34J8mcmqMWL9Ik9AdRCkDWfxXLzwQ5tUU/IO5wN6B
         gNx0+nqD7TisFW22/Dp4jRO8JBfeYzQyBPIGdqaafGS1e/Ms735xaQWMYiCQF2RXamYN
         Qngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709293616; x=1709898416;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsY6CfVyCbQ2vB/rGlJEn0VIwS5C90N/G+T/dHMf44Y=;
        b=O5Ni5tQR9CFMzWKCERvm6PEX1FSSbgMmcqqgVwBHSowL3a/J/l2plh6Zg50bsoc6F5
         +wonWiZtj/AZQk3VE2Esu04iLsnjQud5cX0bQZ5oah0SOBAoKNPw7tjyHtgxIH8a089d
         G9c/Fm2kJyXXEFFdXu97d0VQavXoREobdCeTb0NPCX33nqQVGB442ASfz0tUbet7S70l
         /fwg0LoshTjaeAyaTCfrCtmbpLB2iKFsyuVBYdx/v8KlNMKMGnFiUVpvI1wEFS6aX60p
         JSlfK4ZEgoEAtRPXAKJXEAxbhh4bYBPJn+sRsMU3ReINj3u9Eqicf2nt44MOuevp8JTd
         g0DA==
X-Gm-Message-State: AOJu0Yya3rvbnoWDzsVSe8S/U05kWrAHrB3OhZUkeFIgMEbsvxbZzDq5
	0V2IEj7vNqF9xJS+ZsUvsIAtZlZfHVLm3fnDxtRFfY17P5cSOyKa7iMZTp9OTrg9DhjKqNHexsO
	4v58=
X-Google-Smtp-Source: AGHT+IGr111uwgYS1h3WMSGNGVaNQQG+wIKNzYDBIqwnjEFQgIWuaBbm/t11g5qsVh4m4E/A7mi51g==
X-Received: by 2002:a05:6e02:1807:b0:365:69a:86b2 with SMTP id a7-20020a056e02180700b00365069a86b2mr1917611ilv.17.1709293616168;
        Fri, 01 Mar 2024 03:46:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 3-20020a631543000000b005dcbb699abfsm2853505pgv.34.2024.03.01.03.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:46:55 -0800 (PST)
Message-ID: <65e1c02f.630a0220.9eec8.c971@mx.google.com>
Date: Fri, 01 Mar 2024 03:46:55 -0800 (PST)
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
X-Kernelci-Kernel: next-20240301
X-Kernelci-Report-Type: test
Subject: next/master baseline: 160 runs, 12 regressions (next-20240301)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 160 runs, 12 regressions (next-20240301)

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

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240301/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240301
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1870cdc0e8dee32e3c221704a2977898ba4c10e8 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e17fcdd626f33a8d63701a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e17fcdd626f33a8d637=
01b
        failing since 1 day (last pass: next-20240226, first fail: next-202=
40228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e17fcf716507a59c63701c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e17fcf716507a59c637=
01d
        failing since 3 days (last pass: next-20231106, first fail: next-20=
240226) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e17faca992e3bdbc63706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C523NA-A20=
057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C523NA-A20=
057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e17faca992e3bdbc637=
06e
        failing since 3 days (last pass: next-20231106, first fail: next-20=
240226) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65e1849e5bc8ed1aaf637050

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e1849e5bc8ed1aaf637=
051
        failing since 270 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e17fc0a992e3bdbc637077

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e17fc0a992e3bdbc637=
078
        failing since 1 day (last pass: next-20240226, first fail: next-202=
40228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e17fcd716507a59c637014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e17fcd716507a59c637=
015
        failing since 1 day (last pass: next-20240226, first fail: next-202=
40228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e17fcd716507a59c637017

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e17fcd716507a59c637=
018
        failing since 3 days (last pass: next-20231106, first fail: next-20=
240226) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e180ba6c5760d73c63703b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e180ba6c5760d73c637040
        new failure (last pass: next-20240229)

    2024-03-01T07:15:47.471972  + set[   15.749308] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1030949_1.5.2.3.1>
    2024-03-01T07:15:47.472109   +x
    2024-03-01T07:15:47.577859  / # #
    2024-03-01T07:15:47.678985  export SHELL=3D/bin/sh
    2024-03-01T07:15:47.679384  #
    2024-03-01T07:15:47.780069  / # export SHELL=3D/bin/sh. /lava-1030949/e=
nvironment
    2024-03-01T07:15:47.780429  =

    2024-03-01T07:15:47.881350  / # . /lava-1030949/environment/lava-103094=
9/bin/lava-test-runner /lava-1030949/1
    2024-03-01T07:15:47.881890  =

    2024-03-01T07:15:47.884924  / # /lava-1030949/bin/lava-test-runner /lav=
a-1030949/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65e17f5c660aa7966163702b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e17f5c660aa79661637030
        failing since 274 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-01T07:09:55.894443  / # #
    2024-03-01T07:09:55.997951  export SHELL=3D/bin/sh
    2024-03-01T07:09:55.999275  #
    2024-03-01T07:09:56.101201  / # export SHELL=3D/bin/sh. /lava-3942750/e=
nvironment
    2024-03-01T07:09:56.102329  =

    2024-03-01T07:09:56.204501  / # . /lava-3942750/environment/lava-394275=
0/bin/lava-test-runner /lava-3942750/1
    2024-03-01T07:09:56.206465  =

    2024-03-01T07:09:56.217301  / # /lava-3942750/bin/lava-test-runner /lav=
a-3942750/1
    2024-03-01T07:09:56.297356  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-01T07:09:56.331032  + cd /lava-3942750/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e180c44172c7c748637048

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e180c44172c7c74863704d
        failing since 268 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-01T07:16:04.349623  <8>[   14.019697] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3942781_1.5.2.4.1>
    2024-03-01T07:16:04.452359  / # #
    2024-03-01T07:16:04.553392  export SHELL=3D/bin/sh
    2024-03-01T07:16:04.553732  #
    2024-03-01T07:16:04.654414  / # export SHELL=3D/bin/sh. /lava-3942781/e=
nvironment
    2024-03-01T07:16:04.654745  =

    2024-03-01T07:16:04.755469  / # . /lava-3942781/environment/lava-394278=
1/bin/lava-test-runner /lava-3942781/1
    2024-03-01T07:16:04.755987  =

    2024-03-01T07:16:04.800084  / # /lava-3942781/bin/lava-test-runner /lav=
a-3942781/1
    2024-03-01T07:16:04.860868  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65e17f57660aa79661637012

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e17f57660aa79661637017
        failing since 274 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-01T07:09:50.858767  + set +x
    2024-03-01T07:09:50.860488  [   23.574247] <LAVA_SIGNAL_ENDRUN 0_dmesg =
461142_1.5.2.4.1>
    2024-03-01T07:09:50.968113  / # #
    2024-03-01T07:09:51.069624  export SHELL=3D/bin/sh
    2024-03-01T07:09:51.070141  #
    2024-03-01T07:09:51.171139  / # export SHELL=3D/bin/sh. /lava-461142/en=
vironment
    2024-03-01T07:09:51.171834  =

    2024-03-01T07:09:51.272858  / # . /lava-461142/environment/lava-461142/=
bin/lava-test-runner /lava-461142/1
    2024-03-01T07:09:51.273672  =

    2024-03-01T07:09:51.276353  / # /lava-461142/bin/lava-test-runner /lava=
-461142/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e180d24172c7c7486370ed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240301/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e180d24172c7c7486370f2
        failing since 268 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-01T07:16:18.043398  + set +x[   22.272611] <LAVA_SIGNAL_ENDRUN =
0_dmesg 461147_1.5.2.4.1>
    2024-03-01T07:16:18.043711  =

    2024-03-01T07:16:18.152016  / # #
    2024-03-01T07:16:18.253600  export SHELL=3D/bin/sh
    2024-03-01T07:16:18.254155  #
    2024-03-01T07:16:18.355142  / # export SHELL=3D/bin/sh. /lava-461147/en=
vironment
    2024-03-01T07:16:18.355674  =

    2024-03-01T07:16:18.456679  / # . /lava-461147/environment/lava-461147/=
bin/lava-test-runner /lava-461147/1
    2024-03-01T07:16:18.457519  =

    2024-03-01T07:16:18.460468  / # /lava-461147/bin/lava-test-runner /lava=
-461147/1 =

    ... (12 line(s) more)  =

 =20

