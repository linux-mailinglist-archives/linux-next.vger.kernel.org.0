Return-Path: <linux-next+bounces-2562-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4BC9097B5
	for <lists+linux-next@lfdr.de>; Sat, 15 Jun 2024 12:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739A41F21FA2
	for <lists+linux-next@lfdr.de>; Sat, 15 Jun 2024 10:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB022CCD0;
	Sat, 15 Jun 2024 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="L8FLdpDr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3110A11
	for <linux-next@vger.kernel.org>; Sat, 15 Jun 2024 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718448116; cv=none; b=br+1kIep0xnMzX2gyq85SuXoMaf0PSyY8C2p3wII583iiWimNiWOwJLBsIQk7clPyVcnzAZC2XAgcrtlSgXrcuXkvALTRVVQrlOuS1J2m1m21vSsO1mCQnWnQepGic4mwBi5eLcDr0/CqoQSvxjkgq1KbRFVHmBSqlUm0LyjSoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718448116; c=relaxed/simple;
	bh=HmlEh0eSggOV2IwsdHGIahH7TDF/bZZxfE7F4LDE4r8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=XTBaWoF4zzZ8/qQkaIy5Q6tXcedfSB4kB4WJfX9WkMGyY5OeRxtApTFXFF+JHskQe0HaHh49oXIiW6WfO3ElrtAVwyVECFVDWWAqRMQXSqvERraBD6oZ9Ljvd505dfU3WQHZcQsMalWrbTh1xZsTWWniIBfFfI1ZmdA5iePGROg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=L8FLdpDr; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7046211e455so2264989b3a.3
        for <linux-next@vger.kernel.org>; Sat, 15 Jun 2024 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718448114; x=1719052914; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eispkF4wTDMac3ONRxfquXJ9hBmCDSXwx20D3brziIc=;
        b=L8FLdpDry2C1JeWKnqSvx3KAjKYm0gPC0yD0UH1h5RZdpPwx6DoJQT0yGbjrLKx6bw
         HLxPUHpyLqXx0H1MKUjGxARCN68PDxCplXBuWh2D+NQa3aIp5Fa8gYhx7hCZwrCx74kp
         pe+n2+UWA/b0YB7n90lBnC0UGg90X+VLv6G3VR/OI4KzgdImHvo/AsBZxWf4d47FgIN3
         qga49t4GIjNFrfHFkDkGKx36BycLoWMlAu6oNanEXdbAWA9Ed9cXSG+luKMyEft4sLpI
         KiibAvoqFd4Fjb8xgwNYwRxrLpnEgnElngSJbZvMAk30kIy00mOmoZwTT4z01DOXk8U2
         aK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718448114; x=1719052914;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eispkF4wTDMac3ONRxfquXJ9hBmCDSXwx20D3brziIc=;
        b=NO8KFt4RfgEeWCz/i5mNyIWKlDIFm3IRzmdC9kN8DPqqPOEmtbuHoMjMbL1eP/gAb5
         iD+p96TVAn9ga/aCa0wtFnmTZlA1NDDm35Vio9Az9cQ4XuNfaa1UoSppfS2ZiQybdNIp
         W7FOW+MU/CsFpUOFUL3WxjPq0s5ZmhjWEj6zyp8M85qfu+jvTLmQqpOAZdO+66wA4j4O
         34sa9ssjDJ3mrXvtEVay2G2QXdWSRE3QADUUlDsp9COjp7cHvAIgxaAtqjeDFFoi/oYQ
         GJQc8PsTltrfK+X1fzTr6QgQPvMsPIQFLRbO6ea1y9rK5hzXMSCMdMvX7dQ4Y1jXEut/
         4E/A==
X-Gm-Message-State: AOJu0YzVjB6JSHDPSVDUUWdBsMXICGdNB09F1Kmhq+4XxunEAbNmVuMI
	nk3BppiZX6nsxUfy8En4Oir4eIldWiuRxeHBKe1WCPxUu3lrEuym2Qm5rwkjP1a01LXm1Cmv5DF
	X
X-Google-Smtp-Source: AGHT+IFr9yl8u8VvU6V3o+3yt/G8f9NB0uYYa+QZ+PhI6neHlLyKq5ARzfFToMnOxwEDqA/RQ211AA==
X-Received: by 2002:a05:6a20:3948:b0:1b4:33c0:4a12 with SMTP id adf61e73a8af0-1bae7ec69bemr5866776637.17.1718448113497;
        Sat, 15 Jun 2024 03:41:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e80f01sm46903255ad.114.2024.06.15.03.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 03:41:52 -0700 (PDT)
Message-ID: <666d6ff0.170a0220.172eb.dc0e@mx.google.com>
Date: Sat, 15 Jun 2024 03:41:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc3-296-g575f43b2d19d
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 78 runs,
 1 regressions (v6.10-rc3-296-g575f43b2d19d)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 78 runs, 1 regressions (v6.10-rc3-296-g575f43b=
2d19d)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc3-296-g575f43b2d19d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc3-296-g575f43b2d19d
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


  Details:     https://kernelci.org/test/plan/id/666d3dd5d62673dd8d7e7071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc3-2=
96-g575f43b2d19d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc3-2=
96-g575f43b2d19d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666d3dd5d62673dd8d7e7=
072
        failing since 82 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

