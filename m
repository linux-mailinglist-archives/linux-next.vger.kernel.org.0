Return-Path: <linux-next+bounces-2707-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F058291C500
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 19:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A34B71F214B8
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 17:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879C41CB30C;
	Fri, 28 Jun 2024 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jWd1C43v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA614CB37
	for <linux-next@vger.kernel.org>; Fri, 28 Jun 2024 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719596075; cv=none; b=DDVLuc7f3Ol0Sd+uXRTzg8OGcrdo+rBHKdy9k1M/GCZZEyXHPpkT3b5dadNEs7vtyAMMQ5v2te1zj2vku+mQe2NlyafgmnAouXdIqcSK4Wu4K9ntCNn3mN0Yf5oU84l6D32ZMms+xNTdGxouG5TgKD1WXn8dSN1bIwMkB/lXeAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719596075; c=relaxed/simple;
	bh=+8JLvKOAshxKUjVfGw4dgBKKEoxU5aojGIIDZ3Ty4Co=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=TL7eCfNiIp2Zd3cUzcw0TIng2uYkG3fWFDR30o4HHdsm4g1dmOo1tVv2j7h04cNEjpWBO+6hm2g1AeXkK6FhN8RQNwpt9a0ui+LDvJF+7HkwyajNJ9G5KcQQoRSQ1ZNUjBVauzFnFb8yRN529ul/6W+uO/JCuxfFrxVtnSx7HFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jWd1C43v; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fa0f143b85so6477265ad.3
        for <linux-next@vger.kernel.org>; Fri, 28 Jun 2024 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719596073; x=1720200873; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XdZtImSFH3t1iVfc/PYIRLYuk6NsWTfy5G6UsuI/GZk=;
        b=jWd1C43v2N1b9pBZ7LLd7osnIGogTTHGvOlYW2ibr/2OcFIi0cnK0YDCtDf1/qKkqC
         FwtgIMovTN7QvfyCqmsClJSkum6VblXtg0ARASFlzw99cP28gddHtYRomVbCJvHyBnqp
         UOIgbFapgJsfc21ZVsWPtge4OjeXiGxtilRI+7eepvnKCFglI/mxpXWNKR15qYPo5vZd
         7Fz7OA76vBVC4fMBcWiroLGOW9G4xCxNGHg5lIdWRp/qWcBCifAQ5DMcwyl9Q2sR016d
         8tUo6tG79vjQviSXCDmmbTgdRqRS4zprmk9xd9MCMJKjJ8GXE5U+SghCD5UzdoKbQ4KT
         Mrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719596073; x=1720200873;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdZtImSFH3t1iVfc/PYIRLYuk6NsWTfy5G6UsuI/GZk=;
        b=J/4GakZHfi8I4cDo9WpvVx3PfVb/f3PrWMYyzBnuWZjXm0DqaqsHvkdhULQBP59G92
         F5iPd4x6kmZsy/Lv1HPf5j6bPRKUsmZ4xtrmeFxfa4khKLohCF3GkJpVS4HFzcduU6Uh
         HEdO0yZtxv8YjNbbKLy+9PQQVR5mxTETiW8NeVvoSQoDaR1HxvxkSdQY4IAW9dT9Ys3w
         FFZHp0h6v3xbwodd/I6CloJjA+THjoFnaXcsKPksoBaTPJ4+tgGAtOU29kdFO6Gqehix
         AMT+/g6f5oolfMKHMBQl/YBQB1D8MHRC2j0E0PLyhd/kz7rqV8vRFQ11xIwTRQ/OtN4j
         7Rlg==
X-Gm-Message-State: AOJu0YyLmMTO3XnyXryt2Ciqh3isewS1Pr8n3eQJURKNyxNossnATU29
	wcKPTxQHoK7ZIz3vR8rJrjtfD53bAfhNx4dd/TilIsGutuPeuhuTIhjVNTVyCOteKLhydquLHSV
	m
X-Google-Smtp-Source: AGHT+IH8REofM4uYW4p2l1YUjMbla7AkmhcPy4iiIpVJp2wbWraVLoNqr23/ZUe/fi0Id/w+bRhDWQ==
X-Received: by 2002:a17:902:e74d:b0:1f8:6e1d:7f20 with SMTP id d9443c01a7336-1fa23f1d2d4mr189345685ad.44.1719596072617;
        Fri, 28 Jun 2024 10:34:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c8d8esm17928125ad.47.2024.06.28.10.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 10:34:32 -0700 (PDT)
Message-ID: <667ef428.170a0220.65411.6f45@mx.google.com>
Date: Fri, 28 Jun 2024 10:34:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc5-405-g7aa7d4559632
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 77 runs,
 1 regressions (v6.10-rc5-405-g7aa7d4559632)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 77 runs, 1 regressions (v6.10-rc5-405-g7aa7d45=
59632)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc5-405-g7aa7d4559632/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc5-405-g7aa7d4559632
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7aa7d4559632edf7cc109be084cf98b4b17acaa5 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
jetson-tk1 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/667ec0d40c200260ea7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-4=
05-g7aa7d4559632/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-4=
05-g7aa7d4559632/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667ec0d40c200260ea7e7=
06e
        failing since 9 days (last pass: v6.3-10703-gb3f869e79cdf0, first f=
ail: v6.10-rc4-262-g1ce98b2c2d5b0) =

 =20

