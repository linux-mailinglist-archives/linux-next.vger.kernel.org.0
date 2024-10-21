Return-Path: <linux-next+bounces-4344-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82D19A592D
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 05:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A6EF282414
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 03:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBE1A41;
	Mon, 21 Oct 2024 03:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SgO3Pb8l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C44208DA
	for <linux-next@vger.kernel.org>; Mon, 21 Oct 2024 03:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729480556; cv=none; b=TXW9TxcrwvAOuxqCletM2vbyNZgYYVCbTc21TlEDWaza4gWTezefyx/Sz6JEuG8A85uVDv7pADf7VaLl6lSXVRvSIhyhOKa1KjsbPZPFC1C2R2rPqGD1+irlI5kIVbv7bN0EHKcer12MJEsE3SMMoUzW6RaqEAm6r+y62wz3ArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729480556; c=relaxed/simple;
	bh=JpyLp95cPXwjCK5YcgbZpYZfZt5eCdLa08k3f7Ly27g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=FKzsHyWXZw6fWpL/5FJR8r2UI01zc91KHBWZERA3beGvrvYpuLPT5xs9xu5lnjg8qjJL5wfYWM712QnxuKSbZV1z6EcL36KUTiKG1SxNONc/k+8PhH8Xw45+jW6ifll5DufDxTnvT6iWwJ9je00xCetY3qbX+d7MW6DX8o/v1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SgO3Pb8l; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cceb8d8b4so22404315ad.1
        for <linux-next@vger.kernel.org>; Sun, 20 Oct 2024 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1729480553; x=1730085353; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WAxhlhBxh+SBVU3kEnQO9EnR3XklKN2Ha3XBz8qNNm4=;
        b=SgO3Pb8l0rYkOL8b/LSA9D7EcjuXVLzICklXVy7EvCzH6Cqwm7RLbHvKJ0n0QJ2luU
         +tORQSh+s9h0m0f8/D33xtYAENetnF1+Rozy78e04EiyvqPPV9pOWkP7RNr3FbwQjfHN
         5TTXnDulSO7jNfPUFWrmkHvDsavg0pa9dClUbznrKdt9sCz6k3Pu8O9S9FBUKhPqEyqE
         J3t2tVdD7B/KYZESWCtAAkvegT+ce4SL0jQqImjdoUIa/WqnBUOJ71zVpOj56Uc/UnEz
         GQp6wm/K5bArGbamQ2pCmIaO50nNvveq1ZXFTxVZJCvysO6/IOuMiBb4NXpuUaLqZg3K
         k8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729480553; x=1730085353;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAxhlhBxh+SBVU3kEnQO9EnR3XklKN2Ha3XBz8qNNm4=;
        b=MIJfHtUNzEbZmntj9TYPI+5563u0kHfpeB2BdqhXcN++dGLqT7wkPHQdK/KGMZy1kD
         zgAgBDh8HO6j8fIBSYCFL84KQEAz+CS9LoTONvIToQMCXuS72boLCSXccSvp9DRCEqTT
         uQ37EtaCm1UHWHHG3NLW5X/36kg8o4bgdugHUBofdFhs19N6NxnBcJxd+3wmh8NcfhjK
         eB5tWJGhijA1SMfvY3iHPahltO8T1yndnTgF2gzMNQQSfccR4HPfaQvLkn/DBH4hR/xF
         jNvV5mmwL9/ALmuK1oQwGVGoz3xU8lDMK8w0G0d1kfJBtYW0sa7lOfHYMS+fY6ugUn1m
         YUDg==
X-Gm-Message-State: AOJu0YxsxUq8oJVXit8sdUatp5qXDpwxPiaPcJMl/gZC6Sn3e/aAqhZC
	G5O6+N9FYy4xZM77xXv8vK4socDgpbBJiLQduKVrL4H+1e2ZeTUIDhuqLynHOwx5eLXemX+/9Ym
	U
X-Google-Smtp-Source: AGHT+IEoV3HSydf0ak9GA96pL/S7uJgtUH1O26J2v9L778zfxhDJaGaIr1eTtcIbcZWe8sN3T/XpAg==
X-Received: by 2002:a17:902:da90:b0:20c:5ffe:3ef1 with SMTP id d9443c01a7336-20e5c159234mr163346575ad.17.1729480553340;
        Sun, 20 Oct 2024 20:15:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bcddesm16288055ad.157.2024.10.20.20.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 20:15:53 -0700 (PDT)
Message-ID: <6715c769.170a0220.50d80.35a9@mx.google.com>
Date: Sun, 20 Oct 2024 20:15:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc3-742-g4778061ba8680
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 43 runs,
 1 regressions (v6.12-rc3-742-g4778061ba8680)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 43 runs, 1 regressions (v6.12-rc3-742-g4778061=
ba8680)

Regressions Summary
-------------------

platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.12-rc3-742-g4778061ba8680/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.12-rc3-742-g4778061ba8680
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4778061ba8680be32d596bf0d43ff7efca73245d =



Test Regressions
---------------- =



platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/67159748dd35ba8e90c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.12-rc3-7=
42-g4778061ba8680/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.12-rc3-7=
42-g4778061ba8680/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67159748dd35ba8e90c86=
857
        new failure (last pass: v6.12-rc3-531-ge38329e4c0ed7) =

 =20

