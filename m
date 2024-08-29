Return-Path: <linux-next+bounces-3500-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C45964594
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 14:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC78B1C229DE
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 12:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA7A1990B5;
	Thu, 29 Aug 2024 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="yKsLGuSt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E374B15E5C0
	for <linux-next@vger.kernel.org>; Thu, 29 Aug 2024 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936086; cv=none; b=aROSpEdVM6aM/HU3kH31K+HNiQJ+THXodwLi3sD7ROUYNDBRt7Iik7xTK2qjokXL4tgVHsXPO1SPT4+36TbTMbxX2SIpDatmL2hHeZKGN0rKTUrlOGaHiyD8rZIKzFDFKNuaNCEW+qKVRmvf2b+3zaPlzs1lpaLks7lSMtpcReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936086; c=relaxed/simple;
	bh=3p+5tUjkjwK4xNaW9LENf4zvmkEsAOpxIwcG/nKFn5M=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nRQltfEMP0I4O66PrBcXOq2ANCTIar7O7hgNYu40GA+1r0WbdIJCM3ofu+uFDWdSyl7r5qSlOyK9FlAE6C+QxbnshtKj39iViQzYu8RTX1Fmd7ZIKzEA5yoNS0gBXYqoV1HQFSqGdVVpctG8+dDbluN34jJlxiKiK87elKv63z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=yKsLGuSt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-201f7fb09f6so4627305ad.2
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2024 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724936084; x=1725540884; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tilcWcQfRXIf95qT55MHJUfpK4cMpTNOUATVPHeHyEs=;
        b=yKsLGuSttlSVr3cnFt28i69f19GlR3FPC+5iY5hhfqnoVEraS0dr8QLTt6qf+mQGBA
         DzkJBQci1CjUp/kj1Sj2Ebtb6yRfa1B52kINFC4B598hk9EZS/DvNlNCYr4FT1v/phqB
         /oUFMfhiF3QTwND10EFeFZxeiy/82D4oOoF3UHTUFIviXWqpIyYwSBATB5ex0mmYPymy
         Mr4Ti+BoRCeTYgVxJvkwP9gddQsbVhYllHtF4FGt2uENqLCyu7hkVWdu6ludF9yCk+nu
         v2RojSR8x2ouyGq0EdgLx0mzdNlPNY4dK9iXF9E6WY1hsX3OdQTHiCkgvS/TO6vNNwbx
         Y/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724936084; x=1725540884;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tilcWcQfRXIf95qT55MHJUfpK4cMpTNOUATVPHeHyEs=;
        b=dl5Ix+DuDXGK83I2wWFo/odbBZFrmel7VMT4WZtpJTtWexlo7Z19ADHBXhkUMpjAiS
         KuRu8NUwE2V/tOD8XXsDz0Fv2jpM3LHDptjkHIOLqxTWbQyh6q2MfudeQWiOQrGV4JW6
         nXiBmihvwNm98ainCLm2ScrcVpBjwfpacXmOFdeuAUkbZWkP925dEv4rMjwayEyU6HTl
         tbvubQIMTyYDW34nHD1PE2KLUxBMhwTeWIXgFlfGvuuKDIhAIbUfyw8Gl9CoTvL38KYk
         9AqOda1yBGZ/J4NdlV7UdQljBe4rnveWo+tEMuOYbJX37DXL9JeJ4rJtXlllKzZmfHNK
         5eag==
X-Gm-Message-State: AOJu0Yzfw+bTo0x8nzeOqzVyEmHsKL2dKFjF9IPAjktn1rND1At0yKrM
	g5/Ga9P7iZaR+rj89xKEoa5Z3D2WAUsDY8GAiIb6n2DPwye71Gc4EXXVauHeyO6hNbSWn5kFziq
	7
X-Google-Smtp-Source: AGHT+IHaxxkH/OkT2sengD+/kPwfH/GWUMB+uYw6NxI0tZtfr/MjpfNOETmRx020QtxWAykmbgthWw==
X-Received: by 2002:a17:903:2c7:b0:201:e49e:aaf6 with SMTP id d9443c01a7336-2050c237b14mr32062905ad.19.1724936083644;
        Thu, 29 Aug 2024 05:54:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515533bbasm10761035ad.149.2024.08.29.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:54:43 -0700 (PDT)
Message-ID: <66d06f93.170a0220.36c782.2645@mx.google.com>
Date: Thu, 29 Aug 2024 05:54:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240829
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 153 runs, 4 regressions (next-20240829)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 153 runs, 4 regressions (next-20240829)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

meson-g12a-u200              | arm64 | lab-baylibre | gcc-12   | defconfig+=
debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240829/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240829
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b18bbfc14a38b5234e09c2adcf713e38063a7e6e =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d03f69e9b5d2ff36c86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240829/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240829/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d03f69e9b5d2ff36c86=
858
        failing since 1 day (last pass: next-20240725, first fail: next-202=
40827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d03f6b705b62f77cc8686d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240829/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240829/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d03f6b705b62f77cc86=
86e
        failing since 1 day (last pass: next-20240725, first fail: next-202=
40827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66d037f368612576c4c8686f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240829/arm6=
4/defconfig+debug/gcc-12/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240829/arm6=
4/defconfig+debug/gcc-12/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d037f368612576c4c86=
870
        new failure (last pass: next-20240828) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66d0317f2433e23925c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240829/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240829/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d0317f2433e23925c86=
856
        failing since 7 days (last pass: next-20240820, first fail: next-20=
240821) =

 =20

