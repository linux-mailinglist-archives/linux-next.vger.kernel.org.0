Return-Path: <linux-next+bounces-3926-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BC197C8A7
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 13:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98E4CB212B1
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 11:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E777719C54A;
	Thu, 19 Sep 2024 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qCQS1CMi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A39D199E8C
	for <linux-next@vger.kernel.org>; Thu, 19 Sep 2024 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726745467; cv=none; b=TYjOu5Xsvz1IS7Ul68c/BaYoYpxhZ7uTKhoWrvgR87Bg/Q7fxYNg7KTagGDa5BpejkUcuIhLkk+M4btSlBg0VzKS9Gy12UXFi9Ig1ZBrqW41qTEI72rnBJWt0Z+U/BqzDbmRunhbmSNa/8sWL3+2SohcwXFOngmhYM1C1p0V3wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726745467; c=relaxed/simple;
	bh=DCy0///gLbVY6frgK9CdVZ8n+C7ZXIJZELOTZ3Lrm7Q=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=m8ieV0wXs77pKpwwrvpX/Tc5c21JAK8r466gkK39g8Y84YNcpUkySBxO6LUD3m9svg8UTBqxrPKlLG2z0nxWGSVeizZcTSLRwjGpMmKSJnCdJ88OwL1445euZqOzMORzj8yI3xqerce3ZrWGvXSyo/m/mkwXwjVomwVHH8cCEQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qCQS1CMi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-205659dc63aso6567035ad.1
        for <linux-next@vger.kernel.org>; Thu, 19 Sep 2024 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1726745464; x=1727350264; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7cJcRLycp5WQ1w4mjiYXSeu/ZugFR4RAfduJXy7aa/8=;
        b=qCQS1CMi4vr6QY6afy8EEe1QK/VQ2ZuXAU3O9khMtS8tt8s0YY4t05iZYbg4k13yBu
         xvTJRJebTuSpiYHvunfiqLqzXYYiaMn4FJqerpkkRIPHIAjat2B75PG3z9rYWLHCvKyg
         v6FQyVxYy7XABQCn1OnZBgl+NfAYzFIEMJ3cmPf28D6bFpHS7aqbS5RRT+X2m2N0Rzhj
         DXlGMHyd9Havejjdo4aiG94Unuri4c/VtZwl/dxxkXJbcf3TiyUfvbSCMYri18TfWujI
         3pmMxfuhDMsTRdt6jQcU0nun8THqHnZcyogV//VoX5ZEfam6z2iZDTz8ieHbxVrLRLmF
         WU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726745464; x=1727350264;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cJcRLycp5WQ1w4mjiYXSeu/ZugFR4RAfduJXy7aa/8=;
        b=lyJhGxlKvjMu/Cz0yWrElPQzrilYrPhgke07H04RthmiO+n4E7s95vFZkd2iIyBAQt
         Ns8aS7Kph1H7WdJefygLUBG3802CLvsfnw7e8GeR4UgiiY5T95MtiXQ8XXNvlmm00/AR
         Np/4ypcUSz64GwRYQL5UYayAe9XTZrxLadiqjFe8LuDdanSWa+GYiRzJBpRb+dywhhA6
         R3/FMa9PvUSMtQj8cuoYB1mvZComtGltIrnCmKTgDKPTrPYbek7Ba6MeSRHpkA6U+da7
         T39lJlKBYDaT3qSdqrrcfd6eBFnivD3APoAryfTId7NFjA0Qzds5ujoyAv3t7lAwxb5h
         /Zmw==
X-Gm-Message-State: AOJu0YyjovU+pTCVtfEoWeH9zLGr3s9qfPmMsbIX6m/CP5euJvNN3SlR
	VZu35/AjzHw3Yfq1M+ZsVDQUbgv35GXYoslZfXjc9Oz+gBoDc+hW18824giR/hvPKsYHASL5fDj
	+
X-Google-Smtp-Source: AGHT+IGPJqzMLzuj3Fga7w2YtDYFc0hHVKQcfaAhNG7dfx88h3WswIdDMoLXaflc5urEIQ1v+epIDA==
X-Received: by 2002:a17:902:ce87:b0:202:4b99:fd3b with SMTP id d9443c01a7336-2076e46301amr417755885ad.42.1726745464290;
        Thu, 19 Sep 2024 04:31:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945dc13fsm78350255ad.24.2024.09.19.04.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 04:31:03 -0700 (PDT)
Message-ID: <66ec0b77.170a0220.235a00.f796@mx.google.com>
Date: Thu, 19 Sep 2024 04:31:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240919
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 172 runs, 10 regressions (next-20240919)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 172 runs, 10 regressions (next-20240919)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

meson-g12b-a3...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =

meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 2          =

qemu_riscv64                 | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240919/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240919
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3621a2c9142bd490af0666c0c02d52d60ce0d2a5 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66ebd670ce12a79439c8687b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240919/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240919/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ebd670ce12a79439c86=
87c
        new failure (last pass: next-20240918) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66ebd3c1968da50d81c86d19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240919/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240919/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ebd3c1968da50d81c86=
d1a
        failing since 22 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66ebd3c3675d0bfd07c86878

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240919/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240919/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ebd3c3675d0bfd07c86=
879
        failing since 22 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
meson-g12b-a3...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/66ebd1c04092f3f090c86897

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240919/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-meson-g12b-a311d-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240919/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-meson-g12b-a311d-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ebd1c04092f3f090c86=
898
        new failure (last pass: next-20240906) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/66ebd5a83eb8ec8240c8685b

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240919/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240919/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66ebd5a83eb8ec8=
240c8685e
        failing since 16 days (last pass: next-20240830, first fail: next-2=
0240902)
        2 lines

    2024-09-19T07:41:15.820437  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-09-19T07:41:15.825991  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-09-19T07:41:15.826325  kern  :alert : Data abort info:
    2024-09-19T07:41:15.831558  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-09-19T07:41:15.837088  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-09-19T07:41:15.842618  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-09-19T07:41:15.848145  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-09-19T07:41:15.864834  kern  :emerg : Internal error: Oops: 000000=
0096000004 [<8>[   19.670946] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RE=
SULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-09-19T07:41:15.865206  #1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/66ebd5a83eb8ec8=
240c8685f
        failing since 16 days (last pass: next-20240830, first fail: next-2=
0240902)
        12 lines

    2024-09-19T07:41:15.794327  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-09-19T07:41:15.794762  kern  :alert : Mem abort info:
    2024-09-19T07:41:15.799495  kern  :alert :   ESR =3D 0x0000000096000004
    2024-09-19T07:41:15.814962  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
<8>[   19.621207] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail =
UNITS=3Dlines MEASUREMENT=3D12>
    2024-09-19T07:41:15.815308  =

    2024-09-19T07:41:15.815594  kern  :alert :   SET =3D 0, FnV =3D 0   =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_riscv64                 | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ebd63df59e592deec8688e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240919/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240919/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ebd63df59e592deec86=
88f
        failing since 0 day (last pass: next-20240906, first fail: next-202=
40918) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ebd689712dee51bcc86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240919/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240919/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ebd689712dee51bcc86=
862
        failing since 0 day (last pass: next-20240906, first fail: next-202=
40918) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66ebcf07dcc1ee1d48c8689c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240919/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240919/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ebcf07dcc1ee1d48c86=
89d
        failing since 28 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66ebd1ee064ad09db7c8685f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240919/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240919/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66ebd1ee064ad09=
db7c86862
        failing since 12 days (last pass: next-20240904, first fail: next-2=
0240906)
        2 lines

    2024-09-19T07:25:30.275365  kern  :emerg : thermal thermal_zone2: gpu1-=
thermal: critical temperature reached
    2024-09-19T07:25:30.281291  kern  :emerg : reboot: HARDWARE PROTECTION =
shutdown (Temperature too high)
    2024-09-19T07:25:30.305387  <8>[   17.502132] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =20

