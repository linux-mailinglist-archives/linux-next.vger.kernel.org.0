Return-Path: <linux-next+bounces-3964-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10473985578
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 10:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6351EB22B90
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 08:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5031598E9;
	Wed, 25 Sep 2024 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ApbSqNrI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F187E574
	for <linux-next@vger.kernel.org>; Wed, 25 Sep 2024 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252906; cv=none; b=I0L3D+6OOzmM26RWWzR4NmR+07IbHQS5lg8dQ7HLFDCaL/E4XahLZWfRCnyIemOqxRk6w55kfQgUBUekY0/pDIhpgk/Z+Iy30wy9y6v/16nJ2IRGjYo8btBL5nZVmqfRByJoZJpccZpkaZH4x/3oA4Bolh1eu0DwBDw0Sv+L3f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252906; c=relaxed/simple;
	bh=l/jsQrwGjN5wm8IIu1lVc6WTFq9XwtnSQJ93WqAZyVk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ftNzjMhEkTwuipD0vi9kh+kiBxSjvf/QpvNJ+Iv9snpF27CFJkcWtG75PAnDjj1IALHD2t4bptaZeqaCk3HmsPPwEm3XpAJQoVYT4uliaJzGaiBKhC0l5iWYmfp9KGfyR2UHN+vRPUFvVlR6CBF8H3gmXQnZbwMpPNHYSnguBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ApbSqNrI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2057835395aso73536545ad.3
        for <linux-next@vger.kernel.org>; Wed, 25 Sep 2024 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727252903; x=1727857703; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yIPGEB4uXdfs2HVl3O9soMt+YEf2s/LVcds0ae+En0E=;
        b=ApbSqNrIFW6Rj+CCXZPwNGxCi95CxKWGxxauLiy9H4z93jjIWTO/Dk03zsAeppUnH3
         nvdcL5JYA6IOzWaHLRqB9BT7Lb3+S5UBVBQ8bkpzLHjxM4kefcFnSKQu18c2X1CXeyf5
         7UwU3jJRGrXQYmYjVS+Q1VOeY13Dc2hshvsC7kUFgU7T+AH3TR+73QlpkCf/Q/SpTFJb
         9BUPK4iK2cvsPAaDlEFd4nm73WVZPo/iMVbIWZ02Wrjstvelr76LIPuEHLBTVr2ZqOD0
         ElT8xt9nkOGSzEbYVafqe6ks4SWecZzquYGRdDvbYA6vyT+UB5VlrmvblG2T0lDJaC02
         X37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252903; x=1727857703;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIPGEB4uXdfs2HVl3O9soMt+YEf2s/LVcds0ae+En0E=;
        b=fNvJxa21qXpJ+jLlEGXKmNXnWvZrc/KVKjyRPZiVpfWLxr+gXCcHYIcu2+uzY5kjtw
         b2I3rUKAcQ2cdlzMr7jOF83aI4z4opfXfXnMrAtPt5v8ZTZtzr9DN2b+7rY8gyxc5hLp
         1ad6FlqiFxySXR4zgRu4x/ErTvh8M8CE1uFQjf9BopsoMQTcQLtMHJS3eYBIDt+Q8MZO
         BKFihDvXI1rNp1KxyJezXFs1d7zQnx0t6XvaxeQ5bSx7xSviQPubw0WoUr6isdyU0+Fd
         UGzKcsQOfuSmIkCJWslS9V9qkRSr7/5EA/xHBjk3eF71WY8Rmq2AIgLrvl9nNUc05Pfa
         NkzA==
X-Gm-Message-State: AOJu0YzzhiEl5AyHqDhzy5e1PR5XBWdRf1RgiprloZdrEFUhl8OsXHpy
	LhkO8Gw4HMcR2qQ2bojrqEo0npKDAvFhUVrcBO76bqRxejbaJrpk8sKjwTX2AjUFsqevFoKQsBG
	k
X-Google-Smtp-Source: AGHT+IGgk5JOZEZqV7l6fx2uyY6hxuTFWc5QjkbgwvyhTdij5Z5DwsoPyzXD1OCGm1BepdBGwiuMFg==
X-Received: by 2002:a17:902:ce12:b0:205:9510:1fb7 with SMTP id d9443c01a7336-20afc425813mr32215515ad.14.1727252902680;
        Wed, 25 Sep 2024 01:28:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e05b57decdsm2828238a91.1.2024.09.25.01.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:28:22 -0700 (PDT)
Message-ID: <66f3c9a6.170a0220.27d1ac.bd09@mx.google.com>
Date: Wed, 25 Sep 2024 01:28:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240925
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 134 runs, 7 regressions (next-20240925)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 134 runs, 7 regressions (next-20240925)

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

sun50i-a64-pine64-plus       | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

zynqmp-zcu102                | arm64 | lab-cip     | gcc-12   | defconfig+k=
selftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240925/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240925
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2b7275670032a98cba266bd1b8905f755b3e650f =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66f38f59364c2db2b6c8686d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240925/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240925/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f38f59364c2db2b6c86=
86e
        failing since 28 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66f38f58364c2db2b6c86863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240925/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240925/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f38f58364c2db2b6c86=
864
        failing since 28 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/66f39022fdbb1142dbc86866

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240925/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240925/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66f39022fdbb114=
2dbc86869
        failing since 22 days (last pass: next-20240830, first fail: next-2=
0240902)
        2 lines

    2024-09-25T04:22:42.667311  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-09-25T04:22:42.672847  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-09-25T04:22:42.673318  kern  :alert : Data abort info:
    2024-09-25T04:22:42.678433  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-09-25T04:22:42.684011  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-09-25T04:22:42.689453  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-09-25T04:22:42.695182  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-09-25T04:22:42.711774  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT<8>[   19.876845] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-09-25T04:22:42.712346   SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/66f39022fdbb114=
2dbc8686a
        failing since 22 days (last pass: next-20240830, first fail: next-2=
0240902)
        12 lines

    2024-09-25T04:22:42.639521  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-09-25T04:22:42.640046  kern  :alert : Mem abort info:
    2024-09-25T04:22:42.645245  kern  :alert :   ESR =3D 0x0000000096000004
    2024-09-25T04:22:42.661765  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
<8>[   19.825032] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail =
UNITS=3Dlines MEASUREMENT=3D12>
    2024-09-25T04:22:42.662259  =

    2024-09-25T04:22:42.662705  kern  :alert :   SET =3D 0, FnV =3D 0   =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66f38ca2d3d6d434f1c86872

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240925/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240925/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f38ca2d3d6d434f1c86=
873
        failing since 34 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66f38c4fdc16077dc9c8685e

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240925/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240925/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66f38c4fdc16077=
dc9c86861
        failing since 18 days (last pass: next-20240904, first fail: next-2=
0240906)
        2 lines

    2024-09-25T04:06:35.989678  kern  :emerg : thermal thermal_zone2: gpu1-=
thermal: critical temperature reached
    2024-09-25T04:06:35.995470  kern  :emerg : reboot: HARDWARE PROTECTION =
shutdown (Temperature too high)
    2024-09-25T04:06:36.010392  <8>[   17.713848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
zynqmp-zcu102                | arm64 | lab-cip     | gcc-12   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66f3910518f4ddb435c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240925/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240925/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66f3910518f4ddb435c86=
857
        new failure (last pass: next-20240920) =

 =20

