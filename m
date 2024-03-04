Return-Path: <linux-next+bounces-1450-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B013186F8A6
	for <lists+linux-next@lfdr.de>; Mon,  4 Mar 2024 03:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC0C28168E
	for <lists+linux-next@lfdr.de>; Mon,  4 Mar 2024 02:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5051438D;
	Mon,  4 Mar 2024 02:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="GYMH1RTf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD919A
	for <linux-next@vger.kernel.org>; Mon,  4 Mar 2024 02:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520369; cv=none; b=oXN6DJdqJ/sizFUtiqrSZjMvv/IAadzMjDblt3h6yzsb5MHaxSi+obI0ad7vto6W9K9qMXVA2slWoMunnfO6paHwVePylcvhzH+3XxZbkS/U9JWl+LZY7zLyVLOXyNy1hRRrHe2SFqkb3ZfpEb4gJwasU+vXMUuprm45RvYTzJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520369; c=relaxed/simple;
	bh=DuNOUCyCbG0Jr5pZE6CjMRch0IBSa3O2L5gnfth+63E=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=WVhmgJMiJNuVjEYJnEecsvB6Y/z6niDz8IFZ9P2V8nit2EEnPkPMNZqxMwnvra5gcQxnCE+CDGGDtxgb7zVhLShKvzGCC00i1dJEKPcDvaYDjLzrwqHXxwO/NSBQuGhD2MJWxmjp27Q7Ji53PGiUirCcb7Bj1ylDMTb+79k7TPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=GYMH1RTf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dcb3e6ff3fso15340695ad.2
        for <linux-next@vger.kernel.org>; Sun, 03 Mar 2024 18:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709520366; x=1710125166; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HIIKAQVYfLQV0BXVcPNG6GPw97nRCFRbSTi4K08HUwU=;
        b=GYMH1RTfjWIbd0lXgdAjKH0JKAKESassgOUgE0bJ4dZqoQb9ICgtWUN29tbGLTrb/k
         k5okQ8QJd9rymxuJHqn670je5Sp3a9RRy7r8jeVh3to3se5MJ9v/bBBN2PJ7yNpN7Osz
         V795dXGS9SmiJ2z4Db6dG2+otTLJ8YMXmB6mIkThGt/1jUuudGnqQyyXioaD6RKzFIgI
         IOStS9j4n2RvKI7fgFNZA9MJNpxfR9bUWjGxwO2Pa0uKaT5YqnFSU1KOCX3aknWIowIG
         5RVduhb+W+7pWo7j6JYEkZlNdNiLodWyZrQRwfbrwX9mg/PJsaKSXLW6aDylBhqPgio+
         rH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709520366; x=1710125166;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIIKAQVYfLQV0BXVcPNG6GPw97nRCFRbSTi4K08HUwU=;
        b=PGz+g529QlmgVQVL/FDFSUYG1IOMpwNLIVD+bu1rJFYmCzK5uHDS383A6jXVDt2lCB
         EAnhV+muqt/XMKaL2EhETofgcYW1L5ESn5Q8sksMsN8FfFUsXbuwqeJp5crCBpfTrOKD
         RpzhcUR4DCRS83wbmkTwXZPjyiIVuN3St7taXDpfFrTcbfueE92/uQA+NzLwEAl8rMF7
         SSfOMUuZcIhYkywyLV4kIG8Ib+DRV4o+XKlH6hE6HMNvQoHuEmjhNcISZWbZ5N1a0j6i
         aLqf24EMujjBqwxGyLpyd9oAEsHApjKEBeIIVAfkk/kSUTKWXrHf7VDEDtXIKhDTo2zP
         hmgA==
X-Gm-Message-State: AOJu0YwFgCqDqlUtGrCZJ6gBaLymjxkCPBCvDJ8D1Hc7obZZhbjqYZK9
	jPEATEExvPrD/eATqdFXYTAgf1L13imiEhNU84DzgqYg5AMGBrUmcYBw7kon0BToz90SBnaLqXa
	AIlA=
X-Google-Smtp-Source: AGHT+IHUHyMvAita2ii0h6GR6AMZEfRW6nrWyKL9ZZiEHaejZxxsaB4HKgxw8zDeRepIYyl2zcg4uA==
X-Received: by 2002:a17:902:ea12:b0:1d9:b751:4752 with SMTP id s18-20020a170902ea1200b001d9b7514752mr9219624plg.62.1709520365675;
        Sun, 03 Mar 2024 18:46:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b001d8be6d1ec4sm7257680plg.39.2024.03.03.18.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 18:46:05 -0800 (PST)
Message-ID: <65e535ed.170a0220.82e8f.cbf7@mx.google.com>
Date: Sun, 03 Mar 2024 18:46:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.8-rc7-83-g9ae6334a68aa
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 54 runs,
 7 regressions (v6.8-rc7-83-g9ae6334a68aa)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 54 runs, 7 regressions (v6.8-rc7-83-g9ae6334a6=
8aa)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc7-83-g9ae6334a68aa/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc7-83-g9ae6334a68aa
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9ae6334a68aa77ddb95ccad17603525c1b810e91 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65e501c18aa2e2a037637012

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-83=
-g9ae6334a68aa/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-83=
-g9ae6334a68aa/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e501c18aa2e2a037637019
        failing since 44 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-03T23:03:14.147009  <8>[   20.262477] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438433_1.5.2.4.1>
    2024-03-03T23:03:14.252684  / # #
    2024-03-03T23:03:14.354315  export SHELL=3D/bin/sh
    2024-03-03T23:03:14.354618  #
    2024-03-03T23:03:14.455241  / # export SHELL=3D/bin/sh. /lava-438433/en=
vironment
    2024-03-03T23:03:14.455561  =

    2024-03-03T23:03:14.556212  / # . /lava-438433/environment/lava-438433/=
bin/lava-test-runner /lava-438433/1
    2024-03-03T23:03:14.557146  =

    2024-03-03T23:03:14.598147  / # /lava-438433/bin/lava-test-runner /lava=
-438433/1
    2024-03-03T23:03:14.619761  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65e501c18aa2e2a03763701d
        failing since 44 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-03T23:03:16.725129  /lava-438433/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
e501c18aa2e2a03763701f
        failing since 44 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-03T23:03:17.784363  /lava-438433/1/../bin/lava-test-case
    2024-03-03T23:03:17.784804  <8>[   23.862736] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-03T23:03:17.785129  /lava-438433/1/../bin/lava-test-case
    2024-03-03T23:03:17.785412  <8>[   23.880088] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e501c18aa2e2a037637024
        failing since 44 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-03T23:03:18.862555  /lava-438433/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65e501c18aa2e2a037637025
        failing since 44 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-03T23:03:18.865627  <8>[   24.979005] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-03T23:03:19.924765  /lava-438433/1/../bin/lava-test-case
    2024-03-03T23:03:19.925185  <8>[   26.000587] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-03T23:03:19.925346  /lava-438433/1/../bin/lava-test-case
    2024-03-03T23:03:19.925444  <8>[   26.018369] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-03-03T23:03:19.925560  /lava-438433/1/../bin/lava-test-case
    2024-03-03T23:03:19.925649  <8>[   26.037959] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-03-03T23:03:19.925766  /lava-438433/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65e50170034f05702463704a

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-83=
-g9ae6334a68aa/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-83=
-g9ae6334a68aa/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e50170034f057024637051
        failing since 44 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-03T23:01:58.304995  / # #
    2024-03-03T23:01:58.406923  export SHELL=3D/bin/sh
    2024-03-03T23:01:58.407645  #
    2024-03-03T23:01:58.509119  / # export SHELL=3D/bin/sh. /lava-438434/en=
vironment
    2024-03-03T23:01:58.509928  =

    2024-03-03T23:01:58.611347  / # . /lava-438434/environment/lava-438434/=
bin/lava-test-runner /lava-438434/1
    2024-03-03T23:01:58.612520  =

    2024-03-03T23:01:58.616763  / # /lava-438434/bin/lava-test-runner /lava=
-438434/1
    2024-03-03T23:01:58.685591  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-03T23:01:58.686070  + <8>[   20.849252] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 438434_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e50170034f057024637064
        failing since 44 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-03T23:02:01.126091  /lava-438434/1/../bin/lava-test-case   =

 =20

