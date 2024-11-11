Return-Path: <linux-next+bounces-4732-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7449C3742
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 05:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABB991F21137
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 04:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95D14B5C1;
	Mon, 11 Nov 2024 04:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="pDpkJSm7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F032C8E
	for <linux-next@vger.kernel.org>; Mon, 11 Nov 2024 04:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731297913; cv=none; b=rpXc7BuSqc/FMos8ADMHo7xsxriFhNPUcGXF7eanqPxHzPe7DSm5GRDIA7ZUGo5xiyiVwWECtxELZ5LNSv83ffTEyQqyhuow55nXYMvofQM/ZYpI0/L6tqLFJwnYSOnMi45Hderi4F2Kloq3qrKG7E2TVw8reQMvT68uHIJpEz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731297913; c=relaxed/simple;
	bh=cuo+Z06wzmkF951dCw/yj3c7kmiQEphuZC+HdNuZAd8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cNxezc4F7VwMShQwfhmlc2K0ApBwMf69w/rj9tgwNn69VEtKc7qNJQK1j4JOX5fHMDGEDhwDtRtzoq6w//zYAZMJqEP137CzxnVJOqkRhXJV4SscGALd9qzRFpNYN7fQGuQ5WUg88EzRlYOy3EuCmIHxzUU2hB2tdQvhmJHc3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=pDpkJSm7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e52582cf8so3199569b3a.2
        for <linux-next@vger.kernel.org>; Sun, 10 Nov 2024 20:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731297910; x=1731902710; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rWuXyiE9f0ZMujDckUvxTlWGuXn/H2/zJMrwx+xnT9o=;
        b=pDpkJSm7ZCIjwAgVxxoSAgWr1vmSnDUbXNtmC77soscil0srccJUfMGSqrachxQFYB
         9/bmVvoh3dh+882eT4Rpp+4jAcaIIAzh+DINIMe4MiUi3higVpeVZtt2q3635KfD1EBV
         WNgTNPuoQ/SJuuxb7bMm2gWs3RH5c6R9WZDjDMDL6XaKBdDpuEBD5HV2XW0mzn5btlcn
         w1uuYhwCIJKkpCW3SyzFbfl+2bDFEh5QTs6sP9OEv4fUkGhRCPTpU0Z+stUF4eGC0ji7
         qK0tUTfk6t17OjTPz+ZGxOHnPSzzGl00hLwvHyCPhNIvOCJWBTekJn945IyVUV4g1uEe
         rrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731297910; x=1731902710;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWuXyiE9f0ZMujDckUvxTlWGuXn/H2/zJMrwx+xnT9o=;
        b=pmQf/moViNc6XqN+SX5KIWE/mSsz8jVIH3RagAo3h3l0bc+RCYBrgjaMXlE/A0VQjW
         ADZev4D+tG71vnFXoGkwHcrbsdczHjuprFJV8U5+b6PsxxLi7uQJ1BZPgd6ZTYHy40of
         4FXGYfaaEk5C+EVDfYlY5fMMRSOzOaVgad3DzUS8ali6BRSrpdQmgzJ8cUbv/BmnbSnX
         wUmjiTcttVYeRMamCUtdHxKDiduhtt44ffp0vGy5XJW8wvtFr1w+YKRm6mjpafltnM7i
         eSaWTWONZw1B+irfYfibkOIuQmVPfeAaGDi9xRjbbn19enpii1sw/D/INsqJ3FzUFi7L
         2Q5A==
X-Gm-Message-State: AOJu0YxeukiJKmBoJ+BunB1FoelaE8l2CbMkfgbcNeBQLt8BmSlnewmf
	VGDTfBMElY0dO4EHaRkVtDUjOjRWOBqcN5CMRw1BXw4es2/biSE+rtUDeP8F6DxwtkNLYjfpJmu
	4
X-Google-Smtp-Source: AGHT+IEn2dieLcxZyJc+GyvzfGIdjjz8FSWkTp9gYC+phfZ1a9Gi8ps14xrms9+ow2hKayBP5JYKrw==
X-Received: by 2002:a05:6a00:1150:b0:71e:cc7:c507 with SMTP id d2e1a72fcca58-7241338bda9mr15925152b3a.23.1731297910310;
        Sun, 10 Nov 2024 20:05:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078c09f9sm7985458b3a.80.2024.11.10.20.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:05:10 -0800 (PST)
Message-ID: <67318276.050a0220.39db27.02f3@mx.google.com>
Date: Sun, 10 Nov 2024 20:05:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc6-415-g0e90fad093db9
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 43 runs,
 1 regressions (v6.12-rc6-415-g0e90fad093db9)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 43 runs, 1 regressions (v6.12-rc6-415-g0e90fad=
093db9)

Regressions Summary
-------------------

platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.12-rc6-415-g0e90fad093db9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.12-rc6-415-g0e90fad093db9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0e90fad093db9dfdb0f09edaa8e08d724bc58fbf =



Test Regressions
---------------- =



platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6731550bcce1cedcfec86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.12-rc6-4=
15-g0e90fad093db9/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.12-rc6-4=
15-g0e90fad093db9/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731550bcce1cedcfec86=
86a
        new failure (last pass: v6.12-rc6-326-gaded6a2e0817) =

 =20

