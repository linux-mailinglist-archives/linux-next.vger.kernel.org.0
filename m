Return-Path: <linux-next+bounces-3088-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1FB937767
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 13:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69C08282782
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 11:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F73A127B56;
	Fri, 19 Jul 2024 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EcvEBtzv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63B126F2A
	for <linux-next@vger.kernel.org>; Fri, 19 Jul 2024 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721390370; cv=none; b=N3Q+J64ErFqe+8fcWiI2U2fQLeMaxr+JAkvlyTVlorJdeXqyH0U/yozFGMLFkd2faDXgBl1kpyQtpholyleo5XX/0CMkwtR6qHZ4vosyOrxe1sD6A99wJSEY/kIxhd6k+v2eJjKaR51vu7EhG7HnFEOdKnH8m13F5l3+dhpGAiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721390370; c=relaxed/simple;
	bh=kZ/gyx9fw807M7FQR5doaQFe567EBN+MBk1xvCnfuco=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=HMdSEcG9YtLn6QdzcxLc0EhcpO9bT8vxa69ktvY3ZBx7/Y8MhcH/m53sNCoSROZajrvwLw1yeBIOhaNfxzlVLJvI9IS1E7m5FGUeJu390vsS55nWnvu5e+31cqigHMnwRgy70dUrHoLfc45aM5P/iBe6cwzcdu7asQo+vKH+h9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EcvEBtzv; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so573169b3a.1
        for <linux-next@vger.kernel.org>; Fri, 19 Jul 2024 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721390367; x=1721995167; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UE9GAasB9vOcT0znzjxPTHc61z0SQMr/3p5TtPA+NSU=;
        b=EcvEBtzv8cDdNjuPE5kYMJYcVn6yQ+THr5aQujt90D7DomjFmXFQv/dMJE33pyzC4B
         7ffCha+nUyWGv4m/wraxNlxusk9I6/l0rQrvCN4zVdr6D/netS0BkMEyRYdA9WknjOMP
         ZSXF5FV6K0kLWESNYNleBibYvpjQDcpZT9+KVm2HxZwfETKVWbVnFy+f/QGHoLn2NZP+
         8zEYjZNIO6A2FUD747a0vA4ROvilHQE2Wqozgr/R0MuHXRTp6Lpp4436GtPAyst6pHn9
         dVtKuNIDC2IqUfZHfIBpsze78PlpaUdBD3UGGarA0NtLnPIdu9lVY2tbvibNnCj4YLvo
         MaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721390367; x=1721995167;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UE9GAasB9vOcT0znzjxPTHc61z0SQMr/3p5TtPA+NSU=;
        b=GZO4f64gp9TLkfz1mmlnhgyMVkf4CG1xOLke0Z+0Jgt4EqlEmtegbRplx9y30x72oP
         P+c/ibTPqVhYCsHLwXRNRBjJcfe6UI+8BkEI7SQE1PNo2pNWeCk+Zc/QmVMqZNCAQwVX
         22rSzXm9jdru343KpSJpR5bt/JvftRSD8HNJLpolH6g9ehfFvVokNSBuYN2xdlAlrvLu
         yrxKkvc8TCi8UP3vVw6nh3q8LGnkJly1mJnxa52FisXt0WIm/3wCAgTxG2bHEE3uA0ZS
         s3bIh4GUS5A4R13VE5zqf6gnfTod6pHE7seTz/Huxqg+BbdneHcMwEq2iGeHX2h3+mmP
         TzEQ==
X-Gm-Message-State: AOJu0YwvhXO5JQfxnPD7gv1a57NSO5Xts3jXirZBhkuZ/7+pZUKdaUBK
	D6I0GnCOKZKJ0LcSeMZ4l3BA1Ef1vtGhBfYx6IOGDjwxqwY/e1/KYIp2mS9wLOpUqOeq+56MToX
	x
X-Google-Smtp-Source: AGHT+IE2rGYOy6tFPUNhIjtpjXOPnYXSbT9CxO3n+t2iPVs/6MOK2nbfANty/TymEyHzX4tHZyEOAg==
X-Received: by 2002:a05:6a00:b56:b0:706:671f:d252 with SMTP id d2e1a72fcca58-70cfca0bf18mr2978959b3a.26.1721390367040;
        Fri, 19 Jul 2024 04:59:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff4b5a3fsm1104759b3a.71.2024.07.19.04.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 04:59:26 -0700 (PDT)
Message-ID: <669a551e.620a0220.dd864.280c@mx.google.com>
Date: Fri, 19 Jul 2024 04:59:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240719
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 338 runs, 2 regressions (next-20240719)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 338 runs, 2 regressions (next-20240719)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-12   | defconfig+arm6=
4-chromebook | 1          =

r8a7743-iwg20d-q7       | arm   | lab-cip       | gcc-12   | shmobile_defco=
nfig         | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240719/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240719
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      41c196e567fb1ea97f68a2ffb7faab451cd90854 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-12   | defconfig+arm6=
4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/669a1ee12292f90e877e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240719/arm6=
4/defconfig+arm64-chromebook/gcc-12/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240719/arm6=
4/defconfig+arm64-chromebook/gcc-12/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/669a1ee12292f90e877e7=
084
        failing since 6 days (last pass: next-20240711, first fail: next-20=
240712) =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
r8a7743-iwg20d-q7       | arm   | lab-cip       | gcc-12   | shmobile_defco=
nfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/669a1c4b370b7294597e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240719/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240719/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/669a1c4b370b7294597e7=
06e
        new failure (last pass: next-20240718) =

 =20

