Return-Path: <linux-next+bounces-3025-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB87093200A
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 07:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76B902833F6
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 05:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D526E552;
	Tue, 16 Jul 2024 05:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="M1JXYKFn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7396D18028
	for <linux-next@vger.kernel.org>; Tue, 16 Jul 2024 05:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721107711; cv=none; b=iPfcqUO/t7ArXtR+QtPrODznK3Hm+1SNzzNyhPiOGK/2Q9jGzIXH8W/FRfacuYr1arDdksOssOFfH4FXMffNmrRttY55dxD0oTiSju7bwtTDxv/D2wVTay6YnvpWvM09ci63alNG5wsN5QFL4fnYOEyV3jak+fJLPwgN2D8RZds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721107711; c=relaxed/simple;
	bh=kxFUGOqBoHP9cnO+vG35D9DAetjoIaIFwDPcR04TW3E=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=dT1RKtzlJqMrJ6kL23ZWUKjrqB29lBjLDi9lL+9UMxUQGb3xdOrE9/722Tj1LClhqnm4MRRoRESnx66e/M+mNaJl23rdLKpE2Oo/SapqbGh4l5fM50aj9MFd9xFXv4maqCP03LPpibIiC0k3eF4OC+BIfj7/w8tN1xxVaA7Gngk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=M1JXYKFn; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fb3cf78fcaso34611425ad.1
        for <linux-next@vger.kernel.org>; Mon, 15 Jul 2024 22:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721107708; x=1721712508; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jjGZZ3xYduWbL4saEqbFBpc4KH4uA1Vq9AjZ5KkTv+M=;
        b=M1JXYKFn60CUJalJ6mdAPTf83Jg5vp0SePbQKnCBs0YLPzPHo+DYD5JhFoTb/64L3u
         +X6CqUUpFpoxOCyEo77mT3kPwvYjiK1TxylL5ZslJiEyrEmyAZhRu1ohY5VpzWwTwVlF
         KHyh5mWivFM+S/dLBZ6E3s1GaltIg9f+H7V/1S7Rgt44yu335zNL8rVSRG06wqabjW0m
         GZuKH4oOAYtUz3urDlVXPl5im4OcIe3rFtYvhinozgrIIWMozIrptX/a1bfzoQLd6uDg
         KMyffkJmKF8Q9YDaESyiy8uPuOWuGLXC+Ud516yVt07EoRKjghd/nGTAl/znO15QzeS6
         WFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721107708; x=1721712508;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjGZZ3xYduWbL4saEqbFBpc4KH4uA1Vq9AjZ5KkTv+M=;
        b=c1trVvkLjt0rzVDHzrtsDDvlY/TGtWcCGUnHmldByCZw2ZASbF72e8F0LH+hwTq79s
         P6aXJs6L479J1mLm04klO9L/wjOR2MO3Y5RbFrGCqaz6YmrI7/UnYcDa22PQzcV2DxGC
         IbAAaK8ZTLA7ZuuA0Y8D4WwYKNWQhKz8oGH3NPI7nT3WKO+rT4xI/20cuzgyiksXSv9g
         V5I4BWlAXYJ9MrKi6ktPXnbAb0Bg4F3HcqDBA79k2mV+Pu5RBfYv4zkPhrJUi1IHPE35
         nvTNnK2UQlmszQL2SWUFN+Dync4wRMz1lj/z736uXEQUQwTJ3+gKPAYkaji4BJS7ACys
         lGkQ==
X-Gm-Message-State: AOJu0Yxx9s4EoRtAILrizdki0DZeIYphoBncsOIGOw5/g17t8F0B+5K2
	/7ySBMu3xkCb8NtZ5KyY5MLsE3xYOg4E89y6xLDiE6vL+icxLpyfpyUu9bns8EUGU8jqSYAH9RH
	d
X-Google-Smtp-Source: AGHT+IGIS+Q5jOpPBxW2rMS0tX6QdsFyDOwdyzyswmzaL5CPn6iqkhTDQxCw3ymzEiLtlXq6Y0Ertg==
X-Received: by 2002:a17:902:ccc2:b0:1fb:3b30:8cf0 with SMTP id d9443c01a7336-1fc3da011c8mr7870455ad.51.1721107703373;
        Mon, 15 Jul 2024 22:28:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb74c04sm49732825ad.51.2024.07.15.22.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 22:28:22 -0700 (PDT)
Message-ID: <669604f6.170a0220.f7c54.f1c4@mx.google.com>
Date: Mon, 15 Jul 2024 22:28:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-950-g954104d9dd5b
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 75 runs,
 1 regressions (v6.10-950-g954104d9dd5b)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 75 runs, 1 regressions (v6.10-950-g954104d9dd5=
b)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-950-g954104d9dd5b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-950-g954104d9dd5b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      954104d9dd5bf556aad271bb004b03467e373fc6 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6695d1bf79215eb5627e709b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-950-g=
954104d9dd5b/arm/multi_v7_defconfig/gcc-12/lab-collabora/baseline-odroid-xu=
3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-950-g=
954104d9dd5b/arm/multi_v7_defconfig/gcc-12/lab-collabora/baseline-odroid-xu=
3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6695d1bf79215eb5627e7=
09c
        new failure (last pass: v6.10-rc7-332-g46c782a1503e) =

 =20

