Return-Path: <linux-next+bounces-4493-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB39B342C
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 15:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46F82B227BD
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 14:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F00F1DE2AF;
	Mon, 28 Oct 2024 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FrE2zIzh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BEA1D2F6E
	for <linux-next@vger.kernel.org>; Mon, 28 Oct 2024 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730127586; cv=none; b=P5PwTZh1estU2bUUXeTzCuJM3Ro+QRE+K3mlYh20nzm/mJpL6iwWlERvJ/G3p+UyQEA2OlKDvfZMj0ttI0Cvnh4kqtQ9C9vmYjDrpsFpADeSDfVDrqGKtGxhoeGD11ogy4757EAlpvOjGqY2/qIrSvFBKnbSww8vAHIsVxQPX+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730127586; c=relaxed/simple;
	bh=9AsxRqGFng23fH3S0IduwwLh61Te/qc3x6GUNTT0+S8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=uLKRjA9/KC5CppZZQElbl8hDjLQ+ilXtCx1fcyeykimrRZy0Wu1hAd8lrMjfeg4S5yPqVTuF+k2JcFpBFyaUuRJKqW0tpLjwihwruneUdIqHUdXGybM68RZrg5BrKeqmi4v2N7uJtTWdv1DrIy6eTgyAJkwF67zEnex5AStgDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FrE2zIzh; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so13308a12.1
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2024 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730127584; x=1730732384; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zO2PZjlz4ReUy744A4Hb1ovo+k4k2qjHZ2tmChObl/o=;
        b=FrE2zIzh8XysZM1z7WJ3m1PWM+L/2TAGBLUJm8zMVlxOnUrW+ioW4eEgRrZ2EOd0wX
         VGvzrEWt+aClB1uSpykIAPQGGhB5RYvjohe2q8snhK1Gsi/8xT4anWsTPHqehmSZcNVe
         5px8USS8Ryb/yC2mFaJkEchIDuqz9OS1Fl59Aqp+1BiHphwJmZD3aNlHkarXv56KL0Ey
         vlVc3RP1uGjI5co//J8gKG/Uf4JZ0luoTgpnsf5SOKQ4y38Q6jSWQwFEvc5vrd9Bi7zx
         hnFjB95IyQYA2i3+uoA3gSjzwH3wrc0ZmrQw++M7v1hlbjudfyqzhbNz4oZ74Aay1LUt
         Hb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730127584; x=1730732384;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zO2PZjlz4ReUy744A4Hb1ovo+k4k2qjHZ2tmChObl/o=;
        b=xGZZYRSx3kSHeobAexCwja3/FikgW7fDLOGwbZ6qytLt6my84zvm2y4sLPBEIfpapA
         OK6n77ENukedud78f+0ChyxTzmLhMfW39gUgh+4PIMAdypSe5CHaPBtUCvOkvp3a5+hV
         t492qMfRa1S/uOrQTjJlqhGuyDj0/3X5RWvoeZrl7p3JtchCv/EBHk4/nF/sUDLN5GAc
         NnrlOKpLnyG0t9j8NbFBWFEMvaWVTw0T9HixF81BivUKU248eu+iqftB88DUxpMItUnB
         KWV3ElmuLDJWHV2zkVzbuKhorNGhcUjQEtgabvyRp3sOEVVZ7L9zuZ2OsTE2t6YPakD0
         zH0A==
X-Gm-Message-State: AOJu0YyBVEtbiv7fJLBC99tzxfIjujP8QFIlrZsKCQvX8cBf4k0B93y8
	M3RKqwaKNS+yGMeyPbPB18tcuTht73W/xA1ASo8XVgJA2Km9iqlbLvA4cZ0gVoCkzMqEl59oPXZ
	l
X-Google-Smtp-Source: AGHT+IGlBzZGWa88HGvBHDxODlX9PEMyUTIFE+BUV2lJhxLlfrKNHY/MfYzRV1I/y63JtKfXg0UYNg==
X-Received: by 2002:a05:6a21:3a84:b0:1d9:61b:960c with SMTP id adf61e73a8af0-1d9a83ab113mr10546441637.9.1730127583996;
        Mon, 28 Oct 2024 07:59:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf46549sm51116495ad.3.2024.10.28.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:59:43 -0700 (PDT)
Message-ID: <671fa6df.170a0220.8f1dc.1ffe@mx.google.com>
Date: Mon, 28 Oct 2024 07:59:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc4-519-g6560005f01c3
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 42 runs,
 1 regressions (v6.12-rc4-519-g6560005f01c3)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 42 runs, 1 regressions (v6.12-rc4-519-g6560005=
f01c3)

Regressions Summary
-------------------

platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.12-rc4-519-g6560005f01c3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.12-rc4-519-g6560005f01c3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6560005f01c3c14aab4c2ce35d97b75796d33d81 =



Test Regressions
---------------- =



platform       | arch  | lab     | compiler | defconfig | regressions
---------------+-------+---------+----------+-----------+------------
r8a774c0-ek874 | arm64 | lab-cip | gcc-12   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/671f79a810c351e9d5c868e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.12-rc4-5=
19-g6560005f01c3/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.12-rc4-5=
19-g6560005f01c3/arm64/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f79a810c351e9d5c86=
8e5
        new failure (last pass: v6.12-rc4-373-ga06df994e3b96) =

 =20

