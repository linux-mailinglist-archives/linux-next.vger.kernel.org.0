Return-Path: <linux-next+bounces-1682-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A6B881BF5
	for <lists+linux-next@lfdr.de>; Thu, 21 Mar 2024 05:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5E5E1F22684
	for <lists+linux-next@lfdr.de>; Thu, 21 Mar 2024 04:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A494224C6;
	Thu, 21 Mar 2024 04:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nAXwKJ7C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F112B12E49
	for <linux-next@vger.kernel.org>; Thu, 21 Mar 2024 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710995590; cv=none; b=UBJ9Fcp/+qPwJ7Vy/zvt5evQasS3D8n6g2G/Q1fcsNFtV3k/sImle32rqCKLDNXzT+5TsX9BMZ7NSFFHIakTd4qP4tiajtDJCppFBwlpPmPvqU30YjU8Cd6jJ76I+0254SkOo5jZKyVV7OEY+cxNT6vGMjuKk/M5eJyUguudkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710995590; c=relaxed/simple;
	bh=zGq/5xznsOJG2fm5UCePpRn0LMovteaeh8Az3aySsy0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=RHAB8jnWhQglax4K7K4R2Tps2g6r5fh3rkKKHuj4r+VzUyJg3/uMn2NkGCV9DPFd72X2jNvQjSdAyvrfzb5QYZa5Xk9lgs1ptX8DEQa9fiRs/csWaJHY+LSa4pvV3VCeaI5NN6TaBr7D540/pCshWIitoCZEwqO3xa8M5Jlj0jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nAXwKJ7C; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e0679b1562so4674275ad.0
        for <linux-next@vger.kernel.org>; Wed, 20 Mar 2024 21:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710995587; x=1711600387; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ldUEw7JhXwe/Zajlcb1h8OZBfg7TbX1ZRqxe/F/9VtM=;
        b=nAXwKJ7C4bwFz7VDdbwQu78b3XmU/dYefS+g8jX9AzydWU/i7NU9I2GakT1WvLmAcl
         8sIUQdUQA0SNljjBH7V0hipGK6AaZKUKNpvcyHWcWMQdMyW08Q1EGn7CNGgi5xcPusOc
         0w3Cb4UNzaM5z8ncKcXIb32f0FQ9lvZuUGRATTTLxG8uDlyj9Fw2nAC4VAgdUOfoLNFx
         HLFTqAnXVKUXIyOywao0cTYCSOfhtWbT8gwATk+8nJUVDr3907XxEbMztDacJuI9mIXl
         qzLVvjd+vW9+1gM1e1Q74kKK6BiNj7GEQpEJigRaiCfznbtgC15c+TTSwhXJZs6nmsdK
         oeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710995587; x=1711600387;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldUEw7JhXwe/Zajlcb1h8OZBfg7TbX1ZRqxe/F/9VtM=;
        b=ULCfnbnP/gmtqVy5k7T2adxJxVF2SfntXE0H+3VHCx5ODQ5FLK1/LiofgxTkTPnK7w
         4q1dQnMPBl8bYPyyf8hg/48Wjl0vN8Z49ocXrXsd0y5Hb8UJcQYb9b9kDKKHXfLHjGxW
         oFkx4YRBEmxvYCfvnpUIp6By5VZXDlVhKQ+JxCxD0lbAUGF0RCxtRtfEdztnEaAKmFqi
         T986dIoMQGlBqfmt1cu/4GmgyqGw3hABd5MW0seGfs78N1PLJHrWyEPogM2DbYsAOsXt
         FaWkBHS0ifm+VjHNp4ZERD0zsuTEWtww+u5yb0TTne96i1Pf2jo1k/e/kWpUEUAre1u7
         i7WA==
X-Gm-Message-State: AOJu0YyqkZAozr09xS99hMyW7pe/FhOnISlphLXvFI3+Pux7+zH9ioWy
	BRMPICD3u2X1Sz5IT39QJQ3XHcuHF2JsRPzpn98jp3WhcmUAVUrqQ/CftzNhHFwoN25PxtXNsia
	+K/w=
X-Google-Smtp-Source: AGHT+IHSRMWXaa7yKFMByy7C8dI/E6sJIGG0cvMq4Sjadcj+lQdcXbLf1oaktXtnIbO19//jjaB3/w==
X-Received: by 2002:a17:902:e543:b0:1e0:27c8:5c7e with SMTP id n3-20020a170902e54300b001e027c85c7emr1371426plf.25.1710995586846;
        Wed, 20 Mar 2024 21:33:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902dacd00b001db616fa11dsm14545365plx.238.2024.03.20.21.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 21:33:06 -0700 (PDT)
Message-ID: <65fbb882.170a0220.c7fdb.cca1@mx.google.com>
Date: Wed, 20 Mar 2024 21:33:06 -0700 (PDT)
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
X-Kernelci-Kernel: v6.8-11890-ga2180774a30be
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 54 runs,
 8 regressions (v6.8-11890-ga2180774a30be)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 54 runs, 8 regressions (v6.8-11890-ga2180774a3=
0be)

Regressions Summary
-------------------

platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
kontron-kbox-a-230-ls  | arm64 | lab-kontron  | gcc-10   | defconfig | 5   =
       =

kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-10   | defconfig | 2   =
       =

meson-gxl-s905d-p230   | arm64 | lab-baylibre | gcc-10   | defconfig | 1   =
       =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-11890-ga2180774a30be/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-11890-ga2180774a30be
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a2180774a30be91d9891a6c44cd8406f339f5337 =



Test Regressions
---------------- =



platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
kontron-kbox-a-230-ls  | arm64 | lab-kontron  | gcc-10   | defconfig | 5   =
       =


  Details:     https://kernelci.org/test/plan/id/65fb879147f1c84bec4c42dd

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-11890-=
ga2180774a30be/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-11890-=
ga2180774a30be/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fb879147f1c84bec4c42e4
        failing since 62 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-21T01:03:54.588857  / # #
    2024-03-21T01:03:54.689802  export SHELL=3D/bin/sh
    2024-03-21T01:03:54.690220  #
    2024-03-21T01:03:54.791211  / # export SHELL=3D/bin/sh. /lava-445425/en=
vironment
    2024-03-21T01:03:54.791843  =

    2024-03-21T01:03:54.893302  / # . /lava-445425/environment/lava-445425/=
bin/lava-test-runner /lava-445425/1
    2024-03-21T01:03:54.894466  =

    2024-03-21T01:03:54.903612  / # /lava-445425/bin/lava-test-runner /lava=
-445425/1
    2024-03-21T01:03:54.959819  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-21T01:03:54.960241  + <8>[   20.579422] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 445425_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65fb879147f1c84bec4c42e8
        failing since 62 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-21T01:03:57.064046  /lava-445425/1/../bin/lava-test-case
    2024-03-21T01:03:57.064480  <8>[   22.687230] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-21T01:03:57.064792  /lava-445425/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
fb879147f1c84bec4c42ea
        failing since 62 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-21T01:03:58.125754  /lava-445425/1/../bin/lava-test-case
    2024-03-21T01:03:58.126341  <8>[   23.726115] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fb879147f1c84bec4c42ef
        failing since 62 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-21T01:03:59.203875  /lava-445425/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65fb879147f1c84bec4c42f0
        failing since 62 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-21T01:03:59.207125  <8>[   24.843789] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-21T01:04:00.267929  /lava-445425/1/../bin/lava-test-case
    2024-03-21T01:04:00.268423  <8>[   25.865478] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-21T01:04:00.268709  /lava-445425/1/../bin/lava-test-case   =

 =



platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-10   | defconfig | 2   =
       =


  Details:     https://kernelci.org/test/plan/id/65fb8794b18e7ee0374c42dd

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-11890-=
ga2180774a30be/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-11890-=
ga2180774a30be/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fb8794b18e7ee0374c42e4
        failing since 62 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-21T01:03:56.674442  / # #
    2024-03-21T01:03:56.776461  export SHELL=3D/bin/sh
    2024-03-21T01:03:56.777141  #
    2024-03-21T01:03:56.878647  / # export SHELL=3D/bin/sh. /lava-445426/en=
vironment
    2024-03-21T01:03:56.879326  =

    2024-03-21T01:03:56.980857  / # . /lava-445426/environment/lava-445426/=
bin/lava-test-runner /lava-445426/1
    2024-03-21T01:03:56.982014  =

    2024-03-21T01:03:56.988675  / # /lava-445426/bin/lava-test-runner /lava=
-445426/1
    2024-03-21T01:03:57.055625  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-21T01:03:57.056036  + <8>[   20.907259] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 445426_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fb8794b18e7ee0374c42f7
        failing since 62 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-21T01:03:58.433964  <8>[   22.311236] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-03-21T01:03:59.492390  /lava-445426/1/../bin/lava-test-case
    2024-03-21T01:03:59.492819  <8>[   23.335458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-21T01:03:59.493116  /lava-445426/1/../bin/lava-test-case   =

 =



platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
meson-gxl-s905d-p230   | arm64 | lab-baylibre | gcc-10   | defconfig | 1   =
       =


  Details:     https://kernelci.org/test/plan/id/65fb89665e440f78494c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-11890-=
ga2180774a30be/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d=
-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-11890-=
ga2180774a30be/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d=
-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fb89665e440f78494c4=
2dc
        new failure (last pass: v6.8-11840-gad58b0c356a01) =

 =20

