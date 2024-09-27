Return-Path: <linux-next+bounces-3991-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20232988058
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 10:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEAB31F21F4C
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 08:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A9F18787B;
	Fri, 27 Sep 2024 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Bnse9Y4x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5566DEEAA
	for <linux-next@vger.kernel.org>; Fri, 27 Sep 2024 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426126; cv=none; b=j9BuZJ6fbliYXfpGmZa+qANaYrceHLWelt/TksD0rTzxYv9ezwTjjRw2FzymrqHACC4I/HPIHwgHTCfBnEhTjFh1OQam5xS6Ascb738LUWC/+h5nYLkUXJRUu1HMjDfOOSlydbVsVm+sok0tdl6O8f5E27zB/aFzpm872BL1USE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426126; c=relaxed/simple;
	bh=jZqKcVcrCLDfNQbAuWpLnywWcdi/DONumwAHjvHWMZk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=WQyOHED+A11IqCMhjjar9Qp5TfBOTm3rDgIqZD5hndIRneNtMgaVspU4absXF1KsFrJdQlUowXLj8m4fVJzMkXH79iypfzD8epyO+w5g81umGtuSJl7ai9AvLyGtB+cYCZxEx5NirrGLs9RxzHKz8cPZBypWW3sSi8+RDdp23yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Bnse9Y4x; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e077a4b8c0so1383384a91.1
        for <linux-next@vger.kernel.org>; Fri, 27 Sep 2024 01:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727426123; x=1728030923; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0rka+OisTcadiqPNucDzDPCP2rNJAAE/+t8Vt8swHb0=;
        b=Bnse9Y4x2FO2nY+/AGXk0KvugpOOKi8hHBGU6Vu/+7H9UmXYZUH1n6h1MISZn8P85v
         hp0llISY/sYCC8boXX2mVgMD4bFUKom2HRRfafG0/avESwzzNGGG8awhHMSeUyxADbK6
         KQ6usYLx3rGTY3wH4HAFHhiEHei/uX4NjmLft7BVp0R3wlNdP1liM02/CUqyWot1Fp/K
         eLwkcYF9tLSJ6DytJa5ggJH1D53NVOnfmoHF71k3yEdHD93HGqr0UMUfidqvj19+kPwR
         FvphxNLZ5g95M68nnHn1K0tmZVIEctQDFbctTTXulSYkUj8b3Kgu5VWERe3n0H40LjNj
         KXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727426123; x=1728030923;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rka+OisTcadiqPNucDzDPCP2rNJAAE/+t8Vt8swHb0=;
        b=cEhY+0C3nd5qSGtLr3hEP+WQvjfSzdVDR+UEag/2E4Z5X5XgKKRy/GI43gd/nuRrQu
         OmT28+SaZqOI+Z0xMpuWujhf513SaEPeANypfleXsEIuxk3efHMTpcK1AzB0OLysZVSp
         jELpBgMPCwxDSDloCPeuuiuP1/TKXiE0KZTMxfzGAW+zHQ4UEn38DzfGFbAOPfed+oNi
         5OpQIb4P+nFrIotjyTTnmoR8LNOTYLZiExb8NJY2AnRPNCJe3aQO3lWI31TggHHMt2Wt
         BpevHzuO903hFYTLDP0P6qUdPLx3O4CkpgdgG2NP/5N4OoBiGxb6p5pVKIc9YqIhKSDO
         EKmw==
X-Gm-Message-State: AOJu0YyMjMosZn7gjYaSZ7N8lMEEywKhvpP7wDVYCKTSs4gKr13ykj7+
	eRICfPxRBGJedTO2BoQOY41i14raqnXsrebvSCQkKkY8r0AxE9q1bMLXUhc2Ru2QskKqyCpia/d
	N
X-Google-Smtp-Source: AGHT+IFu2eX2Wqm5KNmClYI1iRJ2ncmyaV4qgk3bA5bJ6GfuvnDYQ2zWb09mqow/2FWpz6J6gPDXCw==
X-Received: by 2002:a17:90a:b304:b0:2dd:4f70:1654 with SMTP id 98e67ed59e1d1-2e0b7125de9mr4445910a91.2.1727426123323;
        Fri, 27 Sep 2024 01:35:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e16d6d2sm5034472a91.2.2024.09.27.01.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 01:35:22 -0700 (PDT)
Message-ID: <66f66e4a.170a0220.21258a.3a4b@mx.google.com>
Date: Fri, 27 Sep 2024 01:35:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.11-11659-g7f18fcc2665e
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 34 runs,
 1 regressions (v6.11-11659-g7f18fcc2665e)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 34 runs, 1 regressions (v6.11-11659-g7f18fcc26=
65e)

Regressions Summary
-------------------

platform                    | arch | lab         | compiler | defconfig    =
      | regressions
----------------------------+------+-------------+----------+--------------=
------+------------
stm32mp157a-dhcor-avenger96 | arm  | lab-broonie | gcc-12   | multi_v7_defc=
onfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.11-11659-g7f18fcc2665e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.11-11659-g7f18fcc2665e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7f18fcc2665e513c5b0b672958ae64bab25a62e1 =



Test Regressions
---------------- =



platform                    | arch | lab         | compiler | defconfig    =
      | regressions
----------------------------+------+-------------+----------+--------------=
------+------------
stm32mp157a-dhcor-avenger96 | arm  | lab-broonie | gcc-12   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/66f63d85e27b30ed98c86883

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.11-11659=
-g7f18fcc2665e/arm/multi_v7_defconfig/gcc-12/lab-broonie/baseline-stm32mp15=
7a-dhcor-avenger96.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.11-11659=
-g7f18fcc2665e/arm/multi_v7_defconfig/gcc-12/lab-broonie/baseline-stm32mp15=
7a-dhcor-avenger96.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f63d85e27b30ed98c86=
884
        new failure (last pass: v6.11-10795-gc678f7c87b9b) =

 =20

