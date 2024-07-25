Return-Path: <linux-next+bounces-3129-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97C93BE0A
	for <lists+linux-next@lfdr.de>; Thu, 25 Jul 2024 10:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB8AA2841FE
	for <lists+linux-next@lfdr.de>; Thu, 25 Jul 2024 08:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC04187334;
	Thu, 25 Jul 2024 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1Dl7djkW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FAB187349
	for <linux-next@vger.kernel.org>; Thu, 25 Jul 2024 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721896489; cv=none; b=N1aNv2WzX28EE040J6X6vD29JtdMdj7MagLb/WLBrwKxE0XiUeo37QUQablrGUFN73cPT9iO4XRZB4RA19mFhU3awzbBc+iwBOUBLF9po+EMo10b8j+fb9WnZZYgw65c+dl427NuISJeq+uknpHfdV1XTOH2b5Ucso5LXYlCQy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721896489; c=relaxed/simple;
	bh=txsWgrN336FPQoLc6WsDb8nI9BN+S0Fx9Zcvhnx1mew=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=AZYK2Zmjdf9pAvRi4+IC4TfirBLqtGRxLVhyJBZ0QZKYtVWFzuAT0lT4RZ2hob8Gwfj0jbxNhr0HbxMrJk8dGdXnZBTR1pJiCCbg3vtUgIr69m8byrzWHv2RKC0/1f5RxLBLXzmI4ro1XV7dWAifjRLBeVPVJXkp5dpM/UyU9tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1Dl7djkW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d2ae44790so506093b3a.2
        for <linux-next@vger.kernel.org>; Thu, 25 Jul 2024 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721896486; x=1722501286; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uqaVCMTWUiB26gGpdR7dZIexCWhIGFlfEab+jZhFB8A=;
        b=1Dl7djkWIHRC91cit6M9za4hagsbtT7TjHFsIDWVY4Yvwz7wzMr/lRnZ8ope1mv6u2
         mLUiXFsc89bd+pKKN5XL4k1VQPrl7jlvvSREgEXdj1ZNA7wvZuVqeBzMWjrMauID52oW
         3pzP8VZefJ9FpuGVam7DhBUgObGHejLcitPTcGuazUldilJK4mDBfn7RwTViK3QymIuQ
         645W5o/XCMu7crI2tHsB+U371FnT30gsvSgZKTHF3SOXvSVTqbceyodYalkJwma/COZg
         WKsNK3Y+vdkrrXkrRmw314AqhagybhTK/dUHMr8hsrgEU3kfW9kgBesbreQD+zOR/BFX
         p0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721896486; x=1722501286;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqaVCMTWUiB26gGpdR7dZIexCWhIGFlfEab+jZhFB8A=;
        b=pZkSzLzvUWgGfmr3SUbSp9Oi3JN/IOyhktuDCYfXi8XkUnTcLWo9V73rQiFXR83JVv
         VWcvLk9Cmi6CVyyZkL83cWK5dOpPBrV+00MlP2ZLrI08LBwmA9l2Z6Modjk3r+Yj+F5F
         RoRzfqiJ1he9E52sW3L+bMAcacUr3zAdxZajLnRrO/oOwqGde+DhqSGTVenL0l1gDJMk
         20UnfXa8j8bl7nMIEiUkjGpYTrFn099FBpbxVt0ZGiU9ZGRztb6Eqj1ouZOwYzuwHMnf
         Poa3wsPHkF8wXMD6jcxT9sXqC6r0Xfa4ol0KKHt7fJt5I318haa9xSbyfaakZWXtPvmf
         Dhug==
X-Gm-Message-State: AOJu0YyBaQjZvzpilTJ6FNm0NJBV5CgUXzINTmS6TXFCkQxdoAzEalif
	KWSSofcSQun1nVTXnILEX+V5880zMuI7B/kwvIJMhKhPyqQxavxIjiM3CgZQX2m9ckbvclZR9fV
	8
X-Google-Smtp-Source: AGHT+IH/K0Mmn4awhqwuthIUX9k5Zn1M+u3zIYudsQj6tff1oqn9PmGmq41xji0mlkJvKqp7X4t+5w==
X-Received: by 2002:a05:6a00:66d3:b0:706:74b7:9d7d with SMTP id d2e1a72fcca58-70eae99e934mr1039350b3a.25.1721896486350;
        Thu, 25 Jul 2024 01:34:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8a35d2sm691106b3a.199.2024.07.25.01.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 01:34:45 -0700 (PDT)
Message-ID: <66a20e25.050a0220.38b0d.1a53@mx.google.com>
Date: Thu, 25 Jul 2024 01:34:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240725
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 123 runs, 4 regressions (next-20240725)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 123 runs, 4 regressions (next-20240725)

Regressions Summary
-------------------

platform          | arch  | lab         | compiler | defconfig           | =
regressions
------------------+-------+-------------+----------+---------------------+-=
-----------
beaglebone-black  | arm   | lab-cip     | gcc-12   | omap2plus_defconfig | =
1          =

qemu_riscv64      | riscv | lab-broonie | gcc-12   | defconfig+debug     | =
1          =

qemu_smp8_riscv64 | riscv | lab-broonie | gcc-12   | defconfig+debug     | =
1          =

r8a7743-iwg20d-q7 | arm   | lab-cip     | gcc-12   | shmobile_defconfig  | =
1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240725/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240725
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      864b1099d16fc7e332c3ad7823058c65f890486c =



Test Regressions
---------------- =



platform          | arch  | lab         | compiler | defconfig           | =
regressions
------------------+-------+-------------+----------+---------------------+-=
-----------
beaglebone-black  | arm   | lab-cip     | gcc-12   | omap2plus_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/66a1d9054d41cc2fad7e7086

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240725/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240725/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66a1d9054d41cc2f=
ad7e708b
        new failure (last pass: next-20240724)
        1 lines

    2024-07-25T04:47:44.000211  / # =

    2024-07-25T04:47:44.008781  =

    2024-07-25T04:47:44.113658  / # #
    2024-07-25T04:47:44.120566  #
    2024-07-25T04:47:44.222590  / # export SHELL=3D/bin/sh
    2024-07-25T04:47:44.232987  export SHELL=3D/bin/sh
    2024-07-25T04:47:44.334721  / # . /lava-1172428/environment
    2024-07-25T04:47:44.344737  . /lava-1172428/environment
    2024-07-25T04:47:44.446606  / # /lava-1172428/bin/lava-test-runner /lav=
a-1172428/0
    2024-07-25T04:47:44.456588  /lava-1172428/bin/lava-test-runner /lava-11=
72428/0 =

    ... (9 line(s) more)  =

 =



platform          | arch  | lab         | compiler | defconfig           | =
regressions
------------------+-------+-------------+----------+---------------------+-=
-----------
qemu_riscv64      | riscv | lab-broonie | gcc-12   | defconfig+debug     | =
1          =


  Details:     https://kernelci.org/test/plan/id/66a1d67bd9c52bee9b7e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240725/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240725/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66a1d67bd9c52bee9b7e7=
077
        failing since 8 days (last pass: next-20240712, first fail: next-20=
240716) =

 =



platform          | arch  | lab         | compiler | defconfig           | =
regressions
------------------+-------+-------------+----------+---------------------+-=
-----------
qemu_smp8_riscv64 | riscv | lab-broonie | gcc-12   | defconfig+debug     | =
1          =


  Details:     https://kernelci.org/test/plan/id/66a1d705ffdb56439b7e708b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240725/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240725/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66a1d705ffdb56439b7e7=
08c
        failing since 8 days (last pass: next-20240712, first fail: next-20=
240716) =

 =



platform          | arch  | lab         | compiler | defconfig           | =
regressions
------------------+-------+-------------+----------+---------------------+-=
-----------
r8a7743-iwg20d-q7 | arm   | lab-cip     | gcc-12   | shmobile_defconfig  | =
1          =


  Details:     https://kernelci.org/test/plan/id/66a1d7825b5b9a43ed7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240725/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240725/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66a1d7825b5b9a43ed7e7=
06e
        new failure (last pass: next-20240724) =

 =20

