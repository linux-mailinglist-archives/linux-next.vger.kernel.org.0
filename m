Return-Path: <linux-next+bounces-3087-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096DC93752E
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 10:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4A31C21625
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 08:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20206F2F0;
	Fri, 19 Jul 2024 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YLrIn/Cp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD2269959
	for <linux-next@vger.kernel.org>; Fri, 19 Jul 2024 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721378519; cv=none; b=mhc1mWyFtkgro+c8Uanve+fA7KJsElJIJt59q/qfHVluVgNVppN+Wj8x9ZnqCxnMen3u9JpMzgWWs9arLHHwdGdyDWP9mLhp5pFVtbLD/OoRM/y62ZVkUgraaq0eKS2KWE8bwloBXWVE+jQAPBxCqSy4eegRYa3+UUCemBMXygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721378519; c=relaxed/simple;
	bh=oHC+B869zZ7VzBPxmK7N2ecHJl4FfWh/o0tajl/8+vs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Xvyj9pFeAUBAf7AfLDjafC2BwCgs3bNTT0rxcLNwr61VAW8SlJTVtGkX1r0udj2ItSV/P0fylgSzPQ1WZHlPyOQq5GYtCHl6r3wkRAyypoSHtvYJ6vheN7zIESVo3H6rEOnxm2Pt6Zimxn0GG+R0rSCqMj/XTcNjEuZkoTTAkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YLrIn/Cp; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70b07bdbfbcso518451b3a.0
        for <linux-next@vger.kernel.org>; Fri, 19 Jul 2024 01:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721378516; x=1721983316; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X9ez7snc77i65JFz5C4I9XapuznxatZNkyUnHG29Fpk=;
        b=YLrIn/CpVl5bzzQX6IbS4L/lATLluq2kmYHeP1dvjRheowQ5b0cH9BO10oJWCN9JXV
         qqiEDZYJOwpf7GDQE6263GTySbebgPF0myKhcSU+Xd6KS9lMrl7c9x8odpyJY5pHXTs6
         MuGS1puk8RjTqO1oqw77VnHFVsNSgebSaa7/sFusyx8R6TGbeL66JdyzeWD8feNvWdig
         ZzBZwiyrBsQPC3dTi/c3dtS5e0tXQM46rl10RuwNSdq6DPTjvgxY8h6H/++5U9Df5Qq8
         atu+Fc1YCp+5GNMiEWhNBTRoFKA8QMDoC8wxSxvt85UGQvvPMPfFSwCrYsaHNErNTvcP
         zWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378516; x=1721983316;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9ez7snc77i65JFz5C4I9XapuznxatZNkyUnHG29Fpk=;
        b=M8c8BqLRV0qWAdeHzNOCI9Digew4Fqp/8MpT8kZHkN01Z5IbosqF8ZXflfEXRa56y4
         fsAMh0uTSX5UKXBdcMU7/y1/RKsVelY7Rc6un4g62fWw5ZbhG/280mywcJj67l7OuEN2
         WoDfgwHrMOux60PlOHoOIzKyr8j5iRiVN97m7dgKCJEk0pb1aR+Zd/n70tghfcFwrLkI
         Y9ughEE0gZfph54hr8D15eqANA9kuMkEWz696RvYKyLB0tdox7haFu+QraqH35ikuKbS
         V+IS0k/4y6xyvpZ4z0AxYvjh+Hs8DbBY3Z679uqVXqBLDUmkVCO6dXMGV3hMPE8b9C/h
         2Uiw==
X-Gm-Message-State: AOJu0YymbLEQK/tozTVbyCILizUMk30ldlFnyQagtJTCzFIq/ROY2nVw
	MM8tOUxraN4KSM+xwf5qk5QLVcFH651tSYnoFmteMpdn2UpgDSIIHkuxdjZR5Ec+DqJ8Bd26R1U
	F
X-Google-Smtp-Source: AGHT+IH9/zlidwfBrXwMg7VOJtInBRn81ekIFY2RnCZD9E6+iugii6xKzYZX6N8n+xKKx/0vo8DoCw==
X-Received: by 2002:a05:6a20:4311:b0:1c0:e1a5:9588 with SMTP id adf61e73a8af0-1c4077ba1c7mr8264280637.2.1721378516424;
        Fri, 19 Jul 2024 01:41:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff61c823sm736308b3a.213.2024.07.19.01.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:41:55 -0700 (PDT)
Message-ID: <669a26d3.050a0220.556e9.18ba@mx.google.com>
Date: Fri, 19 Jul 2024 01:41:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-9372-g89ee05b11178f
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 67 runs,
 1 regressions (v6.10-9372-g89ee05b11178f)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 67 runs, 1 regressions (v6.10-9372-g89ee05b111=
78f)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-9372-g89ee05b11178f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-9372-g89ee05b11178f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      89ee05b11178f39215e7c3f911cce4591e69995b =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6699fa1c520a0852f57e706f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-9372-=
g89ee05b11178f/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-9372-=
g89ee05b11178f/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6699fa1c520a0852=
f57e7074
        new failure (last pass: v6.10-5512-gf66a2ffad56a9)
        1 lines

    2024-07-19T05:30:51.313856  / # =

    2024-07-19T05:30:51.322636  =

    2024-07-19T05:30:51.427647  / # #
    2024-07-19T05:30:51.434532  #
    2024-07-19T05:30:51.578824  / # export SHELL=3D/bin/sh
    2024-07-19T05:30:51.594350  export SHELL=3D/bin/sh
    2024-07-19T05:30:51.696195  / # . /lava-1169247/environment
    2024-07-19T05:30:51.706328  . /lava-1169247/environment
    2024-07-19T05:30:51.808171  / # /lava-1169247/bin/lava-test-runner /lav=
a-1169247/0
    2024-07-19T05:30:51.818105  /lava-1169247/bin/lava-test-runner /lava-11=
69247/0 =

    ... (9 line(s) more)  =

 =20

