Return-Path: <linux-next+bounces-1301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F91860026
	for <lists+linux-next@lfdr.de>; Thu, 22 Feb 2024 18:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68C5E1C23B5C
	for <lists+linux-next@lfdr.de>; Thu, 22 Feb 2024 17:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689A2154BE3;
	Thu, 22 Feb 2024 17:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Y+HsEpCS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29221552E2
	for <linux-next@vger.kernel.org>; Thu, 22 Feb 2024 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708624581; cv=none; b=Y6wkeiunk/r4GrAqCsEihFFutzk7yhULCCrv2Vt1mKI8hWZLy7/4oUmOXLPUIQfmluE9TOAyOJCRyNAhU3LndisuCBfaKVINCTLzWWNN/3+F29tuE2h9JiJzz/8nTviGSJuy2p8m9dZZuRMOMGSo0/yYeObXiE2eXHLSUYXhdcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708624581; c=relaxed/simple;
	bh=ANcsPGUTduXR6xRi2+ZJXD11W05NP02jVMwAGzzg8aE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Dm/UiJn6DD3i8J34WFFX0Gq4YU8/0bnwHVGtxTjtx6Qdz8pHV2INC8ALnagz5sey7yuILjkqhE7+CP73yEXl0trdnL0+W9doF/F6XF1SzTMeoo7VfYoHalqc3ByaCrU686nrrDV+huwFjqVG8tTOc1s/zmSu1QSqrtWGYTGuNT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Y+HsEpCS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e4cf834113so487345b3a.3
        for <linux-next@vger.kernel.org>; Thu, 22 Feb 2024 09:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708624577; x=1709229377; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FMmK/JFYq1BWrJKDAiYmTFOnrvxHaTxyUbHa9k+QJl4=;
        b=Y+HsEpCSUsGxkFyKkNA8/e3yDdLjXrejbUyNR+71kn0QlKDMFZUhyAKFAEKyx1IanV
         2wO7o5Ro2DELcTzXTlLGXziNvIgbr56oMHpyhJ9COWmlazr2pjiDQO08cIwzBY7zRv3O
         D6ZDjSCPHIM6eDBoq/ZrwJwvT7Je5YwrrTmjr7Pd6+MEXSk6c3+XoSwJH8QGQcIhRT8K
         mPuNVtLM4uiy0Yt3jF2iyu6hzpYdffgdiQd+IUV6Da0K3ARLsk05KHESXCXR+BO6iGEe
         AljM5Wb9mvVU2UWtQrEyF9kbusDB6NZvD90PwIvBzB2/s87mj7qME/PagJLg9TafUCsB
         1kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624577; x=1709229377;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMmK/JFYq1BWrJKDAiYmTFOnrvxHaTxyUbHa9k+QJl4=;
        b=m1vYHx3HnF6bDzK/oNEq0xquUBf2kYG3Z2Xdh7JGgp+MOVGVGK0lp08dxstmCMXdUR
         QZvlcMLTHlMgvfoXK2Hbx/pVcBBAH3ENoLptGsay91dXy2rV9jFOBh6zoQ2ObfYkPibT
         b8lX+oqzXFH1BDrZczSZw6pGd1TL33/87EqUX/QCO8iCBrWLNdcB1kpPrh53UeqZVRnd
         l8MMn0D5VW1LQOBpKOuPlVxgOhbC2xrngX1Rk2lL79F4X/SzFTBW33vXm2ypQ9nyoLy5
         igv7XxSIWnEV3J87KjOtACysGJdoT3u2ifaCkVCjjlTd6AFXHS1m8NnUnNX5oIEPaULc
         EV8w==
X-Gm-Message-State: AOJu0YwS5o8g+id/D0qv3UvwVR7O11rL5ifoV04gX5qog0VZqaBqglLJ
	9bYTU/odpf/Ps1NX46DyRgrkHIMfVU6DkkL42Rc/LlGkMpZnrCU6TIdZF+yRaLIVsru21RN/WEZ
	e
X-Google-Smtp-Source: AGHT+IE2qvIiufADkRBmXO2fcSkeaTzievN1CHid5ukbMRalNFK6Tyy5UqHWRWbZzwqCpDSJ5loNVg==
X-Received: by 2002:aa7:8283:0:b0:6e4:7934:79ff with SMTP id s3-20020aa78283000000b006e4793479ffmr8167762pfm.20.1708624577117;
        Thu, 22 Feb 2024 09:56:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a38-20020a056a001d2600b006e4751b964asm4025412pfx.205.2024.02.22.09.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:56:16 -0800 (PST)
Message-ID: <65d78ac0.050a0220.7f050.00ce@mx.google.com>
Date: Thu, 22 Feb 2024 09:56:16 -0800 (PST)
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
X-Kernelci-Kernel: next-20240222
X-Kernelci-Report-Type: test
Subject: next/master baseline: 292 runs, 22 regressions (next-20240222)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 292 runs, 22 regressions (next-20240222)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | bcm2835_de=
fconfig            | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

k3-am625-sk                 | arm64 | lab-baylibre  | gcc-10   | defconfig+=
videodec           | 1          =

k3-j721e-sk                 | arm64 | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =

k3-j721e-sk                 | arm64 | lab-baylibre  | gcc-10   | defconfig+=
videodec           | 1          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig =
                   | 1          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig+=
videodec           | 5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig+=
videodec           | 2          =

r8a7743-iwg20d-q7           | arm   | lab-cip       | gcc-10   | shmobile_d=
efconfig           | 1          =

r8a774a1-hihope-rzg2m-ex    | arm64 | lab-cip       | gcc-10   | defconfig+=
videodec           | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig =
                   | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | clang-17 | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | clang-17 | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240222/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240222
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e31185ce00a96232308300008db193416ceb9769 =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | bcm2835_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74ae3986035d499637017

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d74ae3986035d499637=
018
        failing since 262 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74e18c600ad1277637032

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d74e18c600ad1277637=
033
        failing since 330 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
k3-am625-sk                 | arm64 | lab-baylibre  | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74dfbc600ad127763701d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d74dfbc600ad1277637=
01e
        new failure (last pass: next-20240221) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
k3-j721e-sk                 | arm64 | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74d276d26299262637035

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d74d276d26299262637=
036
        new failure (last pass: next-20240221) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
k3-j721e-sk                 | arm64 | lab-baylibre  | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74eab9db882a186637075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d74eab9db882a186637=
076
        new failure (last pass: next-20240221) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74befe84ba31ce9637012

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d74befe84ba31ce9637019
        new failure (last pass: next-20240221)

    2024-02-22T13:27:42.352277  <8>[   20.323572] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 433813_1.5.2.4.1>
    2024-02-22T13:27:42.457932  / # #
    2024-02-22T13:27:42.559957  export SHELL=3D/bin/sh
    2024-02-22T13:27:42.560735  #
    2024-02-22T13:27:42.662284  / # export SHELL=3D/bin/sh. /lava-433813/en=
vironment
    2024-02-22T13:27:42.663050  =

    2024-02-22T13:27:42.764397  / # . /lava-433813/environment/lava-433813/=
bin/lava-test-runner /lava-433813/1
    2024-02-22T13:27:42.765645  =

    2024-02-22T13:27:42.784215  / # /lava-433813/bin/lava-test-runner /lava=
-433813/1
    2024-02-22T13:27:42.828611  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig+=
videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65d74c654d3ec62e76637038

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d74c654d3ec62e7663703f
        failing since 72 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-22T13:29:52.549997  / # #
    2024-02-22T13:29:52.652229  export SHELL=3D/bin/sh
    2024-02-22T13:29:52.652984  #
    2024-02-22T13:29:52.754514  / # export SHELL=3D/bin/sh. /lava-433820/en=
vironment
    2024-02-22T13:29:52.755272  =

    2024-02-22T13:29:52.856532  / # . /lava-433820/environment/lava-433820/=
bin/lava-test-runner /lava-433820/1
    2024-02-22T13:29:52.857778  =

    2024-02-22T13:29:52.902385  / # /lava-433820/bin/lava-test-runner /lava=
-433820/1
    2024-02-22T13:29:52.920840  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-22T13:29:52.921284  + <8>[   20.672344] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433820_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d74c654d3ec62e76637043
        failing since 72 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-22T13:29:55.029258  /lava-433820/1/../bin/lava-test-case
    2024-02-22T13:29:55.029688  <8>[   22.781599] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-22T13:29:55.030051  /lava-433820/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d74c654d3ec62e76637045
        failing since 72 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-22T13:29:56.089665  /lava-433820/1/../bin/lava-test-case
    2024-02-22T13:29:56.090174  <8>[   23.822005] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-22T13:29:56.090481  /lava-433820/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d74c654d3ec62e7663704a
        failing since 72 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-22T13:29:57.169017  /lava-433820/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d74c654d3ec62e7663704b
        failing since 72 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-22T13:29:57.172196  <8>[   24.938530] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-22T13:29:58.230889  /lava-433820/1/../bin/lava-test-case
    2024-02-22T13:29:58.231046  <8>[   25.960571] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-22T13:29:58.231171  /lava-433820/1/../bin/lava-test-case
    2024-02-22T13:29:58.231285  <8>[   25.978498] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-22T13:29:58.231398  /lava-433820/1/../bin/lava-test-case
    2024-02-22T13:29:58.231490  <8>[   25.998045] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-02-22T13:29:58.231576  /lava-433820/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig+=
videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65d74c67b5f7b3a77e637093

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d74c67b5f7b3a77e63709a
        failing since 72 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-22T13:29:53.905450  / # #
    2024-02-22T13:29:54.007623  export SHELL=3D/bin/sh
    2024-02-22T13:29:54.008460  #
    2024-02-22T13:29:54.109926  / # export SHELL=3D/bin/sh. /lava-433821/en=
vironment
    2024-02-22T13:29:54.110722  =

    2024-02-22T13:29:54.211997  / # . /lava-433821/environment/lava-433821/=
bin/lava-test-runner /lava-433821/1
    2024-02-22T13:29:54.213056  =

    2024-02-22T13:29:54.217142  / # /lava-433821/bin/lava-test-runner /lava=
-433821/1
    2024-02-22T13:29:54.286379  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-22T13:29:54.286809  + <8>[   20.959420] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433821_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d74c67b5f7b3a77e6370ad
        failing since 72 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-22T13:29:56.728199  /lava-433821/1/../bin/lava-test-case
    2024-02-22T13:29:56.728366  <8>[   23.389369] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-22T13:29:56.728492  /lava-433821/1/../bin/lava-test-case
    2024-02-22T13:29:56.728609  <8>[   23.407251] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-22T13:29:56.728711  /lava-433821/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7           | arm   | lab-cip       | gcc-10   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74eab79351f10f6637033

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d74eab79351f10f6637=
034
        failing since 8 days (last pass: next-20240212, first fail: next-20=
240213) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex    | arm64 | lab-cip       | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74e1e4aeecdaa11637028

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d74e1e4aeecdaa1163702d
        failing since 198 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-02-22T13:37:03.455468  + set +x
    2024-02-22T13:37:03.458609  <8>[   28.276782] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1097212_1.5.2.4.1>
    2024-02-22T13:37:03.566673  / # #
    2024-02-22T13:37:05.024207  export SHELL=3D/bin/sh
    2024-02-22T13:37:05.044947  #
    2024-02-22T13:37:05.045368  / # export SHELL=3D/bin/sh
    2024-02-22T13:37:06.993841  / # . /lava-1097212/environment
    2024-02-22T13:37:10.578238  /lava-1097212/bin/lava-test-runner /lava-10=
97212/1
    2024-02-22T13:37:10.598889  . /lava-1097212/environment
    2024-02-22T13:37:10.599021  / # /lava-1097212/bin/lava-test-runner /lav=
a-1097212/1 =

    ... (27 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74cd3ca2e029a4b63709b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d74cd3ca2e029a4b637=
09c
        new failure (last pass: next-20240221) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74e8579351f10f6637024

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d74e8579351f10f6637029
        failing since 266 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-22T13:38:37.386438  / # #
    2024-02-22T13:38:37.487612  export SHELL=3D/bin/sh
    2024-02-22T13:38:37.488057  #
    2024-02-22T13:38:37.588854  / # export SHELL=3D/bin/sh. /lava-3936644/e=
nvironment
    2024-02-22T13:38:37.589340  =

    2024-02-22T13:38:37.690106  / # . /lava-3936644/environment/lava-393664=
4/bin/lava-test-runner /lava-3936644/1
    2024-02-22T13:38:37.691478  =

    2024-02-22T13:38:37.732089  / # /lava-3936644/bin/lava-test-runner /lav=
a-3936644/1
    2024-02-22T13:38:37.840771  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-22T13:38:37.841438  + cd /lava-3936644/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74e51dd386e181b637023

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d74e51dd386e181b637028
        failing since 266 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-22T13:38:05.958508  + set +x
    2024-02-22T13:38:05.960214  [   20.228623] <LAVA_SIGNAL_ENDRUN 0_dmesg =
460211_1.5.2.4.1>
    2024-02-22T13:38:06.069448  / # #
    2024-02-22T13:38:06.171114  export SHELL=3D/bin/sh
    2024-02-22T13:38:06.171748  #
    2024-02-22T13:38:06.272738  / # export SHELL=3D/bin/sh. /lava-460211/en=
vironment
    2024-02-22T13:38:06.273357  =

    2024-02-22T13:38:06.374352  / # . /lava-460211/environment/lava-460211/=
bin/lava-test-runner /lava-460211/1
    2024-02-22T13:38:06.375229  =

    2024-02-22T13:38:06.380654  / # /lava-460211/bin/lava-test-runner /lava=
-460211/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74df883383df45463705a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d74df883383df45463705f
        failing since 260 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-22T13:36:30.851558  / # #
    2024-02-22T13:36:30.954193  export SHELL=3D/bin/sh
    2024-02-22T13:36:30.955001  #
    2024-02-22T13:36:31.056406  / # export SHELL=3D/bin/sh. /lava-3936637/e=
nvironment
    2024-02-22T13:36:31.057274  =

    2024-02-22T13:36:31.158827  / # . /lava-3936637/environment/lava-393663=
7/bin/lava-test-runner /lava-3936637/1
    2024-02-22T13:36:31.160260  =

    2024-02-22T13:36:31.174766  / # /lava-3936637/bin/lava-test-runner /lav=
a-3936637/1
    2024-02-22T13:36:31.294270  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-22T13:36:31.294927  + cd /lava-3936637/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d7552344d7cce252637019

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d7552344d7cce25263701e
        failing since 266 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-22T14:07:09.122329  <8>[   13.641609] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3936710_1.5.2.4.1>
    2024-02-22T14:07:09.225299  / # #
    2024-02-22T14:07:09.326319  export SHELL=3D/bin/sh
    2024-02-22T14:07:09.326729  #
    2024-02-22T14:07:09.427749  / # export SHELL=3D/bin/sh. /lava-3936710/e=
nvironment
    2024-02-22T14:07:09.428245  =

    2024-02-22T14:07:09.529423  / # . /lava-3936710/environment/lava-393671=
0/bin/lava-test-runner /lava-3936710/1
    2024-02-22T14:07:09.533014  =

    2024-02-22T14:07:09.572057  / # /lava-3936710/bin/lava-test-runner /lav=
a-3936710/1
    2024-02-22T14:07:09.659132  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d74dec21ecbb551b63705c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d74dec21ecbb551b637061
        failing since 260 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-22T13:36:19.783878  + set +x[   18.836166] <LAVA_SIGNAL_ENDRUN =
0_dmesg 460205_1.5.2.4.1>
    2024-02-22T13:36:19.784191  =

    2024-02-22T13:36:19.892041  / # #
    2024-02-22T13:36:19.993574  export SHELL=3D/bin/sh
    2024-02-22T13:36:19.994098  #
    2024-02-22T13:36:20.095082  / # export SHELL=3D/bin/sh. /lava-460205/en=
vironment
    2024-02-22T13:36:20.095589  =

    2024-02-22T13:36:20.196585  / # . /lava-460205/environment/lava-460205/=
bin/lava-test-runner /lava-460205/1
    2024-02-22T13:36:20.197406  =

    2024-02-22T13:36:20.200296  / # /lava-460205/bin/lava-test-runner /lava=
-460205/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d7551c0daf875e116370ac

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240222/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d7551c0daf875e116370b1
        failing since 266 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-22T14:07:07.975986  + set +x
    2024-02-22T14:07:07.978430  [   19.852434] <LAVA_SIGNAL_ENDRUN 0_dmesg =
460218_1.5.2.4.1>
    2024-02-22T14:07:08.086431  / # #
    2024-02-22T14:07:08.188018  export SHELL=3D/bin/sh
    2024-02-22T14:07:08.188580  #
    2024-02-22T14:07:08.289597  / # export SHELL=3D/bin/sh. /lava-460218/en=
vironment
    2024-02-22T14:07:08.290182  =

    2024-02-22T14:07:08.391199  / # . /lava-460218/environment/lava-460218/=
bin/lava-test-runner /lava-460218/1
    2024-02-22T14:07:08.392240  =

    2024-02-22T14:07:08.395564  / # /lava-460218/bin/lava-test-runner /lava=
-460218/1 =

    ... (12 line(s) more)  =

 =20

