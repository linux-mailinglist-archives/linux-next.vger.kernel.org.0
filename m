Return-Path: <linux-next+bounces-3992-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FE0988167
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 11:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AEF11C20D2A
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 09:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9989E189910;
	Fri, 27 Sep 2024 09:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="v35lAgaj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A115ADAB
	for <linux-next@vger.kernel.org>; Fri, 27 Sep 2024 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727429640; cv=none; b=c91yXA+2HrOo28FOUvjJR9B9pdt8UKVUAztJcK562LCjJZ/UW22WPru0GfBcc8/cxJEqdhI93wSipcku/FOvA6UgtjbxaLKZH4AAki6CMWCYJo73RWNGMynUWkCjNsEEaZAXEzw/VCbgi2hvtM4xAfF5FumpYJh3vsGSEVRzVmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727429640; c=relaxed/simple;
	bh=T6TIkZpdsd/qT1lxEXcqlNXcYwN3xFNzmLHJs26cGJI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=gZH7vPtel2DabODIwBxl2SlMi1LWXwEENLIFthDg+nqMQx0Aq9zUMeF3RAydALIG88LU7UZChhsekVXbTpulIXQTRsEcq2z3zFB1yhjfkpmyGLGhirWle+5izTGskCjfbWfsf6+JtHl0obv3/Kftqhjo+OXGYVxliR6AvEtidZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=v35lAgaj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b4a0940e3so1201955ad.0
        for <linux-next@vger.kernel.org>; Fri, 27 Sep 2024 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727429637; x=1728034437; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hli6TSbb+yNBd7a74pQgnMhrcZx04gnqVTm0Br/qJxc=;
        b=v35lAgajTk/CJXkjI3SckW9dzUUUf+EuTOY7RVz97oayuFLTHQ7FW+cQ2lsncSootI
         uUsu8UcVtp+uazGY3i+T0DngPScYN04MwMD94Y8zwzRiY58fG2uGzzJKVLlmOXGooIlT
         ofbwAilk0kPsndW56fX8aP7A0vKpZIkdH2vtrQRzKCUKassLzX6G90UpmQjUQyI9LoEd
         9sFrB/tGQlAkyTZP/LQFdJF9gHTJU21zMi5WcZQOMuR/oc08q1LYqHdqmzmM1IAJTbZj
         jd4YaeQRGQIc0qmIr3zvGRKFjSi6P4AnzeNkPTstcr4LQzZGHd18G1O4VmHu/wmCeliT
         aFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727429637; x=1728034437;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hli6TSbb+yNBd7a74pQgnMhrcZx04gnqVTm0Br/qJxc=;
        b=L0w/TlxI0jxBPnrL/Kdr6GN21xiA2nR2CYFjGL93nW+9srsVTla0/QL9Jv4niAwj0f
         TY0N56WCjMUzqko1dW/OcY/tbspBIlC9dwXHXUcgC16DCEW3T9iGcnal626eSphTVA+f
         d/rqbAqESwXnwC5TY97Sm2yGKCzVrmiRWTGLdTzHwYwUXEDfegscXiXmNTMnz2roW8a4
         mQQyVzuLAs8pgyPxXH9n0aSSizqKzporaAttJnYiWUOcBHh7B9X8PUEr1av8cgEl7RCj
         vJ5B2WmkXjXe/sWWVcyRR4A83m75dkcswqWlCIe0FpMNjwRDIc6z3VQwLsMVe9+kjv87
         f8HQ==
X-Gm-Message-State: AOJu0YzntVrwLKOcbEgijZJzDTXAFncAgWp6A/a/DO1xfBaLl7hrMJ8B
	e8NyTqhwfJM53LZKXwqFHYiH06uAsTSMMmPR3DHr0nTgA4JqgHLelOzF2xVwEVmXZakgrTGMBAZ
	z
X-Google-Smtp-Source: AGHT+IGzEYiPAv4JldY+HFrUwUlwX7/Hjk2R1IdG8hfrfXdUZWna81KksVENAanulWTYZN0l1fZKqg==
X-Received: by 2002:a17:903:230e:b0:206:d6ac:85e1 with SMTP id d9443c01a7336-20b367d01c6mr43378075ad.2.1727429636811;
        Fri, 27 Sep 2024 02:33:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0fa82sm10323645ad.168.2024.09.27.02.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:33:56 -0700 (PDT)
Message-ID: <66f67c04.170a0220.b99e4.4a40@mx.google.com>
Date: Fri, 27 Sep 2024 02:33:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240927
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 129 runs, 4 regressions (next-20240927)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 129 runs, 4 regressions (next-20240927)

Regressions Summary
-------------------

platform                   | arch  | lab         | compiler | defconfig    =
                | regressions
---------------------------+-------+-------------+----------+--------------=
----------------+------------
beaglebone-black           | arm   | lab-cip     | clang-17 | multi_v7_defc=
onfig           | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig+deb=
ug              | 1          =

r8a7743-iwg20d-q7          | arm   | lab-cip     | gcc-12   | shmobile_defc=
onfig           | 1          =

sun50i-a64-pine64-plus     | arm64 | lab-broonie | gcc-12   | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240927/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240927
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      40e0c9d414f57d450e3ad03c12765e797fc3fede =



Test Regressions
---------------- =



platform                   | arch  | lab         | compiler | defconfig    =
                | regressions
---------------------------+-------+-------------+----------+--------------=
----------------+------------
beaglebone-black           | arm   | lab-cip     | clang-17 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66f66cc6ae3d96bd9cc86904

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240927/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240927/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66f66cc6ae3d96bd=
9cc86909
        new failure (last pass: next-20240925)
        1 lines

    2024-09-27T08:28:36.566121  / # =

    2024-09-27T08:28:36.572411  =

    2024-09-27T08:28:36.675606  / # #
    2024-09-27T08:28:36.681947  #
    2024-09-27T08:28:36.783113  / # export SHELL=3D/bin/sh
    2024-09-27T08:28:36.789148  export SHELL=3D/bin/sh
    2024-09-27T08:28:36.890160  / # . /lava-1197990/environment
    2024-09-27T08:28:36.896458  . /lava-1197990/environment
    2024-09-27T08:28:36.997421  / # /lava-1197990/bin/lava-test-runner /lav=
a-1197990/0
    2024-09-27T08:28:37.002333  /lava-1197990/bin/lava-test-runner /lava-11=
97990/0 =

    ... (9 line(s) more)  =

 =



platform                   | arch  | lab         | compiler | defconfig    =
                | regressions
---------------------------+-------+-------------+----------+--------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig+deb=
ug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66f64a8d7236f6133ac86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240927/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240927/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f64a8d7236f6133ac86=
862
        failing since 4 days (last pass: next-20240829, first fail: next-20=
240923) =

 =



platform                   | arch  | lab         | compiler | defconfig    =
                | regressions
---------------------------+-------+-------------+----------+--------------=
----------------+------------
r8a7743-iwg20d-q7          | arm   | lab-cip     | gcc-12   | shmobile_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66f63cdd736af8294bc86875

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240927/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240927/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f63cdd736af8294bc86=
876
        failing since 36 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =



platform                   | arch  | lab         | compiler | defconfig    =
                | regressions
---------------------------+-------+-------------+----------+--------------=
----------------+------------
sun50i-a64-pine64-plus     | arm64 | lab-broonie | gcc-12   | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66f644b837459f1ee3c86863

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240927/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240927/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66f644b837459f1=
ee3c86866
        failing since 20 days (last pass: next-20240904, first fail: next-2=
0240906)
        2 lines

    2024-09-27T05:37:36.668313  kern  :emerg : thermal thermal_zone2: gpu1-=
thermal: critical temperature reached
    2024-09-27T05:37:36.674301  kern  :emerg : reboot: HARDWARE PROTECTION =
shutdown (Temperature too high)
    2024-09-27T05:37:36.690681  <8>[   17.681900] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =20

