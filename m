Return-Path: <linux-next+bounces-376-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E81810A30
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 07:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5811F21278
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 06:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E65F9DA;
	Wed, 13 Dec 2023 06:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xMJmZERJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056369A
	for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 22:21:04 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d32c5ce32eso19101485ad.0
        for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 22:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702448463; x=1703053263; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oV1ij0Ev/NRh7AYsWUwT7WGaAjl4ibD2iIVV6+y5ZsU=;
        b=xMJmZERJuYl2bEvz00B2L0kpxDStfgpLcAj6P8sr3f4EPIexrTtA69dW+0uEoa26oH
         VsiLd495bFMViM4vn3lOMG8L1EBBMNphC1lEbXmRPwyVEjan71Pgmg+6N8EHXlwwSzrb
         V+OuQ8BX9bpqdDXuivb9LsZUmEbJLyzJMSxRXHe4E5S/SvNw1datMIdY89TOwOKntLcI
         1L7nJ5JN8iQnSrzAiYY0KIibHVW/bJ2aqfp3KlWcKJUQn2KOfAgSVHl3hiVn/D/IkqtT
         sXKRpEeP012zm4PUFWNO9R73ZHDbZ0wWOktS/glGkE0V64KG4FHw9+plVv+hCKUut2FY
         jWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702448463; x=1703053263;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oV1ij0Ev/NRh7AYsWUwT7WGaAjl4ibD2iIVV6+y5ZsU=;
        b=bJsTC9g9wFd1UX70LvbVB5Z0plCJ1JCMsBx0f4Up+exdmFE8TdrUuZlbD8VfXX9Kge
         Ja9ZKWtcWQ/qTDGi9pca+K/yFEKInEvO1zd3v8N40xdRJYvM7iB2jhYOmcdOF8+l3Bwi
         /VM25XvhXbzAMg9JFEIj82WjS9Pmtp1uPRY66RG+axhyqS1/WYhnrKLKs6NZnIary6FE
         SzanPAJFAg6fbSyaEsL4v3lSdJOLn08OZERG5iHaOmpbfkmz6ioxyidMh/sFgAsniUa6
         gqSp3zYInB6DecPv1UtzjWfDAdCIOppR5M2lfacGQLCVEfxXIi88SLprZwDDgELKOglP
         K79w==
X-Gm-Message-State: AOJu0YxFTmFfwBvpBdVnP+TkBe/nrhoPn+NW4u+xsx3+o8NYwvblCufw
	N7nyCuvv4rVEQyBV8u0Op2fPYFakbSuvVpTItGzzjQ==
X-Google-Smtp-Source: AGHT+IFZAPx7mpudJ1L2RRFa0TOBhu4JLfEYPHvkQvEhbqZYEnI6NV0fhFkfjxUcMNyFTTCC0ungWw==
X-Received: by 2002:a17:902:b40a:b0:1d0:6ffd:6103 with SMTP id x10-20020a170902b40a00b001d06ffd6103mr6882704plr.37.1702448463051;
        Tue, 12 Dec 2023 22:21:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j3-20020a170902c08300b001cfc68125desm9688003pld.203.2023.12.12.22.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:21:02 -0800 (PST)
Message-ID: <65794d4e.170a0220.48f6a.e59f@mx.google.com>
Date: Tue, 12 Dec 2023 22:21:02 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc5-246-g91523d2e24e55
Subject: next/pending-fixes baseline: 105 runs,
 1 regressions (v6.7-rc5-246-g91523d2e24e55)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 105 runs, 1 regressions (v6.7-rc5-246-g91523d2=
e24e55)

Regressions Summary
-------------------

platform | arch | lab          | compiler | defconfig          | regressions
---------+------+--------------+----------+--------------------+------------
panda    | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc5-246-g91523d2e24e55/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc5-246-g91523d2e24e55
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      91523d2e24e55ae76d35f6920af9711f1091772f =



Test Regressions
---------------- =



platform | arch | lab          | compiler | defconfig          | regressions
---------+------+--------------+----------+--------------------+------------
panda    | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65791be4c50b641d2fe134ce

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-24=
6-g91523d2e24e55/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc5-24=
6-g91523d2e24e55/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65791be4c50b641d2fe134d7
        failing since 6 days (last pass: v6.0-12387-ge54e01f1826aa, first f=
ail: v6.7-rc4-354-g2e06d594f8593)

    2023-12-13T02:49:47.171076  <8>[   14.024688] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3877468_1.5.2.4.1>
    2023-12-13T02:49:47.277679  / # #
    2023-12-13T02:49:47.378729  export SHELL=3D/bin/sh
    2023-12-13T02:49:47.379050  #
    2023-12-13T02:49:47.479793  / # export SHELL=3D/bin/sh. /lava-3877468/e=
nvironment
    2023-12-13T02:49:47.480137  =

    2023-12-13T02:49:47.580885  / # . /lava-3877468/environment/lava-387746=
8/bin/lava-test-runner /lava-3877468/1
    2023-12-13T02:49:47.581413  =

    2023-12-13T02:49:47.586541  / # /lava-3877468/bin/lava-test-runner /lav=
a-3877468/1
    2023-12-13T02:49:47.651520  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =20

