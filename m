Return-Path: <linux-next+bounces-2274-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91F8C3A78
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 05:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA491C20848
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 03:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3342D145B24;
	Mon, 13 May 2024 03:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="XQWueCKC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742912F37B
	for <linux-next@vger.kernel.org>; Mon, 13 May 2024 03:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715570966; cv=none; b=cGIDwiE71ZuES06Fm8xsh4V0rTCueXgZ5uwgUNoeNhdbH3nM+sZSimV9E5hcjPBIvRMuUaFdP7oHkmAhx1d4/7DQ5cV0InRPKSgWp+mEizpPoEEekvDPEnhz50Y3b7sHUbTG0KhMC0NNHtRpYkd7DQS3w2s9S7TavXJ7Fq0WMdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715570966; c=relaxed/simple;
	bh=FEntjvRDisVNfi9spduD8vmFd07RB8A85T/rWmYjLAU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=H52mehq91icQ8DRC9qZHZ1HML/y8Uthp1G0np8piV2YfOhiX8UVWee4zo0Y4yHld9YctQfHKouo0ioG1AuR8HqDyfON9Q7OslY0fDs5nCI5QH9bBeTQI//zg6oLNUvpt5NsYQI0JUrp0vIbyYoVlZ5IHL4YNC7IooLJBNLgd97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=XQWueCKC; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-23f0d4353abso2657994fac.3
        for <linux-next@vger.kernel.org>; Sun, 12 May 2024 20:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715570963; x=1716175763; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P1dYTYi6i5app4nVRaPQ3Q8kYB9Vmg15DIy91xkRpgk=;
        b=XQWueCKCEGgvGZxk2Ie3pAGyvSRguV5zIzO9BBIfsDkXL+/JG92Y/h6LFuN3USoNPT
         0ZcZ+HURFobNbb8OIbNflG24v3pn14+xBbkLoumYmOjk+z6iWXmPz1yxCRDLcwOrKU2u
         4Xo0dMjRbuBQgQPEKvv9TQc5330AubpWNV8+1yMh60kL7XQhqSMJVbIUS4Helo++2ldO
         KkBJEYGl8Hp0j2AZONIJNgrPdtEgEskElaKN/xroe4skhhzjS4Jp1EGXnvptaNr51gMB
         TByDyslF9ELmYTgwJnZWwqzWmAbbgF/luXipB1xxbAR4keKJxqJVobCB7fX3C7ECGlZL
         QNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715570963; x=1716175763;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1dYTYi6i5app4nVRaPQ3Q8kYB9Vmg15DIy91xkRpgk=;
        b=gIK9gyj412+iWThE/vaVpS4ql6V+fTFc3gIoVcpVmC7yPKmXGRo6Wh6iL5yh4mZzOn
         /eac8TqEnqNkl3tXnO0hKZaQWEydV/93j/sLrO/WolhI/91k5i8fKoFz4fpKvAKBhwgK
         rpVbO+7hk/psNBmoOcC2jhZSkzu37leZ7mE4IXYwdu3ky/ch8H0MN0N2A7YoNvThowBG
         JGYoBfNWFQxyy9TE4Z5lBqRKZpFPcGfPTeETnPWgRyTxfqo3SwU01D7zIxyUi2QrMgQJ
         MTe4OxAJOjV/0rRRGhzQMKZ121lMl5BVNoWYfq3wJ3HMgjT8muxkQecK5xaQz+YAwQK7
         ZjoA==
X-Gm-Message-State: AOJu0YxHjGAhUvuvxfcJv4aCOF6qZ69PbWXy1hdOFDD1oC8zMW7kkbpa
	K0brUoPi9t1dwSg5TSGh0VmkIGu4m+X65L3rCukRfL2cff6xiTaOuBjbHxFH/FRM7TvZSjCLtwo
	qrQg=
X-Google-Smtp-Source: AGHT+IGWMA5KNnHhryg4NPum868F7i+VVWFV4LfTQCeEULZF6UUICvqAcNNq5qkxyovqr//0F88Kxg==
X-Received: by 2002:a05:6870:648e:b0:22e:e26e:73ad with SMTP id 586e51a60fabf-24172f69ea0mr10802918fac.58.1715570962996;
        Sun, 12 May 2024 20:29:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66316sm6357041b3a.35.2024.05.12.20.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 20:29:22 -0700 (PDT)
Message-ID: <66418912.050a0220.2d510.0864@mx.google.com>
Date: Sun, 12 May 2024 20:29:22 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-71-g3d77dbcb46b6f
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 78 runs,
 1 regressions (v6.9-71-g3d77dbcb46b6f)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 78 runs, 1 regressions (v6.9-71-g3d77dbcb46b6f)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-71-g3d77dbcb46b6f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-71-g3d77dbcb46b6f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3d77dbcb46b6fd474b0a384f2ffa3acf2843e247 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/6641581efd6a8ee1794c4302

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-71-g3d=
77dbcb46b6f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-71-g3d=
77dbcb46b6f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6641581efd6a8ee1794c4=
303
        failing since 48 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

