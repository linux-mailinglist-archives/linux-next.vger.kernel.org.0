Return-Path: <linux-next+bounces-3102-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E093A0E6
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 15:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E952E1C221FC
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 13:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A0B150981;
	Tue, 23 Jul 2024 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Xm3b8bhH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F86150989
	for <linux-next@vger.kernel.org>; Tue, 23 Jul 2024 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721740153; cv=none; b=CDIwTvGC+ejR9IRhFSUteR4ilTNDpBDWjxj3yjv2Rd5E2GuHNkvLzGfJ4CTrlzs6PYXio46Z3LUMCKSqjo8x4Bo6M9Q0x6dMqVEAopAvLHiNST1Zqvca0q7gqwUFIjjy4uq5FhSpyw4fnKlc26tF3gQnh/Z4KWRlPkdp8RTKfQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721740153; c=relaxed/simple;
	bh=kM/5+bwtud+Ea5ZHL2hwdX7xsuHao/BNV3cmjeQUJ9w=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=NrYahwOY1MLriTpJ+1G6Eyr6KxNdptVgEaDqsvV4Y9YMjjJy779+v2JJ083FvWtC8zbn64EhPi9Geb+VtGudEUfMse5Z80wnqhir+aqFTnZZ5do2lfkDoujFb4+iQD4sQyjFnogsUJukqS1wR9EJqxasv7y2Ju7SR9DO8ayPwsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Xm3b8bhH; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d18112b60so1779657b3a.1
        for <linux-next@vger.kernel.org>; Tue, 23 Jul 2024 06:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721740150; x=1722344950; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O1khPcwpMMX+Jhnwk3Q13YiSPWlKb3b4pSOcgP0qFHc=;
        b=Xm3b8bhH31yYyUSdJaHHqh4yyfGjYwV8b5ogNLO4gLuKhlJLfGQaauMx4s4e7/svJL
         mcuX/ZTbonXi7L5qP89/5TwjGPAW7VtTX/8//2/9rK9o5700ZZDSEceGcKjF/9aEPcs7
         VDsY9nImk0XHZsj6EbtVtsBCNo+uESWGXJpN9yPjLRSwOOELs74SBAjqSH4we3SVleWc
         7GomP3vBPIR5ukR4PQ2tY7Iww/oLC6Jr5nvfPHFzoYNEhE/PadWNVd4x2p5ORHLQY9j8
         xYQabGtwLUqEsfCoy3SKbDGIw1dCBsuW3OY6o4xWyHsZSIq0H1FZsB857nwFlUSCLpdP
         iotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740150; x=1722344950;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1khPcwpMMX+Jhnwk3Q13YiSPWlKb3b4pSOcgP0qFHc=;
        b=IwZIR+INjsMObx1ToK1NddIVyIpedFs8lNrvSTSV1HSHZ1HU8gAp5IAZUpvzny1Tor
         tEgL458XbudzgNx/SYimM/40H3FvCuh7FZK5qDAPMy7V3iXGHcXvltlnOwdvL5JEgriO
         sfELPhysf619PwEdaFP6UvYPRZDl4iDZjPxZD0dT9NHPfAlovGy/ujSaKE4nHYH875UF
         aJ/YyY/VFkdBdHJMn7LCG6rFrObKniiA4E19knqeFfHmfyNBcqwyWGtQcbTs1G+1WwRx
         /T/QOtwkDzQ/ovoaN7xvKUofjT8BA5RKoeA5aQlFBkT5vqhp3VKvpqIY+ArBDIp4S4cB
         IcoA==
X-Gm-Message-State: AOJu0Yw6ZsQvB/J6XNNf+Q9PLHH4/Ac48hTbXiiXvTv/fbOE64qGXUZo
	v8VCVJ3zsmSJA38aRjQ2iwFzXhTIhE+UGUe606pMg5qQvVKJCGOmBqibbCHwhVxVDwxrjvgxjSR
	x
X-Google-Smtp-Source: AGHT+IE2+le64iT9IM1m2wYzOTQZz8zu8Z2pfMGmTA6p4dCm0Ipdws66vM0YjZEzY6fQlyo06OEKlw==
X-Received: by 2002:a05:6a00:1807:b0:706:6867:7a63 with SMTP id d2e1a72fcca58-70e80778f94mr3055011b3a.6.1721740150489;
        Tue, 23 Jul 2024 06:09:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d1d4effdbsm4088147b3a.114.2024.07.23.06.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:09:10 -0700 (PDT)
Message-ID: <669fab76.050a0220.2289b5.927f@mx.google.com>
Date: Tue, 23 Jul 2024 06:09:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240723
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 197 runs, 1 regressions (next-20240723)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 197 runs, 1 regressions (next-20240723)

Regressions Summary
-------------------

platform          | arch | lab     | compiler | defconfig          | regres=
sions
------------------+------+---------+----------+--------------------+-------=
-----
r8a7743-iwg20d-q7 | arm  | lab-cip | gcc-12   | shmobile_defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240723/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240723
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2347b4c79f5e6cd3f4996e80c2d3c15f53006bf5 =



Test Regressions
---------------- =



platform          | arch | lab     | compiler | defconfig          | regres=
sions
------------------+------+---------+----------+--------------------+-------=
-----
r8a7743-iwg20d-q7 | arm  | lab-cip | gcc-12   | shmobile_defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/669f6c641c467826ed7e7073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240723/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240723/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/669f6c641c467826ed7e7=
074
        failing since 4 days (last pass: next-20240718, first fail: next-20=
240719) =

 =20

