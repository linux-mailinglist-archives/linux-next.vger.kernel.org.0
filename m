Return-Path: <linux-next+bounces-2227-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 187448BFAFA
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 12:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99AC41F2139C
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 10:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703D52575A;
	Wed,  8 May 2024 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FOIR5JpD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF7A7C09E
	for <linux-next@vger.kernel.org>; Wed,  8 May 2024 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715164121; cv=none; b=ge2ZhDH5M9XIsIQVoKFmGA3XC1AraHNumDBrrTHyHfbG8M9TlJLxJ3gP9jBkM5SSgdV+GTfXDESyWnUUC4InSIU6dAzk6NNprxXKrvwrHo+/IztRQWNR6HXl25xFR/+FXtWgMfsrAonVTgpbe7Ai0+MDAbue7nMBLIYHl7fo7pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715164121; c=relaxed/simple;
	bh=VdLUp5Tlu5Cs7w4eSSEK+DK3pqn8+vSwGaUjpvKfs+g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=n8f+TrJQSkwm00zNBDP+hQCx+Z75VEi2cEW11HGonhJ0RNxr0ZAxy7yUyOi2+y/Qy/fe6BmW+utGdZ26+YDUtIQsDc8lhKXo07RE1CYxpIO5rt1HSn8LMI+4vW18LkcpC+dEUSQljT1zIz/QKFZIxajBKXQHc+uh3tJvypxJr5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FOIR5JpD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ecc23e6c9dso26450855ad.2
        for <linux-next@vger.kernel.org>; Wed, 08 May 2024 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715164119; x=1715768919; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fdWzu1xw40TPD1x+zC4wNX+etrmOC20doY7VaGOS194=;
        b=FOIR5JpD7FaUMcDmKUzQux6tfn1GIayd2sNmctiUUdmXnW9e1umagocNTgefQFy+ir
         0WsGEbaG0u/3IVWVn+RZBRs86z8ie0r7keW2TPvkfQ6323vn/5hLT8dW5bbZ5zlrXx0B
         I2WfXOJj0+JoXiiDm9YyupWwAQKT60BHwDAqPlHhcx15UOvdc2Z/EtrWFcqdQNSq2J/u
         m2KNYmTPaiCQdYf4qI3FHi5WDkdl241fAqN7KS4M2XtWurR471ZiZptw4HIjJPvXCviz
         vHephkG0ihFkvMQDRHDs87XWS7RYBw4MgncYceJUsRPUDaH8O6u7Fplhe1q/D8H6bACz
         OcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715164119; x=1715768919;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdWzu1xw40TPD1x+zC4wNX+etrmOC20doY7VaGOS194=;
        b=pQjM1jCwCdPKwFMwNqnGl2/NBhgcZHygbp72O/oW1/xg4tygF9Cb5obSQ68DUmktRQ
         r2RUCvFp6GdiO0szXkThTCy8AkHWo9IhTCcdpfgpia5wYmXxwHhx4Z2jChlRzwJDmgXM
         8PzN2zP0PlGNNvmQW1KpLEsxtfgDNzUbyy8d/MJ54PAHvltUOySaIVxTdVSYYkMbtWEn
         KkEirF/Zvl31giE6xGbdrwD8kehwgGgkUXxoZ/joP3jkr8qOL5v7cvteUP9cDqFwKLKo
         zFh4sMV/mMc5V+oQn1qIrOLl8qQO0JzZwR170h48/JXR2pfiWutGCwa+Qfy/UFYY8ULo
         t3mA==
X-Gm-Message-State: AOJu0Yx9c9QkbAgwEgCu41u6bl1FY5ez018KFJbxvSzmtQN2SzbromCt
	eDjj48cKrNq+6PVJ05P5LgC6xU/jqu72pY1d3fKPr74ssVvaUbwoFQCiRxrcr8kK8DZhEPP3iPk
	Q
X-Google-Smtp-Source: AGHT+IFeaP0mMzh3hsCs1pMu/pZIFxYlIU7WyODNyXHCVLxm6PvJXIGGDmFkiNXrrzfYDq4k3wS7wA==
X-Received: by 2002:a17:902:6506:b0:1eb:5a92:cabf with SMTP id d9443c01a7336-1eeb03a560fmr18779245ad.41.1715164118932;
        Wed, 08 May 2024 03:28:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j3-20020a170903028300b001e7c05cf1a2sm11503316plr.112.2024.05.08.03.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 03:28:38 -0700 (PDT)
Message-ID: <663b53d6.170a0220.bab46.33d5@mx.google.com>
Date: Wed, 08 May 2024 03:28:38 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc7-134-g5bd88a48bbb7
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 74 runs,
 2 regressions (v6.9-rc7-134-g5bd88a48bbb7)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 74 runs, 2 regressions (v6.9-rc7-134-g5bd88a48=
bbb7)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

jetson-tk1            | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc7-134-g5bd88a48bbb7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc7-134-g5bd88a48bbb7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5bd88a48bbb7c60d55a4e42b419b75788c011e02 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/663b218dc25d076ff24c42ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc7-13=
4-g5bd88a48bbb7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc7-13=
4-g5bd88a48bbb7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b218dc25d076ff24c4=
2eb
        new failure (last pass: v6.9-rc7-121-g9b1e89a69d08) =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
jetson-tk1            | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/663b2089fbd7419df64c42f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc7-13=
4-g5bd88a48bbb7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc7-13=
4-g5bd88a48bbb7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b2089fbd7419df64c4=
2f1
        failing since 44 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

