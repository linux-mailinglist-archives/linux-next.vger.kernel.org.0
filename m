Return-Path: <linux-next+bounces-2670-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523C916E2C
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 18:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAEAE1F21A11
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 16:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE02A14A639;
	Tue, 25 Jun 2024 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="R3AZp5He"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C03B14A0B8
	for <linux-next@vger.kernel.org>; Tue, 25 Jun 2024 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719333159; cv=none; b=E1nJyOw//VN4FGVIXh1YGCF0c+k09k0u7b9ab94uixlkMySUs70v+h5HfMMarnfhP+pxCMknNivvJwO8FXvNJMDnwxdAfxSKOY73xnTzVkKLyAIPrshJ05afjI34sgxp0PK1rTista5JYYNxGW/UhKWMcYTGpTIGqFMvv5SArOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719333159; c=relaxed/simple;
	bh=wfoIUI8q+GZElLsKR418sMV8r6LoxqsMQ0TO0BysrhI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=J1WAkBMfCjWgbaFMCF2gS++XhQZ6nxXRcQ+2zc87EnZqUBaiUfT739KjwNDL1WpARXfZiWraD5KZYbGfvsInbfYCfsquKhEhd7mjfO/bEGzkXaMdwTwzM1hjNNVTyRB4/V/Ko6xlmVLhmtSTTqqvK49FvJ/rZ2ryQ901Iuz7gsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=R3AZp5He; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70698bcd19eso746081b3a.0
        for <linux-next@vger.kernel.org>; Tue, 25 Jun 2024 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719333157; x=1719937957; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bczkSUHrRadtvYkCl9yZ2Tf8XIBgzplOYUUp5JDQba8=;
        b=R3AZp5He6AKHGiJ+Q6wOIf3U6ASXKJDmDG4gDooGKJCnTF8tV0FU/3ewqgKiQRBydm
         W7tWXgNpTCh8PFEkxv319iX4NsOqqYKN0e6bQqnYDA5PIRfHOZHziS/SMn/os1g3ODCZ
         Gu6G7TJ7NhsT+6RiR03bpbRcU90Cqa6vGk8r9gee0QQpCHIUaVGM4ufSYYMNKDzOM8Zy
         KIMXOmiuwftgXcy768o7MkwKZS/vqoLipRzFblw1Mwd4DFwmfNvTP2Xa4OHhu6OyZfZ2
         AheAR/B/SdczbFOJ6XDxR30ItvduqlImXcKIzU8jtA5XE+n9hsOBLJ/UPze2Tg6mKCQs
         aQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719333157; x=1719937957;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bczkSUHrRadtvYkCl9yZ2Tf8XIBgzplOYUUp5JDQba8=;
        b=abZtdzt+h8ZnfvKtOlXMD7/+EATw39JIk0KGQ+7Cr+GsfhQIUWU601e41QI22smqY7
         hQ9t6xvQH9jg1Nwm/9OTehg41UmhFKtjTHWaugGY7cSceR9vazh/++tPabAPgHf+kJKP
         UCwpkR026NG1yEVS1mCpR2B2FmNI7C/iryCYr2a6a/+nHt9mR02T4KSo4WPARZBf8FUD
         npb6WCLTkLm4bPGP4toCdgtIMQHM9cbgC73sYPxmQOmZFI5shSB2zuHGMhoFE3Mb4PQV
         kyqsJulMdmAgtAJ68+WFGU14IPBx0aWsDuK9bySRZ/3OnFjvPxfE3e/q/BfBD9wZypSL
         FSlw==
X-Gm-Message-State: AOJu0YxPQRbuevfI0J+CHdghCuZm3pkwokdnVmV8luz6VC0YplAEw0sx
	ho9Ry+SsHL7bsiGMlT4VN+qi7b6dp0n82AiA3GXl0LwirrCf7Aw8v4mbtu5oBCHFxGbgyw0hqmM
	A
X-Google-Smtp-Source: AGHT+IFLv9Qtrtl0wjAo8Aka/wS5WWNwL7PtDAbuEOhtgQG7mNSk3chBvsGdydgLud7OH4r025D7cA==
X-Received: by 2002:a05:6a20:3419:b0:1b2:cf6c:d5a4 with SMTP id adf61e73a8af0-1bcf8025e10mr6596826637.61.1719333156983;
        Tue, 25 Jun 2024 09:32:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7068248ffbdsm4300976b3a.19.2024.06.25.09.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:32:36 -0700 (PDT)
Message-ID: <667af124.050a0220.68c33.b95f@mx.google.com>
Date: Tue, 25 Jun 2024 09:32:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc5-250-g3d9217c41c07b
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 74 runs,
 1 regressions (v6.10-rc5-250-g3d9217c41c07b)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 74 runs, 1 regressions (v6.10-rc5-250-g3d9217c=
41c07b)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc5-250-g3d9217c41c07b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc5-250-g3d9217c41c07b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3d9217c41c07b72af3a5c147cb82c75f757f4200 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/667ac07bc485e4687e7e707c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-2=
50-g3d9217c41c07b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-2=
50-g3d9217c41c07b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667ac07bc485e4687e7e7=
07d
        failing since 6 days (last pass: v6.3-10703-gb3f869e79cdf0, first f=
ail: v6.10-rc4-262-g1ce98b2c2d5b0) =

 =20

