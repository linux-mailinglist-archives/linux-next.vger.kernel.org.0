Return-Path: <linux-next+bounces-3543-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1B0968943
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 15:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 568912813E1
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 13:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFE3205E38;
	Mon,  2 Sep 2024 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xvIP0HU9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5771865F6
	for <linux-next@vger.kernel.org>; Mon,  2 Sep 2024 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285419; cv=none; b=oSkTkBxlB0ejA2JbwQuPzT3/ZSUw5N9Cth0B/LVnC6WQai+fh97Ak2xnb9Enk+l3I8paFKJo51mVth497bwl8bhegDvi8n1HFvT376E2HKWniawiT1w7xDhL7rTTj7INYpWTgISCuBBsj6uRQ4VGETsdUl3fFZ1KEcdz9MAwsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285419; c=relaxed/simple;
	bh=wwiPtmcn5PmyLo74pct6zh97xuwdJZ47kroFcsXRbFQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=RBS9AqsYn0Wdka69Z6/wLBiL/tAgOZYYAxrr+oNTnB8TUP+raYpEV7fhRLqigS/bq8Dj7M7DBWF8CyO3SPqEXRyVu44yZbKWlVeVUp4O7v0UxR+2+QhywodUxRDmBuHHH152vVFhJWJNT/ma/PUlgpgR/rg1NNcKQw/UAq35hm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xvIP0HU9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-717594b4ce7so783483b3a.0
        for <linux-next@vger.kernel.org>; Mon, 02 Sep 2024 06:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725285416; x=1725890216; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5TELxG2VIMI9dCiuzjcfiYhYHk4H001/y6Ni5Tc00MY=;
        b=xvIP0HU9ZvgQ0A+zJAExuT7AD904cHyqJxVXEx4XcqU306B+Ob/xfoZpfKdYf53z16
         jES7uL8iUTPMFGvztYK0ytcf5Y5ztdFqvqXLWzxFl3HZrr9av7+zmYO2OOz2Lg/PSm4e
         wssjkluoBKJnt1FKCCc2A6cwuQWiVIRM2j8+96ozyvCC0qgaERO5jiLVkJvO7ucVDXk7
         yXPPxdl/I6NT2UuybbjEkwSuTpDkvg+yfMo/qZaSiRcxeLU3YhAF5ehy11Md8d+WJXVH
         W7MzZN4q6rTdGvWDH0dI2d2GynAvOs4EoyC6yuyphAbrmkrfTqDQl2v2WF49w1IwV6v5
         bHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725285416; x=1725890216;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TELxG2VIMI9dCiuzjcfiYhYHk4H001/y6Ni5Tc00MY=;
        b=hxdbZWsJ3wEZvf/NB1s2wVdvHS8HnqYJ5FLGtBJVoXdRfaoMrTAnCC2sypXxjAvQhm
         n2hvTPQWsWqsUzroqtBMJlRafZHL4N2HD8fcC/TAx3IfL9k/6OSfJY10F1jBFCLTalXy
         wto55nBZDMgptj1wDpSpIUz3WKuTTDc7EdlXQSOuz8oxLhSXeyOA/nUF02CwKo1loJHS
         y3xuGZc1nEDNLDO1d1Q9nX/IEkKVzv5T1Vw38xKlq3DlAm5FoeHoSQ6uyFPzvEx6jyew
         kwxFx5cVbfuSZMIaEC/WkvF7Y0etrgeSMJnzqSiwA//3N+RVlPLAvxE4qhtDPnNYZkDC
         mIdQ==
X-Gm-Message-State: AOJu0YydgUiRDW+n5MOc+0i3UbHn5g1DN4Ww8vdlNDhL1EselZWEgTys
	tfTht01ZBjtLemS44iYqwmv2DaTkCIRhf0AH4LK9JXaO1RC7Fi/O3qf6wykHc/MVOyvQj7XQZAY
	k
X-Google-Smtp-Source: AGHT+IHLtoy4UjH791WtK0UHBrnUeubwzvlt8mxqriOYAGls8WlEzaKPN5oIJ547sdbfxD85Y1CR+g==
X-Received: by 2002:a05:6a21:114d:b0:1ce:cd97:f865 with SMTP id adf61e73a8af0-1cecd9803femr9081539637.31.1725285416258;
        Mon, 02 Sep 2024 06:56:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2053e1261cbsm42347855ad.228.2024.09.02.06.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:56:55 -0700 (PDT)
Message-ID: <66d5c427.170a0220.1e7c1.ce4d@mx.google.com>
Date: Mon, 02 Sep 2024 06:56:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240902
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 155 runs, 8 regressions (next-20240902)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 155 runs, 8 regressions (next-20240902)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
         | regressions
-----------------------------+-------+-------------+----------+------------=
---------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-12   | defconfig+k=
selftest | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron | gcc-12   | defconfig+k=
selftest | 1          =

meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest | 2          =

qemu_riscv64                 | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug     | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug     | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig  | 1          =

r8a774c0-ek874               | arm64 | lab-cip     | gcc-12   | defconfig  =
         | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240902/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240902
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ecc768a84f0b8e631986f9ade3118fa37852fef0 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
         | regressions
-----------------------------+-------+-------------+----------+------------=
---------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron | gcc-12   | defconfig+k=
selftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d58c897078b91c9fc86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240902/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240902/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d58c897078b91c9fc86=
865
        new failure (last pass: next-20240830) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
         | regressions
-----------------------------+-------+-------------+----------+------------=
---------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron | gcc-12   | defconfig+k=
selftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d58c9e7f12d069e3c86879

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240902/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240902/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d58c9e7f12d069e3c86=
87a
        failing since 3 days (last pass: next-20240827, first fail: next-20=
240830) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
         | regressions
-----------------------------+-------+-------------+----------+------------=
---------+------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest | 2          =


  Details:     https://kernelci.org/test/plan/id/66d58bb81d425a64d4c8686e

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240902/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240902/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66d58bb81d425a6=
4d4c86871
        new failure (last pass: next-20240830)
        2 lines

    2024-09-02T09:55:51.807399  DABT (current EL), IL =3D 32 bits
    2024-09-02T09:55:51.807916  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-09-02T09:55:51.812938  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-09-02T09:55:51.818599  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-09-02T09:55:51.819110  kern  :alert : Data abort info:
    2024-09-02T09:55:51.824051  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-09-02T09:55:51.829589  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-09-02T09:55:51.835105  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-09-02T09:55:51.846169  kern  :alert : <8>[   19.635423] <LAVA_SIGN=
AL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D=
2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/66d58bb81d425a6=
4d4c86872
        new failure (last pass: next-20240830)
        12 lines

    2024-09-02T09:55:51.785121  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-09-02T09:55:51.785666  kern  :alert : Mem abort info:
    2024-09-02T09:55:51.790727  kern  :alert :   ESR =3D 0x0000000096000004
    2024-09-02T09:55:51.801789  kern  :alert :   EC =3D 0x25: <8>[   19.592=
536] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>   =

 =



platform                     | arch  | lab         | compiler | defconfig  =
         | regressions
-----------------------------+-------+-------------+----------+------------=
---------+------------
qemu_riscv64                 | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66d583c7358e54ba5ac86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240902/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240902/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d583c7358e54ba5ac86=
862
        failing since 47 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
         | regressions
-----------------------------+-------+-------------+----------+------------=
---------+------------
qemu_smp8_riscv64            | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66d583dbd129350314c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240902/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240902/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d583dbd129350314c86=
857
        failing since 47 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
         | regressions
-----------------------------+-------+-------------+----------+------------=
---------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig  | 1          =


  Details:     https://kernelci.org/test/plan/id/66d57e04985da5f918c8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240902/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240902/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d57e04985da5f918c86=
85b
        failing since 12 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
         | regressions
-----------------------------+-------+-------------+----------+------------=
---------+------------
r8a774c0-ek874               | arm64 | lab-cip     | gcc-12   | defconfig  =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/66d5831cd18936fd1ec86868

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240902/arm6=
4/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240902/arm6=
4/defconfig/gcc-12/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d5831cd18936fd1ec86=
869
        new failure (last pass: next-20240830) =

 =20

