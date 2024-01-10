Return-Path: <linux-next+bounces-710-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B0F82965A
	for <lists+linux-next@lfdr.de>; Wed, 10 Jan 2024 10:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1689D286F63
	for <lists+linux-next@lfdr.de>; Wed, 10 Jan 2024 09:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A5B3E49F;
	Wed, 10 Jan 2024 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EuderK3W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC479374FD
	for <linux-next@vger.kernel.org>; Wed, 10 Jan 2024 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bba50cd318so4078731b6e.0
        for <linux-next@vger.kernel.org>; Wed, 10 Jan 2024 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704879386; x=1705484186; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qv/ouOO+g86YVJeWGzsi0Eii7uvPVIqlOXQVwI5sgqA=;
        b=EuderK3WciFJI5feKWBldOFOGC7iPcYt9ovizF5F0N7G3QGypeitTmP11Y6rjMrL/j
         G5CskyXh2IOIBl+qlmLrSl3kkEWfOuymQEVzIPGcAIXBuRhTPJXyk/P4bYK4gNnnfnTd
         krVgMwCtZOw6QBwsy5ZzqtNqobD1t+sJJtuRItxvcPJwN5rKeunPugFOqYBmjGGuyZfV
         gMon19RZELJmL6hQTNLEi4d/p3DaYOBVgzakhswH78MCP0WnTs7DtybQMD7KwjxfDtSL
         fizHYVGjH3NkaAbzflHDkK02ba6TiKnb2qzpxvD4rDk2gs9NM3cBabJiBKrterydg60v
         CFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704879386; x=1705484186;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qv/ouOO+g86YVJeWGzsi0Eii7uvPVIqlOXQVwI5sgqA=;
        b=MesVL2fURpGss37vyIG+reOtz7oiUyugwaQkpzCm18dVLAx2+gucEsoCd+3lTFTNPr
         7MYU3Rdcyfg9OWYslHnisF8n9dFDrhavy18XeQFRAUmV6qItpBDkOj6Omjd0gnOZo1y8
         6CgoRXehY6EMZoFMfIlwM4d5jLL04OEfh7w6bH1BXpmnv/V1w0lpuONklIQHUr7JJ6cB
         pg7HBsFXwWs6QyymcZ/CL4Ymg1hdyYzNlh5Zhd9zp1YYgnTEve9qsOOEXJyeiCjCx3q4
         /Y6Gf21EiAfUdIz8JOnXbV8QOaviCVMEq992qoXbolcgg5PXdPjvvd8BYWsGh+uExxQM
         ZmGQ==
X-Gm-Message-State: AOJu0YwdUw3MMveQsKDg+19yCxgqOn+lcqo/vXyz3Ucmiir7SjQM3s3Q
	4LZoACkHwEzbNhC9Y4skmsKZlxis1dR2HYCqvaHkLO5JB3k=
X-Google-Smtp-Source: AGHT+IGnf2DZ7ASwx458XGjNzIT4rVkradnACR2C8u2mkA1Qwy9KKwZiAnS7SiLeljld2do9BPTxrw==
X-Received: by 2002:a05:6808:199e:b0:3bb:821b:4b56 with SMTP id bj30-20020a056808199e00b003bb821b4b56mr1189351oib.2.1704879386420;
        Wed, 10 Jan 2024 01:36:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e8-20020a056a0000c800b006d9ecb8e956sm3172268pfj.173.2024.01.10.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 01:36:25 -0800 (PST)
Message-ID: <659e6519.050a0220.83d82.d201@mx.google.com>
Date: Wed, 10 Jan 2024 01:36:25 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-1609-g22841eabe9226
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 74 runs,
 2 regressions (v6.7-1609-g22841eabe9226)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 74 runs, 2 regressions (v6.7-1609-g22841eabe92=
26)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-1609-g22841eabe9226/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-1609-g22841eabe9226
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      22841eabe92265eb1fd24ba860ce5d9042ceda5b =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/659e32560067abcf7052a3f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-1609-g=
22841eabe9226/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20=
-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-1609-g=
22841eabe9226/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20=
-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e32560067abcf7052a3fb
        failing since 56 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-10T05:59:24.947802  / # #
    2024-01-10T05:59:25.050804  export SHELL=3D/bin/sh
    2024-01-10T05:59:25.052073  #
    2024-01-10T05:59:25.154241  / # export SHELL=3D/bin/sh. /lava-3905286/e=
nvironment
    2024-01-10T05:59:25.155449  =

    2024-01-10T05:59:25.257480  / # . /lava-3905286/environment/lava-390528=
6/bin/lava-test-runner /lava-3905286/1
    2024-01-10T05:59:25.259064  =

    2024-01-10T05:59:25.270170  / # /lava-3905286/bin/lava-test-runner /lav=
a-3905286/1
    2024-01-10T05:59:25.396990  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-10T05:59:25.398155  + cd /lava-3905286/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/659e3256acc546e5e952a3f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-1609-g=
22841eabe9226/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-c=
ubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-1609-g=
22841eabe9226/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-c=
ubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e3256acc546e5e952a3fb
        failing since 56 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-10T05:59:27.986589  + set +x[   22.185294] <LAVA_SIGNAL_ENDRUN =
0_dmesg 451666_1.5.2.4.1>
    2024-01-10T05:59:27.986911  =

    2024-01-10T05:59:28.095160  / # #
    2024-01-10T05:59:28.196675  export SHELL=3D/bin/sh
    2024-01-10T05:59:28.197205  #
    2024-01-10T05:59:28.298170  / # export SHELL=3D/bin/sh. /lava-451666/en=
vironment
    2024-01-10T05:59:28.298673  =

    2024-01-10T05:59:28.399656  / # . /lava-451666/environment/lava-451666/=
bin/lava-test-runner /lava-451666/1
    2024-01-10T05:59:28.400507  =

    2024-01-10T05:59:28.405289  / # /lava-451666/bin/lava-test-runner /lava=
-451666/1 =

    ... (12 line(s) more)  =

 =20

