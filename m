Return-Path: <linux-next+bounces-3622-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1896E468
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 22:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9DE81F21D31
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 20:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E424F1953A9;
	Thu,  5 Sep 2024 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PEiqCfE5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17A23D6D
	for <linux-next@vger.kernel.org>; Thu,  5 Sep 2024 20:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569433; cv=none; b=LIa+oYfARJSs+EAjsupoqQZvGFvNZgR0pCu+BgAaODOmyMzM4sHDI49S9zgPBl5qiJBVpUV+vFjcCAZ9t46dWPdhhSfLLtMomOmXG6CTbjt5o3xYqrS5A/for5z5z2tqdV6UlsXyHdcD/cWcQYK6q+IRAPjexo0UhhCOlwsInYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569433; c=relaxed/simple;
	bh=ykUygUrej1+01gBi+KSl0OzCr8sfum/VMyOTz9KSELU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=i2Nxmzi/g0BIkN2zMh2d4+B6e+uTYAXLgkNwUd1w4Q8j217CsKeDiZ/JDrAHJSmqiOHVP6Sy/1yGVCPS5H3G8E3vEQgWczzAJhE2pxa1KonHdEQT2CTdEAKbUqeKdbsVhkobxuDgU5vOHdvJctof23pULyugZRY3AFdC0LhB7ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=PEiqCfE5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2053525bd90so12864375ad.0
        for <linux-next@vger.kernel.org>; Thu, 05 Sep 2024 13:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725569431; x=1726174231; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Aeb+6nLYnpcfCkZGO5jdiHi/KhHavOvTpJRoAG+OjyQ=;
        b=PEiqCfE5yYzubPUE5psoFdOyZtSthMxwqEPDMFcs6eAjHIf+PPD55lmjTW0qpzDzjn
         7OKn48kvebxTE7n2xqMObomxxjm6T33IxAX5ihGP/OktUwFQ94LMlU2vtrsLnie4CyRd
         KiRxdwv983HpzHqdp25yEho/2uNya9yA+m81HeRjcDhgQM38J7UGMk+Cp3Lg5QeaHsCu
         E9AoAYpJfoY+WmXAjOK9cBCq+NUqmzjSDqFmxLvw501bLkO2Mn5fsYPTcJs38jTOVnn/
         ytbL3anEBVkwOLA5cShvNLFOatuD/cmGtRH21Qb8S7Vbr5n0hgPvwZ6vMHUMWBAfUW/C
         T6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569431; x=1726174231;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aeb+6nLYnpcfCkZGO5jdiHi/KhHavOvTpJRoAG+OjyQ=;
        b=D0+jccGkrWQ/tsdeA5vNeujuHIW6ew7UhOcHJiM21X2OAOsxV9shv2ZH5MFPf/OUao
         1Fuzd2nSciqBpdllUozOjYklbFqNjiWoMwXltSwtCkYbZZ4VoJQcIgdPYterfCBxsKRR
         IVmKoo7JEkqG7y+qy42nSjUmOTTcv6nl7SJpwmN7YSmVbebXHDJNCIKSTeOFdU6zH460
         egwEUPnxY8jcaUIozBygLdNihHcUyZxip4tbaFdWrq/DfEckezi2wYEBqaoLnODs5Dcs
         jUx3BQDL9/M607BGXKaq0IGHB1srA5SiF+LcpZen6LMWV406ZMzlo+YgKIYzyMEyiHo0
         C0Gg==
X-Gm-Message-State: AOJu0YyiX42GnDFxa0QGuTovutLIUlUWd4VQaRh0IxJDUWRxeZl+z8YG
	k1SxZD2r3SYyaZkQr9CHslj43HN6q+5jtLe0AHZgQyBW8/hfDFRzE5Lwz1ze5Afww6pe2YeY3Vu
	z
X-Google-Smtp-Source: AGHT+IG+aGIEkScU7qBBq+ckGcMoJUGWiVme6dU5iIiHDUTi3reiC0Mgtg0Htnj3i3zBC9sirSSJcA==
X-Received: by 2002:a17:902:ccc1:b0:1fc:6b8b:4918 with SMTP id d9443c01a7336-206f05f67acmr3757595ad.41.1725569430616;
        Thu, 05 Sep 2024 13:50:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206b93468b3sm29215485ad.120.2024.09.05.13.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 13:50:30 -0700 (PDT)
Message-ID: <66da1996.170a0220.faa45.c243@mx.google.com>
Date: Thu, 05 Sep 2024 13:50:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240905
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 131 runs, 5 regressions (next-20240905)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 131 runs, 5 regressions (next-20240905)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 2          =

r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240905/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240905
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ad40aff1edffeccc412cde93894196dca7bc739e =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d9e3bfd457c2cc0cc86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240905/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240905/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d9e3bfd457c2cc0cc86=
85a
        failing since 9 days (last pass: next-20240725, first fail: next-20=
240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d9e3c1e7fc346522c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240905/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240905/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d9e3c1e7fc346522c86=
856
        failing since 9 days (last pass: next-20240725, first fail: next-20=
240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/66d9e0724aab76d4cac86870

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240905/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240905/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66d9e0724aab76d=
4cac86873
        failing since 3 days (last pass: next-20240830, first fail: next-20=
240902)
        2 lines

    2024-09-05T16:46:20.190112  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-09-05T16:46:20.190604  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-09-05T16:46:20.195669  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-09-05T16:46:20.196204  kern  :alert : Data abort info:
    2024-09-05T16:46:20.201211  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-09-05T16:46:20.206732  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-09-05T16:46:20.212298  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-09-05T16:46:20.223436  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-09-05T16:46:20.234489  kern  :emerg : Internal error: Oops<8>[   1=
9.656438] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/66d9e0724aab76d=
4cac86874
        failing since 3 days (last pass: next-20240830, first fail: next-20=
240902)
        12 lines

    2024-09-05T16:46:20.164506  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-09-05T16:46:20.165026  kern  :alert : Mem abort info:
    2024-09-05T16:46:20.170094  kern  :alert :   ESR =3D 0x0000000096000004
    2024-09-05T16:46:20.184547  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
<8>[   19.608407] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail =
UNITS=3Dlines MEASUREMENT=3D12>
    2024-09-05T16:46:20.185126     =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66d9d9ddb6df181f10c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240905/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240905/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d9d9ddb6df181f10c86=
85e
        failing since 15 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =20

