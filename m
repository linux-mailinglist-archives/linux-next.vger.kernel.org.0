Return-Path: <linux-next+bounces-689-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE5D827E9A
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 07:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 260671C235F3
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 06:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E3FAD54;
	Tue,  9 Jan 2024 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="hkD6XVFp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C2915A7
	for <linux-next@vger.kernel.org>; Tue,  9 Jan 2024 06:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso1931511a12.3
        for <linux-next@vger.kernel.org>; Mon, 08 Jan 2024 22:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704780090; x=1705384890; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1eP6FTzP8RZ+0faE24D4Z/XbcNDwnWJkv8lb9YlXRNY=;
        b=hkD6XVFp45qzNvbuMKThkGIPhr/GHsdZMFsWMi6y8X53BoRScoZyRcZuulTUE/BBHm
         wQRj0nA+MA4ATGI2Jw6NCyy5E1sI2aINUF7aofU9tmFyWOqCdMXhWjCGWpuD0kzc3omO
         TUGtV5iqoBHPPBXtezHNrFffq0KnlvqlvU1o/Qavh4KMhsknQeqHRQP21aLzUAP7mc7N
         plGyksgtxDI2WBy1crJEyf7I6vPW8/jsmIOyH56ulN1fheF4Xhnosr6jGj4LV2MN38gG
         jDZP/or/rGpg6fCn4x2chuwxRLA0/DikWfcjovXspePdLMJivD0pjEjZtL6eMAA+jOE4
         B8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704780090; x=1705384890;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eP6FTzP8RZ+0faE24D4Z/XbcNDwnWJkv8lb9YlXRNY=;
        b=lOrmwn9ttWX1ImSEpEJPh8LczEUEVBjYSPPENNKq48K7irG/uZ0+grizyP1WgtwKZj
         7Ghfn2ImDnsl7sA0r8na5ohW4ZDn00pCrgMIcchZqVBwPmAMhBAsIHhZRFdcAlQDAhRf
         YeNnVWZpplkpJS/FfsgBUv5kKqV6v6fqrypsTPqchgfy/n64r86w8hHM34MdriIAlwRM
         uCLRRDMxbHOx8pDoR/zANOZqsNrNJa/UKk0Nd5ftDxO4OGSMgNhqyZ8MaRm5fGI9eOvw
         pOHSPjNk4tDch9QKUU4eFffrct5wMQzDiMDePauG8zb3TKhIGuirEep9XotLJXAwTpBz
         t1QA==
X-Gm-Message-State: AOJu0YwlG1z83xmYpb0YSP1+fwGSLAz18U4FJT/CWdQLE2K3VqGX1k/P
	JNbyNJ3ho41Osra5gSlIc62yySZA5lGfCn/zMlKYd78hwzU=
X-Google-Smtp-Source: AGHT+IFDfvrGYn6qwljXFyEZ1A2eOAlWYn1ufZdqoSPU+kPf32XgnwD5eoW5NsLGhXL8+8h9DOpXuw==
X-Received: by 2002:a05:6a20:dd97:b0:199:e17e:bf49 with SMTP id kw23-20020a056a20dd9700b00199e17ebf49mr1087789pzb.47.1704780089805;
        Mon, 08 Jan 2024 22:01:29 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v1-20020aa78501000000b006db07575334sm820224pfn.59.2024.01.08.22.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 22:01:29 -0800 (PST)
Message-ID: <659ce139.a70a0220.9b1f7.4640@mx.google.com>
Date: Mon, 08 Jan 2024 22:01:29 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-530-g1593fdc6832f
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 42 runs,
 2 regressions (v6.7-530-g1593fdc6832f)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 42 runs, 2 regressions (v6.7-530-g1593fdc6832f)

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
v6.7-530-g1593fdc6832f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-530-g1593fdc6832f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1593fdc6832f58f66843e2abb40b21ccd65f12ad =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/659cb06525ffd5eba852a488

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-530-g1=
593fdc6832f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-530-g1=
593fdc6832f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659cb06525ffd5eba852a491
        failing since 55 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-09T02:32:50.271107  + set +x<8>[   14.129732] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3904767_1.5.2.4.1>
    2024-01-09T02:32:50.271228  =

    2024-01-09T02:32:50.375027  / # #
    2024-01-09T02:32:50.478063  export SHELL=3D/bin/sh
    2024-01-09T02:32:50.479115  #
    2024-01-09T02:32:50.580942  / # export SHELL=3D/bin/sh. /lava-3904767/e=
nvironment
    2024-01-09T02:32:50.582156  =

    2024-01-09T02:32:50.684273  / # . /lava-3904767/environment/lava-390476=
7/bin/lava-test-runner /lava-3904767/1
    2024-01-09T02:32:50.685912  =

    2024-01-09T02:32:50.704878  / # /lava-3904767/bin/lava-test-runner /lav=
a-3904767/1 =

    ... (11 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/659cb070d01a66246a52a3ff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-530-g1=
593fdc6832f/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-530-g1=
593fdc6832f/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659cb070d01a66246a52a408
        failing since 55 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-09T02:32:57.974107  + set +x[   21.198490] <LAVA_SIGNAL_ENDRUN =
0_dmesg 451562_1.5.2.4.1>
    2024-01-09T02:32:57.974419  =

    2024-01-09T02:32:58.084951  / # #
    2024-01-09T02:32:58.186660  export SHELL=3D/bin/sh
    2024-01-09T02:32:58.187248  #
    2024-01-09T02:32:58.288218  / # export SHELL=3D/bin/sh. /lava-451562/en=
vironment
    2024-01-09T02:32:58.288762  =

    2024-01-09T02:32:58.389754  / # . /lava-451562/environment/lava-451562/=
bin/lava-test-runner /lava-451562/1
    2024-01-09T02:32:58.390560  =

    2024-01-09T02:32:58.393499  / # /lava-451562/bin/lava-test-runner /lava=
-451562/1 =

    ... (12 line(s) more)  =

 =20

