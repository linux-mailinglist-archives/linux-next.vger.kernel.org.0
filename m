Return-Path: <linux-next+bounces-2527-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1232904C47
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 09:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DBE0B20CE0
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 07:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14B113CF89;
	Wed, 12 Jun 2024 07:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wC2YBjRt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C020612D1FE
	for <linux-next@vger.kernel.org>; Wed, 12 Jun 2024 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718175810; cv=none; b=lqD8fzCHPYoCvlfm/PnlGrrvETrUO0mG6eqIazZ3IXaxawcOtlTA3+F16y7bxoZ0cgQ7NVwSdQTv9JmjBMxxrnEfxxPP4r3Xn3El74YsVMjy79p5wRopMpGMKzL27GQflMe6WZc8l/Dvz1r+/DT8dfgCxKjRavKZUMZDd3jNgfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718175810; c=relaxed/simple;
	bh=9BcBDdfTaBm9dWK7kx6u8ts1pzSQ0SxP182YmEi0ESQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=GgIWlONgHujnpDAYkq2q1PLryGZwKMFedfBTp8z7NqL4R6/KFEfgZps2G2X6uwJWc2i1m5uTJqvpCu1S2MXox1hwF4R3ykuS4yVr6vBsWL1qA8SN7tV2tVYwNTfN3OvUNnD0P0n5ueA6MgsU5ejBez01xx7IP2VobcgzbOv2t5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wC2YBjRt; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-705c0115192so170743b3a.1
        for <linux-next@vger.kernel.org>; Wed, 12 Jun 2024 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718175807; x=1718780607; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oJF+y/L9bpKU3nPS5wQvatr/n11lAl9+4fI9r7DdRqk=;
        b=wC2YBjRtwnbhUpF/+zmADXtvOTNfU+U7AHb6tyydFLAYn634F5wdM4QeLPyoW3qa/Z
         O4YlrgDIanj0t/rxbdi8Hwh9v2BHQi/tkAirntYupeuE0BFbZfnFHGAoWbCjVdGu5zJ1
         vlNKe3VE7pkQY4w0uebcEMuvrMaLQ+UScQzArdHjYjiuYIa+e1CiETen654LZKuAQoYI
         vuFyQkwIz9ejI/gfUVvqHf72dHAe/MzAMWZazddcN0WFqLyidKAcBV28MrRF+dJCH8B3
         H58VnHRxXNthTV5K/Nzqiw4l2NrFIFXupbtaKv2uQq4h0e4N0nsyyn85F+VpqcGm5+Om
         NDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718175807; x=1718780607;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJF+y/L9bpKU3nPS5wQvatr/n11lAl9+4fI9r7DdRqk=;
        b=Yv/GLXy34/ltKCnTNpyiw9zrgGPITYnrOQksRZIcPO3aNpi2bkYfd6fpDTXiFn8n4k
         HbPX3hhbCyWBPjPvy7EQ8npHFILSBJKfey211g64lWzwixTCM8YeUv63LxzS1wAuxU30
         eQaBBn/8SM3SuJUbU2/5zEJcDpixCfebwh0A/+uFlQB1wQO30x7VQ+iqQIIGSTh1X9wK
         x6fnAspa2P3S7wStZkvu670NtNF+2QTZwf+YGATeu5LSYwR0tgfiWMvch2GpkWmqjFw6
         jXY1rkfZBDUO8vV1apiysIrqL+b8TZpLXvqr0sLwf96AoA7C5Rw1k+rVzHGg7bR1vP65
         sFxg==
X-Gm-Message-State: AOJu0YwYZZKEdL8sD7NxMK4ys8P37odRM+esG3tjUlHllUudJ8isbvb5
	Oq4VlCzH046DAHalBQ0FEKd+mir3M47KAC9F61NmqOKBwlO0nWQElM5pw1ISKnW0BLNK7XO4kWD
	JJuY=
X-Google-Smtp-Source: AGHT+IFN14JPL5PnaHi2d5gA/AfbghMFL77MBObGitNj/kkwfpWTl1vdmrUQ6Z/jYImoqLFBlZRsHg==
X-Received: by 2002:a05:6a20:3406:b0:1b7:edc9:be56 with SMTP id adf61e73a8af0-1b8a9c76182mr1017655637.40.1718175807426;
        Wed, 12 Jun 2024 00:03:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70421e6453csm7101043b3a.205.2024.06.12.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 00:03:26 -0700 (PDT)
Message-ID: <6669483e.050a0220.a57fd.5201@mx.google.com>
Date: Wed, 12 Jun 2024 00:03:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc3-263-g47cf82b3e437
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 82 runs,
 1 regressions (v6.10-rc3-263-g47cf82b3e437)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 82 runs, 1 regressions (v6.10-rc3-263-g47cf82b=
3e437)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc3-263-g47cf82b3e437/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc3-263-g47cf82b3e437
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      47cf82b3e4374db3bcf580c2e635dd826cda835b =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/666915799a61b252397e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc3-2=
63-g47cf82b3e437/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc3-2=
63-g47cf82b3e437/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666915799a61b252397e7=
06e
        failing since 78 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

