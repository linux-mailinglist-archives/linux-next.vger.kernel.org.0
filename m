Return-Path: <linux-next+bounces-103-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C169C7FC10B
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 19:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ADF72823EE
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 18:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108A239AC1;
	Tue, 28 Nov 2023 18:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YCaBIlui"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C81A1B5
	for <linux-next@vger.kernel.org>; Tue, 28 Nov 2023 10:09:38 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d001e4cf7cso6529165ad.2
        for <linux-next@vger.kernel.org>; Tue, 28 Nov 2023 10:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701194977; x=1701799777; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GNNSks8Rw9QUL8+pZ16aVgYcIH6JPG5KV8pUANE+Voo=;
        b=YCaBIluia5SpKxfrSEhGj1/96LaCRHGsbhT/5qpCrgsRrYzBMGiUNblpLnJfCta43k
         bQv1HcmwkFt2N2pppe6d9d14JL50UtScC4z4Hm9CTotnvoiOdYbxwGwJuwXpd4vvvO2t
         2vDxFsmiDZWTmSaDWmjwfiUPwTF1erHlpcjlf+lZOe+WOq7/ddIW54GwYkmyUN7T9edh
         dBT+n08kJ//xwnRWGfGOLfuNp+iVOxSxzl9TVxsop9YYR0T3nxlHFGk3niNWsRfVm3aF
         hLxoloGWmlKPmyEMWVu4G1nvRqmKUOvP3zFuqEVSmF9PqMHeOB4KQK4HKkGNmkRDfGKx
         MCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701194977; x=1701799777;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNNSks8Rw9QUL8+pZ16aVgYcIH6JPG5KV8pUANE+Voo=;
        b=swSwR62bJmMKXwRicbmd5EtVeylmQJj33y4ljde73/MoElG8nBYz6U9bwJfm1bOpuV
         4Tk4oScrnRFUz8qPM/9aoBSlEkdYiqYbVyF5nmrwg8UcEp/4rwAX1k92td4AAib4iKdY
         kUIEK72uh2q2j2hpxJYwSuEKX1Gw+92HIj4TsPhBWsbmuDmuE8PY1G3EzbxU0x2NX/ko
         d+pLcjDhNb2sR49xdqlhE/KE1hozw3PkteO3+mRTM4d7AjHajuJckApkzjHOOC8EpUKN
         6mFTluNG6Bd3QpxP2R8c7oPPeKgW5v/Q4FFVU6cbV0TDWWT7YVqOMuiD2HpbxZxwGBIj
         iMzA==
X-Gm-Message-State: AOJu0Yy3c36HdMusyslYr87iyspDEzne4w1EE4bmeXoDKvH6EoJUE8Bv
	adbx1JkJUKw1NiDyN0vbc3oXohLeiUTB1tm1Loc=
X-Google-Smtp-Source: AGHT+IEBWE6H3sw6X/eK0VJcDGRZ75E3vGH5aFeh0N27i7icBNJWqxo57V/rIZ4C11zj/inP9227qA==
X-Received: by 2002:a17:902:868d:b0:1cf:be44:bb9d with SMTP id g13-20020a170902868d00b001cfbe44bb9dmr8103911plo.30.1701194977368;
        Tue, 28 Nov 2023 10:09:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l10-20020a170903244a00b001cfc170c0cfsm5631468pls.119.2023.11.28.10.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 10:09:36 -0800 (PST)
Message-ID: <65662ce0.170a0220.638b.e485@mx.google.com>
Date: Tue, 28 Nov 2023 10:09:36 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc3-220-gaeca85031d1b
Subject: next/pending-fixes baseline: 92 runs,
 1 regressions (v6.7-rc3-220-gaeca85031d1b)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 92 runs, 1 regressions (v6.7-rc3-220-gaeca8503=
1d1b)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc3-220-gaeca85031d1b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc3-220-gaeca85031d1b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aeca85031d1b22c716e2de91b791f0cb13bd92a6 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6565fc21f6f4a7d80e7e4a97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-22=
0-gaeca85031d1b/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-22=
0-gaeca85031d1b/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6565fc21f6f4a7d80e7e4=
a98
        new failure (last pass: v6.7-rc2-454-gc7607b4f01b34) =

 =20

