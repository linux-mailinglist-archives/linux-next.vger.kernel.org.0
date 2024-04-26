Return-Path: <linux-next+bounces-2067-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ACE8B2FD6
	for <lists+linux-next@lfdr.de>; Fri, 26 Apr 2024 07:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B65F1F2281E
	for <lists+linux-next@lfdr.de>; Fri, 26 Apr 2024 05:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37ACB13A3E1;
	Fri, 26 Apr 2024 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="tGRdCTDI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1813A276
	for <linux-next@vger.kernel.org>; Fri, 26 Apr 2024 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714110652; cv=none; b=G7xbsPnxUr08zGh2Ehs/ZIpyFN/m/IEOg5iJwX3x4ZQ4oWKR7YGPFX1OZ2jR82H3akNkkVoduALw9wIdF0wh7b5PS7f+2hZA5/nahKSufNYciImZoulkotxxSYwRpF60RMm+HHOPFVu68OQ07wjxo764ZSo/m+gnqKGLoGE3LG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714110652; c=relaxed/simple;
	bh=76IgT1wTwC9p/hinBci/GgvZpyokV15Co0cth5pHAHQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PCUD4jYS1NfPGGK6gujjEM3R5o9t4WOVltOMqHgf2YiJsZyGt4GJ9hvJfNX9QQlzNPHCtyHf0iRLrbQ/+0jXOtB43ViYH1B/lxELFtbCmhynLWbQ4OnwoovUDKwldRf3NdBGf8Y/RYXdKRmIAEF7coG6nXqPRLzpou0kipQVlgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=tGRdCTDI; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2a55a3d0b8eso1312016a91.1
        for <linux-next@vger.kernel.org>; Thu, 25 Apr 2024 22:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714110649; x=1714715449; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4QHn9saCg4fGP9RCdABHBD+Y+gmDCMVLkUjPR8EQrVc=;
        b=tGRdCTDIrJ+oWvjGNutPmaQuqOO8j05d47doiQq4LjoxOBnXvpOgSm4JAv4x5hS6ro
         ZYydzQjZIHiRMdWbqxgs+QchfRp5qNwvhWLMVYAIFA7epIJbNOHY9hoJ3UX3qfX2C1Jq
         V81RTEXw/8SkJVQHHBLQ55zPE14KUXp3zbTe3eC7VE/6kmajcokf5GYInUzffmcKZaCY
         T2oFK8hdWd1gDZ4EMX+EAtAXot8BAQ04pCfALusYc8fu/UPJb+sGOUYaS2wZxjTrzSPK
         EEfQ06w6Y+dk9spM/wu7sLGr+DN7VvU3mb2PxA2P465vMX5CU+RNrIJl4YamDe2xf9z+
         11dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714110649; x=1714715449;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QHn9saCg4fGP9RCdABHBD+Y+gmDCMVLkUjPR8EQrVc=;
        b=YJp7UN6GkOWX0rt37kY59fvfmTvHaz9qbZUHxP/0qf2dv4B7cPAq9w42iU2k33TYDu
         bAT4L4eXbZBq4ZlCYpSY4MTOfLjq5wOsm2PUNWB8NwOv2t15gbfTd4E4QKOeT0ZgKSsN
         z5CN1mTAm9ajiL64hwsrEdqaJbnMZWM4MZJsAm3Sx9C1NwDLgfqlnd1ObvJm5OsH9cyo
         IOkUJAl/JMjzJhSXFlWZO2JInwOmSIhUVBnF5OwhK5/lnbxSIGDEKfp1C2whMPhjJYPt
         IVvdTEVH4mjYECigR6dtQX4cxTL8PO/rpeQCw17Qkn7k7z0COfzkxo1cqnsT3c/q2TVZ
         G3Xg==
X-Gm-Message-State: AOJu0YxKjFMo/EWKdiB2sdTdjEUtwFnetZjxn65cokl49lJWw/q8cLfp
	RjYRgRxOHUrtK/Tnu8hyD4HDb9R3bWdoHktXGq/ySuH17jYfllWTAWwhzi4N3chESLgiyOuuZHg
	TD8w=
X-Google-Smtp-Source: AGHT+IF3ItOEhyhptrSdT7bIdRZHyFJFlcvI60I5ct7bgHWxCpM1qiJ/juWl+RnDYYI+0Vdw2pfrcA==
X-Received: by 2002:a17:90a:8cb:b0:2b0:763b:370e with SMTP id 11-20020a17090a08cb00b002b0763b370emr1008789pjn.18.1714110649338;
        Thu, 25 Apr 2024 22:50:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z24-20020a17090abd9800b002a56b3931dfsm13853454pjr.49.2024.04.25.22.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 22:50:48 -0700 (PDT)
Message-ID: <662b40b8.170a0220.df6a7.2346@mx.google.com>
Date: Thu, 25 Apr 2024 22:50:48 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc5-365-g68d7c66c8435
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 41 runs,
 1 regressions (v6.9-rc5-365-g68d7c66c8435)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 41 runs, 1 regressions (v6.9-rc5-365-g68d7c66c=
8435)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc5-365-g68d7c66c8435/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc5-365-g68d7c66c8435
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      68d7c66c8435bad8c74bb64a4422fb2aba6fa282 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/662b0bd50f745843434c4317

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc5-36=
5-g68d7c66c8435/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc5-36=
5-g68d7c66c8435/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/662b0bd60f745843434c4=
318
        failing since 31 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

