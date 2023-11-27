Return-Path: <linux-next+bounces-77-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D26D67F97AC
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 03:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB53BB20A3E
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 02:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12311C16;
	Mon, 27 Nov 2023 02:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="XEWhFivL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D939122
	for <linux-next@vger.kernel.org>; Sun, 26 Nov 2023 18:55:10 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cc9b626a96so25638885ad.2
        for <linux-next@vger.kernel.org>; Sun, 26 Nov 2023 18:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701053710; x=1701658510; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qJU1V3tUq/Bk8cidUaRbJetXNU/I9W8m/X6XWnP9AFs=;
        b=XEWhFivLQsmcl6gX+HdqP7nPugnDRt3LRGOfWF7YDhPPmOQs5prL1PrbmVackpSLH4
         nNsS6uRCDzjPiOl7mBzlPGQ5GjsznBcMW0cS1V22rn1TsamiP/uXjjwuNeUGyUHxd5AG
         8NnkNyhLe5lSqBHSoTLz0Kw5OuqGIkmiOUzODTb/YeQ6/rNDHPEOKAsohu1Izx9N8kAS
         K+epkLnddvE9OdPP+bl1KbRiFNcpiSfoX+4yEz21dGNn+S0XhgIW/Y7CePX3XJZw/RJf
         VzVOgJ95yyJRoR3RLuU5RTW9MPGrHJDfr3Sfz69lcBBTSbJGCFLUrskHAXQ7Rw1+2aFQ
         YrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701053710; x=1701658510;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJU1V3tUq/Bk8cidUaRbJetXNU/I9W8m/X6XWnP9AFs=;
        b=dLtLjnrDz63HGER9T8htCvEDto+msm6gLVVTEy/bVHY87WaQB1vPi9SURWAXefKRO9
         uz9onNuwVD3TDLE860a3OkuWbA8U+OCCs7MiP1YlmO/JbhNpV6p8ATxIWrde4f4VkaO+
         XM4hUwBfxI30lTWogqiomMgw6QsHd62xBk5sK9bRlwhelAvqJmvX2XGNc2DVm3AYD3aP
         wVYspUhQ6QOTHyM0hJ9F8E6oY3Dy0dkmo0Gs9cPJUKzpqPD3Xco27+aLwDl4Ola8ScH+
         QwWoE+R2gGtWHqZRQtq0C5M+DCNHT+useqD8zmSmr47rRFhm4a7CMNXC8fVgeDYdfcuC
         ICvA==
X-Gm-Message-State: AOJu0Yxf85IyDXUjYCWR6GO9sQy4Y85WAv7JGHmjPAiAmB5F7GvyAL3V
	TzWFZ3ky7e4B3i5cdKNuvvpxop25nS3XrpSONRo=
X-Google-Smtp-Source: AGHT+IEj9Bq71uXkxou4wQE9KA7jR577mOtU5ERkpDC/oAoDAxGcBha+HwAWNtrJUVoCAqh2NJ/8Jg==
X-Received: by 2002:a17:90b:4b91:b0:285:a4f9:4597 with SMTP id lr17-20020a17090b4b9100b00285a4f94597mr4060749pjb.21.1701053709652;
        Sun, 26 Nov 2023 18:55:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s5-20020a17090a5d0500b00280469602bcsm6523739pji.2.2023.11.26.18.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 18:55:09 -0800 (PST)
Message-ID: <6564050d.170a0220.aa699.ecce@mx.google.com>
Date: Sun, 26 Nov 2023 18:55:09 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc2-454-gc7607b4f01b34
Subject: next/pending-fixes baseline: 77 runs,
 2 regressions (v6.7-rc2-454-gc7607b4f01b34)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 77 runs, 2 regressions (v6.7-rc2-454-gc7607b4f=
01b34)

Regressions Summary
-------------------

platform            | arch | lab          | compiler | defconfig          |=
 regressions
--------------------+------+--------------+----------+--------------------+=
------------
beaglebone-black    | arm  | lab-broonie  | gcc-10   | multi_v7_defconfig |=
 1          =

qemu_arm-virt-gicv2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc2-454-gc7607b4f01b34/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc2-454-gc7607b4f01b34
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c7607b4f01b34588b85ee3e48a1db6ff450caa11 =



Test Regressions
---------------- =



platform            | arch | lab          | compiler | defconfig          |=
 regressions
--------------------+------+--------------+----------+--------------------+=
------------
beaglebone-black    | arm  | lab-broonie  | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6563d48c28932e5c3a7e4aa1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-45=
4-gc7607b4f01b34/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-45=
4-gc7607b4f01b34/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6563d48c28932e5c3a7e4=
aa2
        new failure (last pass: v6.7-rc2-287-gd58dc32d55f5) =

 =



platform            | arch | lab          | compiler | defconfig          |=
 regressions
--------------------+------+--------------+----------+--------------------+=
------------
qemu_arm-virt-gicv2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6563d3ff158455ea227e4a99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-45=
4-gc7607b4f01b34/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc2-45=
4-gc7607b4f01b34/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6563d3ff158455ea227e4=
a9a
        new failure (last pass: v6.7-rc2-287-gd58dc32d55f5) =

 =20

