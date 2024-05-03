Return-Path: <linux-next+bounces-2160-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2A8BA96E
	for <lists+linux-next@lfdr.de>; Fri,  3 May 2024 11:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD8AC1C21D5D
	for <lists+linux-next@lfdr.de>; Fri,  3 May 2024 09:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF211367;
	Fri,  3 May 2024 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="A0o01H6s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C0314E2FD
	for <linux-next@vger.kernel.org>; Fri,  3 May 2024 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714727133; cv=none; b=ioDoK4EAhYBjPj2V45COARhw2LTuJkzYJtPbz0KjNutzMvAEB6Br0796hGjklG9DPc2FNyjkO1zWCTWpC5tM4WJkQvho12MOYWwtqSaGFsbKUqTGJIUGdBie+URr26bLaXY0O1pDc4MOWEtpckYwEOvebTW9vlbvUhj+2M7Vwpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714727133; c=relaxed/simple;
	bh=qfr5RDosxvR9JCrkpxdNgINyCWERHNK+H6fzlBZMRng=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=R9BrMINuKbUzcdkTnzBC8CPJe7LJZHh1crk0kB8DQpiOny0dITs8P+B+f7VzT7MxYSng6U7P6tDKo3pbI1dPvaYYAWOEQmj/NpCJLykExBR3whLGM/b5SBpShynhjRAirs9oK1eSa+M3aY70HuJ1MDoRWrb+vagkYfv3b4Ptps0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=A0o01H6s; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2b38f2e95aeso1331915a91.0
        for <linux-next@vger.kernel.org>; Fri, 03 May 2024 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714727131; x=1715331931; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2yz08ol+7eB0ny9Ge05rueBeh9YEcBQTzMosA1jqeSQ=;
        b=A0o01H6sQbPc5rvYFkm7THobBs/SzNxeNgp+vOnXz3EhaNbD5G6DBpmQF1V6yPjlPH
         EIveOznBLbepjS9DEeDP9Lul/ZjjN5yciBf9EPvX4PI2gjXnI6ZoQFfDX2oSUPeaEMKC
         fb2Aj5XSciH59z85mpbuPkmcW7fC2LIE+mUZyG+RYLnqD2opuxLig+QYKzRWiOM5GOPI
         /CBzMCyvXjccMTENfO5vvyTKJ2idgHjoeq6UvjW6zvypwRp1DlmCn+jrFEid8tdMflj9
         6/nCQ5MOvHhdHh1DYHG8I+FiO4PbudIWuewQzfOUYQevJmXkmEgd2Cp8ZibYCRXLk2sm
         +gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714727131; x=1715331931;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yz08ol+7eB0ny9Ge05rueBeh9YEcBQTzMosA1jqeSQ=;
        b=JEgUGR07y/bxCjc14iA0M7/YoHs8FDc3OfDin2KS8pypdM0CuQaRQCsvF21w+IoGyF
         O7T1hn4DF7c63c0owVkAmdbB1HaAGbhukWO1FM04oVHjpszxwa6Eq/qFGsehWyBBFiqL
         LGdan1Eid7vSXHdvIQ0aK9gjqY7/YDJMl185un1/PSOJkwwi5HnSVpXl8+YeOuJakEXB
         +2S5vt6X97GqcYzIza6MwvGKn9gZVR01zJjXzP5J7aW2BQxbMYxg60OrpgEj9J3ZhbGK
         ddzLa2TSTVo+inNFquPiVnv5nSN6R9tmJJe4Y51MVyPq/H15EyaxkXiQcUj1MqQVJcUe
         Ck2Q==
X-Gm-Message-State: AOJu0Yyrdqq3UXq1DQqzwb67i6aBzR5tskG+zNjVUAmVwF1sSr6oZbCG
	Wk5jFX6iGgvf5kNw03uFegcq8anktSNyqp0lCUMqEOGCQy0vF7gUQQK5n2JhuRgnDk+vE2q24B0
	35t0=
X-Google-Smtp-Source: AGHT+IEgWpu/Vbiy7RdOFDQ8LU03gX4d+tH09P+rczd9x0n2JEa5Nt7YavqPr+LO4sTX8Rry+oCP7g==
X-Received: by 2002:a17:90a:de09:b0:2b4:35a9:65fc with SMTP id m9-20020a17090ade0900b002b435a965fcmr1890557pjv.17.1714727130723;
        Fri, 03 May 2024 02:05:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090a348900b002a27132ac02sm2853326pjb.2.2024.05.03.02.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 02:05:30 -0700 (PDT)
Message-ID: <6634a8da.170a0220.61542.ce02@mx.google.com>
Date: Fri, 03 May 2024 02:05:30 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc6-300-gbd494b917bde3
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 76 runs,
 1 regressions (v6.9-rc6-300-gbd494b917bde3)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 76 runs, 1 regressions (v6.9-rc6-300-gbd494b91=
7bde3)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc6-300-gbd494b917bde3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc6-300-gbd494b917bde3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bd494b917bde37f8d3f9eb55088908e2c1c00eb6 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/663477c7ea22e5537f4c42f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-30=
0-gbd494b917bde3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-30=
0-gbd494b917bde3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663477c7ea22e5537f4c4=
2f4
        failing since 39 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

