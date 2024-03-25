Return-Path: <linux-next+bounces-1711-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2588A1F1
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 14:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429892C38B7
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 13:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AD312A166;
	Mon, 25 Mar 2024 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="sHZxMg8w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB05D6D1A7
	for <linux-next@vger.kernel.org>; Mon, 25 Mar 2024 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711352332; cv=none; b=meI+vCDbzhXTxrdGoGD4VACHnPTI9vvUWU0nHdSj2QRZInm9ivmvPw38Sn6yxM3SqllalZKZy6WRREVaVlv/OekbcKtJlgbcBO6Gy2mrs4hVhQNu11mtx2DtxRb04DGOVBwyV8/TEf9X6XrMPzm9936CnJGxEeYB0kWoIcBA0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711352332; c=relaxed/simple;
	bh=lTmlE2FzFYiPM1DCzI2J6rLzGJBnc1uI+8T8VmXNJ6o=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Z2HAMpXnqtA8U5iQMX6mcThJ5f6wkCWQb2looUXVLuaKnCCgfFm5NrOIofyBGfqpG01Vkr8l/PCpJc5OCC39jS29gh60/Lu3xoLkFu36KwYscxFs07Bh2v8/GMsPaeGPRa/dZIn0pzhX2VNiso+STLlQCdG/0wb3YAsSDAmgtxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=sHZxMg8w; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso1950937a12.3
        for <linux-next@vger.kernel.org>; Mon, 25 Mar 2024 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711352329; x=1711957129; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LlAoOW7j57lAg48OPvhBLmInCiWkxtBFkp9rU7knfh8=;
        b=sHZxMg8wXNY6xTDpij+1Ck5EJvrH8XiGb75/9oVrm14MC+PseTvYxNIxOn/ajR6h5K
         4U+yZAqN+/BuU/9OIOng8V0WHLtItHdLo/1MaodVxFQ2UCGIN+XEgtWQhEjFNEm/MoB7
         wTWKkkcYEXb3NJ5F3Wnzas0QJva7OEMnrPqHssrX62JT5AhGKD2i9T245tAkwZl/xssa
         USxYIcSnEzfCDmyzc4KtnZtyjME6abmc0hILKebxACs79WojdrfHkhLQl06px44NfL7i
         YZ6EJ64bCmOP2b/O55YI3RYXADpwrG7aX4IQ0tliumGUyF6jmbPnlvBNxUTDukS31RwY
         w1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711352329; x=1711957129;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlAoOW7j57lAg48OPvhBLmInCiWkxtBFkp9rU7knfh8=;
        b=YAT8y2LG9Tfrz3D4nzGEn/TT7hAHYQKgZAISSNQqimOCE0FKkI3kYmnDtCTxVb86hy
         KSAZNBr1Tq1917pb1D4uaentW7jV3Vndz08n0MAOaxfpxVaSsWaoGzcIc+tBdWk6m3Kh
         KA2IAMAlpJqIh4dNdVv1AdVGDfl0vXmiL64fWm7P1QMGQ0+pEYcNYeme16jbLEOTTeSR
         ErVzC0XcHVBXa8XPxVzhL+4R6Hj8kXQxm71vWZ8fU1l5qvjuD/S42qo28ci6VlRSdhQN
         nvNlH+J5OvwlYawp3QZXdP0vokltlgzp4v0arZdhXFMegSDGZdOxP5IR5RkfVq5EqWQh
         +66Q==
X-Gm-Message-State: AOJu0YwqYeYa9228wWc9H8kMLhdkEhy7nEIUcI5P3GR2Dy6CQCAM7Ynk
	VYOWlq2/LdtbHOZRq6hyiVNP+DSeCITokIxU1H5sq4JMLnZVMeH5k6MJ/ObOkIyQr/P811vaIwO
	EqEQ=
X-Google-Smtp-Source: AGHT+IFc8OaG86e7qsOCBCdoBZlYg0ZUmbbxuCiJeIcAo4CB0fzHbXmSS3sgL4b7ENp9rfn9Fu+9Kg==
X-Received: by 2002:a05:6a20:dc9c:b0:1a3:64d5:7482 with SMTP id ky28-20020a056a20dc9c00b001a364d57482mr4351958pzb.28.1711352329445;
        Mon, 25 Mar 2024 00:38:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id nd6-20020a17090b4cc600b002a066d2d7f9sm1865933pjb.39.2024.03.25.00.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 00:38:48 -0700 (PDT)
Message-ID: <66012a08.170a0220.1699c.3aae@mx.google.com>
Date: Mon, 25 Mar 2024 00:38:48 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-83-g2c54eea3a68ea
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 35 runs,
 2 regressions (v6.9-rc1-83-g2c54eea3a68ea)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 35 runs, 2 regressions (v6.9-rc1-83-g2c54eea3a=
68ea)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

jetson-tk1            | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc1-83-g2c54eea3a68ea/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc1-83-g2c54eea3a68ea
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2c54eea3a68ea45ceef479d13e95daad73122408 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6600f7dd1d0687407c4c42ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc1-83=
-g2c54eea3a68ea/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc1-83=
-g2c54eea3a68ea/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6600f7dd1d0687407c4c4=
2eb
        new failure (last pass: v6.8-rc4-334-g904accd85136) =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
jetson-tk1            | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6600f61b84fb425d9b4c431a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc1-83=
-g2c54eea3a68ea/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc1-83=
-g2c54eea3a68ea/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6600f61b84fb425d9b4c4=
31b
        new failure (last pass: v6.8-7223-gd5f8ee808c59) =

 =20

