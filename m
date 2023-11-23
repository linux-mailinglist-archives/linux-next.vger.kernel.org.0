Return-Path: <linux-next+bounces-44-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8897F581E
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 07:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2E192816EC
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 06:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC22E54D;
	Thu, 23 Nov 2023 06:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YM7B3Ac1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B34191
	for <linux-next@vger.kernel.org>; Wed, 22 Nov 2023 22:22:44 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso555158b3a.2
        for <linux-next@vger.kernel.org>; Wed, 22 Nov 2023 22:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700720563; x=1701325363; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JpRyz+81Bm5YICAG15Ya4vel/d1LMMiW3171dyXMNZo=;
        b=YM7B3Ac1ZJIWEgtfu86s5+5AF/h5TAQ+rLac9umpZBuzuGc9o45e4sLpbFUGqgTIMz
         BaL2GB7T9vz1t7ujaoy/MzhoLhHrZTyp+9p5RkQtaaegFe+kQSZsWuhGJV/TgH8+jMe4
         Mh89Z2LE8eFpBdGztvCguvhzKmIJcgyrcN9HMvUjpEbcQCblmCOhcPcauYwyw6mkqQS+
         yPU3J7V+TuOoUsHD4L9KLjVJ6uNJ/dspNoq1H7bs5gs0WhTJYCdpx8yL5TQ5KZOnx85L
         DtFo5YXZGcm0AaTiaQVQnltW3zt11EtCgYbDvydoRmq0dEE/LSYztwu04uo2vHsDU788
         6xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700720563; x=1701325363;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpRyz+81Bm5YICAG15Ya4vel/d1LMMiW3171dyXMNZo=;
        b=XAhbws7kr7ekz6lLNZyeTqAUelO3o5s3gQzcYoCIjizfUiZQYxmH9H4HWQY5hivRXZ
         e0Kmv3Ltvo0O9UAbRzZUkFfhQqcWwLZSxXoyOZ7BARhnjqqZhloNYVwyxHVtNDPt7GrV
         oTZ3RcIyfkKgdTtthzxMcVaU9kpMs2g/C/0V7fAPLBsZMyXmESt4fcVcag5VQY6cOX21
         iaE5nujkDD9EY3minsVWrxGyMD5ant6qg/TGP0M1RyoRVf+acK2v+6FLjUAOl+LXOFlm
         hJrau3fiL/lB8XRWFA++TdPGlv//PyhMht7kAw1w4len823ggaB149p23e/CXRiKYvIX
         yZsQ==
X-Gm-Message-State: AOJu0Yw/FpeFJCYTn7LI1mH1bvGFPClVyj3PLtRbXL67DkFp2I7SHdff
	E6rcLL4UHEZQZv2D/FvAeZwGYrikhwvGhhpG6eM=
X-Google-Smtp-Source: AGHT+IHfEqRQ5itxOdf6IGye1arN1TG30uEBpa3EVzp0vsnhAP84TsXlzlHTZz7M3LPnH3grLYQZXQ==
X-Received: by 2002:a05:6a00:3a1d:b0:6b1:b5c4:a8b0 with SMTP id fj29-20020a056a003a1d00b006b1b5c4a8b0mr5165155pfb.23.1700720563429;
        Wed, 22 Nov 2023 22:22:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ei44-20020a056a0080ec00b006c988fda657sm493530pfb.177.2023.11.22.22.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 22:22:42 -0800 (PST)
Message-ID: <655eefb2.050a0220.16683.1485@mx.google.com>
Date: Wed, 22 Nov 2023 22:22:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc2-250-gec797c020fad
Subject: next/pending-fixes baseline: 92 runs,
 1 regressions (v6.7-rc2-250-gec797c020fad)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 92 runs, 1 regressions (v6.7-rc2-250-gec797c02=
0fad)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc2-250-gec797c020fad/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc2-250-gec797c020fad
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ec797c020faded71434e2416188429f220cd7e70 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/655ebdb07abf2691187e4a86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-25=
0-gec797c020fad/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-25=
0-gec797c020fad/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655ebdb07abf2691187e4=
a87
        new failure (last pass: v6.7-rc2-192-gd636cd8a5dbf) =

 =20

