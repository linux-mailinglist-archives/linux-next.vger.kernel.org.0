Return-Path: <linux-next+bounces-2338-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1108C7182
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 07:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EADDD1F21DA3
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 05:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D641C695;
	Thu, 16 May 2024 05:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0jnochCU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D68847C
	for <linux-next@vger.kernel.org>; Thu, 16 May 2024 05:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715839119; cv=none; b=iAANsP4n+Dy6e8tJXPjTzIwqCgrqgm08nuwT+i4YHv7wOR2GXxQlA3/UOySyg8uJQuAmg0+C/u+6j2bSsDXEh+Eo6kTU7ZQceFM5tF3eLDX+f13MKvAU+RSvu8Rtt66745uQ58et29vrvwSbe6R4fszPF4D1hmKmJMfKfseDjLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715839119; c=relaxed/simple;
	bh=sq7m6qRMTnHVUH+7Zw4pRxVORuYU2WBX14Ky+PUDQyI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=iTGQL8Heekpcjw95kznWcjGcEmMWz6u22vAFXNzPdVBsGx2Y5u8v2S5ZMJdfQUoaLc/gcme7iRlQS30uJMSSa6rXXFKmoXrWbFBeiL0ZgQPjSV6VTSfJG2xDTNZUpulFKBoXfICXx7rlm12uUabmXtoE7i2MkTTC+c2ZXqQda6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0jnochCU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ed41eb3382so56118145ad.0
        for <linux-next@vger.kernel.org>; Wed, 15 May 2024 22:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715839117; x=1716443917; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g2sLGfGV/ZqYWRts3hIpr1sQViUbTaZR1sv8KoivsG8=;
        b=0jnochCUHidNHqQGExwgEo3wXWRglEj6iJb15HhOCzLyMKrDSOncr0Rp4aTSK9Gqva
         zNqOT+DWn4D0Sc2iFAMrXzrJ5d8YocFQ8JI04FmVjG6wI20J8rk6MqxNSPHCpaGSfygO
         OD/Q6f8kMfJxuPKmXTm0TTev0GwgLN2aVlXTb9zeBi93kglm3QNAIq3rHkVTF2JFPSvg
         ycYM970+9EwJitXY5iRmayO1o3sC0e6Q8x5ymc+PNNbQrabLaTdoDWWaiJvOHHv5Cjtc
         IdODJCnitTzN4VrmcycazU858DXR+JwOp1v9ublTS5Ak3Xvi4L+Tw/y1SEQFk/K0ZWtH
         OPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715839117; x=1716443917;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2sLGfGV/ZqYWRts3hIpr1sQViUbTaZR1sv8KoivsG8=;
        b=EcR53Za9qrW9Ia9gZLc2kmIIuCxtpw0xz1VuPc/Ha6olqUpBfVeUt1Pc/wd3UiLr9P
         B5CSkePr8BYuewlDXca5xZmTX9ruoCv2ayyXyQMsi7HVH2sB5gK2cyDzmPc4LgDkvo/Z
         Z466tjUp0sSkgRRjkiCtXNYIfS6LDmRRgb9kJO05rhXUgsodleCkjO5ApKJEzqrlKGwq
         5qlrV5ortmg8VdZnU8ZdRfOeSaTXYA3qhnorD3CJuMrng7gKtqf2yb+1shR/0wMoFFC+
         UmJaxIdZsy8cmQoz2YuCXmNdkBtKjdaJYdxLR2Io5YUnQE2irhbqOABtS4WbeSQ4h4Ho
         aO4A==
X-Gm-Message-State: AOJu0YxB4/qcgHITcZgZ2Go2qB9NRiqPm1UyNlo2cImzCQ9YAF2jIASC
	QAOrN3IE9fVnQQRNigVtoPuqg8w6bWzPqW0RwR1xHotCUj24fUyg5Q9BsUISSSH9jS1wRdMU/rV
	I/+o=
X-Google-Smtp-Source: AGHT+IG9adL8xq9wnrPJLAe2KHhmwbUtfzbMfW2mY8RJb9nlkV2xs/+flmamCHa5vuIgm4qyPgnUBA==
X-Received: by 2002:a17:902:cec7:b0:1e0:b689:950b with SMTP id d9443c01a7336-1ef43d122c1mr293809385ad.16.1715839116866;
        Wed, 15 May 2024 22:58:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b17sm129570375ad.143.2024.05.15.22.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 22:58:36 -0700 (PDT)
Message-ID: <6645a08c.170a0220.e0ea8.1960@mx.google.com>
Date: Wed, 15 May 2024 22:58:36 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-7443-gb449e3dad2d62
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 74 runs,
 1 regressions (v6.9-7443-gb449e3dad2d62)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 74 runs, 1 regressions (v6.9-7443-gb449e3dad2d=
62)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-7443-gb449e3dad2d62/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-7443-gb449e3dad2d62
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b449e3dad2d62b390466a0f721095585e2646164 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/66456fadd621a04e3e4c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-7443-g=
b449e3dad2d62/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-7443-g=
b449e3dad2d62/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66456fadd621a04e3e4c4=
2e3
        failing since 51 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

