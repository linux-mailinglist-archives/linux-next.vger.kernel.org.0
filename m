Return-Path: <linux-next+bounces-3528-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D18EF967ED7
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 07:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54A5FB215AD
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 05:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD9D64A8F;
	Mon,  2 Sep 2024 05:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2pe02cvK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C0145B14
	for <linux-next@vger.kernel.org>; Mon,  2 Sep 2024 05:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725255118; cv=none; b=qwKJBH/Pdc4nX63NYYEH7cp2Cy+RSeKkJP7qziSzOafUUMPpwzPats2v30oIg8jcIFWFFatgfS1HtbX3KzlcLlYeNZ1PD6JCZ18KBBp+y4TCn4sF5enWAj7SYzgCGGtPQz4L14kya5X5NGC60kkL5bCeMQLaAyDSOWC19AgQeD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725255118; c=relaxed/simple;
	bh=txGnXNeOHHCy6REX48jrEUUgIQIxNEWrqsUidGtVX+o=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=uA06JTs77iNLuG+zfogJIRM547I8f9qzWBwxOBJbblcQfJIl8+FYy2V0NKvZdAVJKibZi5R7e8yXD9LXfKDlKwYlnTT7pUGHFdf8OZb78W8+NQHWscXf9/tdLpaYAyEmyzPXT/pnsyRpiTjKPv3Z9PzCDS9NolAx0Xwo7e5KY+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2pe02cvK; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6e7b121be30so2187203a12.1
        for <linux-next@vger.kernel.org>; Sun, 01 Sep 2024 22:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725255115; x=1725859915; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FeSx6P/vy9XKgm2HOU0BH9AY1jWFn8rHcThT8XqdaqE=;
        b=2pe02cvK33/NMuVIs/Too6olNfQWSDX76YpcrPCwNu9TbQHxBiu4mrs7pzB5w/di/E
         FND0RWIzFIw1x5nxRbowT3VkYdvQ/TyB5EwS7N1O++yvx6k6gx8peTHeV/E4Sdk0jEth
         07b3xiIOoFWWGV0ORx5nbQ+Y7lPYQC2w69LtcdG1qHKfYHOMxaAlf1Z6IAnD1hUlxZa1
         AokD674fhuwBBcyHdDh3oBYseA/lWpdjIxwPudnQE25zseYaLd4o8H9y6dy5CcybUo5g
         SwRC3Yxnt1ikxoDdRsCpVScR/Ggxqh8+G4cGxMwXwTsh6774CRS4+4XAs1N20p8aQCpP
         Ws0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725255115; x=1725859915;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeSx6P/vy9XKgm2HOU0BH9AY1jWFn8rHcThT8XqdaqE=;
        b=fVAAzptplAmb6lLR4hdIFYvaxHJDD2gVzNNzPWJPx1WeYAMaMaWMTS+UQwv9OtudG0
         8QjJJT+/wWF4ZwbSjPHs6D7Rz2mka8/mLZpxpCZcs3b5bDxR3Vn7dg4ZZAtRWY8weLce
         qSij8Mt5MfjyuUZh7n84l6cW6ePr5gOVSfl3K8TM6RaO7Lg/t4SV6TQ8G1LGnwde9s+A
         wukUP7qY3LyAUwrmXcwmJrXl+2g86jESZ4OHo/TI6w5G20Ceihit+G90VBXg1FOtBhTa
         4k0jqhLQAGi8JdftB+YBfVNpH0FHC83Kv/ls4sMPRXdh0HNAMIWK4MLjfu4q1QDXzmTe
         f3lg==
X-Gm-Message-State: AOJu0YwhVW+ZyZvPXjlpNZHKhkk19tPz86VRBXxPE11fufjEsiLmKbQx
	yVV+MHeg6sIarBJeFOQ0CZFx+ITudf6y8PXPgNmo2YgDRP/zm0/wzc1O3MDHF4YbDK55adz0Xzk
	X
X-Google-Smtp-Source: AGHT+IFu2lcTwNCnDH189laSHV0XVCCSQhKCHmPL7zsZ0czZ6YaVu/q9qcF0jGqaBtzVgehbyHJO3A==
X-Received: by 2002:a17:903:2b0f:b0:205:5860:d7ab with SMTP id d9443c01a7336-2055860d959mr29491725ad.62.1725255115421;
        Sun, 01 Sep 2024 22:31:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20551cf10dcsm25657045ad.14.2024.09.01.22.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 22:31:55 -0700 (PDT)
Message-ID: <66d54dcb.170a0220.1004d7.5f12@mx.google.com>
Date: Sun, 01 Sep 2024 22:31:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.11-rc6-167-gdb37105e292ae
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 46 runs,
 1 regressions (v6.11-rc6-167-gdb37105e292ae)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 46 runs, 1 regressions (v6.11-rc6-167-gdb37105=
e292ae)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig | reg=
ressions
------------------------+-------+--------------+----------+-----------+----=
--------
k3-j721e-beagleboneai64 | arm64 | lab-baylibre | gcc-12   | defconfig | 1  =
        =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.11-rc6-167-gdb37105e292ae/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.11-rc6-167-gdb37105e292ae
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      db37105e292ae6279b6650c0c64062440064af26 =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig | reg=
ressions
------------------------+-------+--------------+----------+-----------+----=
--------
k3-j721e-beagleboneai64 | arm64 | lab-baylibre | gcc-12   | defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/66d51dc843f9936a33c8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.11-rc6-1=
67-gdb37105e292ae/arm64/defconfig/gcc-12/lab-baylibre/baseline-k3-j721e-bea=
gleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.11-rc6-1=
67-gdb37105e292ae/arm64/defconfig/gcc-12/lab-baylibre/baseline-k3-j721e-bea=
gleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d51dc843f9936a33c86=
85b
        new failure (last pass: v6.11-rc5-385-g5cb02e7ad8fc) =

 =20

