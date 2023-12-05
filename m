Return-Path: <linux-next+bounces-234-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95784805A72
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 17:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C633F1C21262
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 16:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C780E60BAE;
	Tue,  5 Dec 2023 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="AMamVXfN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E00D4F
	for <linux-next@vger.kernel.org>; Tue,  5 Dec 2023 08:52:04 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ce52ff23dfso1825187b3a.0
        for <linux-next@vger.kernel.org>; Tue, 05 Dec 2023 08:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701795124; x=1702399924; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UF8h57KGEYaaO7ZeAO7CIlragiT90CyvWupEGqaqa1M=;
        b=AMamVXfNbuOxbZfp+hAXam0tZQzWYogtdRNW/DjwrBvFIAdr6zm6vknTXM7nNBvYCf
         sf6OIioXqgaQ1h4c1b4dYqyND3gb6r3ehhKnHSUgo1SLvHr2irTgDWqAa8Z1/jP0cPuW
         5aAAomrDAnUl+O/YUWf594+gD80/p0xgWlpk7tHPp7M70qS3c0IvjsBvVJXlA8a1nR4T
         woizuNpu4T2Geg26jU67FdOodlkpt8o909CyS6yDHz14VLTbXgAnU41V3HsA3dEfwGkH
         ob1Y9wMkPWEcL2F2KtuCC7LOLyWPgO/S7XOhfTojC5ygrAduoElU/mySE84Pzr8yFq0A
         G/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701795124; x=1702399924;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UF8h57KGEYaaO7ZeAO7CIlragiT90CyvWupEGqaqa1M=;
        b=sBefeafcHXFRSJOSr/ck9D9yhhvl+0Iiuqpo78OiIfZF9yO+/b5ALHxPwl66NC05a2
         Q90Q5ienx9q85PQKNL8XnAt0jrEY5+fX9Z0kUNxWFaj6H/8CCBToL9zqmYD4oYrMQInV
         LlOwyf2Fl18Y8fL6bKttrecpZglxReAsZWkaeoi/X7o1wpuIj4w+Sshu1MrX5pGMiPk4
         BO9YsEpsNHdf4DQxrBsgKbq5I4PERXS1Va9IbBaakuV9rfjtPP1wcFGjlFvcPT+ARkWm
         hZBHkQgqc4XntRilAJCxXIHY2RQ37+VJ+RN5LNUc6GAKVUJpWvoxAbD9DlNaVxkXQrrK
         jESQ==
X-Gm-Message-State: AOJu0YyI0EsaAdCWbZ4iLRib4kcOOml7hbUbnrB9zrqU80tJekAwWf3r
	ibVwOd6yIYZk576mSSC5DF2X2LVAJQdeNmAmpG2fxQ==
X-Google-Smtp-Source: AGHT+IE8AJXDLLfWDbJyhPuadiwEeHKLlw9Gv24SmVI+gZTno/Cg0VT2UBMjZ1cCqp6NsktgwC+V1w==
X-Received: by 2002:a05:6a00:1888:b0:6ce:7f32:d64e with SMTP id x8-20020a056a00188800b006ce7f32d64emr110370pfh.29.1701795123777;
        Tue, 05 Dec 2023 08:52:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p23-20020aa78617000000b006ce742b6b1fsm1192021pfn.63.2023.12.05.08.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 08:52:03 -0800 (PST)
Message-ID: <656f5533.a70a0220.90447.3264@mx.google.com>
Date: Tue, 05 Dec 2023 08:52:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc4-219-gcc1b39317a57
Subject: next/pending-fixes baseline: 91 runs,
 1 regressions (v6.7-rc4-219-gcc1b39317a57)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 91 runs, 1 regressions (v6.7-rc4-219-gcc1b3931=
7a57)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc4-219-gcc1b39317a57/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc4-219-gcc1b39317a57
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cc1b39317a57120651840e79b535594ee09f5768 =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/656f2546c40ab1fef8e134b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-21=
9-gcc1b39317a57/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-21=
9-gcc1b39317a57/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f2546c40ab1fef8e13=
4b3
        new failure (last pass: v6.7-rc4-181-ge070da1246e73) =

 =20

