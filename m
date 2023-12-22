Return-Path: <linux-next+bounces-543-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AABD81C51D
	for <lists+linux-next@lfdr.de>; Fri, 22 Dec 2023 07:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22DE42826C5
	for <lists+linux-next@lfdr.de>; Fri, 22 Dec 2023 06:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C2D9447;
	Fri, 22 Dec 2023 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="g4o5l505"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3CA8F5A
	for <linux-next@vger.kernel.org>; Fri, 22 Dec 2023 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d307cf18fdso10679535ad.3
        for <linux-next@vger.kernel.org>; Thu, 21 Dec 2023 22:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703226634; x=1703831434; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O/Kn/nzOjaJwOltb7DEoQxh2NctHKm5zt3ckL2kx28M=;
        b=g4o5l505k2U5AQ4ksM9lKvDCxFJsDylI18zI0JWLAQRijXvWTFUSVnHvPQTyNhk7bX
         mIKZCgDLu0UpLRu9N7GhswYP2VMeWgV0AWoqWfULoc5LlRyk1P9lgg4XKcuL5KNupf7V
         NPCIQSPYsoEbt7CSv7D3p+2r/Zf/bO0UEy+9Sw1S1VWGIiUfibpvCIozd3eLs5onIa2q
         rBegmJdzS4O/gdlSmcMphHMMKaTAGjbvMDuzlmA/jZMFNbhDyuGGnnP7mrqvGADdn4vg
         O8FXXKWE0Y6jiHhwY+Rgx5q/ZM6RWOp3TPs7EZdcNBuJfXB9nmlsXBuK5M0Rlj2keeEd
         m78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703226634; x=1703831434;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/Kn/nzOjaJwOltb7DEoQxh2NctHKm5zt3ckL2kx28M=;
        b=J0+JXI2L5cM9WXbmcZe+omWzvvDVt9P8zyQ6LIfhVEhAOJMWtX2dpzwvM9hgHrOYC8
         JHJlEqKYl8NvCH05/N1cv33git5UkFqQQH5lxAukB2pV2KV+MRMCrfPLt+t8YtdJQAvP
         HimGu8pPDey2nvc4sXPZFCdkux3HeI/6/peUQNOAnSjucWFOX6gwa9X4mMApZi9404ub
         FLXGbmqDWO9bCiAR7TStV7N6V4suS22RDh/oA2/CwHn2r2a43gqnG/kyRqnj9bzngOpb
         34kkICCwwFgDBK2tx96JbeyLbL3qlLyVT1A17kHXrcbmD1Kqpt1Q6/WUGEORIhqTzcsE
         VJmA==
X-Gm-Message-State: AOJu0YynXhmCVA5r7GROSslG86KSaKzZcEiquUXMefSmXP0vv0FQrkZS
	V259cpyzATnqtnwmKeny5hW17vySN0uPqCYPSLjt9wAgql4=
X-Google-Smtp-Source: AGHT+IGz5D8WwgMTsmkIXAHXBVAhEoZ4oFRQiYGL7myMgb69s7Wd8YQqvQ3C5yRHK3sXXvSAZ3gWlA==
X-Received: by 2002:a17:902:e80a:b0:1d4:53b:c90f with SMTP id u10-20020a170902e80a00b001d4053bc90fmr687342plg.114.1703226634618;
        Thu, 21 Dec 2023 22:30:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l2-20020a170903244200b001d0cd9e4248sm2665225pls.196.2023.12.21.22.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 22:30:33 -0800 (PST)
Message-ID: <65852d09.170a0220.dd43f.93c3@mx.google.com>
Date: Thu, 21 Dec 2023 22:30:33 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc6-316-g9711fa59aad96
Subject: next/pending-fixes baseline: 100 runs,
 2 regressions (v6.7-rc6-316-g9711fa59aad96)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 100 runs, 2 regressions (v6.7-rc6-316-g9711fa5=
9aad96)

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
v6.7-rc6-316-g9711fa59aad96/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc6-316-g9711fa59aad96
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9711fa59aad96ae77753ce166c61743206656d83 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6584fb6f34b08fda36e13499

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-31=
6-g9711fa59aad96/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-31=
6-g9711fa59aad96/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6584fb6f34b08fda36e1349e
        failing since 37 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-22T02:58:42.357438  + set +x<8>[   14.210015] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3892664_1.5.2.4.1>
    2023-12-22T02:58:42.357605  =

    2023-12-22T02:58:42.460276  / # #
    2023-12-22T02:58:42.561318  export SHELL=3D/bin/sh
    2023-12-22T02:58:42.561678  #
    2023-12-22T02:58:42.662382  / # export SHELL=3D/bin/sh. /lava-3892664/e=
nvironment
    2023-12-22T02:58:42.662740  =

    2023-12-22T02:58:42.763427  / # . /lava-3892664/environment/lava-389266=
4/bin/lava-test-runner /lava-3892664/1
    2023-12-22T02:58:42.763934  =

    2023-12-22T02:58:42.807985  / # /lava-3892664/bin/lava-test-runner /lav=
a-3892664/1 =

    ... (12 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6584fb6d34b08fda36e1348d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-31=
6-g9711fa59aad96/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-31=
6-g9711fa59aad96/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6584fb6d34b08fda36e13492
        failing since 37 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-22T02:58:30.346783  + set +x
    2023-12-22T02:58:30.348581  [   17.551071] <LAVA_SIGNAL_ENDRUN 0_dmesg =
449407_1.5.2.4.1>
    2023-12-22T02:58:30.457082  / # #
    2023-12-22T02:58:30.558700  export SHELL=3D/bin/sh
    2023-12-22T02:58:30.559232  #
    2023-12-22T02:58:30.660209  / # export SHELL=3D/bin/sh. /lava-449407/en=
vironment
    2023-12-22T02:58:30.660826  =

    2023-12-22T02:58:30.761937  / # . /lava-449407/environment/lava-449407/=
bin/lava-test-runner /lava-449407/1
    2023-12-22T02:58:30.762884  =

    2023-12-22T02:58:30.765239  / # /lava-449407/bin/lava-test-runner /lava=
-449407/1 =

    ... (12 line(s) more)  =

 =20

