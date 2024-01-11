Return-Path: <linux-next+bounces-723-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1181582A6E7
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 05:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D9CF28BD81
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 04:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0201C16;
	Thu, 11 Jan 2024 04:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="VwSlWyZo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1951856
	for <linux-next@vger.kernel.org>; Thu, 11 Jan 2024 04:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5988e377264so1074551eaf.3
        for <linux-next@vger.kernel.org>; Wed, 10 Jan 2024 20:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704946253; x=1705551053; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fXD3tq5AnV0SOtwIQ5r4eO7aAh9i48kacp06hp0q40Q=;
        b=VwSlWyZoQxxO+LphfbSPF/CjQCTNlvFn257IPRt0KwnMMm8Z+fXUVrFaPjeauIpsbZ
         ye5Ur4+unVBpvDuqpiR3W9KTEODBF8fmyktDsA3qa1UgdKsFuuOCAghzMm0YjSAoIVpZ
         IuZH1Dn33Sp7ndJHDFSs1PzmcwUP2rHoJVgh66D7JxDKHbR1MGUkPUqyrYSZ0Qpemis0
         l1nn5OV0a95kDb+eQuwFwio9HfsIaC0Aq/ybnPsvAKsj/VEJ2S3ZQ40XsJsWaiutl2MT
         O//kw7SdORUZWfCqvltaKFILKLrPJt/w5n8IE7Ehz2iQd9P8avpGHP5VdNwyzF6seWHR
         rH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704946253; x=1705551053;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXD3tq5AnV0SOtwIQ5r4eO7aAh9i48kacp06hp0q40Q=;
        b=pJf5edq9B7lzu+LqMIgM01bHhqrIhtjSSCTG6/Qp80gqyUA6joxfcqiIZJC/JPFseV
         S5w8HhMhu1//Rjk6NOWtvsgP1yyWuy2TWy97nLD9BrBhINyNyL8iB4nb6dpgAk+uSHpa
         ZpkN3uz3O92wQmhZWaIm+VQ6utNvGpZjJs+1kAMkFDj+EzQPqOumV5m0KRzEcQadu4RE
         KEptrtIk4XPBtA0dUn8UmJWUaxlW48ax2AAYncUMek3xAmTBo7C/5A4WgTY/oFNhwEuo
         qhuGRFjWA4xGNwveUmdf+UzT4zHzSL7WxLv3pFABObvlEWTKsrn8R3v+eIlu5kVMW0mV
         T/4A==
X-Gm-Message-State: AOJu0YzHLOzJDeNWKVfCkGIRxl0upmK/ELpUWHDAoekLXtM1RkzCo2U4
	8XAL8hVaCMRWHCymml4YScfBnhY1wzZ77ruGazIELPKyFVlq0w==
X-Google-Smtp-Source: AGHT+IEp5upgFf6PxAenZjnG7+WQyZlehNjC2981jklAr9J/0MVEaFsC3/xt78a8UmAf7WQPLdvfUQ==
X-Received: by 2002:a05:6359:4114:b0:170:d73f:d25f with SMTP id kh20-20020a056359411400b00170d73fd25fmr741482rwc.37.1704946252913;
        Wed, 10 Jan 2024 20:10:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id sm9-20020a17090b2e4900b0028bad9b220fsm187452pjb.37.2024.01.10.20.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 20:10:52 -0800 (PST)
Message-ID: <659f6a4c.170a0220.8ad06.0806@mx.google.com>
Date: Wed, 10 Jan 2024 20:10:52 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-2936-g357881a4f22f3
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 71 runs,
 1 regressions (v6.7-2936-g357881a4f22f3)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 71 runs, 1 regressions (v6.7-2936-g357881a4f22=
f3)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-2936-g357881a4f22f3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-2936-g357881a4f22f3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      357881a4f22f3e32964503b0d30af6b084b4ffb1 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/659f3a2faf3546efe152a3f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-2936-g=
357881a4f22f3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-librete=
ch-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-2936-g=
357881a4f22f3/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-librete=
ch-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f3a2faf3546efe152a=
3f7
        new failure (last pass: v6.7-1609-g22841eabe9226) =

 =20

