Return-Path: <linux-next+bounces-2538-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 460B290631F
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 06:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57D861C21ADD
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 04:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4296112E1D3;
	Thu, 13 Jun 2024 04:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="eljXdfGw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3818C05
	for <linux-next@vger.kernel.org>; Thu, 13 Jun 2024 04:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718253873; cv=none; b=aAWuOygXxhb1npZe3516OLd/pf6bnH6XTWm6x3wNv2Blrf2h1rS/Bm7SKR5+kgIa7XuFqXbLBcdmjBTiL0fdK1Ne7m+BW9iQV1jtgiCHZ6o13J8f8CW1ajv5raSEDPZ5naNkqRQm0p1tDHj18L1QstRvxnxV9JxxaFY9ur44W1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718253873; c=relaxed/simple;
	bh=8onVjmnIvfjIQpcoYvMrbDcy6jDbLnU6ESy5gfl2z4A=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=JOVinvdCCUWhfq/6DPaSs07WlAN5ViYQeYO1m3dlkpEMmTmiyBjphhLlmMx+YRNrJLhz/SCjyZTGoXZ6F433AYWCalcXaLU4IwnWjmei0WFBWFcpAJEWpE42xErV/if9pMN1gyKQfCokue+4S2pRNyxkTs4FMKcEtUNScnnnxtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=eljXdfGw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f44b5b9de6so5158795ad.3
        for <linux-next@vger.kernel.org>; Wed, 12 Jun 2024 21:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718253870; x=1718858670; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YWeVahNDJDKO1/YlQIDvp/PoAnRgDg/XJqL0eHNZurk=;
        b=eljXdfGw2V2Y6KNUa+Uz0Hx7aCZMrqwX9tIvc202mZTdi37U7aB+pkseW7If/I0j+1
         zog8cuhFZK1/5/xnFd4eYAG9NuRnhUjDUikIJKQLCq6pDuTE2HgYJ//bcQFcMrxQq3zX
         nj1J5jDRgyj1RFagbryj3JcQJ0AfrtxP+4ZHKwctcrFLbvKRrOAkUHZwgFDE2jsMjRNo
         /ve2n/FcGbKjUyg6sp3sGP773MKjZR7CPnGvI+o0xtVHS+nB7xrTaGrKTTp8FbQsQ0Q+
         QGjfIYsGhnFHwPvU6P5j8XcHZfnyj26L6uGGu0hFJ0agn0MnxYDudqv54EnTIN34xRE6
         Uc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718253870; x=1718858670;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWeVahNDJDKO1/YlQIDvp/PoAnRgDg/XJqL0eHNZurk=;
        b=Z1+Xh1lnaISbBJRV2I5doatKp+yWx+eaiESoLEQspyIBr3q4kcc4W5VV5QaljjzqCM
         16SC/b4zEyOkNY/IqcMGTbfSugJKszbwhUXG2cvycO0BBsnC6MMS0YrZUk8OkPT77lq/
         WG0qk0y/KWg4dIUNpBc+uxiLjUWi/n7ytHCTEsXBOkGjDwZhD2JNOl4YqQNSLY28uY6j
         aBGyXFcwYH1VnKiNGCFeKqASyGrqGd9O3ivT7beO1DuBrj9Gc2d3GMRDuGmBJ+Sr2o99
         2nxgsJOV3QSsR8H9B53wtlp+pzluYIoqXS7x2Ep85fDTiiZrLTD3Rq4nyZpgdWfuaoFn
         rCOQ==
X-Gm-Message-State: AOJu0YxDEuWtSnmeYr0HH26HbtDOrllNP8iuokDfs1AeRLaBv7NzNegV
	K6jVF0Jc7F4/uelP+zsPejw4oMYjiU/cHnEw11trSZzXkLr4FQ6YVb6dC39FZwWKuWsfEhTq6TE
	BS2c=
X-Google-Smtp-Source: AGHT+IFZXC+lXqWUxN06JyNLqNxU3knjmBbECWsRoVkzPxMR/KC/8nIfsBTkiuMywu3pnfWALAfJHw==
X-Received: by 2002:a17:903:32cf:b0:1f7:25b4:c810 with SMTP id d9443c01a7336-1f83b5c8360mr41678235ad.26.1718253870068;
        Wed, 12 Jun 2024 21:44:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f5c039sm3371235ad.306.2024.06.12.21.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 21:44:29 -0700 (PDT)
Message-ID: <666a792d.170a0220.773c8.0ec0@mx.google.com>
Date: Wed, 12 Jun 2024 21:44:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc3-296-g575f43b2d19db
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 76 runs,
 1 regressions (v6.10-rc3-296-g575f43b2d19db)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 76 runs, 1 regressions (v6.10-rc3-296-g575f43b=
2d19db)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc3-296-g575f43b2d19db/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc3-296-g575f43b2d19db
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      575f43b2d19db3b233b2c7040e79a1d85f422c0f =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/666a48c190fc9ad6eb7e7098

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc3-2=
96-g575f43b2d19db/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc3-2=
96-g575f43b2d19db/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666a48c190fc9ad6eb7e7=
099
        failing since 79 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

