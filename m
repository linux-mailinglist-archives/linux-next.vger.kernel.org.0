Return-Path: <linux-next+bounces-4063-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BAE98D132
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 12:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516CE1F234C0
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 10:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234E21E501B;
	Wed,  2 Oct 2024 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HRH5TqpM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035972564
	for <linux-next@vger.kernel.org>; Wed,  2 Oct 2024 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727864920; cv=none; b=rGa2ihtND8EH9GcUsYkHQpv74J9rdLOBofJu2/RKrONgLVR1v3pS2VvZRCpeHBE5VUtWNfs6nT4NtQM8NAZ+jKEMRRB2uctDrpf3GfRvTZfbFdUkfHThFMi7PugRYSxs50B4eDodmrMvbNa90/tl+FZ4iE4QLknrRx0DHg90okI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727864920; c=relaxed/simple;
	bh=bXPYvRCyk/TZbxlbWd366LW7oWDYTxqODr1Wc3783yc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=pI9Si5kpGvtL6AVouvZ38RfAzNvwKjIVd/03ilOIkycLkyD+2j5I0sjcLVJuDAFikXWKY8OQU5ppcPAUqM2bc3hpXjUN2solVqlXPdx1P5xkli8H4wuwdwCD6fJWGMP2Fxz+JEGGeUUrxTUPKh4ew7gRXNiCpceAixyX/9q4aM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HRH5TqpM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20bc506347dso7469155ad.0
        for <linux-next@vger.kernel.org>; Wed, 02 Oct 2024 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727864917; x=1728469717; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=COn6t6kN/hNOKR192XD47BSUFHcwLHsXcCjcErvnBtA=;
        b=HRH5TqpM4U6MBJuZE3/g4+g/zTHZejslowkBsNYCIfiYWz1iGITeMxD+rOTcoF/f8K
         JuUTHMtazNj2h/9fRUlIRXseZ4RuXyd3W/0oQ2DHwxru2gckug9hNVgC0dB+cYGC015m
         UGWUB0ZYeh0wQq0EQEYP3YqFeu+4eELOA+z90TbOpZcFkYyxztwJ3t2z3ve+VzagLyBP
         tO16z4MIPmooAcaX7l8gfIuIJVybooV+PD5DM2ZiqPANvfZcsoqf6FHYe5kozJOZgqVG
         /MV3293NW64xqcnsao6Yyc9j38H56E0nfEuYICYDrczlvxzVxHQT8SkFLwGv4WNbxMTR
         w48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727864917; x=1728469717;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COn6t6kN/hNOKR192XD47BSUFHcwLHsXcCjcErvnBtA=;
        b=I5iFGSc2/LG6TXFVRLbfyDCC2esoWwUpFjgo/+q+HERRx+3VYKjjXwHQ2bp581bBUX
         bsKxsXjWR/e58avTeyqi63dIMPAgl7/XRVsab4qqbocY+G8lS1VpYWrhiRvuktz4GAbb
         C42pHYpQD4OejWL2m7YTVzT6Hen8oWUTFyWSAWDZdSwmMkJ9BfrFtT7JvRqTndoiHY2R
         YiB92KgWMOJbj6U/XZPx3ExMVVw6VAivOOxOz/ocaS10r/eeAIuwFk+n0550/QDm0fyx
         /v6CiGeWYbEXKzh0Wbx0BdbV9YIKtJrYoyEx8VBujMAJi4ICGecF6Qc94BO5Ojfv91Y5
         yIaw==
X-Gm-Message-State: AOJu0Yzx1XyNZEiMPyj7Tg0kjc0XlY9wfmhdKzaCXmY8VC4CKfVwOzXV
	m2swamYzDczmchmdzuUWTKdUxjudJrUQdUbEoMEkwq0Bv2oSVR0XeYF2Ye2pLFiUoW/b8Wy3LjX
	i
X-Google-Smtp-Source: AGHT+IF/kNQzS1qPO3mnPlpsD62iIR3ZSzzPcxdlnTziFLHjzQ2AwGAQAh0xJHELil+3dWfobXfggQ==
X-Received: by 2002:a17:902:e80c:b0:20b:51c2:d789 with SMTP id d9443c01a7336-20bc59e6496mr38672735ad.16.1727864916774;
        Wed, 02 Oct 2024 03:28:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0ef3asm81309995ad.121.2024.10.02.03.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 03:28:36 -0700 (PDT)
Message-ID: <66fd2054.170a0220.250ce7.10d8@mx.google.com>
Date: Wed, 02 Oct 2024 03:28:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241002
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 226 runs, 7 regressions (next-20241002)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 226 runs, 7 regressions (next-20241002)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beagle-xm                    | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241002/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241002
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fe21733536749bb1b31c9c84e0b8d2ab8d82ce13 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beagle-xm                    | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fce2f40c182ccb57c8686a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241002/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241002/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fce2f40c182ccb57c86=
86b
        failing since 32 days (last pass: next-20240829, first fail: next-2=
0240830) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66fcec2ed71a872b83c86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241002/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241002/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fcec2ed71a872b83c86=
862
        failing since 35 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66fcec30abdbab0dfbc86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241002/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241002/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fcec30abdbab0dfbc86=
856
        failing since 35 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66fce7fd1489dfd094c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241002/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241002/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fce7fd1489dfd094c86=
857
        new failure (last pass: next-20241001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66fce7d5a13691ec41c8686e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241002/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241002/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fce7d5a13691ec41c86=
86f
        new failure (last pass: next-20241001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66fce251b17758f5aac86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241002/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241002/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fce251b17758f5aac86=
85a
        failing since 0 day (last pass: next-20240930, first fail: next-202=
41001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fcee40c3c68f280cc868f0

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241002/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241002/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66fcee40c3c68f2=
80cc868f3
        failing since 25 days (last pass: next-20240904, first fail: next-2=
0240906)
        2 lines

    2024-10-02T06:54:34.488353  kern  :emerg : thermal thermal_zone2: gpu1-=
thermal: critical temperature reached
    2024-10-02T06:54:34.494063  kern  :emerg : reboot: HARDWARE PROTECTION =
shutdown (Temperature too high)
    2024-10-02T06:54:34.514298  <8>[   17.572561] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =20

