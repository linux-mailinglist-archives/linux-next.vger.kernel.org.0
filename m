Return-Path: <linux-next+bounces-738-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF982BA3A
	for <lists+linux-next@lfdr.de>; Fri, 12 Jan 2024 05:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3098B23DFC
	for <lists+linux-next@lfdr.de>; Fri, 12 Jan 2024 04:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D841B281;
	Fri, 12 Jan 2024 04:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kr3X6yV0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C8B8C0D
	for <linux-next@vger.kernel.org>; Fri, 12 Jan 2024 04:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28b6218d102so5008670a91.0
        for <linux-next@vger.kernel.org>; Thu, 11 Jan 2024 20:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705032378; x=1705637178; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9r4zXWHpeuGzquwOQ3Sok9BNeB3kJvfTuc5fBV3b/Bo=;
        b=kr3X6yV00wi15xmZM6zYQBUOixMS19gqvEcHCBFieB0VpE5+OMkMJD60WrI27CENaG
         dQUQV+WbfsUFwa+IWoouDZ/mUSo0Bs+bbJWEzK8u6/yizNTh3V+FjyZYL5qzFU+NOQPE
         V7SGy0rbhCZ5d+zBVcZQAWPdtBnO5s5em6TXx1vUiL2SquK45+xyVtSJTtPKp0+OymOs
         b9vsfI0rb+ubKOpSbGuhj/PcGerc78G3fdxOuVTaNBBqJxOrLPSoDd6QamACmt3w6zRf
         wwqcpR2jNsWJ7beNZuyvQ32F09nAqGC2fjVBSs2x5aEOY9W2c4xOv6SBRZAlRDkrzLjY
         dU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705032378; x=1705637178;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r4zXWHpeuGzquwOQ3Sok9BNeB3kJvfTuc5fBV3b/Bo=;
        b=mTUV27tdeEqvU/CcC5jhoLCPRn1eEoZ/+dfqGJHqrTcyKAzGjSRksLa5Xlwo1NnXbP
         Co5Je3soDtJdfC6LoTHdlkio/F8LtCd/LnuaGbH/LsflBHrhwgm8f3t/irjgU4oCqaV5
         YCp96bDkwc2myFskrd5XzJVXP4zOd/evvbU9RNmMmsOIQtoGAiL6XMpioEMuPIwLNfKU
         UYJr34ko10UAbMwuUldUqfiEb9SYH77hKzAyp2/st8Cnker+cV+Ejp5b40VKExYT9New
         nnmiVbl1d2ZT6PA0Lt/Zdf7KJ4Rqick30P0znikhcexZn4vhst3xrAnD9eiyDzzxHMrz
         COig==
X-Gm-Message-State: AOJu0YziRxRFCvw+ec3uBCE/6klGZjv5/JNUk9/3zn5CNvPh5hr+UrAn
	5KXKFyXCMhqOhiJ3jQ3R6ddM3IVsVtFL91LGozN7otmHLHSbSw==
X-Google-Smtp-Source: AGHT+IGtSGwIg61LubvjRVu3pXqfae59+72gRIk4lA3+ve7x4fDZBDUylq8BLInxkGVy5AQCuRnJ8A==
X-Received: by 2002:a17:90b:3504:b0:28d:3964:9f2e with SMTP id ls4-20020a17090b350400b0028d39649f2emr801218pjb.27.1705032378440;
        Thu, 11 Jan 2024 20:06:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id kj16-20020a17090306d000b001d4301325a6sm2018377plb.247.2024.01.11.20.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 20:06:17 -0800 (PST)
Message-ID: <65a0bab9.170a0220.d767c.6e6b@mx.google.com>
Date: Thu, 11 Jan 2024 20:06:17 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-6752-g74b227210a3c6
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 67 runs,
 5 regressions (v6.7-6752-g74b227210a3c6)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 67 runs, 5 regressions (v6.7-6752-g74b227210a3=
c6)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
beaglebone-black            | arm   | lab-cip       | gcc-10   | multi_v7_d=
efconfig | 1          =

odroid-xu3                  | arm   | lab-collabora | gcc-10   | multi_v7_d=
efconfig | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig =
         | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-6752-g74b227210a3c6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-6752-g74b227210a3c6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      74b227210a3c6f82eb7af4c43143089d3f674e2c =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
beaglebone-black            | arm   | lab-cip       | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65a08d58255330fc5052a426

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bla=
ck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bla=
ck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65a08d58255330fc=
5052a42b
        new failure (last pass: v6.7-2936-g357881a4f22f3)
        1 lines

    2024-01-12T00:52:13.260414  / # =

    2024-01-12T00:52:13.271264  =

    2024-01-12T00:52:13.373475  / # #
    2024-01-12T00:52:13.383092  #
    2024-01-12T00:52:13.484241  / # export SHELL=3D/bin/sh
    2024-01-12T00:52:13.495012  export SHELL=3D/bin/sh
    2024-01-12T00:52:13.595728  / # . /lava-1074465/environment
    2024-01-12T00:52:13.606983  . /lava-1074465/environment
    2024-01-12T00:52:13.707894  / # /lava-1074465/bin/lava-test-runner /lav=
a-1074465/0
    2024-01-12T00:52:13.718887  /lava-1074465/bin/lava-test-runner /lava-10=
74465/0 =

    ... (9 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
odroid-xu3                  | arm   | lab-collabora | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65a089f6045fa44f6152a59d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-x=
u3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-x=
u3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a089f6045fa44f6152a=
59e
        new failure (last pass: v6.7-2936-g357881a4f22f3) =

 =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/65a08b1209c36186eb52a3f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi=
-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi=
-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a08b1209c36186eb52a=
3f8
        new failure (last pass: v6.7-2936-g357881a4f22f3) =

 =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65a089b867914fdb0d52a461

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20=
-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20=
-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a089b867914fdb0d52a46a
        failing since 58 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-12T00:36:35.108997  <8>[   13.962359] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3907209_1.5.2.4.1>
    2024-01-12T00:36:35.218433  / # #
    2024-01-12T00:36:35.321059  export SHELL=3D/bin/sh
    2024-01-12T00:36:35.321693  #
    2024-01-12T00:36:35.423169  / # export SHELL=3D/bin/sh. /lava-3907209/e=
nvironment
    2024-01-12T00:36:35.423793  =

    2024-01-12T00:36:35.524701  / # . /lava-3907209/environment/lava-390720=
9/bin/lava-test-runner /lava-3907209/1
    2024-01-12T00:36:35.526255  =

    2024-01-12T00:36:35.539787  / # /lava-3907209/bin/lava-test-runner /lav=
a-3907209/1
    2024-01-12T00:36:35.667567  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65a08996b18ae79d2d52a47e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-c=
ubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-6752-g=
74b227210a3c6/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-c=
ubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a08996b18ae79d2d52a487
        failing since 58 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-12T00:36:21.478834  + set +x
    2024-01-12T00:36:21.480640  [   21.360180] <LAVA_SIGNAL_ENDRUN 0_dmesg =
452170_1.5.2.4.1>
    2024-01-12T00:36:21.589406  / # #
    2024-01-12T00:36:21.691505  export SHELL=3D/bin/sh
    2024-01-12T00:36:21.691976  #
    2024-01-12T00:36:21.792849  / # export SHELL=3D/bin/sh. /lava-452170/en=
vironment
    2024-01-12T00:36:21.793349  =

    2024-01-12T00:36:21.894204  / # . /lava-452170/environment/lava-452170/=
bin/lava-test-runner /lava-452170/1
    2024-01-12T00:36:21.894924  =

    2024-01-12T00:36:21.897715  / # /lava-452170/bin/lava-test-runner /lava=
-452170/1 =

    ... (12 line(s) more)  =

 =20

