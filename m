Return-Path: <linux-next+bounces-2496-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A43188FFE2D
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 10:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCBA31C2246C
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 08:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CBC15B0E1;
	Fri,  7 Jun 2024 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="C0in+Ptm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D515B116
	for <linux-next@vger.kernel.org>; Fri,  7 Jun 2024 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717749708; cv=none; b=VlUg6ONPZBSt1hizkdKejxsRMM6KCxwEhB+Kx0EMrDADO6H9fPseS60V7zMJhGYscpMU0MSnmXUbFeHjPLOA1uBdVhmjZWnqLD7o9Luwm9XzGrsbS4rJwTaW4Dq0c72rUvfJRCnwXjMLUM9yXGhVJA6yIyPJUx5OginE8QeGCh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717749708; c=relaxed/simple;
	bh=phVf9ijd9kN4X/GgpDJKNrw++ui5muApAHnY1aszKTs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Tec+S36/6RuvhrwWtK7GL4n/Zty9L7Jv4INF9kyLJbJDraE0J1PakBVXI2AoD+kwPDXzszGhHo+nrEMc7t8XlB+ESge+izPOHbUbFpCv/VIPE7majAUst7/MpZoHPUG3WDVBh5cbJjsSp8EtzgOH0lkoOsWILFc24oLZTQ2lnLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=C0in+Ptm; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c2ccff8f0aso79560a91.0
        for <linux-next@vger.kernel.org>; Fri, 07 Jun 2024 01:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717749706; x=1718354506; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bCMON8BAWbillu1gEdUIfYGs34cSYJTMb8V2uEP08/w=;
        b=C0in+Ptmo7f+11EGSZKLTrwvRAmXvK8QcdlWXKpQW3lA+n3S0JEK8kDBNFS221JRyD
         JAEtejJ6Mpsvy3E+nH5ejN5BesW5ZwxfTD2jnSCakZpQuLGTbersm7xuDJqjtpbYaxKY
         evPfA+Wpzl0Lvy9QZvGEgZqJvitC40n/zYW5P8tQW0G8yZGEQ5QP7pg/S2xp/U5byXUd
         ur1nWDiIY/cKs8jDgfhGOC+vu1upyYFh6ReSos+i4rz9ZVfjCAPEomc6IuJJC/1Wylv9
         1LtsvxWYM3EaFdbwINxQdma1Ko63yH236Zlffsi+VPcWs4HSroHyt+LD/PyLnxNqB/Lt
         hedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717749706; x=1718354506;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCMON8BAWbillu1gEdUIfYGs34cSYJTMb8V2uEP08/w=;
        b=txjMM8f1kavpzSd0cVk3wjZKQI7hG5woGJADRqyYgwr0rAvx429j45mdgIqAQ78s2b
         BF/Da3N6s744+yGC4M1ZihwUSSdLGIJGGUTTM7OCTOOHT7ENWenJdLQ5+66IoLiEw5aE
         AN0+ZVIXJrMN1XF4HVWGUwYEZZ1KwC24nDT3lin2HdS4iaqxqYffhIswHA0mG7RtGI1b
         uwTNLK52zeydOCX3jFaeEcjt+r7L6rfUNZxV8aiRWzkK2ilSvq2p4Vh+8wW0WcZM3p8A
         m6+bwY+q7zYIvdrwNGrO7KC4rt0ZL+UMJOCxK++bJvYnLLeH3LAr2lYxMUqE2HewuDpX
         9qYA==
X-Gm-Message-State: AOJu0YwHfDVbxvGfV9YzgpPVDHuquGUNXDql4N4zjLq4loiDyLNaTfRe
	BRLpRH6F7hLCBrJQMauk7wYFX919olKj+s470D1FwMLVbOwThgRfThmg+efTM4tzOsGo5uhALKz
	RowI=
X-Google-Smtp-Source: AGHT+IErkxPDeXUCWEf2IUYInbnXO86AyAFXz0Iv85ZTGUFLaE12s+S3BOMVemd9stVtFPx8o3MDbw==
X-Received: by 2002:a17:90a:66c6:b0:2c1:bb57:5154 with SMTP id 98e67ed59e1d1-2c2bcc632c8mr1753098a91.32.1717749705673;
        Fri, 07 Jun 2024 01:41:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28413b509sm4838641a91.28.2024.06.07.01.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 01:41:45 -0700 (PDT)
Message-ID: <6662c7c9.170a0220.1d0b3f.d8c5@mx.google.com>
Date: Fri, 07 Jun 2024 01:41:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc2-498-g6ec8e62a9eab8
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 78 runs,
 1 regressions (v6.10-rc2-498-g6ec8e62a9eab8)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 78 runs, 1 regressions (v6.10-rc2-498-g6ec8e62=
a9eab8)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc2-498-g6ec8e62a9eab8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc2-498-g6ec8e62a9eab8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6ec8e62a9eab8f2a9e9ba51d9164c18a9117c766 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/666296e3c2193d856d7e707d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc2-4=
98-g6ec8e62a9eab8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc2-4=
98-g6ec8e62a9eab8/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666296e3c2193d856d7e7=
07e
        failing since 74 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

