Return-Path: <linux-next+bounces-2685-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1429198D8
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 22:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 548A4282FCD
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 20:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A583218FDA0;
	Wed, 26 Jun 2024 20:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1w8swe6B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE97C19149F
	for <linux-next@vger.kernel.org>; Wed, 26 Jun 2024 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719433007; cv=none; b=MwxaWtd0y72PsLn+rSR5X6m/zuCTAd0FHbCUV71TCbfAJFFD89/8ffkz/aVYfRqQjTss/w8NyD1fS8T5bkH8NTsNCNFPoxfRK26b5v9I65Cz8xwH0JZs1i4Iw1pznHiQG4LUd6C/vnIBoC+G2hICCFw0KzNcq9gj1HOrNIxy+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719433007; c=relaxed/simple;
	bh=+yZKK2ZDLXl9id0WiMg8wP6RHuRYC1hNTZ8pcDq4PxQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=q6CTPIdAQcxMEWWa+G9bxRy2+tzPSUQ9nb26Pr0vhNddRBvQLt2ePoiM7tOuoDhvJuKFu4BWbkJHHn1W2eFR5rts3KzkNKGA7/xLaMnLuEVwpfleszKei0DDxyJBK6tbMFv7nS0NPvfqcuzMwhqJvVCIURAvIhrX+LY9GvRILlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1w8swe6B; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-706a4a04891so1243027b3a.3
        for <linux-next@vger.kernel.org>; Wed, 26 Jun 2024 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719433004; x=1720037804; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yf3B4tI+UNEBvK5CF119+uVggw9zrvw98VvVnLPizw8=;
        b=1w8swe6BQWBHj45YBrclxFlw/6XUWGTqjSLBYfoyMbMxKVTGwkY/U1B0bmE7s3vPxr
         cvJNQhzElMKUAtailuPSFEy4NJ9vkbTx4XbmAUHJBbLeF0IJ4nGRDd3p+ahuhzGQsCvl
         6IlWtjJSaQW4HaX0D7cYbiwLJdvk/g+fWNPClnF053YFuQmbb317XWzFvoNe+oBxtsat
         uFq2l8+Yd7DhjMSZN015T8z2qXJ+NqE9JIYbmbBqUPIn7E/R2yi33FN19juUQ37X//3N
         tyaOIo7Q59YKnaNwnk6K36HnsbE1ScuC+wyrywjK+Zo+HHCAl/M0sU1z5oj/kgvncQMg
         Jo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719433004; x=1720037804;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf3B4tI+UNEBvK5CF119+uVggw9zrvw98VvVnLPizw8=;
        b=XNfX9xlmAHgwSnGwv8tZsJ67k4AeetpPm/NPZSo+LvBiqtlPKwgtsBTa4HiPPioxZa
         GGHprKFOIoXQC75SzpEKTb7DAYOn3/lKXmNhXw+fzjiQ1wHHAuhsYGRbTv+ILEF5+Z4R
         62I6P/s0jNEJ83S6FObTbuqRcSzrGtHRrrvGkQkLpalg45YffDKLF3DseVi4iExx8YwR
         0jrtdlzMd3KIvPD2l6jA9McSK48xLDJhfS0ai9Vm9R/DhcygDzqhdJ9zp/p11E15MSGU
         8QEa0nN3NK6fVCBL9WpdEVXiNIfU1/oGEWLS/uohfAIW//tGQLitlg/HOkrhjXf34M0/
         eKBA==
X-Gm-Message-State: AOJu0YwO3Yk4NfL2UGNInSbqrp10mAa4LeeEWAtVYLauLF9JTfXNUatQ
	V6ovmxu4lCT5MIyCM5WFFfkauLNCAgh6ttb5yemQIYznw7oZMHxeLQocdLdwqZR/MIiAA603+ge
	9
X-Google-Smtp-Source: AGHT+IETdeMWOccbZqNBNz3bnFU/Ry2mzmpWEh+Y5sTVwKDa1VIdi2VAhbObNc+1fpc9fvEPg18g8w==
X-Received: by 2002:a05:6a00:89:b0:705:c860:13c with SMTP id d2e1a72fcca58-7067105f4dbmr10212822b3a.34.1719433004362;
        Wed, 26 Jun 2024 13:16:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70678827659sm6904938b3a.7.2024.06.26.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 13:16:43 -0700 (PDT)
Message-ID: <667c772b.050a0220.848dc.4a69@mx.google.com>
Date: Wed, 26 Jun 2024 13:16:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc5-290-g7c636c256db1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 77 runs,
 1 regressions (v6.10-rc5-290-g7c636c256db1)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 77 runs, 1 regressions (v6.10-rc5-290-g7c636c2=
56db1)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc5-290-g7c636c256db1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc5-290-g7c636c256db1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7c636c256db1ec9afd69b731e0a777980d14f346 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/667c467db80fc73adf7e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-2=
90-g7c636c256db1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-2=
90-g7c636c256db1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667c467db80fc73adf7e7=
076
        failing since 8 days (last pass: v6.3-10703-gb3f869e79cdf0, first f=
ail: v6.10-rc4-262-g1ce98b2c2d5b0) =

 =20

