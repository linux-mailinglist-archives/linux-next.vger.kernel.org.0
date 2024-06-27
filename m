Return-Path: <linux-next+bounces-2696-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD83091AF5A
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 20:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE1771C211C4
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 18:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7776199EA9;
	Thu, 27 Jun 2024 18:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qMuRcU2J"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6650622F1C
	for <linux-next@vger.kernel.org>; Thu, 27 Jun 2024 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719514496; cv=none; b=gR9rB+OJeHviHi4q1TaxOfrD/n+UpyZp0su9aywcLTvZSW4De91bp+HGxJHUXLQniytRDaxCtJa6RSPxz4jNBL30NLp84eIaj3+GDkbAIiFpZCQGniKkg9SCI3FbMTXPg7gM5C/cBcxxJZQYlcchynzimyyERjKJppJNuVePW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719514496; c=relaxed/simple;
	bh=3L5Js36epTaqUIn7VGChnFVsO3eNclhCvpGvUf73M6g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=L8d7sM30bLpZmZ/BK0BIRdrbisb0ik63nFSwy5//UChQiKvhsZx+pS0UF423dW7T7Th+TGkrmOUr6g4DSJVjUNhYJnabqLva35Riy4FdO+x0IYt8+lPugkKUwOqQatog6fqbirrw+BX8+PBsXIvzGWYmDnZxdgReUrHrtlrvhsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qMuRcU2J; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so5149673a12.1
        for <linux-next@vger.kernel.org>; Thu, 27 Jun 2024 11:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719514494; x=1720119294; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GKrXpZdZcBVV7fG2HYi7wBfXFnljJ9XoDcrbStpgNmg=;
        b=qMuRcU2Ju7gcgvkfIozQx1Kn/i+0BPa6/Wtcz6ZUS+RW9cQoZdHiSLQqHAQ1z4cagv
         DGWnLXqoUIQlECzfwo8WBSPBoSYDSEYIHiyMHUWVbIMgPoIofozM/ue4J2tw5zio9awS
         NHNtlkA5Mo3y+3opM5IoZc8dmOn8t50UvVgZZSn/a+SaRHFFIZoc7EXH8b8z3hTwc5qA
         JhBTD6ZxJgNxkY+fbsDdDKOwgiG9sJGOt6VjNRbkKnc7B5w24Tcw2WSiYWIvGRCKUy9q
         y67jyavTFqa12HnrUGMERTFRLR8D4sJsKUAwVyjlQFIOrhpDoNd0g4eSpYuDEVU5ssXd
         mtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719514494; x=1720119294;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKrXpZdZcBVV7fG2HYi7wBfXFnljJ9XoDcrbStpgNmg=;
        b=sUxRLAgUq+VZkIie36AnjVqFrznAojtvhtn+hiEtM+ychx8nbD8PdU7U2DCwPYyMGM
         7kX8pSzG3LDHxAB4q8OCx3rewYvt+8K1mqnYmkzSl4Snr8Edxt+v005PSNJYY335RNkP
         oqipltUyaRu7pJS8wCwyfwlpOeThfyZfrIJzUW4pQuxpUb7a97Oag5J7FGB6hoflhZOa
         vJel28TfqscGB/qrQBzPqdrHPZMdsV4rEZRkZNNGEExq5jFb/3YVumzq8imiy2DTCHOC
         Txw+XlX01RoCxTYHhfnabKyU/fIBM7HySHa4puF6S5D+9NbSFjNGzIi3g0XccY9pYs9l
         9/GA==
X-Gm-Message-State: AOJu0YzTvkaX14Dt6gA4s2QQKvvo9l/PrqpgPO3de+FXVk2GkQD7lOrd
	ejC9K3zxBXlx8IFppy/YfeSTurC5SS/FQrmyZ6LW9AGEy1cyFOuVHJCi2lWEEn3xxZdQrJKMK8f
	q
X-Google-Smtp-Source: AGHT+IFBHAcwwMijbB2zyVnFSWwVB3lFfOzYwf/+l9yRYZILQZ9jSPRIdoxhomUMZSzzi0XvPMA8iA==
X-Received: by 2002:a05:6a20:85a9:b0:1bd:1ab1:e90c with SMTP id adf61e73a8af0-1bd1ab1ea37mr9050111637.15.1719514494181;
        Thu, 27 Jun 2024 11:54:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803fc8b9esm50432b3a.118.2024.06.27.11.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 11:54:53 -0700 (PDT)
Message-ID: <667db57d.050a0220.e9a39.04c2@mx.google.com>
Date: Thu, 27 Jun 2024 11:54:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc5-354-gc419f7fa3634
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 68 runs,
 1 regressions (v6.10-rc5-354-gc419f7fa3634)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 68 runs, 1 regressions (v6.10-rc5-354-gc419f7f=
a3634)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc5-354-gc419f7fa3634/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc5-354-gc419f7fa3634
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c419f7fa3634433539b563721ad26fada5b3cd87 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/667d828ffa50b153b57e7099

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-3=
54-gc419f7fa3634/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-3=
54-gc419f7fa3634/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667d828ffa50b153b57e7=
09a
        failing since 8 days (last pass: v6.3-10703-gb3f869e79cdf0, first f=
ail: v6.10-rc4-262-g1ce98b2c2d5b0) =

 =20

