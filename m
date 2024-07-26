Return-Path: <linux-next+bounces-3138-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB593CFAF
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 10:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0CC11C21E0F
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 08:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B832C6B6;
	Fri, 26 Jul 2024 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="rNmGfUmr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8667736D
	for <linux-next@vger.kernel.org>; Fri, 26 Jul 2024 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721983005; cv=none; b=U80QKi0ofK9wJb6LdYY6LE1o8OJO6gtisfxsHwGtwxlgTB7crXJhh46SoKSlVvsjQsMTKjF9FlVQvgNARg8cA8UdSabKchWI/uuHZNMo9vPVf8cN8hsi4h/uh1rcdEYWifPlJGZd5w6UNYqoJqH6stCeR45S9pouzsx6hD6S/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721983005; c=relaxed/simple;
	bh=7Pxu+jSVu7BbSWE7EaKu3DvRQbgUohDPdYLfu1WI0/c=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=s2Fo4Ty0jaUug2Rzc7My3uG7qG0Mk5sdgV3DToKsioJm8qnIPhiwixXL+qzeaTvo+OcBY4kF8abnfovHAkTefmqmATnvhTuDw4yl14L76tCmJfX1CSDEYgaCKXD/vH8X1OLbCvpeSq1h/Cmzk34CvNk39xXtyWZHKWJMebGKrdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=rNmGfUmr; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso556926a12.2
        for <linux-next@vger.kernel.org>; Fri, 26 Jul 2024 01:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721983002; x=1722587802; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AsBPC/ay08+wu95Yih/CHbHPwGd3uPafdvr3AH4x4sg=;
        b=rNmGfUmrMOE5PpAtlNtVy+z0M1tvPdU5AqSq0Btuiq9wE533QZ4i70t+EQEFqCYjHS
         vQ9wIpsCOF9OIFncJQn3AYqI5HvWh8heZ6LHyj1HhICMSitghGacgmyROAWsFuJU5lRN
         fgwbqKnMHiSwH3Av1vyqoHc39qebs2i5/URE02KfVyGA6apokk/HWrcO676KbTOwu9eQ
         FvNOkFQ79eAZzksyk5xByRCYH378zypXNpSHWeIXxSvj5Nquk1aS3QCFY9ph5DXTjbqs
         7IqDxuc/PeutcN/Txap/5rEMv6JLObGuHeQ3cY4V72COyJgEIakefqIP5hJgyOu+k/YG
         sWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983002; x=1722587802;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsBPC/ay08+wu95Yih/CHbHPwGd3uPafdvr3AH4x4sg=;
        b=MBi2vyw+OEYbA9ppYS3joXC9m2//qaZ8aYdyWoOemDtShosPwshRKwvVvgJh1eAkQ4
         yUX1Yt/JiYc3lcwPHs8Ky2MmIDnhrChpGLhEmJMdIcPy+8RKoY42AWOtgL2o95bIdteH
         XXW8xrCTVO1uhJ/tBOMpK95MTTwXTw6Y4Gua5ZWjLHummQfRKc/G1gFkRQaXKi3P8KNA
         uMfJpRYwsemHb8Zsag8ORlSVJlIhEyZ2OgYystZlaP6d1zb/h3R+RCHjKaGihgCIbY6/
         +rL+oZc6VNDBJzvmJu0FbktY32d0vF4sNQPEucrICmlHjSMLir8xLU/a4AkDTjfw4/cB
         lHAw==
X-Gm-Message-State: AOJu0YxsJ6qIwW+97Tou+PHcXJSGb/Eoo+BjU/NTvmLztG+rKfZ47h9p
	ALDPc1bbhdkeGbgIgnqIUen7MGiJhxiA41D8RCFcqUCtJQHemQv6xHSLMlpqkWF4sOBYkJE87qw
	7
X-Google-Smtp-Source: AGHT+IFiyPiSJpNk7VaOftq5IRFt2it8M1WAQYtBR8N//kZd5K8ysC/KoMCznM4vxrwuUSDZZENwlg==
X-Received: by 2002:a17:90b:4f83:b0:2c2:f2d6:60d4 with SMTP id 98e67ed59e1d1-2cf2e9d0455mr5144952a91.8.1721983002381;
        Fri, 26 Jul 2024 01:36:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c5578dsm2792828a91.2.2024.07.26.01.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:36:41 -0700 (PDT)
Message-ID: <66a36019.170a0220.15c0e8.7710@mx.google.com>
Date: Fri, 26 Jul 2024 01:36:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240726
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 201 runs, 1 regressions (next-20240726)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 201 runs, 1 regressions (next-20240726)

Regressions Summary
-------------------

platform          | arch | lab     | compiler | defconfig          | regres=
sions
------------------+------+---------+----------+--------------------+-------=
-----
r8a7743-iwg20d-q7 | arm  | lab-cip | gcc-12   | shmobile_defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240726/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240726
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      668d33c9ff922c4590c58754ab064aaf53c387dd =



Test Regressions
---------------- =



platform          | arch | lab     | compiler | defconfig          | regres=
sions
------------------+------+---------+----------+--------------------+-------=
-----
r8a7743-iwg20d-q7 | arm  | lab-cip | gcc-12   | shmobile_defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/66a32251bfba5958997e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240726/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240726/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66a32251bfba5958997e7=
077
        failing since 0 day (last pass: next-20240724, first fail: next-202=
40725) =

 =20

