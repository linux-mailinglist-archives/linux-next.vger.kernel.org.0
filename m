Return-Path: <linux-next+bounces-2138-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A25E8B93A7
	for <lists+linux-next@lfdr.de>; Thu,  2 May 2024 05:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 292912830E6
	for <lists+linux-next@lfdr.de>; Thu,  2 May 2024 03:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B31918AF4;
	Thu,  2 May 2024 03:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Q+UuWVJt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C4D171AD
	for <linux-next@vger.kernel.org>; Thu,  2 May 2024 03:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714620826; cv=none; b=UfLomfdtue6ec62k+xnGiRjPNj9Rut3H3RhEXEkBSlkN2G6+jhinI+Nqv738AvMLCLEDqdnhRiEBMhCxoJluhEUgb84DW89P8jvz3y0AsmCdQV3C+9WsByeEmjdTiiYrAREoJ3HzfKP7l9SuYXFRY5+YFWhS6CxYSYy6fSsJeR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714620826; c=relaxed/simple;
	bh=nmm3sCvcZtaAzE/6uYCHxzcpc3NFS77PRBMAqJOVycs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=BKDY/DVfyGdTODU3DE98OW+0O7+OcqI36xPEz8JzXnEymRVW84D+VxYwl8IFVbWVw6RkqkeGd483qQ0tJFMscTkbvX86+wb1JIsbx3N0z7l94vvmvda0/82OGvF5B6PWKnSxo4k1rC6DlhJfYedF+mhotURuWrnewrSCqXqrHbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Q+UuWVJt; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5acf5c1a2f5so4815848eaf.0
        for <linux-next@vger.kernel.org>; Wed, 01 May 2024 20:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714620823; x=1715225623; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=murF8YkPDDVe5nHuwtv+8CQeyvGZXwNcEHenDVHJp6U=;
        b=Q+UuWVJtLW+eHM5pifMauSTi6DAPQ41zfwlI6yCU0+A3Ncxvnhaceqq9EhzqtPzBa9
         cIaqgSlNjfFkkBqFtSSzsk+iOlxaZm935twFtNpvYDrrJ6tlTOBHw/5NrxMIeU5O7w4J
         0f8BM7QgUr4Rp+OQCH7p+ff6I9P8zi6LgMB+ldqlCih0yWDBmbbRE+SdhWRx+Je4xURn
         fiFNx+lnr2/RSQjD8UuXdoGUIGfPzJ3lM9eyW5/Nz9/je94pu6n8MIuIp6d/LNvsjBVo
         ABZv/rCjh5sQjckR8RnNYDkMq9e70kqGIIvuuL2Gh89i/RoCacC0+sALFK9ffeKK5t05
         5JPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714620823; x=1715225623;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=murF8YkPDDVe5nHuwtv+8CQeyvGZXwNcEHenDVHJp6U=;
        b=cEjKnOildf6z1NDVMEmU9564yKiyOPCk8RFBN/hNmtaRglKorAz83N3vhayQ35/9cm
         K4e23h9E2hZMXJGTRE5dfY7gNr3juO+gAo1mm0PuPpnjqOWgpVVABklKAl9GD9a2YX2i
         FtvpzANp/Q4AkeQu9BoQ0WLvY9dfdT8aB2JxZSVBsmfsc061OXtoo6cUG/x6/POtTorN
         3i/nBq3MfYkzmEO3sPOIJeLIRwK17KGMrLYQL8+mkyIWUTImdgY/pG9XE5KUBvK9JeR7
         p0WwKnsBh/EjoMhn2WxW9mmjIUkITH9OfWN3wGgrGiT/BSPWoHyaIybKKrdZLz4qaKNs
         e17g==
X-Gm-Message-State: AOJu0YxH5OH0YzXILa1zuCPcn0Nyi+gpyjXhEzf0kQ3iiu44T198WlPs
	aJMnkwQmyCQVaSERYSbDxxoLj75NSUB9RkfuUkVx9bd2OYD0U9/jUp6udH4M/naKuBYkSKzYEPu
	YQQE=
X-Google-Smtp-Source: AGHT+IE+uiKg6BSY1vt18Xz3rq5pOwUtllSDg/gyqQ6774/X8QHEUQL+Jf7JByKrija+whJlKe/Kzw==
X-Received: by 2002:a05:6358:8090:b0:186:e49:2f21 with SMTP id a16-20020a056358809000b001860e492f21mr5504293rwk.20.1714620822983;
        Wed, 01 May 2024 20:33:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e18-20020a656492000000b006089cf2cde5sm107128pgv.26.2024.05.01.20.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 20:33:42 -0700 (PDT)
Message-ID: <66330996.650a0220.f0dcb.04b4@mx.google.com>
Date: Wed, 01 May 2024 20:33:42 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc6-269-g609939ebb81c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 77 runs,
 3 regressions (v6.9-rc6-269-g609939ebb81c)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 77 runs, 3 regressions (v6.9-rc6-269-g609939eb=
b81c)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =

k3-j721e-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig  =
        | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc6-269-g609939ebb81c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc6-269-g609939ebb81c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      609939ebb81cc404d3b90ce94838f6edb5c599ed =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6632d8bc2b45e477274c430f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-26=
9-g609939ebb81c/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-26=
9-g609939ebb81c/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6632d8bc2b45e477274c4=
310
        new failure (last pass: v6.9-rc6-253-ga94c31c73ac1a) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6632d67e3b71d96fdd4c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-26=
9-g609939ebb81c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-26=
9-g609939ebb81c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6632d67e3b71d96fdd4c4=
2e3
        failing since 37 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
k3-j721e-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6632d92c2f473d2e434c42e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-26=
9-g609939ebb81c/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-26=
9-g609939ebb81c/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6632d92c2f473d2e434c4=
2e5
        new failure (last pass: v6.9-rc6-205-g3e8ecb3dccc6c) =

 =20

