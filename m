Return-Path: <linux-next+bounces-773-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE88832360
	for <lists+linux-next@lfdr.de>; Fri, 19 Jan 2024 03:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97042285F51
	for <lists+linux-next@lfdr.de>; Fri, 19 Jan 2024 02:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B00D46A2;
	Fri, 19 Jan 2024 02:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dKMzq99T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20396440C
	for <linux-next@vger.kernel.org>; Fri, 19 Jan 2024 02:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705631993; cv=none; b=HM+9FYlZRUaR6qDnSnUevMuHWRjLoXqunN1boFeLT8+mZne8ix0Oa1xTvZrU+oDDgHGX44cDpufGyyY0CC9oBilj0QVwquKQefvQ+drQ6bPNy8FDyV7ONkwbhk+T7nsTEfK/HUHpzq9KvnFh2gScsZdH/JdTxrW3HUnuYYfMltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705631993; c=relaxed/simple;
	bh=LMpRA4AZ9If0qzZdzvMDntxQUCqv7crm6hlm+1d1oeY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ti6P4KhTyMRSK4auU0FWywUQ/VVduuO1/Dcx6wXaDEYRsc0qUSiTowAexng4HpGwsxfEFYlaKIei9VBL3b2hd0HDJO0Oaq6L2/OguOefSOmulK2fgJ6QOQrlFBTyrWARMdRgSkdlAHZ5xXQA8bjyxkigRuG4x65hHlk1MFlAa28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dKMzq99T; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bba50cd318so361489b6e.0
        for <linux-next@vger.kernel.org>; Thu, 18 Jan 2024 18:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705631990; x=1706236790; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u9T44Rm7mwhwTQAMQjZ9QNy3LBBe5/Z+71V2lDK3Tbg=;
        b=dKMzq99TQsa9ACF6HuuYYHAL7kOVwbsaxWnBOs9vpHWA+/mNpKiscnJ+VU76QB1TOs
         01qHgrI3slhDJBkUt8AJdvo3rSPUeCfjbiApuHHF+0CAmg7OGu3rYVbXp6xXaqMG1Igd
         ykhSyfiL8KAXEHVVc5Wo2T5W48UrkYBGpUE7A0DtIYAEoLMRW+GW+hs6DlTHwPuXKVz4
         chUkY1cHFIjqIUd3a7ML+FRmAZmupbTe//tcIFFLIsFRnFEkOd5h/esd8IPwiJW+1za3
         RaCCV8eCXcT0C9uItwZ4/uaVAUO9Vmonw2f9zs/GzEx9uhYPbORHCucy/oIzkSGHYgX7
         2AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705631990; x=1706236790;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9T44Rm7mwhwTQAMQjZ9QNy3LBBe5/Z+71V2lDK3Tbg=;
        b=Oof1cQEQhS19i9LIJazUM5xyLsnOci0rY52DDTRaQHqoodR5juDSjLEYmF3ztYHFbC
         4cgwin3HULa9odc5Eq770l4e7FwdQ3ZhtI+cW2Tfcsf06HJKnu0vUs/QzCHyg9bk3gOQ
         9XcYIowBuebU5VpehaBfNMtxB31eyeSuKBc+FGi/66vHRqFOULaS5LrjHPBEkTSQpqHg
         WPN0XfTIYcyTYTzmB9eRLypA68ANpCUuPYc/p00m0ZAhd+Qu227ONKObr6IoxPc1YvX4
         vPnW39ia1AeaCPXv7i6w2GcoYUOoHeUGY9BoXnBCKKFsHqauhubAGGYN4eGY5iAsJss4
         P1yg==
X-Gm-Message-State: AOJu0Yx2cmLwqBUJtZ3LXR95RAvNklvUqUf/Sy4THBNrusxctmXCunGG
	KXQWAtMBN3zBCey2T8MH1V7PxzYWNzQY2f41fTC6F0cfLxO3er+caHwR/ku8NKlh+2VLX/b6g1y
	TtnY=
X-Google-Smtp-Source: AGHT+IFaiUijbdXKcRla7WXaE/RQVeixXLHgzxUFTD//Zsg08NW9HVMx1w2q65aXryrW2Qz2v2Dn6Q==
X-Received: by 2002:a05:6808:30a7:b0:3bd:9fd2:3ba7 with SMTP id bl39-20020a05680830a700b003bd9fd23ba7mr1630540oib.70.1705631989766;
        Thu, 18 Jan 2024 18:39:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m7-20020a62f207000000b006dbbc6ab938sm191962pfh.199.2024.01.18.18.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 18:39:49 -0800 (PST)
Message-ID: <65a9e0f5.620a0220.d594e.16f9@mx.google.com>
Date: Thu, 18 Jan 2024 18:39:49 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-12142-g865a3df089bf
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 74 runs,
 10 regressions (v6.7-12142-g865a3df089bf)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 74 runs, 10 regressions (v6.7-12142-g865a3df08=
9bf)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-12142-g865a3df089bf/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-12142-g865a3df089bf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      865a3df089bf2466078a6c4b444961f6de827c9c =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65a9b01a2968dc74b752a426

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoco=
mm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoco=
mm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a9b01a2968dc74b752a=
427
        failing since 0 day (last pass: v6.7-10328-g7e88b70257d4e, first fa=
il: v6.7-10708-g52db520a0959c) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =


  Details:     https://kernelci.org/test/plan/id/65a9b000d6c839d02c52a410

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a9b000d6c839d02c52a417
        new failure (last pass: v6.7-10708-g52db520a0959c)

    2024-01-18T23:10:26.154657  / # #
    2024-01-18T23:10:26.256808  export SHELL=3D/bin/sh
    2024-01-18T23:10:26.257528  #
    2024-01-18T23:10:26.358636  / # export SHELL=3D/bin/sh. /lava-418427/en=
vironment
    2024-01-18T23:10:26.359391  =

    2024-01-18T23:10:26.460854  / # . /lava-418427/environment/lava-418427/=
bin/lava-test-runner /lava-418427/1
    2024-01-18T23:10:26.462124  =

    2024-01-18T23:10:26.502328  / # /lava-418427/bin/lava-test-runner /lava=
-418427/1
    2024-01-18T23:10:26.569969  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T23:10:26.570398  + cd /lava-418427/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65a9b000d6c839d02c52a41b
        new failure (last pass: v6.7-10708-g52db520a0959c)

    2024-01-18T23:10:28.782808  /lava-418427/1/../bin/lava-test-case
    2024-01-18T23:10:28.810851  <8>[   26.034714] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
a9b000d6c839d02c52a41d
        new failure (last pass: v6.7-10708-g52db520a0959c)

    2024-01-18T23:10:29.871211  /lava-418427/1/../bin/lava-test-case
    2024-01-18T23:10:29.897720  <8>[   27.122560] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a9b000d6c839d02c52a422
        new failure (last pass: v6.7-10708-g52db520a0959c)

    2024-01-18T23:10:31.130372  /lava-418427/1/../bin/lava-test-case
    2024-01-18T23:10:31.157552  <8>[   28.381120] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65a9b000d6c839d02c52a423
        new failure (last pass: v6.7-10708-g52db520a0959c)

    2024-01-18T23:10:32.180282  /lava-418427/1/../bin/lava-test-case
    2024-01-18T23:10:32.206373  <8>[   29.431222] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/65a9b00367d7ee8a6d52a428

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a9b00367d7ee8a6d52a42f
        new failure (last pass: v6.7-10708-g52db520a0959c)

    2024-01-18T23:10:38.640380  #
    2024-01-18T23:10:38.742672  / # #export SHELL=3D/bin/sh
    2024-01-18T23:10:38.742923  =

    2024-01-18T23:10:38.843483  / # export SHELL=3D/bin/sh. /lava-418430/en=
vironment
    2024-01-18T23:10:38.843811  =

    2024-01-18T23:10:38.944438  / # . /lava-418430/environment/lava-418430/=
bin/lava-test-runner /lava-418430/1
    2024-01-18T23:10:38.945558  =

    2024-01-18T23:10:38.986280  / # /lava-418430/bin/lava-test-runner /lava=
-418430/1
    2024-01-18T23:10:39.014587  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T23:10:39.048461  + cd /lava-418430/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a9b00367d7ee8a6d52a442
        new failure (last pass: v6.7-10708-g52db520a0959c)

    2024-01-18T23:10:41.974243  /lava-418430/1/../bin/lava-test-case
    2024-01-18T23:10:42.002449  <8>[   27.070079] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65a9adf0b08c64b5fe52a495

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20=
-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20=
-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a9adf0b08c64b5fe52a49e
        failing since 64 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-18T23:01:44.527755  <8>[   13.903667] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3910680_1.5.2.4.1>
    2024-01-18T23:01:44.635073  / # #
    2024-01-18T23:01:44.737834  export SHELL=3D/bin/sh
    2024-01-18T23:01:44.738636  #
    2024-01-18T23:01:44.840200  / # export SHELL=3D/bin/sh. /lava-3910680/e=
nvironment
    2024-01-18T23:01:44.841164  =

    2024-01-18T23:01:44.942698  / # . /lava-3910680/environment/lava-391068=
0/bin/lava-test-runner /lava-3910680/1
    2024-01-18T23:01:44.944307  =

    2024-01-18T23:01:44.959046  / # /lava-3910680/bin/lava-test-runner /lav=
a-3910680/1
    2024-01-18T23:01:45.084799  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65a9addfdd37e20d4452a46d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-c=
ubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-12142-=
g865a3df089bf/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-c=
ubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a9addfdd37e20d4452a476
        failing since 64 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-18T23:01:32.792782  + set +x
    2024-01-18T23:01:32.794591  [   21.907227] <LAVA_SIGNAL_ENDRUN 0_dmesg =
453561_1.5.2.4.1>
    2024-01-18T23:01:32.903516  / # #
    2024-01-18T23:01:33.005152  export SHELL=3D/bin/sh
    2024-01-18T23:01:33.005712  #
    2024-01-18T23:01:33.106713  / # export SHELL=3D/bin/sh. /lava-453561/en=
vironment
    2024-01-18T23:01:33.107280  =

    2024-01-18T23:01:33.208309  / # . /lava-453561/environment/lava-453561/=
bin/lava-test-runner /lava-453561/1
    2024-01-18T23:01:33.209192  =

    2024-01-18T23:01:33.211828  / # /lava-453561/bin/lava-test-runner /lava=
-453561/1 =

    ... (12 line(s) more)  =

 =20

