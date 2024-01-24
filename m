Return-Path: <linux-next+bounces-819-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B483A3A5
	for <lists+linux-next@lfdr.de>; Wed, 24 Jan 2024 09:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89FCEB21208
	for <lists+linux-next@lfdr.de>; Wed, 24 Jan 2024 08:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B40DF501;
	Wed, 24 Jan 2024 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zuDRLh3v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D53CDDD6
	for <linux-next@vger.kernel.org>; Wed, 24 Jan 2024 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706083234; cv=none; b=FUUaZLvyCl7gZMxoFWsZFcsqacvm/wZIuCusYBc9u5eHnsmJeW5PI0y3iUlpnJ80epTDoa/8zqU6MIT8dcG3kP1zs5kfK+HeuZSk6u5rkG5NcaLs5T4jHI+L+kZbq9EOTPYNIzTxUjW0DLbufjVujfdzRhml4ka8nM/WpTlUsIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706083234; c=relaxed/simple;
	bh=3VM6eZvXaL5YgJ8cZQ5s9hJtRGzRBi2RTINPiXjHqGE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=R5RBH2V4vepbBu10vdCtvzvmezQJCyy5KYSHX1emWwYih7Xx6T2+d4ECXzhFpxrX1mxblLa3tLkUAv11y1Zc7XzrFDa/tFl7DcRrhqrMdBOxVdYEMX8wBj0Ac4APNreQlXaRExPYRepD9cwNYTC1GMC6WQQJbzmeJNn5Te1bUqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zuDRLh3v; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6dd9f9b167bso143490b3a.2
        for <linux-next@vger.kernel.org>; Wed, 24 Jan 2024 00:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706083231; x=1706688031; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xOC7gG4Kym6H2+WQ3JhkMTtMReUJgyHWbbGLQ2z+IYQ=;
        b=zuDRLh3veSIeGEfgj+SwjAwayGm+zC71kwD7ZDijr8EAqFTw3t2BC8lry7oUIhSri5
         e1gJMcmUK63yBkffXIp17NlUGIzMIYczfWKDr4xAY6w/TWKUNxfkZ8w2qHLgAfeOHEPF
         lqen/vY8fZp+8qf3PAN7FdAanaXZsEYIjy17cJVka922PNT3dc9yuwXDbzISPozHa0wt
         a1gO+k3Xu16GccEccHwjrb4j3EUhUC4472MIVrXvoF4QNcFX3/o3oYFLfqO1f8ZLWxuB
         KM+Bgvya9lVjxK/r4HIsYEBMUHXLRuWyQiWqs06AnXpZ3lCkH7LtQrj8VKXzkK/tVM2K
         zHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706083231; x=1706688031;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOC7gG4Kym6H2+WQ3JhkMTtMReUJgyHWbbGLQ2z+IYQ=;
        b=d9+5lPhQL+3DYaf1TCpLvSu/QZp/k6pMD91lHFOPDx2UNQ5Bm249bP+7ouj1ZZ5T6e
         pRR/DmjBmDVCAkquFTQ4M3FgzjOGFEm2OOavctXAAkwBrLL5e5ZvzEjedNAwyhS8U2aQ
         rt0RG3mtfu0d8waakn778xBQNE62MXlT3DNe3RaDbUImXFXdXvIMT4EgaL3CnKQ/Cer9
         b+/+LI0Cfj+BHvHbB5coMZ5HaW/Hu9SU3VqYPmgecZ8CIEqrZz53Z1/yHF3bCwqSe4qo
         cSZDfCOvujeMX50Z6+Ml45oQplnv9RMzfCJxZFzEti0KTHkzxBT+QE7TlS9A7bOsJkLw
         3/Yw==
X-Gm-Message-State: AOJu0Yx2zadBb64ngyT9UAxHvG5TSIaZ33PjV6nEOLsjwjgGb3QvQ4L8
	k/lXIzsdVDysxeC9tc49lHzqma0zJ1ZK7Xsv4e1NrcEAvRB5FGSs/krf1BSFC6XorXLptftuJIf
	kThI=
X-Google-Smtp-Source: AGHT+IHelr+J6/mMlSomck+yeOWjLBeomQN0GyIkS87t4OePOH766ag1im/AZueCMdkKVjqzlPhxiA==
X-Received: by 2002:a05:6a20:7353:b0:19a:4d7f:db07 with SMTP id v19-20020a056a20735300b0019a4d7fdb07mr338952pzc.69.1706083229922;
        Wed, 24 Jan 2024 00:00:29 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id db11-20020a17090ad64b00b002900eeada1asm13110297pjb.43.2024.01.24.00.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 00:00:29 -0800 (PST)
Message-ID: <65b0c39d.170a0220.745d1.e139@mx.google.com>
Date: Wed, 24 Jan 2024 00:00:29 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc1-263-g8184f2e5ae071
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 70 runs,
 10 regressions (v6.8-rc1-263-g8184f2e5ae071)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 70 runs, 10 regressions (v6.8-rc1-263-g8184f2e=
5ae071)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
 | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
 | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc1-263-g8184f2e5ae071/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc1-263-g8184f2e5ae071
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8184f2e5ae07137012d841d20ff8a12f7d00b9a8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
 | 5          =


  Details:     https://kernelci.org/test/plan/id/65b091b8748eb49a5252a3fe

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-26=
3-g8184f2e5ae071/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-26=
3-g8184f2e5ae071/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b091b8748eb49a5252a405
        failing since 5 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-24T04:27:16.022064  / # #
    2024-01-24T04:27:16.124207  export SHELL=3D/bin/sh
    2024-01-24T04:27:16.124961  #
    2024-01-24T04:27:16.226451  / # export SHELL=3D/bin/sh. /lava-421405/en=
vironment
    2024-01-24T04:27:16.227180  =

    2024-01-24T04:27:16.328601  / # . /lava-421405/environment/lava-421405/=
bin/lava-test-runner /lava-421405/1
    2024-01-24T04:27:16.329780  =

    2024-01-24T04:27:16.374393  / # /lava-421405/bin/lava-test-runner /lava=
-421405/1
    2024-01-24T04:27:16.436830  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-24T04:27:16.437260  + cd /lava-421405/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65b091b8748eb49a5252a409
        failing since 5 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-24T04:27:18.650538  /lava-421405/1/../bin/lava-test-case
    2024-01-24T04:27:18.677594  <8>[   26.051516] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
b091b8748eb49a5252a40b
        failing since 5 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-24T04:27:19.737599  /lava-421405/1/../bin/lava-test-case
    2024-01-24T04:27:19.764769  <8>[   27.139285] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b091b8748eb49a5252a410
        failing since 5 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-24T04:27:20.996971  /lava-421405/1/../bin/lava-test-case
    2024-01-24T04:27:21.023807  <8>[   28.398615] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65b091b8748eb49a5252a411
        failing since 5 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-24T04:27:22.046363  /lava-421405/1/../bin/lava-test-case
    2024-01-24T04:27:22.074590  <8>[   29.448634] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
 | 2          =


  Details:     https://kernelci.org/test/plan/id/65b091bc0c789e5aa952a421

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-26=
3-g8184f2e5ae071/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-26=
3-g8184f2e5ae071/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b091bc0c789e5aa952a428
        failing since 5 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-24T04:27:15.416595  / # #
    2024-01-24T04:27:15.518479  export SHELL=3D/bin/sh
    2024-01-24T04:27:15.519191  #
    2024-01-24T04:27:15.620524  / # export SHELL=3D/bin/sh. /lava-421406/en=
vironment
    2024-01-24T04:27:15.621227  =

    2024-01-24T04:27:15.722689  / # . /lava-421406/environment/lava-421406/=
bin/lava-test-runner /lava-421406/1
    2024-01-24T04:27:15.723831  =

    2024-01-24T04:27:15.729316  / # /lava-421406/bin/lava-test-runner /lava=
-421406/1
    2024-01-24T04:27:15.793501  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-24T04:27:15.833323  + cd /lava-421406/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b091bc0c789e5aa952a43b
        failing since 5 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-24T04:27:18.759990  /lava-421406/1/../bin/lava-test-case
    2024-01-24T04:27:18.787148  <8>[   27.103559] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 2          =


  Details:     https://kernelci.org/test/plan/id/65b091f7e9136893cb52a444

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-26=
3-g8184f2e5ae071/arm64/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905=
x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-26=
3-g8184f2e5ae071/arm64/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905=
x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65b091f7e=
9136893cb52a44b
        new failure (last pass: v6.7-13113-gcbba68b0eb609)

    2024-01-24T04:28:34.457441  /lava-500853/1/../bin/lava-test-case
    2024-01-24T04:28:34.519145  <8>[   38.558537] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
b091f7e9136893cb52a44c
        new failure (last pass: v6.7-13113-gcbba68b0eb609)

    2024-01-24T04:28:33.305188  /lava-500853/1/../bin/lava-test-case
    2024-01-24T04:28:33.367243  <8>[   37.406213] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/65b092ba409df5987f52a3fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-26=
3-g8184f2e5ae071/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-26=
3-g8184f2e5ae071/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b092ba409df5987f52a=
3ff
        new failure (last pass: v6.7-13113-gcbba68b0eb609) =

 =20

