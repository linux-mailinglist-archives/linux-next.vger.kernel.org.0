Return-Path: <linux-next+bounces-3382-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 909F3959CAB
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 15:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A9A61F21557
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 13:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701891E4A6;
	Wed, 21 Aug 2024 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MLrKglBk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CEA613D
	for <linux-next@vger.kernel.org>; Wed, 21 Aug 2024 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724245297; cv=none; b=BqJnU1DSPM0GrEI2CS42JTtmo/kxcwubOXXy1Wj8J/2lXmTGOdkrF7K+7Az6XiNYiNL3+wb1t3i68/pzi3eG8VR/kZwMYiT6DRPsbhoNRlnV3AHgnAbfSRP3lLQGrhy5jOW0YLDrZSs4vvK9MRx6sH5WsKPqIA+WiCxiz9omFTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724245297; c=relaxed/simple;
	bh=7c8JtTVO8kC2nTobToc+zGEbPmzvzCFfHav7l0KodBA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=TEswsF4S2L+6F8P+PnEV1i9ND8sQqGSfeYC7H/PO29ZNB5BZOHWzNfetHRSDBxss+IC7XY7V6oFuWNHUe3WaY0OYtEloVBP/bxjulucFrvZwa4X3D9e1Jn1SvP6PzkNPuk0F/3wMlEqaHUvu6e2bqucglTHs+IpkLMovHw4qBPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=MLrKglBk; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-710e39961f4so4579291b3a.3
        for <linux-next@vger.kernel.org>; Wed, 21 Aug 2024 06:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724245294; x=1724850094; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NNeBbIxWeFHAYO+xUJIgCND2ikHiLxyvsq/tib9N2yY=;
        b=MLrKglBkxBpUhVXk9HjJid4Z1aSolwgA6ngA7teJIHMmkRdwLnVAJ9cB4HIWWFKHXB
         qFaIZKLncEDf1v0uzX+djcPJ1Qi9jrH0BW1u3ERn7quXM0QHsnF/YzJjR6nQ10LMucHf
         t8znL525jEdrv1pwpqWftIY3wUGJL9zCSa6u8URoJdFyMBb+jKHrgiOLqxp8k27EWmEl
         cuXn0EwrovDLBWjY8rM2/tb8zx7WaHy6NLNVF2y5XgwLHsjRQ9ILUirCqoF+oOAdkkDv
         2DfMHKoFxZb3xkwFiL17FYCRGU5RGck+enbgX7qgvCvxkaWgXSFvsDNdp6oaEKwrj2gc
         B4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724245294; x=1724850094;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNeBbIxWeFHAYO+xUJIgCND2ikHiLxyvsq/tib9N2yY=;
        b=xVcpTjMh/o/Kte3AQaXdli19GLUqVayCLCS4F71JkvMTrzgkyrYGxlQA71Bil2/3jA
         /Ruwd5GBVTY8YgDs47ok8KLPgwr5OnLnFsC3F1fzVEFCmcq/nZ299t54botK9tOB+5gT
         edxNjbNneqFh5f+6UmvkVkqE5aTBIGkHYPmUfCt7wZ63zeBHx4jGFRkcFLLKZ5QrcXP9
         7tArCDoK/I4EfQM7H/Ks/qP6yGSaogcOgT/CuwfEAamkor8HXVoKbhFZ/MNVLzKlKBtu
         1XW1mmAc3/W1g0nn7cqJRzmxMjKS+65qMQWU3rCKOEL3v3cJhiqlM0aNPbPkW3OwGlkE
         CI6Q==
X-Gm-Message-State: AOJu0YyfSZB0XqM9TjuAry2KBNfgDppzZm0YuayDxqEJGjOR/QRmRR02
	kk4EoRiU05gybQgNYG5/SU4RgS02jZBWA2N14YT0j8AAQGxagloQKRfXejD7rgicj8bmjO/k1ux
	O
X-Google-Smtp-Source: AGHT+IHi69Bno1k5waaKFFIU5mH3IWzTtLwHKV4EjTWEeC3KuYLgAbstJ8UCsJAgmZW+KQS6jn3bFw==
X-Received: by 2002:a05:6a20:d492:b0:1ca:cd6c:2ab3 with SMTP id adf61e73a8af0-1cad7f72550mr3123089637.10.1724245293768;
        Wed, 21 Aug 2024 06:01:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1644bsm10259637b3a.148.2024.08.21.06.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 06:01:32 -0700 (PDT)
Message-ID: <66c5e52c.a70a0220.237c3b.3260@mx.google.com>
Date: Wed, 21 Aug 2024 06:01:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240821
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 141 runs, 1 regressions (next-20240821)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 141 runs, 1 regressions (next-20240821)

Regressions Summary
-------------------

platform          | arch | lab     | compiler | defconfig          | regres=
sions
------------------+------+---------+----------+--------------------+-------=
-----
r8a7743-iwg20d-q7 | arm  | lab-cip | gcc-12   | shmobile_defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240821/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240821
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      eb8c5ca373cbb018a84eb4db25c863302c9b6314 =



Test Regressions
---------------- =



platform          | arch | lab     | compiler | defconfig          | regres=
sions
------------------+------+---------+----------+--------------------+-------=
-----
r8a7743-iwg20d-q7 | arm  | lab-cip | gcc-12   | shmobile_defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/66c5a9e3883454a5c6c868db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240821/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240821/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c5a9e3883454a5c6c86=
8dc
        new failure (last pass: next-20240820) =

 =20

