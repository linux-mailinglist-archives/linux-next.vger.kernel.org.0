Return-Path: <linux-next+bounces-3977-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1109871A1
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 12:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC47A1F213C8
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 10:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7516D1AE847;
	Thu, 26 Sep 2024 10:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MJiXzJ0Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE0A1AD5EB
	for <linux-next@vger.kernel.org>; Thu, 26 Sep 2024 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346888; cv=none; b=kiQ6GL8uhCvkTXS9W6W5snFxHMLRyM4NsPwK2ydCVK8WpM+byD+GsoeokNzT2mHwcJefSKOxVVQpxeC18O0GKjf1X72nV0+ryw1f6nv2OzYU6hzNhdwQt7NvRctnyUB5qwuPoMqx5lZyJH22ixx+26iFCpjWBUCnZVgLplYqx2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346888; c=relaxed/simple;
	bh=hNgRha49ziZEEYq1GnsEODcni2q96OiQrfg5g+t/RBw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=GAeg5Pg22HaKfiQchK5jt75wVj6rqyzyAOWZrsMI5mx+egwpHueyaH7f7MXSmR6mGas5dpzHeASLjY/YnOuflSDSza6uy+pNBPwsbqYY26r9b9AZWn7eWAkLZxM0QfkpIzoCcvnoRwBBlw5e7ExmY70x4S19UTDYFMs0l6b00wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=MJiXzJ0Y; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso611136a12.1
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2024 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727346885; x=1727951685; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7+4tWHilF0SiouR/TuibZ/o1D9G/zX1bAjGB9FCHun4=;
        b=MJiXzJ0YWDdSorWUXhgm95tRaz2yAs3TjTTxDx1IKyPNogjmh4WcJfZJcnNIueNyKe
         /qHee4vmgJiE4bSGHsVrdO+vQ9rI7X0OEtDXgY+OWGRtHkWDuPiQsof59BJjfW6/+XPk
         ZB+PsqHAvZZWMvZh0flKUP3ugrI1/vhZvo7RJYRZJF2Kr/z4RtUZUQb2zODK/mfic0EM
         WgmaHDdMsbWfv+hFCi5RiV1FFm6u9wd6TsmMAjXqN65TDS9HrPjsmLC2H0fjoRmy8UeK
         IU2TMp0aeI9KghX1ha4A23yrHxcM/ysvdycmvH4WpqVpAqrjChwkPrDu1K9mPnWJ5hkF
         TLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346885; x=1727951685;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+4tWHilF0SiouR/TuibZ/o1D9G/zX1bAjGB9FCHun4=;
        b=pBNPlWY7EEuY0BL/0hJ5R6Ii5TDsDyig13rudUUWeDcQvOYfEPHCZ0tl0LHuVvItzd
         ET6q/FxSe3KwjFJGhCptpK9MbQp/Dx3QfFAWaNu9Uu6k5eR3vVNoo58vu5AS+wMkT/E1
         kA/oKEzlhuRFOpfx1/GYU8D5+3Z/JzkU+CdGzD+OguYjWqV0waqLt+uxSm4wj9i6wX/9
         jcohlYaE3z/czXcKShwyVhCxLCVjioPlfMSOukx0NGr37BiNSHA/wWtg0xyBNuUVakE4
         GGHlNkXDUJuAY11ecv0qID+Pqz97NSuWQ69wEsznAoBC07RxtIhDG5+vgnrf2q5Ndm0g
         MjYQ==
X-Gm-Message-State: AOJu0Yy5pPUFXRlyhjh1UvZnvXoky1T0ZghcZabqgV4hALNsrku0khbA
	NON7HhWc+S6+y54Y27aAJxRsv2gt7HJ++/S4FmdUKgyMGx/ZdXnK7iwsRVGLLWUJyqAx6/sD0mn
	A
X-Google-Smtp-Source: AGHT+IEygwMBwzEDr0aPDuSxsu3qSaeeKuyJkab9B/drobDgaHrPbGzYZ31n0Ke61b78m17dwHdG8w==
X-Received: by 2002:a17:90b:b10:b0:2c9:5a71:1500 with SMTP id 98e67ed59e1d1-2e090ee3e1amr4323955a91.0.1727346884866;
        Thu, 26 Sep 2024 03:34:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e2cebefsm3124557a91.55.2024.09.26.03.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 03:34:44 -0700 (PDT)
Message-ID: <66f538c4.170a0220.2942e7.b983@mx.google.com>
Date: Thu, 26 Sep 2024 03:34:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240926
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 119 runs, 5 regressions (next-20240926)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 119 runs, 5 regressions (next-20240926)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 2          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240926/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240926
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      92fc9636d1471b7f68bfee70c776f7f77e747b97 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/66f4fef6f302482154c868dc

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240926/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240926/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66f4fef6f302482=
154c868df
        failing since 23 days (last pass: next-20240830, first fail: next-2=
0240902)
        2 lines

    2024-09-26T06:27:44.799759  <8>[   19.725821] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2024-09-26T06:27:44.800289  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-09-26T06:27:44.805281  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-09-26T06:27:44.805769  kern  :alert : Data abort info:
    2024-09-26T06:27:44.810791  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-09-26T06:27:44.816373  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-09-26T06:27:44.822664  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-09-26T06:27:44.832967  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-09-26T06:27:44.838613  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP
    2024-09-26T06:27:44.844096  kern  :emerg : Code: 540004aa f9401a80 9b25=
0265 b4000445 (294014a3)  =

    ... (1 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/66f4fef6f302482=
154c868e0
        failing since 23 days (last pass: next-20240830, first fail: next-2=
0240902)
        12 lines

    2024-09-26T06:27:44.774095  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-09-26T06:27:44.774668  kern  :alert : Mem abort info:
    2024-09-26T06:27:44.779622  kern  :alert :   ESR =3D 0x0000000096000004
    2024-09-26T06:27:44.783071  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-09-26T06:27:44.788657  kern  :alert :   SET =3D 0, FnV =3D 0   =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66f502cd2364d90cb9c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240926/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240926/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f502cd2364d90cb9c86=
860
        failing since 3 days (last pass: next-20240829, first fail: next-20=
240923) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66f4f9f0e2086ad50fc86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240926/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240926/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f4f9f0e2086ad50fc86=
861
        failing since 35 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66f50527f453520c0dc8685b

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240926/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240926/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66f50527f453520=
c0dc8685e
        failing since 19 days (last pass: next-20240904, first fail: next-2=
0240906)
        2 lines

    2024-09-26T06:54:25.576540  kern  :emerg : thermal thermal_zone2: gpu1-=
thermal: critical temperature reached
    2024-09-26T06:54:25.581336  kern  :emerg : reboot: HARDWARE PROTECTION =
shutdown (Temperature too high)
    2024-09-26T06:54:25.595982  <8>[   17.672838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =20

