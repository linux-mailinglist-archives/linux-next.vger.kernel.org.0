Return-Path: <linux-next+bounces-4215-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1108F9984F7
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 13:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DC271C2424C
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 11:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC27F9CB;
	Thu, 10 Oct 2024 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="vFZBW2pb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7FE1C244C
	for <linux-next@vger.kernel.org>; Thu, 10 Oct 2024 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559640; cv=none; b=Y8OA/xjLyLWKBNG9LPRDgX2H4HB5t/Kdr/DpcuAQVl78WkDczBs/fnwQyP83ucbhGVA7MAZcOCaDLyNhuje36oTtwg5vQqBCXao0IwAFhYBJJPl7KJXudZ+HuJ204Fda0FE+ZxKXBYY8q0m/HynuI9l7hlPkm6EHgCd0b0D56kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559640; c=relaxed/simple;
	bh=wDBn8//XlshsHNzjxvQXzA8RHLrpwgOZtC7YDJMOhnA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=JzAku9KozCujKcbmJLZ6SQj6hWWAZ1QRUWTXovMnXU3vZcVGDEBM2gkh7sr9uxt6HjrUTscjlLkWrcxWjVukMHz6WZKvcbVqVWCvyQb+wbWDx9AOL807pz1AU7ceOIXnBs3cjhEoyosWoY/5KXl4HH+76QCD5rp4zIpmIJZO5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=vFZBW2pb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e01eff831so608205b3a.2
        for <linux-next@vger.kernel.org>; Thu, 10 Oct 2024 04:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1728559637; x=1729164437; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GWZSL+yCeVW19ozWZXbraQutK1PQbkPlQewtbDMx1Io=;
        b=vFZBW2pbzNCaelZL+amNGUmwk059V8W039h0sFjJD55nd/808/g60b1a7mxm+7dDrG
         2bVYRXio4l9drcNg5mUgNbEYC1ZlDDnZQH16mII9ui7Veb6WP2XxTqEwsBwHfumJGLQU
         KuEszHB+HjcC+qmbX8nKqJYoGyRFYy0HEjifKLaRqduG96Dwidlx7fP7C9BPLiA/hIHb
         GhaXB9a30qu5ApDFTOCDU16J+rvgkextonepz+9Ure1akTBMOINJ7Kteco6hbg9AZsQm
         poMosQV7e92wdSuOv1waJWs8qy5PPX24oa5s7S7UybbbRl7tCFMS/wIr7PVgemxucWtJ
         oLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728559637; x=1729164437;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWZSL+yCeVW19ozWZXbraQutK1PQbkPlQewtbDMx1Io=;
        b=s5Yto/sTBhNekVfAvq100UW0J3+NEhld7aZR9/ShX5TQdcClyyQ1+WzM4Wc4HmBd8q
         muPYyzjUPeTAMCCd71P0QRyM1pMi8Te3Wq4hya2jh43jirpoZVfGlxBW3U4/VFi4NlZw
         N5eGi4IrIqCRqgoS2dqcBf+2sfPYkXaKbKM05AhYtgeUwEEHwhUcUkB55amt4PF+61hg
         iRQRJeMkpEKZ6GiMLsSzv2fwG0TsgZVq21GDeRV1+W1929X+/VkFe0yjBVaM2wcTenD0
         Rt92qFv2aa9U8shf3ormpUHMZPGd4Le3OdHzkzmIBjpZNFEMDga3SlfcbOw5lE5LdEUj
         EuHw==
X-Gm-Message-State: AOJu0YyW6pegPSFlEKoW42H+FFMqh7YEPCA5vWT5ulX+CVo5fWbe+yww
	cG5mHZgSWgxCwFabBS/rnLFboDv04559Uv6fvA+tBedi3iaA6895FqFSfN1yvcOEzTkloMXkhPW
	j
X-Google-Smtp-Source: AGHT+IGEGTlFEWyX61Dy4gJrGDJnymu6lS5L2ZHl9SslCrxe9kWXIMHVjpsSEtfy8Y/rY3Eq/c7JsA==
X-Received: by 2002:a05:6a00:4b4b:b0:71e:410:4764 with SMTP id d2e1a72fcca58-71e1db77071mr9902553b3a.8.1728559637153;
        Thu, 10 Oct 2024 04:27:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9f6cb1sm849961b3a.84.2024.10.10.04.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 04:27:16 -0700 (PDT)
Message-ID: <6707ba14.050a0220.216ae3.2048@mx.google.com>
Date: Thu, 10 Oct 2024 04:27:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241010
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 165 runs, 3 regressions (next-20241010)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 165 runs, 3 regressions (next-20241010)

Regressions Summary
-------------------

platform          | arch  | lab          | compiler | defconfig            =
        | regressions
------------------+-------+--------------+----------+----------------------=
--------+------------
meson-g12a-u200   | arm64 | lab-baylibre | gcc-12   | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =

r8a7743-iwg20d-q7 | arm   | lab-cip      | gcc-12   | shmobile_defconfig   =
        | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241010/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241010
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0cca97bf23640ff68a6e8a74e9b6659fdc27f48c =



Test Regressions
---------------- =



platform          | arch  | lab          | compiler | defconfig            =
        | regressions
------------------+-------+--------------+----------+----------------------=
--------+------------
meson-g12a-u200   | arm64 | lab-baylibre | gcc-12   | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/670782fe2c82000191c86871

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-baylibre/baseline-meson-g1=
2a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241010/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-baylibre/baseline-meson-g1=
2a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/670782fe2c82000=
191c86874
        new failure (last pass: next-20241008)
        2 lines

    2024-10-10T07:31:59.971277  kern  :alert :   ESR =3D 0x0000000096000006
    2024-10-10T07:31:59.971645  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-10-10T07:31:59.972027  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-10-10T07:31:59.972287  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-10-10T07:31:59.993490  kern  :alert :   FSC =3D 0x06: level 2 tra<=
8>[   16.088897] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D2>
    2024-10-10T07:31:59.994029  nslation fault
    2024-10-10T07:31:59.994455  kern  :<8>[   16.098214] <LAVA_SIGNAL_ENDRU=
N 0_dmesg 3901942_1.5.2.4.1>
    2024-10-10T07:31:59.994836  alert : Data abort info:
    2024-10-10T07:31:59.995275  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006, ISS2 =3D 0x00000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/670782fe2c82000=
191c86875
        new failure (last pass: next-20241008)
        13 lines

    2024-10-10T07:31:59.948954  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000000000c8
    2024-10-10T07:31:59.949205  kern  :alert : Mem abort inf<8>[   16.06130=
0] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D13>
    2024-10-10T07:31:59.949431  o:   =

 =



platform          | arch  | lab          | compiler | defconfig            =
        | regressions
------------------+-------+--------------+----------+----------------------=
--------+------------
r8a7743-iwg20d-q7 | arm   | lab-cip      | gcc-12   | shmobile_defconfig   =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/67077fa8f0ca2d54e5c86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241010/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241010/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67077fa8f0ca2d54e5c86=
865
        failing since 9 days (last pass: next-20240930, first fail: next-20=
241001) =

 =20

