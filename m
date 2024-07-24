Return-Path: <linux-next+bounces-3119-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF91093ACFA
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 09:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AF95283AFA
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 07:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8579F1BC4B;
	Wed, 24 Jul 2024 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RAGOYMFR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07684C84
	for <linux-next@vger.kernel.org>; Wed, 24 Jul 2024 07:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721804945; cv=none; b=BqQFKiI4T/GKmnLB7XXjRwbSXTV/kgY+qQoxw41eG0fFqcvn0n2BTYUJhtRPHiFFeipUXC3dThQySjy0ToboB/6K3Tkv9zWbZjIJw1e2nmjSqHt6mkFaZtiLpsIfS6IGBjhmr6n5XLhSePj44J8wooIGC2UvwyJMj8V+7NDVrVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721804945; c=relaxed/simple;
	bh=Er/rg8rSxWsDaFvK9QgXhu/HitElimPePKw+PyoMCpI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=XUdiblVAfnbSZywQxgQ7J/5ekHfXJwRxU3rWa17J4xHWdWFzwfC4QR9cTjFbq8Ubq6Keks5zKwOtmbTfc4anXQ2gAhlh7Rx/lOl9NnGooej1gR6pfTofhpmsJDqFYwZj+dLs+1fHdExUhKIw95nCwSyfBEnxmhBpYrCxPHrIjoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=RAGOYMFR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c9e37bdd6fso3754976a91.3
        for <linux-next@vger.kernel.org>; Wed, 24 Jul 2024 00:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721804942; x=1722409742; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7w7O6La5DNo0J+vEj4k4QoudfttbcLCT+TbC2To+ACY=;
        b=RAGOYMFRhyPIvL698YkKwB9mgQW9wP/FT477PD/LtQM2efnTFaosCq9EOgJx80yycW
         2LDceQfcrFI1UgVx5TJjyP4qva/W5gzzLth2Y+dlJIrFqE/2LFYySv2hkZ9SuNPLTaqh
         YpTDoVE83gNNhSqCvt427tpjouNTDk9xMeZHC/9+PEAUI/QZkQ8UHi3hPwa9MW7mApmH
         81a9KuQa/7UlOuerntpgu7ZNzcxkn3NwdNavm8VmZFqfpAamfv29ze1or4WHmKKwTMU8
         K9h4irJNNoFjZcRUlsfT68VeMkbH7LUlhYA/tUhU4VvOL5KQTnS0WzugFj7yZIOVTj/f
         W24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721804942; x=1722409742;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7w7O6La5DNo0J+vEj4k4QoudfttbcLCT+TbC2To+ACY=;
        b=eU/Q4v3IAdBojrCjq7Ur6cy+PM+qiVwtWqZi+xmEuYeKCxZHPsykRVXRfTmkqExUSI
         ZUlj7uOyT4G7QocgXOzno3cjCVgb+FW7iUnBRBuxLlD9o4l7pXKUiytuJlA/MxqeaCDJ
         wO2YB1QexQK5XM14G+QatKKC2mjhkIPO9UsBqG8oa/x2qZ++04HRExiGwR72n5mJPJO3
         VMFA22L2axRujg2pNh2u2X8AoKNKHO++XbNvGEN8yQdg0aVgUL4qPWomhnwpw2jjIC76
         HsgvPXB6B4veXSDV2ht1xmsnQ+EEqP5MqwFsULkSJ0W6J69wWQS8YVvVRbOaShryMLS6
         A0nA==
X-Gm-Message-State: AOJu0Yys6bDsmCZFQiDpqueFr9wp622liWMJme30KQPBT6QBzkyXSY2K
	AFZ9/Gp2/ahC7kWZFPUCSqHwaF/jBVntlqZ1SxovakN3RNmbM51IGIqz3aUjkeStV3YTioDxnlH
	k
X-Google-Smtp-Source: AGHT+IHGRkvTBcKsIe9FdpWBHw0B5Hmc9CHt28UQIUATGlmaWPRNAFUmgmuBvXyHmcQVfkaOV7WzKw==
X-Received: by 2002:a17:90a:a00b:b0:2ca:a625:f9e9 with SMTP id 98e67ed59e1d1-2cd274d06b8mr10705241a91.42.1721804941432;
        Wed, 24 Jul 2024 00:09:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73d9b7asm843752a91.22.2024.07.24.00.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 00:09:01 -0700 (PDT)
Message-ID: <66a0a88d.170a0220.30a3bc.21bf@mx.google.com>
Date: Wed, 24 Jul 2024 00:09:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-12301-gabc7217b467c
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 40 runs,
 1 regressions (v6.10-12301-gabc7217b467c)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 40 runs, 1 regressions (v6.10-12301-gabc7217b4=
67c)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-12301-gabc7217b467c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-12301-gabc7217b467c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      abc7217b467c17ee95fa4c7d329da71992030320 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66a09b6bbfb4b7b3477e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-12301=
-gabc7217b467c/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-12301=
-gabc7217b467c/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66a09b6bbfb4b7b3=
477e7072
        new failure (last pass: v6.10-11430-g1694c7db3651)
        1 lines

    2024-07-24T06:12:43.972794  / # =

    2024-07-24T06:12:43.981742  =

    2024-07-24T06:12:44.086920  / # #
    2024-07-24T06:12:44.093698  #
    2024-07-24T06:12:44.211531  / # export SHELL=3D/bin/sh
    2024-07-24T06:12:44.221692  export SHELL=3D/bin/sh
    2024-07-24T06:12:44.323527  / # . /lava-1171947/environment
    2024-07-24T06:12:44.332612  . /lava-1171947/environment
    2024-07-24T06:12:44.434426  / # /lava-1171947/bin/lava-test-runner /lav=
a-1171947/0
    2024-07-24T06:12:44.445477  /lava-1171947/bin/lava-test-runner /lava-11=
71947/0 =

    ... (9 line(s) more)  =

 =20

