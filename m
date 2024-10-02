Return-Path: <linux-next+bounces-4059-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0586398CDA8
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 09:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3736D1C20FC8
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 07:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343F07DA81;
	Wed,  2 Oct 2024 07:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="tCvhPnpK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB801754B
	for <linux-next@vger.kernel.org>; Wed,  2 Oct 2024 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727853454; cv=none; b=CQITXn9g+s5H1tVIj1ITMahdu+fPRf61j89x/B6izIwJ71AY5xJeaQ8lY3TMpElwECVve77guzBlokmM5vPhW4UpFszSEyxNPfFPoio4es6GYqim6ti8oL7OkVV2SdoEK11m3Mdt7h4frUyPEfsJF2plr5/seo0WDQkc9FzE1o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727853454; c=relaxed/simple;
	bh=32j+Hb/MR/iHgJD7SRwl2o5P7x3T/QGLfFLHxRwXFpQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=izGGihab48LrwsMW7IL/R5qwHA+uovFt77pwpR6i2h9g8LJ6ofXGLsSqK0T4XBJZS1riwzQgxzJjkbwpmE8pXaklXg5zZ2hC6Z4RFIOM/M+H2DvADFlEUfVmQKXwQ/8p9o+SGH62XsXrrlR2XNQ9rwMV7OYYPb206id3mslDcnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=tCvhPnpK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7179069d029so4602578b3a.2
        for <linux-next@vger.kernel.org>; Wed, 02 Oct 2024 00:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727853450; x=1728458250; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xkumKuzluZWKesvhGxboV4bLn6zxXx/tw5i+L/P0hUw=;
        b=tCvhPnpK9Sy2VI9ImeLrkEaI3iiykfi2SV9+stbrcPVkp29bKoUMCtwGLOrM2nRfy0
         9iiTMGCnWdKx3c91ShwPSV2Yn6HSD23INqMapeBr3H+C7b0kd5MJyuSFxJ/g48u5SGQC
         8krq7je7H3KsyA4sFlF68XlPLvAT3H3uzRD79m4g2aD4oW4lwFItSpTmHYe8PhSCUPr3
         o2EGsIgYp2n0AWWIiLUJuWmUMCA7JP+P5aGcJU1ntRoAjyUCbBavxy0s4EkmHQpjBs7b
         M9uc/0tLvaCx/edaZHPQsazbcAPywSngtavjKoI5U+7/Ar/Rrt8ErVePEquhvjeCOgBq
         k9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727853450; x=1728458250;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkumKuzluZWKesvhGxboV4bLn6zxXx/tw5i+L/P0hUw=;
        b=TgykVK6jlWkUqqLmksoDxhGopZLbXthgdaNaeGLIWnlMxOZfs3S3Ep5GD3y8hyq90N
         RG9LgkF+E50FDo/KXQpEEO9DrFx6/OlP4j6u8MJEWckNKPnRIuZvg3yfX0hNNaFYGAML
         8u4yRtuLzU4GPg2o7H0RKx92SVLCiTcfQH2e3Ez0+V7Lct2h9KC3Khz9Ks9IcShApPZ5
         fr5ta4a7LChSf+CA9fBZUGJhHuZBkKwhredSikKftFZ7VRO/MG5ptnwb0pDZuPZ0uU8I
         WzUrkxbxqQzkSf1b0u8aSgYl5d5+9yvKgj8DW3o0SS6u6YxvO1rPrCJcGhvjxo6YZ583
         EsfQ==
X-Gm-Message-State: AOJu0YxLdVK4bfsRig+JH8f8WOIn37FXuO7OmREQTYIsj472gko9N6cC
	9bHOIGyvqlFJkFMx33Vihn9JWemIq7aL8H3qa0KMjh/oVSwWhNmLOURLhSYJRs77RQ4zhh+FwiZ
	n
X-Google-Smtp-Source: AGHT+IEs8slX9ZxA7Z0fdRPqBB3Y5OxVZwQEAGRDkl/ZwccTrP9KlYcryPqdbiWPS9OGvnoLJr0MCA==
X-Received: by 2002:a05:6a20:e30b:b0:1cf:4c70:f26f with SMTP id adf61e73a8af0-1d5db1dc748mr3059829637.17.1727853450675;
        Wed, 02 Oct 2024 00:17:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652b4d6sm9522258b3a.177.2024.10.02.00.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 00:17:30 -0700 (PDT)
Message-ID: <66fcf38a.050a0220.35da1c.7184@mx.google.com>
Date: Wed, 02 Oct 2024 00:17:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc1-232-gee49e25f04561
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 41 runs,
 1 regressions (v6.12-rc1-232-gee49e25f04561)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 41 runs, 1 regressions (v6.12-rc1-232-gee49e25=
f04561)

Regressions Summary
-------------------

platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | gcc-12   | multi_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.12-rc1-232-gee49e25f04561/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.12-rc1-232-gee49e25f04561
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ee49e25f045613c85059db2c2e2cebac9029056a =



Test Regressions
---------------- =



platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | gcc-12   | multi_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/66fcc131df83faa6e6c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.12-rc1-2=
32-gee49e25f04561/arm/multi_v7_defconfig/gcc-12/lab-baylibre/baseline-beagl=
e-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.12-rc1-2=
32-gee49e25f04561/arm/multi_v7_defconfig/gcc-12/lab-baylibre/baseline-beagl=
e-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fcc131df83faa6e6c86=
857
        new failure (last pass: v6.12-rc1-157-gf81ef06dcf90) =

 =20

