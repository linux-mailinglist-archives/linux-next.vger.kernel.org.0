Return-Path: <linux-next+bounces-3149-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91593EE70
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 09:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16DC51C21796
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 07:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C15127B57;
	Mon, 29 Jul 2024 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="POTRrxDS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1219129A78
	for <linux-next@vger.kernel.org>; Mon, 29 Jul 2024 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722238197; cv=none; b=fPZ8gkUZJGAUD3btH5CvNPncrVS+YSktJ+XickSGjLnaQvpifyeBpDXkEFhIWp2LMIF7niwA7qL1t5+AvB4/oWMBdzNlMB7dftLsEnYik0bgrDHoGntN2itIw+PAFFQbPp613Hd19Pc6lNCxg3Kdzfes5Cx9SF2tr75Tx/0e900=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722238197; c=relaxed/simple;
	bh=BzfP3X1H+57pdbLuKUFL/UPLu3Y4QHeVvVPqrhEQNJ4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hTwVQh0ChMJ6F7wkU6HUgh9z9Nuu58hp+AXcR+ESAgE525ZxAMlm6AiFkjFpMWtcbQLsqkJsITmadNB5bFFyprn8CGGbwrSvy/fTA6uoKp3D122hX1TjE1/BkNCWIZ26sDeWBlw1JDL38b7+DvszYwNpg6nk+qK3+7R1t6+Rm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=POTRrxDS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc60c3ead4so15353135ad.0
        for <linux-next@vger.kernel.org>; Mon, 29 Jul 2024 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1722238195; x=1722842995; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kYxhgpCNhMUeeD0DSR6i9wCCFzRm3nY1zW8cV9NHPpQ=;
        b=POTRrxDSv9+VcxddQuSA5I5UoC3yTlQSXyNutQI96GlxkjVg+EfXeEugQrZGrBBcXg
         2AbrHZoe0ljCwPFCvVZdS1TzKxtrTAli6ofix22PsjynJUTMChrDjMRlTOAgw5sTafmd
         nIJNbpMmXgH+FovYr3Hj0LUXB+RGEYInyNxowsG3veseQbUMFG0uu/gBqvD72MD5dmZ2
         SmCKqwgHoKL26eUkGrKbG8j+gfErULIvmKqdw+qeIz1n0JyLRSxk4qyJJDcWWueqetiK
         IdH6YQYIBV4YEUWeVvCY02lxuNma8e5RFo8RqR4UjbGtEPdKW9otGWZJNso9ntNOHs14
         h/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722238195; x=1722842995;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYxhgpCNhMUeeD0DSR6i9wCCFzRm3nY1zW8cV9NHPpQ=;
        b=s3E14PMrH+/2vFprxAOPak73Pqg+VAviRmuz47GjqF9QiB87RBh93XHX0hDqYYwC9E
         Uq2BE4ZrbGmHQ2/TKqDnzB3i3n2jDXa10YCiXy2iM58dXHAjYHkVC6S1KTbPsxcc96Tv
         FixKMdom9syHnROcrwPYxKdwbW9gUML7ztfywtiDbhERTWPXF0Fw59GG9nLRO2AWmC9x
         qo/MwycOHDPNTqywzdyrJ8diapnHHR0jR6i1S5/kgUu0Xv49J8qHFCjPE+Sas0TKMARD
         JGVSnzHtf1uzcwBK4AAxp84ScbD2NeotNp1I9ciMYT1Y6shm4gOhd3i1424s8sKyzIfz
         ZBRQ==
X-Gm-Message-State: AOJu0YzawZ6NwYddXpfzPKOpzwgvhsiA4YRTrwElapPmdm83PD8BKSx9
	h2aJLt6Ka6YGde45D1m6i1AtjXNOHWqvtc6t9vD+Pcnlm6pG2r9vKW+59BHjBHLZL3YRAYPHNYe
	N
X-Google-Smtp-Source: AGHT+IEKvty2TS2XFvi58dJ+dDYKNKDY3ofv6BzzdARBRX6mblGdXVvNkz0L+MwmpKtAJcJIN6Rm+w==
X-Received: by 2002:a17:902:778e:b0:1fd:95ac:506b with SMTP id d9443c01a7336-1ff04950719mr44088185ad.64.1722238194634;
        Mon, 29 Jul 2024 00:29:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f99099sm75941135ad.247.2024.07.29.00.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 00:29:54 -0700 (PDT)
Message-ID: <66a744f2.170a0220.afe3a.1fd1@mx.google.com>
Date: Mon, 29 Jul 2024 00:29:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240729
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 166 runs, 3 regressions (next-20240729)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 166 runs, 3 regressions (next-20240729)

Regressions Summary
-------------------

platform          | arch  | lab         | compiler | defconfig          | r=
egressions
------------------+-------+-------------+----------+--------------------+--=
----------
qemu_riscv64      | riscv | lab-broonie | gcc-12   | defconfig+debug    | 1=
          =

qemu_smp8_riscv64 | riscv | lab-broonie | gcc-12   | defconfig+debug    | 1=
          =

r8a7743-iwg20d-q7 | arm   | lab-cip     | gcc-12   | shmobile_defconfig | 1=
          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240729/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240729
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      931a3b3bccc96e7708c82b30b2b5fa82dfd04890 =



Test Regressions
---------------- =



platform          | arch  | lab         | compiler | defconfig          | r=
egressions
------------------+-------+-------------+----------+--------------------+--=
----------
qemu_riscv64      | riscv | lab-broonie | gcc-12   | defconfig+debug    | 1=
          =


  Details:     https://kernelci.org/test/plan/id/66a713fbf58c6902587e70e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240729/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240729/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66a713fbf58c6902587e7=
0e3
        failing since 12 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform          | arch  | lab         | compiler | defconfig          | r=
egressions
------------------+-------+-------------+----------+--------------------+--=
----------
qemu_smp8_riscv64 | riscv | lab-broonie | gcc-12   | defconfig+debug    | 1=
          =


  Details:     https://kernelci.org/test/plan/id/66a713edf58c6902587e70d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240729/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240729/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66a713edf58c6902587e7=
0d9
        failing since 12 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform          | arch  | lab         | compiler | defconfig          | r=
egressions
------------------+-------+-------------+----------+--------------------+--=
----------
r8a7743-iwg20d-q7 | arm   | lab-cip     | gcc-12   | shmobile_defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/66a706de0bfb7c0f5b7e707a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240729/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240729/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66a706de0bfb7c0f5b7e7=
07b
        failing since 3 days (last pass: next-20240724, first fail: next-20=
240725) =

 =20

