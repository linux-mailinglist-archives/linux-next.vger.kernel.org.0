Return-Path: <linux-next+bounces-1792-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1F1897BCB
	for <lists+linux-next@lfdr.de>; Thu,  4 Apr 2024 00:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B9DC1C21E9E
	for <lists+linux-next@lfdr.de>; Wed,  3 Apr 2024 22:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174A61534E6;
	Wed,  3 Apr 2024 22:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="sV2vcs3Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56126139D
	for <linux-next@vger.kernel.org>; Wed,  3 Apr 2024 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712184845; cv=none; b=ovYo0xQCm1sTMtMMk9oqyfIiij5kFNMWabZkARyqEf+oGg36majO2sLHV8hd4+Bw0zg2LugsC6ReLlmbuR+X8Wxy7/nJ4hGiEPawsZZtAGCbf0YalSlwTU9762UfwwLl2wcueCcq94mNxbU3D2trQW4HjDiq6KjOA+YeJEW+0eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712184845; c=relaxed/simple;
	bh=LabOmYDwq4IqYl4CG4sOb/+ZZsgZ48fq/YfR/4U8qjg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=HYWLmK8FbQCsr+Cf7Ob8VO5WSr4RFFqoGf0X6GSv6aizydIYTbQcvSCm4CHeYru0dVaTfuf9+0qdZOgR3RPmVeu3UzgcC+NOHgztiGmGGj8XwZsDGfSLzSXyC83PcGzMDypHkDpPjxk2oF2FS8icGB2OTWu3yXMHNYMvjVC4PFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=sV2vcs3Q; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e0f0398553so2906585ad.3
        for <linux-next@vger.kernel.org>; Wed, 03 Apr 2024 15:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712184842; x=1712789642; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JGmZcu7VIPE4bzIOGcbdI+CG+jBCqTjz8kGeKZ1nAVg=;
        b=sV2vcs3QLC8R+u7Thvm/yGGleda0QALhwsd22A56G41qFBeMKSSqR1MPYEPvX9WSEo
         jMEtGPDyy3EmQUE4QlflvkMOVBVCDhklUoVQqUZ+DhdX3GwHXYJdIUh3d3WiVhuVP7PR
         e35ZdWTVLShNWe6Q5QTClW++h7EE9K7MYcQZoCP5tfcxvO3oykg3GwOTQYxwqze/lk9s
         fodY9Pdx7Ybsv8Tr9q5lum2pa3RaSdH+6aykB8u2SyXR4jZjWo9Fun0J1pb2P1JroWIO
         2Q3N6tb4sbt5+ojapvMcWN3LeClzU3Rl2J/8SLRX2cdA6XZvA6adwZyGQyY+2BvAPb8Y
         JYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712184842; x=1712789642;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGmZcu7VIPE4bzIOGcbdI+CG+jBCqTjz8kGeKZ1nAVg=;
        b=UVNJdwrOfY7404nu0jPFFBPfUI1k9t51g20HJgCt+nOo3eylGq7jrHYLUzOS4R8Z1X
         FwOYY2ox8FTFm+iawY07TGu2iF6n3bFwDRYWsmMwZ07h0jOikE/FonyRe6dC2/AGFgV8
         YjmOXIZUliSEtaZmjItDg76BeGXPPWgkPgrGtCaaVJrqFKkwQnKJx85KnFQ4ZphzdgyL
         d56NWuRQJ+FQuulGOQgNT1cNeEMNff9SGsBjABfkNIlxh2sLkTM/qP1qpYNPn6UkPVUv
         Y7csViCZBwbLEXOIzZirp1p2QhBJIpvsu7ZLXPvTyDizX1j1PxDEoAUUV06NNBayyBAr
         S2PQ==
X-Gm-Message-State: AOJu0YwmB/IqRWbSlniUR7j3WMUv8xVTOz79knt68Df1RLbEzsPK5Ue8
	UpKx/iirxUMrZoVpZDvdse1F4/V7TVXkunnxjbNmsHJVxWgId957H3WC9vQkYAZ3LLQQLWRzSi6
	Lr6g=
X-Google-Smtp-Source: AGHT+IHkTEsc2Tc6KC3O5jL/fxVQ5dL+2HrZ985wzikYB/KE+Kzvu+baj3GPf5WF9HrWW6XZoKWIag==
X-Received: by 2002:a17:902:d508:b0:1e0:ace7:2955 with SMTP id b8-20020a170902d50800b001e0ace72955mr809728plg.67.1712184842228;
        Wed, 03 Apr 2024 15:54:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jc6-20020a17090325c600b001defa712890sm3187471plb.72.2024.04.03.15.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 15:54:01 -0700 (PDT)
Message-ID: <660dde09.170a0220.1c388.bf49@mx.google.com>
Date: Wed, 03 Apr 2024 15:54:01 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc2-290-g5a8e64cdf8869
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 83 runs,
 1 regressions (v6.9-rc2-290-g5a8e64cdf8869)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 83 runs, 1 regressions (v6.9-rc2-290-g5a8e64cd=
f8869)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc2-290-g5a8e64cdf8869/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc2-290-g5a8e64cdf8869
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5a8e64cdf886935b487d4eb868983d95d5bd5a8c =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/660dab69c87e68ee714c42da

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc2-29=
0-g5a8e64cdf8869/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc2-29=
0-g5a8e64cdf8869/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/660dab69c87e68ee=
714c42df
        new failure (last pass: v6.9-rc1-83-g2c54eea3a68ea)
        1 lines

    2024-04-03T19:17:42.852424  / # =

    2024-04-03T19:17:42.861357  =

    2024-04-03T19:17:42.967041  / # #
    2024-04-03T19:17:42.973178  #
    2024-04-03T19:17:43.090911  / # export SHELL=3D/bin/sh
    2024-04-03T19:17:43.101159  export SHELL=3D/bin/sh
    2024-04-03T19:17:43.203047  / # . /lava-1115582/environment
    2024-04-03T19:17:43.212999  . /lava-1115582/environment
    2024-04-03T19:17:43.314937  / # /lava-1115582/bin/lava-test-runner /lav=
a-1115582/0
    2024-04-03T19:17:43.324880  /lava-1115582/bin/lava-test-runner /lava-11=
15582/0 =

    ... (9 line(s) more)  =

 =20

