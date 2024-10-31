Return-Path: <linux-next+bounces-4556-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1535F9B78D5
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 11:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCD1828657F
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 10:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA4019580B;
	Thu, 31 Oct 2024 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="j8kKbgRx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787E01953A2
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2024 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371312; cv=none; b=NQPeaVmSwBJRUjlUBhlUffFpeT1EG730b8nKwQAyItcPmGWtPXAhxwP8q8HHmPbF++iDrqbdRVLNfGK3bXoOfqsoRG9UkvVvCqieaXs6AnD3guqss8G3Mrtr0gSthglDUi0Ufq5JxeqM2yR/k1fE9+3gooiTzxagTBIQqFZTmCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371312; c=relaxed/simple;
	bh=0aAG1oTqR4nOl4sXBtk0Vi9UxnQ82WRJYT9c12cBhaE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=IBjGV9E+OH3Ck4a9hoZVngSYenhgNstGdpXe/vLdkSFV7XFoJR2EVQx/BehAHCGaZzC1MikEpNekTlRKg6g1LFuqLbk1zg2OQyLRGrkom89R/Zx2sDjBchNpt5qlG/4t7ZD/shwxegIVHRdVvXIId2GxaQO5hGGLll73CSvjtNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=j8kKbgRx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso645905a12.2
        for <linux-next@vger.kernel.org>; Thu, 31 Oct 2024 03:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730371309; x=1730976109; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=juYmY0iO/H9xnRSyH7fh/OV/j3VE+gdTzIt2wf/kdeM=;
        b=j8kKbgRxPL5f/jwn1tste8FVqa3K3JC1mutaVLKGuOFg53FH4+3U7LW2ZGPnBQHUrn
         7KkWEViAEYOK+R7EeyI2u8aY08tedMsVgCOBK3i/s2wH93E15meJtfGnCu3mI5pOIryI
         uXyilSVYqMTsGDPAce8zvAH5qtU0WTKIQHo25i6uwe6yBC039wM1xjg0TuXuNYIliZ1d
         dlIh8j+3YrkUTv9de/vLEf2R9Hfoz0NRG/aQd5a/DrEtkheN9JP8VhlGdHPAu0v1IE8/
         DID8cqKOWB9ddWcMinC7PcmfXDWTynv0kvrfNskbEEjs5xbVbtYnv8aw6zUNHERGGfDR
         bEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730371309; x=1730976109;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juYmY0iO/H9xnRSyH7fh/OV/j3VE+gdTzIt2wf/kdeM=;
        b=InHdVAoQ9QzH7JZU8ZSEJZsBDspTmlbAD/mcjFC9G0PrqOknMTsDZpEIX0inubZaMk
         mmTdwnrTrKTNTBvNs4QEt4GcWlJsCMNbyiBZqHZhgAt6uN5YSg50b5d3YPlJspFAsKgx
         8yV5oY+q4wTNlaoNaA+lQkDPkhpcdBYvgrb7/5S+r8onhnVAN3TJpj4c73QwHNSiC4Jx
         ErPlvMrhrFbnUYY0hnPmlK+rEyhplu/wi43HhMqmk0BV8gWYuSYrxaQyJ+0pbLejDeDp
         3vfE+23opigGpa81M2JgbTPU1IS27+MK5+l0HswvCrfzdL+THS7yibKFhIxUihEcOWdC
         i05A==
X-Gm-Message-State: AOJu0Yy/v+6KphHbiwxpPmK52kDpQ925xNGT4+ITKTzLWWbnZd3HKp4O
	ooQVhVGKERzDVF/XsUIF8g8tXqNJJYPqc0Uf+9p0xQAe3W7NJDzmopjgUS9UoDe7DR+v3x9Cusk
	D
X-Google-Smtp-Source: AGHT+IEUXjNXBbGXCoS23S/PVCUk7QPhUxN0Z3x9dib2u8E08AVMfMoXGA1LNVa19fO6d/y+0fYFUg==
X-Received: by 2002:a05:6a21:398e:b0:1db:915b:ab11 with SMTP id adf61e73a8af0-1db915bab14mr3483595637.24.1730371309578;
        Thu, 31 Oct 2024 03:41:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee528e9ddesm57290a12.42.2024.10.31.03.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 03:41:49 -0700 (PDT)
Message-ID: <67235eed.050a0220.150f7f.02ef@mx.google.com>
Date: Thu, 31 Oct 2024 03:41:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc5-352-g2188349a4b9e8
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 40 runs,
 1 regressions (v6.12-rc5-352-g2188349a4b9e8)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 40 runs, 1 regressions (v6.12-rc5-352-g2188349=
a4b9e8)

Regressions Summary
-------------------

platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.12-rc5-352-g2188349a4b9e8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.12-rc5-352-g2188349a4b9e8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2188349a4b9e85530de57dbb4fff01e80942ac1c =



Test Regressions
---------------- =



platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/67233170de6d15087ec868a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.12-rc5-3=
52-g2188349a4b9e8/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.12-rc5-3=
52-g2188349a4b9e8/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233170de6d15087ec86=
8a5
        new failure (last pass: v6.12-rc5-310-ga617ead022203) =

 =20

