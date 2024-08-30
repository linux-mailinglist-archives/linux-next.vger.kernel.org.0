Return-Path: <linux-next+bounces-3514-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DF79661CC
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 14:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEEC9283429
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 12:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E5916FF2A;
	Fri, 30 Aug 2024 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="LOcS9S5R"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F02B192581
	for <linux-next@vger.kernel.org>; Fri, 30 Aug 2024 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725021094; cv=none; b=f5hJsXttac6DZ+NP0+HP+8hoolblLTw1P3LbQvD2FV0JQ4OysyDd5QzVo06819kAetHbp979p+094PHiEXorpAFF6gYWoEdQuz5MJCoCXfWzyrAm2q3N3yE/J9PGpVQzdxKobxwTsp771PT/C9tg6GdXYMVTXhDk7Q+e3X+k4yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725021094; c=relaxed/simple;
	bh=n8bjNJNytnMpbSLOiPHhSLXyGnhT+abTHkF+omQsEvA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=pv7aaoV+s3fy5tRCBjfSdmNc8vOJedwRCR3Ieqga16XKKXucINTHfquh72lmmjmwsewhgm5d3a2S+b6lRA5j/QHpiwJ/qWJ6CwM7Sfk4zEVlOwbMj6IH0fCNNSlf08SUY5Bl+KlJIgQEau2hiWktaurAxzy5rluP2w+Shqczfcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=LOcS9S5R; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-76cb5b6b3e4so1119000a12.1
        for <linux-next@vger.kernel.org>; Fri, 30 Aug 2024 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725021091; x=1725625891; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TwJFWcmNw86S6wwUytblKIWmeXEA6elWkvpXJ/H3wrY=;
        b=LOcS9S5RI1cqZPfIIKXj3aNIWv+PEZW1DA6KN6yf4foWCB3fP6YyFAr+ov5pciXfdi
         7fkcfWKLvrFf5t3JQOiCyyYGPVkN8eZ1pGwHT2TKatamcn1R2HCziEjIOu0p52+Wzk5z
         oZHQ6iKGjUHyk52MbJVfHU9BD/m/d6kR4OSuKcZHyDic98D95Ug7DO+VE6hzpTlQsgrm
         ePHv+tHttLo3DdQrWRMVy1F/7uuhyhfu07h1DUZk93q87F+15/QXGOCI8ShlwgWzhr6D
         YYPTusS/UShWZDGy76UZfhceYDHtHo7n218zoCF1gMMC7w9GV2GletniA7FCtV0Z0crO
         ooqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725021091; x=1725625891;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwJFWcmNw86S6wwUytblKIWmeXEA6elWkvpXJ/H3wrY=;
        b=vlKB8f80EOlkkU6DJ9HtfuFVlB77bi/lNQWMhg4U21KlbpLPfxkGEwOqhQYZMuHnhk
         TIsR8IE+ktITcbby68eGtCsRVLIIncW572Aq62IdvnhSdJYPrfKC0QwhyEIxGKeHh+aB
         DwUQ/tCNJhLNSxmACodeaQZ8QTy10pRA5dSPUUzJp6NB7s5wCprUJ3HAYq4NB3Ho4AKk
         CdYbRGNqlCv0xdcZSIHDM567T2NohPGiZQ9b1pUWhCXvtWv2Pcq2mBF9imT23bpuwOR7
         lbgTbX7V/KG7Y0kHGyJG9XjlVnldD1wRBhkCCxBrnKRM7e06fLa3VJHIl5jwj+Tvk351
         LMlw==
X-Gm-Message-State: AOJu0YwWUtoCqbuv4VjGnO5waeQuKSA0A3u0NzwaQZMabIAdZhzapdWb
	5HnstdNjUEyC9ARwJCuD2iqG5XYMTXFiA1z9U528kPwGBhzDg6MxkphcQmcYxUIL5qSIynw8ncI
	w
X-Google-Smtp-Source: AGHT+IEa+go5qUCFZXNO6ZPDzmraAPrNr4Cp4Lp0sxrWEFQ/5aHLLsutn3ZcZBJdG0pjZYPU/wKDCA==
X-Received: by 2002:a05:6a20:d70f:b0:1c0:eba5:e192 with SMTP id adf61e73a8af0-1cce1015cc9mr5505780637.27.1725021090694;
        Fri, 30 Aug 2024 05:31:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a692fsm2650747b3a.60.2024.08.30.05.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:31:30 -0700 (PDT)
Message-ID: <66d1bba2.050a0220.1fbfa2.a0c7@mx.google.com>
Date: Fri, 30 Aug 2024 05:31:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240830
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 225 runs, 11 regressions (next-20240830)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 225 runs, 11 regressions (next-20240830)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beagle-xm                    | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

imx6q-udoo                   | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-12   | defconfig+=
kselftest          | 1          =

qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240830/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240830
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      985bf40edf4343dcb04c33f58b40b4a85c1776d4 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beagle-xm                    | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66d17e60b5aa6ca3a7c86866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d17e60b5aa6ca3a7c86=
867
        new failure (last pass: next-20240829) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx6q-udoo                   | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66d17d7b238c92eb46c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-broonie/baseline-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-broonie/baseline-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d17d7b238c92eb46c86=
85e
        new failure (last pass: next-20240828) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d1812fbd10506880c869b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d1812fbd10506880c86=
9b9
        failing since 2 days (last pass: next-20240725, first fail: next-20=
240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d18131c0c39856c4c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d18131c0c39856c4c86=
856
        failing since 2 days (last pass: next-20240725, first fail: next-20=
240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66d18b09d817dc17c4c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d18b09d817dc17c4c86=
859
        new failure (last pass: next-20240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66d1810dbd10506880c86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d1810dbd10506880c86=
858
        failing since 44 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66d1810ced7d029866c8686a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d1810ced7d029866c86=
86b
        failing since 44 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66d182459fa5a71237c8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d182459fa5a71237c86=
85d
        failing since 8 days (last pass: next-20240820, first fail: next-20=
240821) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/66d17f0a3e275879d4c8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d17f0a3e275879d4c86=
85d
        new failure (last pass: next-20240829) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66d1845b4c8059bb95c8688b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d1845b4c8059bb95c86=
88c
        new failure (last pass: next-20240828) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/66d17f57c3b06c43e8c86874

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240830/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240830/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d17f57c3b06c43e8c86=
875
        new failure (last pass: next-20240829) =

 =20

