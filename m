Return-Path: <linux-next+bounces-4757-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 950AE9C4ECA
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 07:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B2728827E
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 06:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F00C208210;
	Tue, 12 Nov 2024 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MmWMszFT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B245234
	for <linux-next@vger.kernel.org>; Tue, 12 Nov 2024 06:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731393087; cv=none; b=D6VXwge5Zebm2iIwA5MR1z0DF0bsTdn8JBbSdxWNx/Q/ULPzUCy9ATPG6knUlNsWBozclkan8wZQaQxmTKuHop0oznLjGyjOTH8Gg1gjB4c57Ys44zOi3CPSlityeDpCa5si4Fj85BV4mSGSQLL3oi0zCF3cgzto/l0slwcHz4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731393087; c=relaxed/simple;
	bh=ET4B3eBs1DSDaD2hlWeUYfM+c0MOjq12MqVRvWcklbU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=b8dMIQHdE5AYLlJDMBFeWYNsVjbFkV3W7CxF5p9P/WXAOdDQeTD4OLJrFPB+sVrEOTI+eMVIb9W8iHXI4VwSjW0+iVg94GdBX50T/6bNElPid4LQ93ZmJ+rVsVWi5KA41JkqUkdUshzh0kQjkK481yjcn2H00tGU0znIAsdFMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=MmWMszFT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7206304f93aso4757234b3a.0
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2024 22:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731393084; x=1731997884; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wrus6mNHQMe5veO6BElnrZXFWHJwaVk5UDTLOZZGUqY=;
        b=MmWMszFTpxn4N9a1IlHwk2h+OKSq1RvUY1Be6kpeMxKDAYkBCCk1BOUWuamtrkpula
         QX5nC1HmTmcxe8aznbf+dm8vt2SVl4dnj4Fn6/0lDCxGn+G8MzHNw14ar1D00Id+NPHf
         ioJyKeZERAOMUpOXYWMW0kaLIJgdlSaOIuZ+pecAs1+DZkIjFEk/b8MnnUVxZ3HTfyZH
         xK8hfqBTUfujSS21Y+6O5btGgXWK1pP0r2eA+WA/66eFiw/UTq0XPcDSRFCdJ6N/Vh9U
         aOYClbcKSz1Yyof+j7ssKvSXQg592xRXLhK82wam+peuFpp1zC6DxoWDswoL6aT7u6xt
         ByEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731393084; x=1731997884;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrus6mNHQMe5veO6BElnrZXFWHJwaVk5UDTLOZZGUqY=;
        b=wl/qAjTyRpyOmhEpTuEqCWuA7uPxwVKSxYcqeYEcTLNHrk2yDPnP/WIomA4wyZiBKo
         XZZnORYe6yjPok8narj7Mqx9t8/FWmISXdKtEIKL4sq9ZNPwDs+/Xzvo0rxfdStG/Acf
         UvmnztRk6KknwsSgPlO8pzHnrd+PvrxeWJtKUZDHpMYxoglHfndXq24BIlsaySrVC+W4
         ADDcfZCyauGHkXQ+16k8FyrGu+tn8VXgJ90LarKlVpQKLTrVZLRqh0sXyk6ww9dcUFOp
         Lxp+l3WvVIgILJ0xh42tAi/SW91BYm24oI+EQKIByPbFfsdxmdIVnujWa8pp3FUeGKou
         szhw==
X-Gm-Message-State: AOJu0YwdOhU39uLs7qCB+wYaHkFhTdyIeSM933ZxIwKUStKfcUy7EJM+
	zUXUdpmhUiR3B/l151Evzil5LWnnJxFZ8I58cY9RPCOB7yU75TjlMHNhx6aakz65Jtz1Mf/kr8Q
	k
X-Google-Smtp-Source: AGHT+IFTJwJZo4fEFoGeLFym2+1z7K3jy13RNon0/zAYW4bmzYDHqyESCo2I2dsOzNHwWeizW+uphw==
X-Received: by 2002:a05:6a00:188d:b0:71e:4655:59ce with SMTP id d2e1a72fcca58-7241314261fmr22701356b3a.0.1731393084062;
        Mon, 11 Nov 2024 22:31:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a2367dsm10330758b3a.169.2024.11.11.22.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 22:31:23 -0800 (PST)
Message-ID: <6732f63b.050a0220.1e1426.7a38@mx.google.com>
Date: Mon, 11 Nov 2024 22:31:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc7-95-g96203094619a7
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 43 runs,
 1 regressions (v6.12-rc7-95-g96203094619a7)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 43 runs, 1 regressions (v6.12-rc7-95-g96203094=
619a7)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-12   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.12-rc7-95-g96203094619a7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.12-rc7-95-g96203094619a7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      96203094619a7fda589f7a73808518f4b3e0113b =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-12   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6732c453ede488ad1dc86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.12-rc7-9=
5-g96203094619a7/arm64/defconfig/gcc-12/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.12-rc7-9=
5-g96203094619a7/arm64/defconfig/gcc-12/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6732c454ede488ad1dc86=
86a
        new failure (last pass: v6.12-rc6-415-g0e90fad093db9) =

 =20

