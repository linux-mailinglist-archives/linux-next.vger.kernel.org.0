Return-Path: <linux-next+bounces-1676-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E154C881079
	for <lists+linux-next@lfdr.de>; Wed, 20 Mar 2024 12:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C4C01F2363B
	for <lists+linux-next@lfdr.de>; Wed, 20 Mar 2024 11:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B280C3B799;
	Wed, 20 Mar 2024 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="eE23vHHH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAD13B1B2
	for <linux-next@vger.kernel.org>; Wed, 20 Mar 2024 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710932966; cv=none; b=P6wf67QRYsA27dmFDvmvkcizGWW+kNnDEjs1vHDNH654fy1hkogIlivgAOGNef+cE8KX4skz4YQEswWGnNbiStLaNFpAdzVC373pVelI9c6/FqVlLLFQ38FH/N2zUFBgH3OFo0TBaOuwyYzLjCR0CF/BSDRxNf47cWtFSVOhedE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710932966; c=relaxed/simple;
	bh=fuo2fGXD7K6A3AJHe+CtfDbkgCWAVgzRqGKxroyZ4ik=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=IFzFmtRBR2jBiWBDTyD4kJ96KB3L7vgc9hMPIS4NWajt6EMW1D4HUnU8tJVjlWmiHA48syOvJAOYfIrQ8DEXvEX+PtTlPaRhap0FHdcSc5hYTYh9MCFWqnrXeKFG7B2rsNZWfYbQx0S79OLqkPi4625CRz1nP1TVX3DSD25eGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=eE23vHHH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e709e0c123so3339293b3a.1
        for <linux-next@vger.kernel.org>; Wed, 20 Mar 2024 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710932963; x=1711537763; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YbSPG0xv98kkg3QVNFfZIfTUBkXaQH/Eu/5SjK42MXA=;
        b=eE23vHHHv6Qk8SAerzvlnxrpRlkfbaLeYjk15qVPbiyixjRofrDRnxG/W6sDcltddo
         oFRjwufgDZir+/dvUXcnchUqniZ9rQL0KcNxMSS1x7Kg9TjU6bmov5fDRkxq5Eizoo21
         F+I4Rw3J6s/0YzGfYLjlIpZY2bSNe05oXdk+bW50Wo8scMjMxelEDo9w7eMB9yu25ALo
         PJ7r3UzlmPGWJZZfcE1EE6NkxlVtL8I4VMxT0Y2gDEaJW//cPB4kKvrMkoOO7TJ+wvvl
         xDoSEz9TCDmCEMzoWGpzZL17DKbd75rDZ8YQJzIZxqGhlkZpgwPWcQHBc1aRUUNyK+Bq
         smUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710932963; x=1711537763;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbSPG0xv98kkg3QVNFfZIfTUBkXaQH/Eu/5SjK42MXA=;
        b=e+QcM5cX66BWH59OnR++jM/Og1TqCyFeI140RypNGlcjvG2MOyzyqT3LSB5U27hJw1
         AIXK9eDoQu0j2aBs86jDH2QONpN7LX52n0hfNL2DdgYrQoNMYRFVh1pBojlJ3++XuI7w
         JDPQF0nY+pr3Cw9zRDgmeyxEKzuOGm0XchAoi94xrBF1fGxgm3lVn5tyzBDuEbJiFRJF
         1YB3GBVMKI9OZOrAIwCA5nYcZBsegqFGV7q9uOVGoXEq8PKa4YSM0xoWFCfWXEAPb02K
         MfQQt0BGRt5468Swb3hTyJpHfbJTWiGzjvqa4bwuCg9l8jrRU18cfRmbC90pVsW0rEPH
         mrcQ==
X-Gm-Message-State: AOJu0YzwBQc1KFnim72I+SLL2x/Z9KtCWZzVyJzShjSkEuIee4UBj1OL
	P+0uqo5C/VRYP0rJzQliSQrgZeblZfm/1rybD04EPbNVFCtV/KmD24BaMRVGIk6dURKGEcyOTQA
	pmm0=
X-Google-Smtp-Source: AGHT+IFhgZ5GcS0VuhiKbtyv1qaOFDUZlR9wm/EUF4sEZBlRI/6x+SmyPSIOKn2Kfee4089Um2UbNw==
X-Received: by 2002:a05:6a20:c294:b0:1a3:62d1:2906 with SMTP id bs20-20020a056a20c29400b001a362d12906mr4751159pzb.14.1710932963087;
        Wed, 20 Mar 2024 04:09:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id eu16-20020a17090af95000b00299101c1341sm1309195pjb.18.2024.03.20.04.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 04:09:22 -0700 (PDT)
Message-ID: <65fac3e2.170a0220.32bf8.28c4@mx.google.com>
Date: Wed, 20 Mar 2024 04:09:22 -0700 (PDT)
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
X-Kernelci-Kernel: v6.8-11840-gad58b0c356a01
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 53 runs,
 7 regressions (v6.8-11840-gad58b0c356a01)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 53 runs, 7 regressions (v6.8-11840-gad58b0c356=
a01)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-11840-gad58b0c356a01/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-11840-gad58b0c356a01
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ad58b0c356a015c7b302d1416f6dc0521ed6f2a7 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65fa9308ffec83c8ba4c435e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-11840-=
gad58b0c356a01/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-11840-=
gad58b0c356a01/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fa9308ffec83c8ba4c4365
        failing since 61 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-20T07:40:36.355193  / #
    2024-03-20T07:40:36.457038  # #export SHELL=3D/bin/sh
    2024-03-20T07:40:36.457693  =

    2024-03-20T07:40:36.559195  / # export SHELL=3D/bin/sh. /lava-444913/en=
vironment
    2024-03-20T07:40:36.559921  =

    2024-03-20T07:40:36.661343  / # . /lava-444913/environment/lava-444913/=
bin/lava-test-runner /lava-444913/1
    2024-03-20T07:40:36.662567  =

    2024-03-20T07:40:36.668420  / # /lava-444913/bin/lava-test-runner /lava=
-444913/1
    2024-03-20T07:40:36.725738  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-20T07:40:36.726216  + <8>[   20.861478] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 444913_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65fa9308ffec83c8ba4c4369
        failing since 61 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-20T07:40:38.834926  /lava-444913/1/../bin/lava-test-case
    2024-03-20T07:40:38.835349  <8>[   22.971317] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-20T07:40:38.835658  /lava-444913/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
fa9308ffec83c8ba4c436b
        failing since 61 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-20T07:40:39.897803  /lava-444913/1/../bin/lava-test-case
    2024-03-20T07:40:39.898342  <8>[   24.010824] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-20T07:40:39.898636  /lava-444913/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fa9308ffec83c8ba4c4370
        failing since 61 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-20T07:40:40.975414  /lava-444913/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65fa9308ffec83c8ba4c4371
        failing since 61 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-20T07:40:40.977643  <8>[   25.129352] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-20T07:40:42.033986  /lava-444913/1/../bin/lava-test-case
    2024-03-20T07:40:42.034468  <8>[   26.151514] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-20T07:40:42.034770  /lava-444913/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65fa9307ffec83c8ba4c42f7

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-11840-=
gad58b0c356a01/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-11840-=
gad58b0c356a01/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fa9307ffec83c8ba4c42fe
        failing since 61 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-20T07:40:44.592291  / # #
    2024-03-20T07:40:44.694364  export SHELL=3D/bin/sh
    2024-03-20T07:40:44.695074  #
    2024-03-20T07:40:44.796219  / # export SHELL=3D/bin/sh. /lava-444912/en=
vironment
    2024-03-20T07:40:44.796625  =

    2024-03-20T07:40:44.897329  / # . /lava-444912/environment/lava-444912/=
bin/lava-test-runner /lava-444912/1
    2024-03-20T07:40:44.897916  =

    2024-03-20T07:40:44.938035  / # /lava-444912/bin/lava-test-runner /lava=
-444912/1
    2024-03-20T07:40:44.971417  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-20T07:40:44.971598  + <8>[   21.130000] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 444912_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fa9307ffec83c8ba4c4311
        failing since 61 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-20T07:40:47.411506  /lava-444912/1/../bin/lava-test-case
    2024-03-20T07:40:47.411982  <8>[   23.561824] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-20T07:40:47.412343  /lava-444912/1/../bin/lava-test-case   =

 =20

