Return-Path: <linux-next+bounces-2972-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860D92FA54
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 14:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 961841C21E03
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 12:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D2915ECE3;
	Fri, 12 Jul 2024 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zo8hH4So"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221816EB79
	for <linux-next@vger.kernel.org>; Fri, 12 Jul 2024 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720787580; cv=none; b=oovZAId+a5S3NexP3XV6OqM50nPZ00Af6H6tfwTG5WhSWPD1M0dtO3NDFAgJ5yBuPr81HPVimQq+AYA5Kkb+VkXCM0cDeegTkUvlnZvqAjdMAaiP0Mc66Gm6M4wOlKfCarfeJKqGPu31TJ7Pfx425WmJbbISPcyzMwMxqUMD864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720787580; c=relaxed/simple;
	bh=+FwbuxFhi8aNV2fpvsoh072m5gMUwUPpiUm6GwjSrHU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=EGZ6J2Gj52tJ075zwSwM1mcjMIduh0tC34uxpvPNXN7xQew5F4C0nXb6abbouaSo533ug5u6rbTERmcrAQC5RZVFdlrVyIVJcoAc+mvSfqeAZ8+0oElSNqPLO435PV2PtXfPx2Lr6koSaeA1pDvArOIdEPMX1DAtHknqTl5DKcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zo8hH4So; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-78964fd9f2dso978702a12.3
        for <linux-next@vger.kernel.org>; Fri, 12 Jul 2024 05:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1720787578; x=1721392378; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g7JVKIlj8RPMlsxzz6R+IMAHUyp2NPZ5oLfQxuiAF2w=;
        b=zo8hH4SoKH5vGzU++WhBGHFqdLJWv2cRffJHudnD+7CYk5jRq0xcMSd7czf0OUtWCj
         c8jdL7LRFbYBpEiCMyAlyA4eCa4Y2Qa/Sbf57RrpS+yHrd+rnnei8pjcn32mAiSYZ+eZ
         rxzvlE0x54g2VdMf3vujFGVYxoKxusW9MVBX9k3OGRlJmM5w9iJ12FKz+s7Me9wlQQ8t
         Ouq8noRmLXCukMvsPvDseQWgVMqrHBOgMQkEZarFBMZWC6cbKixAlnx7XjpNM63XRo1Z
         jQkKVf3yFPvW43h9rqV080mXGIXPJNw8EW+LqDzJP93mx9E0uq7dcjLKdw4jVQ7zKNbw
         WMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720787578; x=1721392378;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7JVKIlj8RPMlsxzz6R+IMAHUyp2NPZ5oLfQxuiAF2w=;
        b=DejP1D6+Q4qO5SMm3OTC6+zB8oCKMH/Ko1vddkWOb6x+cv3J2RuvnQDXAnyJphSzkv
         wCZWcZOa/hR79hZbNosbtH5XrQ2amEdYE8neCFYoMgM8t0a/ffP57JZ2YRQVCgSkY7xx
         zJC8ZpQ5tPfUn4Fi0HVbrkfKSSCDctUC8ezCh/gjKBJkQNUtv63XcKe4bKtffT2wdlyq
         Vx31H+zBcU6xg4Q1IG68henK08/PbGTotAGRabbOO47gLdXNjm1FPhP/sZDp8SeZ0bNj
         IVO3vLHEAQLlbz4Iro7194KTpZFH+oduQX7X+xzvvPYfod0kSiMXMSM2T1PgKdEu2MqL
         tH3w==
X-Gm-Message-State: AOJu0YwpRPySfikeoFNk59f2F1HEkCCY8ijwZeraTkruddkFeztLwfpL
	KHOglKzIO+Y5OrrZQq7rABH+6GEYFby5krrmrDZhxxGnPbKFa4CEdE7L5xsTrrpNeWilNP3Aaeh
	A
X-Google-Smtp-Source: AGHT+IFijXTQUgYtdxVFgQaAAZGhVKZwDv8WwptteOGj2uRfN+nyNhjoxwKXhZBs5FMOlos7WJcfgQ==
X-Received: by 2002:a05:6a20:2445:b0:1be:c5d9:5a19 with SMTP id adf61e73a8af0-1c29821d071mr15504702637.24.1720787577765;
        Fri, 12 Jul 2024 05:32:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a2a623sm66010275ad.69.2024.07.12.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 05:32:57 -0700 (PDT)
Message-ID: <66912279.170a0220.26b13.b82b@mx.google.com>
Date: Fri, 12 Jul 2024 05:32:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240712
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 315 runs, 1 regressions (next-20240712)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 315 runs, 1 regressions (next-20240712)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-12   | defconfig+arm6=
4-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240712/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240712
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3fe121b622825ff8cc995a1e6b026181c48188db =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-12   | defconfig+arm6=
4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6690f047ad5a777a547e707e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240712/arm6=
4/defconfig+arm64-chromebook/gcc-12/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240712/arm6=
4/defconfig+arm64-chromebook/gcc-12/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6690f047ad5a777a547e7=
07f
        new failure (last pass: next-20240711) =

 =20

